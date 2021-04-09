Return-Path: <SRS0=Zf8m=JG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B87C43460
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 03:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF49261132
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 03:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF49261132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6176E441;
	Fri,  9 Apr 2021 03:13:02 +0000 (UTC)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872F6E441;
 Fri,  9 Apr 2021 03:13:01 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGjqr14Qqz9sW1;
 Fri,  9 Apr 2021 13:12:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1617937978;
 bh=//XF3pf9c64cU+t13IzrOTUQCue+ZS7pXjZN4nupHbg=;
 h=Date:From:To:Cc:Subject:From;
 b=qax6trgBiOYRcsSNdKFHnpVvqoT/99lvSUdSLgtPjyygpFrMlOQ0RXCE3HVNTXY07
 04A7GqcMIbkDTCphq4BUSlczeW9m3EC4WTJV8C7JljzT47U7MQhfbKo8QuEKzmivnw
 Z0LMeywwlwFQs7QBaWFEAVj8i9HaP9RhNmW9k8Y+jlt72qttQI7wCYhjL0bgEjHofo
 K/aglLFfHlsrbmnpHSztligf5yRSZMblS8dLF2TN6/enfrio1sseSl/yKvEIEn4DZp
 lxcOJdfdaBMmjSbr+6rIoIoxqdBTSxTt+t9wY2WZKMidYXcl8M4ze11jYgLbR5hnHM
 aAEkwWBtmXs7w==
Date: Fri, 9 Apr 2021 13:12:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Message-ID: <20210409131253.1a67eae2@canb.auug.org.au>
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/mixed; boundary="===============0582637619=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0582637619==
Content-Type: multipart/signed; boundary="Sig_/.3TCEW2K/ucdGcZbZyQjv9B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_plane.c

between commit:

  35d65ab3fdba ("drm/vc4: plane: Remove redundant assignment")

from the drm-misc-fixes tree and commit:

  5ddb0bd4ddc3 ("drm/atomic: Pass the full state to planes async atomic che=
ck and update")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vc4/vc4_plane.c
index 1e9c84cf614a,c76e73a452e0..000000000000
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@@ -1133,31 -1135,34 +1135,33 @@@ void vc4_plane_async_set_fb(struct drm_
  }
 =20
  static void vc4_plane_atomic_async_update(struct drm_plane *plane,
- 					  struct drm_plane_state *state)
+ 					  struct drm_atomic_state *state)
  {
+ 	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_sta=
te(state,
+ 										 plane);
  	struct vc4_plane_state *vc4_state, *new_vc4_state;
 =20
- 	swap(plane->state->fb, state->fb);
- 	plane->state->crtc_x =3D state->crtc_x;
- 	plane->state->crtc_y =3D state->crtc_y;
- 	plane->state->crtc_w =3D state->crtc_w;
- 	plane->state->crtc_h =3D state->crtc_h;
- 	plane->state->src_x =3D state->src_x;
- 	plane->state->src_y =3D state->src_y;
- 	plane->state->src_w =3D state->src_w;
- 	plane->state->src_h =3D state->src_h;
- 	plane->state->alpha =3D state->alpha;
- 	plane->state->pixel_blend_mode =3D state->pixel_blend_mode;
- 	plane->state->rotation =3D state->rotation;
- 	plane->state->zpos =3D state->zpos;
- 	plane->state->normalized_zpos =3D state->normalized_zpos;
- 	plane->state->color_encoding =3D state->color_encoding;
- 	plane->state->color_range =3D state->color_range;
- 	plane->state->src =3D state->src;
- 	plane->state->dst =3D state->dst;
- 	plane->state->visible =3D state->visible;
-=20
- 	new_vc4_state =3D to_vc4_plane_state(state);
+ 	swap(plane->state->fb, new_plane_state->fb);
+ 	plane->state->crtc_x =3D new_plane_state->crtc_x;
+ 	plane->state->crtc_y =3D new_plane_state->crtc_y;
+ 	plane->state->crtc_w =3D new_plane_state->crtc_w;
+ 	plane->state->crtc_h =3D new_plane_state->crtc_h;
+ 	plane->state->src_x =3D new_plane_state->src_x;
+ 	plane->state->src_y =3D new_plane_state->src_y;
+ 	plane->state->src_w =3D new_plane_state->src_w;
+ 	plane->state->src_h =3D new_plane_state->src_h;
 -	plane->state->src_h =3D new_plane_state->src_h;
+ 	plane->state->alpha =3D new_plane_state->alpha;
+ 	plane->state->pixel_blend_mode =3D new_plane_state->pixel_blend_mode;
+ 	plane->state->rotation =3D new_plane_state->rotation;
+ 	plane->state->zpos =3D new_plane_state->zpos;
+ 	plane->state->normalized_zpos =3D new_plane_state->normalized_zpos;
+ 	plane->state->color_encoding =3D new_plane_state->color_encoding;
+ 	plane->state->color_range =3D new_plane_state->color_range;
+ 	plane->state->src =3D new_plane_state->src;
+ 	plane->state->dst =3D new_plane_state->dst;
+ 	plane->state->visible =3D new_plane_state->visible;
+=20
+ 	new_vc4_state =3D to_vc4_plane_state(new_plane_state);
  	vc4_state =3D to_vc4_plane_state(plane->state);
 =20
  	vc4_state->crtc_x =3D new_vc4_state->crtc_x;

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvxjUACgkQAVBC80lX
0GxIuwf+MLYE674mIMmHxJJji/55gWYtGGX/V3SrSewLyeKvHLfDuQlPItFchsX1
3Pz68dEgLmoWKU4VMulSbKduwWdP2SBPTT8CuKu9hXGjLj/CaVW9cG0CN6FFi55g
GQEnlmYDcvLjvVyMmi/Tva+TJ1ck9HRWzfiuSxeo9uDp4qsmSnl04DgKcfovOoy6
PY4kFCQ7d6QqF4Fnw5RQClDB8Lzf8SV0geat+Hvv9O9R244jLstLNx7rqLuNyd2S
bzyIMwugX/Oiu274Cxgf9W7aIeYSDrrdVwQ1HNTZErscCjoWjoKE/aFaCOnNKQ2r
y+SB5knEJv0xAg4gxS2Zxtzb+6SwSw==
=ya55
-----END PGP SIGNATURE-----

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B--

--===============0582637619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0582637619==--
