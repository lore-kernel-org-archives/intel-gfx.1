Return-Path: <SRS0=rhBX=H3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6DFC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Feb 2021 09:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 656E964EBA
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Feb 2021 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 656E964EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2006EC76;
	Thu, 25 Feb 2021 09:53:25 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784FB6EC74;
 Thu, 25 Feb 2021 09:53:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2708A1C0B8B; Thu, 25 Feb 2021 10:53:23 +0100 (CET)
Date: Thu, 25 Feb 2021 10:53:22 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210225095322.GA5089@amd>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
MIME-Version: 1.0
In-Reply-To: <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [Intel-gfx] udldrm does not recover from powersave? Re: udldrmfb:
 causes WARN in i915 on X60 (x86-32)
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
Cc: intel-gfx@lists.freedesktop.org, kernel list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1799370747=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============1799370747==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >This is in -next, but I get same behaviour on 5.11; and no, udl does
>=20
> Thanks for reporting. We are in the process of fixing the issue. The late=
st
> patch is at [1].
>

Thank you, that fixes the DMA issue, and I can use the udl.

=2E..for a while. Then screensaver blanks laptop screen, udl screen
blanks too. Upon hitting a key, internal screen shows up, udl does
not.

I try rerunning xrandr ... --auto, but could not recover it.

Any ideas?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA3c5IACgkQMOfwapXb+vIK+wCfcBgCyVwqlwT9BhlQBINozkZu
6EMAn2cKNi7+6HsERfcaiq/3RwULgi5f
=/Y0f
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============1799370747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1799370747==--
