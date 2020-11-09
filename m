Return-Path: <SRS0=npFd=EP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F6BC63697
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 10:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94EA8206B2
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 10:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94EA8206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEA989875;
	Mon,  9 Nov 2020 10:33:03 +0000 (UTC)
X-Greylist: delayed 497 seconds by postgrey-1.36 at gabe;
 Mon, 09 Nov 2020 10:33:01 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F6B89875
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 10:33:01 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 25B7E1C0B88; Mon,  9 Nov 2020 11:24:39 +0100 (CET)
Date: Mon, 9 Nov 2020 11:24:37 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 kernel list <linux-kernel@vger.kernel.org>
Message-ID: <20201109102437.GA15835@amd>
References: <20200916090059.3189-1-chris@chris-wilson.co.uk>
 <20200916090059.3189-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20200916090059.3189-2-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [Intel-gfx] 4.19-stable: Re: [PATCH 2/3] drm/i915: Break up error
 capture compression loops with cond_resched()
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0965905314=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0965905314==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> As the error capture will compress user buffers as directed to by the
> user, it can take an arbitrary amount of time and space. Break up the
> compression loops with a call to cond_resched(), that will allow other
> processes to schedule (avoiding the soft lockups) and also serve as a
> warning should we try to make this loop atomic in the future.
>=20
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

This was queued for 4.19-stable, but is very likely wrong.

> @@ -397,6 +399,7 @@ static int compress_page(struct i915_vma_compress *c,
>  	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
>  		memcpy(ptr, src, PAGE_SIZE);
>  	dst->pages[dst->page_count++] =3D ptr;
> +	cond_resched();
> =20
>  	return 0;
>  }

4.19 compress_page begins with

static int compress_page(struct compress *c,
=2E..
        page =3D __get_free_page(GFP_ATOMIC | __GFP_NOWARN);

and likely may not sleep. That changed with commit
a42f45a2a85998453078, but that one is not present in 4.19..

I believe we don't need this in stable: dumping of error file will not
take so long to trigger softlockup detectors... and if userland access
blocked, we would be able to reschedule, anyway.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+pGOUACgkQMOfwapXb+vIvQgCcDwo9ICEQfTFKE7D+KQj2Ngzp
v9sAnjFdQRjvjH8ijc41QciyP5sDpOWb
=rh9u
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

--===============0965905314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0965905314==--
