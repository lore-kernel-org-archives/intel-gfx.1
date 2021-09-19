Return-Path: <SRS0=88YI=OJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3F4C433F5
	for <intel-gfx@archiver.kernel.org>; Sun, 19 Sep 2021 23:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDED361107
	for <intel-gfx@archiver.kernel.org>; Sun, 19 Sep 2021 23:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDED361107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB56E2B8;
	Sun, 19 Sep 2021 23:07:38 +0000 (UTC)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD466E2B8;
 Sun, 19 Sep 2021 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1632092853;
 bh=/y3BMjdPouVMaRIxDFH1zDnVpECOAnWjGL7jfG4p6KU=;
 h=Date:From:To:Cc:Subject:From;
 b=cNdPyGwxLSPoMadDLwNaK/7sp/kr7gC3LQQn9C3FsZo//2vtgKKd+7LHe17pcBALA
 NVruV0G+BywEgjK86xX9joygfdRYJgVh70AH5BC51Ems2tbcn71d/F54EBnvqoxfV9
 CRVtyYJmw/yKyGUZRSx7hCqPDaE1LWRwijRP9z22a2+qP4JdBlmQmftBqcRcA3h8qW
 GZra8XKA17g8PPl9FGq4wg/xbMnV/aW+yZsDk9PGT0cAnKWpc978i5LMxrSiIsLGWK
 o6+VTmYWB62U/exeDLW8fVb1C1HBj7QN1pHqkSDL3+koqsGlKlbsQ5EOxGAMwgt3uy
 51zT8LIK9//Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCNcz64yQz9sR4;
 Mon, 20 Sep 2021 09:07:31 +1000 (AEST)
Date: Mon, 20 Sep 2021 09:07:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Maxime Ripard
 <maxime@cerno.tech>
Message-ID: <20210920090729.19458953@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/STKEsFTlVk9UE/CSsnEVvBS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: [Intel-gfx] linux-next: manual merge of the drm-misc-fixes tree
 with Linus' tree
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

--Sig_/STKEsFTlVk9UE/CSsnEVvBS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_hdmi.c

between commit:

  b1044a9b8100 ("Revert drm/vc4 hdmi runtime PM changes")

from Linus' tree and commits:

  36e9bcb8edfc ("drm/vc4: select PM")
  a22dad7fa0cd ("drm/vc4: hdmi: Rework the pre_crtc_configure error handlin=
g")

from the drm-misc-fixes tree.

I fixed it up (I just effectively reverted the change in Linus' tree) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/STKEsFTlVk9UE/CSsnEVvBS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFHwrIACgkQAVBC80lX
0GwKZQf+KNVEEMRpeML0EC3GVZmsVTbhrVGlTjlN1Je3T33hBSxO5WRkmEM7f4pY
k5IDtwnhFRsJmCgsE4H04w7TITimEtxqyY9ADZFt0qWO1+i06qMz70URT32+0WIs
uhAyc8yPp4Ii/ZesRQ7dUcveUkAL4gfhW27VCUVZWmcMLUN/MjIVK2Ed3MuATsOM
kedG0mvk+Pa/RRJTeva6ZrjkFNNspHWrMzPSt7iV+pUom20xB+VpcOLN2W0M2mFk
JwdrQVBKZjBlSPrdd9DRp8yskOuaKdAiFjqNaIbSkLkmPO5eDBI9ao2rSMtfMwXF
2tdZvcG3pw6GoZWwykGDgKSlUDFL1A==
=OrlO
-----END PGP SIGNATURE-----

--Sig_/STKEsFTlVk9UE/CSsnEVvBS--
