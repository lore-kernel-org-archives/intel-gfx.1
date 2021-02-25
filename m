Return-Path: <SRS0=rhBX=H3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B990C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Feb 2021 10:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30B364F0E
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Feb 2021 10:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30B364F0E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090FB6E107;
	Thu, 25 Feb 2021 10:15:10 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012326E116;
 Thu, 25 Feb 2021 10:15:08 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A82021C0B81; Thu, 25 Feb 2021 11:15:06 +0100 (CET)
Date: Thu, 25 Feb 2021 11:15:06 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210225101506.GA17499@duo.ucw.cz>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
 <20210225095322.GA5089@amd>
 <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
MIME-Version: 1.0
In-Reply-To: <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] udldrm does not recover from powersave? Re:
 udldrmfb: causes WARN in i915 on X60 (x86-32)
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
Content-Type: multipart/mixed; boundary="===============0396978850=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0396978850==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Thank you, that fixes the DMA issue, and I can use the udl.
> >=20
> > ...for a while. Then screensaver blanks laptop screen, udl screen
> > blanks too. Upon hitting a key, internal screen shows up, udl does
> > not.
> >=20
> > I try rerunning xrandr ... --auto, but could not recover it.
> >=20
> > Any ideas?
>=20
> Did it work before the regression?

I don't know. I'm trying to get it to work, I basically did not use it befo=
re.

> For testing, could you please remove the fix and then do
>=20
>   git revert 6eb0233ec2d0
>=20
> This would restore the old version. Please report back on the results.

I doubt this is related, but I can try.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDd4qgAKCRAw5/Bqldv6
8s4MAJwMEpPvM8Uj3RqK+M5x8Kvx5bKlKwCePvQAZYLSesysWma9mbGP3nNG4jU=
=qjfI
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============0396978850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0396978850==--
