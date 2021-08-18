Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA443C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 06:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370C161056
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 06:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 370C161056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE688F3A;
	Wed, 18 Aug 2021 06:58:35 +0000 (UTC)
X-Greylist: delayed 679 seconds by postgrey-1.36 at gabe;
 Wed, 18 Aug 2021 06:58:31 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1488F3A
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 06:58:31 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 210661C0B77; Wed, 18 Aug 2021 08:47:09 +0200 (CEST)
Date: Wed, 18 Aug 2021 08:47:08 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 kernel list <linux-kernel@vger.kernel.org>, rodrigo.vivi@intel.com
Message-ID: <20210818064708.GB22282@amd>
References: <20210624095359.GA29649@duo.ucw.cz>
 <162487567602.6944.6736788493261786550@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <162487567602.6944.6736788493261786550@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Intel-gfx] 5.13-rc6 on thinkpad X220: graphics hangs with
 recent mainline
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> > I'm getting graphics problems with 5.13-rc:
> >=20
> > Debian 10.9, X, chromium and flightgear is in use. Things were more
> > stable than this with previous kernels.
> >=20
> > Any ideas?
>=20
> The error you are seeing:
>=20
> > [185300.784992] i915 0000:00:02.0: [drm] Resetting chip for stopped hea=
rtbeat on rcs0
> > [185300.888694] i915 0000:00:02.0: [drm] fgfs[27370] context reset due =
to GPU hang
>=20
> That just indicates that the rendering took too long. It could be caused
> by a change in how the application renders, userspace driver or i915. So
> a previously on-the-edge-of-timeout operation may have got pushed beyond
> the timeout, or the rendering genuinely got completely stuck.
>=20
> If you only updated the kernel, not the application or userspace, could
> you bisect the commit that introduced the behavior and report:
>=20
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
>=20
> We have changes around this area, so would be helpful if you can bisect
> the commit that started the behavior.

So with more recent kernels, problem went away. Is it possible it was
one of those "aborted fence aborts both application and X" problems?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEcrOwACgkQMOfwapXb+vIC3QCeJirTC9Cf5I7TcizH8NrCvzRG
W34AnR3UwIkupopApaBERV9hTCObwWH6
=3y6B
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
