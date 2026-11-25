Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6C606A31E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMCP8rTq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5C10E2D0;
	Wed, 25 Nov 2026 12:27:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5381A10E2D0
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 12:27:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C94A416BF
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 12:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D621F000C4
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795609640;
 bh=VL7mE9sEqfpS7ZOiwyBlBGWaoitz6NZP38Qwy2AfD+g=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=mMCP8rTqpOaSAmEQNEjuFqBjaoHlCjK2eZcbzth8SKCpx3Z1L0MK7Wd7/OWomtAJG
 URnnmJS7XWN+Phl5l4ZSBM0S2bWbsVZ6PN+Ac5X4irIuD3dp/xYBLMx7IcwLh4wfX2
 28vJi1qLZjmEzff5hK/VxT+xF5xxbCd/jZ4Oz0xKfndQmZSzHOn1xitacBaqwiea0e
 PbmR0CzLkRJd2kW8NnQyH8tWsZuQl3FfrFjd9Aet8f/Oi+KhKfCDwGOSrgdn7Z0EWy
 dXqQ8oyF0vPXAomCrFn+Wht1gEnuh4lYuoPtVyLEhuLH2s5MTlnTbv8+FbnOtA0sPA
 AcjZyJS5t+ZTg==
Date: Wed, 25 Nov 2026 12:27:17 +0000
From: Mark Brown <broonie@kernel.org>
To: intel-gfx@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWls?= =?utf-8?Q?ure_fo?=
 =?utf-8?Q?r?= linux-next: build failure after merge of the drm-misc tree
Message-ID: <86c903d7-3844-4fee-9dcd-bcc2721cd8bf@sirena.org.uk>
References: <awXJ__-grexFFPb4@sirena.org.uk>
 <179557865171.82384.9412973438568863738@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bkT2iqOVggAnIIfG"
Content-Disposition: inline
In-Reply-To: <179557865171.82384.9412973438568863738@9ac1b63fe3ea>
X-Cookie: -- Owen Meredith
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--bkT2iqOVggAnIIfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 03:50:51AM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: linux-next: build failure after merge of the drm-misc tree
> URL   : https://patchwork.freedesktop.org/series/179539/
> State : failure

Again, not a patch submission.

--bkT2iqOVggAnIIfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG1CUACgkQJNaLcl1U
h9BXEwf9E/pBKhpd8sM7n38XL4+svQF1fK+lk5c4Chz1c9zA4aE9NSitW5Q3C4S2
5pjwZkmE7vUNLqhIrh/roSuzIHvAjatxSfELp5zA4g7Gd2Q/WuG4W/9eQORq62gg
F7HQ4EHx7OBzUkq1iRkfl4qYslC8iHPnlLNjWydYN5OqJgv152O5RUDOeA/ewiq6
mlBnTF5D6tFbzRd1GBq7EfL1tD40C//0g4fXe7ZOKBXdvy+k0Kxs62UmDwuMotzW
EGAXlfpxdRVIBbtn8dGfwaD0H1EctDdYy3cX/V72W483qfcyMvyjw3E1hvHYBSGz
43p0rsdJjjxwIvo6geeeligMVviSfg==
=Soha
-----END PGP SIGNATURE-----

--bkT2iqOVggAnIIfG--
