Return-Path: <SRS0=KOmL=OR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD61C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 05:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CAF460F6D
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 05:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CAF460F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C186E834;
	Mon, 27 Sep 2021 05:53:51 +0000 (UTC)
X-Greylist: delayed 558 seconds by postgrey-1.36 at gabe;
 Mon, 27 Sep 2021 05:53:49 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6998E6E826;
 Mon, 27 Sep 2021 05:53:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHs5j4NL1z4xbR;
 Mon, 27 Sep 2021 15:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1632721466;
 bh=DCtEvsg3hsgFmNRnoDHLNa8pY9MmGR9OS0ESIOqr/ZE=;
 h=Date:From:To:Cc:Subject:From;
 b=mPerCW3BRc0bILK/tVFzZ32X/Oqt2Qa9RQDgPY8JjQc2Gh/OBy3Vr2AEpomfgv8Ch
 lrIwnsWB+Zq64oHzfft8fBDEDoOHq8OPk0PLkn5hCdPAXXz9/ZqnxFhvLRG3U/NL69
 01I9mjlzGXskhU7SWeMYur2vr5LFBkxvcBRYy8IZLSCA7oZ/xCQTQLvw62bMDdQSid
 h5DTmn1gOyVr4P6vTQQ7eQvvc5aeRXNPaJ4NXoupZ1q9/NdwsuUJeMMHyaNIkCq8ro
 ZVuhD61FobAFwZrATBRZTUyAvvo6B4WPNNCDzlMK7oJoJcCiLGpm1ruY5F7+5lYy6A
 Yi3VJYUjyqnnA==
Date: Mon, 27 Sep 2021 15:44:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Douglas Anderson <dianders@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Message-ID: <20210927154422.605920fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wMHWzMzTFiiQiKRnfentyY/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: [Intel-gfx] linux-next: build warning after merge of the drm-misc
 tree
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

--Sig_/wMHWzMzTFiiQiKRnfentyY/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_edid.h:530: warning: Function parameter or member 'vend_chr=
_1' not described in 'drm_edid_encode_panel_id'
include/drm/drm_edid.h:530: warning: Excess function parameter 'vend_chr_3'=
 description in 'drm_edid_encode_panel_id'


Introduced by commit

  7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")

--=20
Cheers,
Stephen Rothwell

--Sig_/wMHWzMzTFiiQiKRnfentyY/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFRWjYACgkQAVBC80lX
0Gy39gf/e568oOLEQAhDFPJCzNYA5T06zR9qmRx/veY0EC8OSxtvdtKukj/AzmV6
vR1xWOtCLuS0nObNdtfODdkLWAxFMUDtESqJdrC7x5C7fRnViZkz07kEwHahZTxG
MfX9a+Eph2t+YscLNPQlvDXlwCxOqFiT64nyp/AVz//BefJ9s3cDrBVNfiKRGoCu
q9q5majl1FGlmn9BlmWUC9hdxdf0xKZyHldZ0+k3G5cTjvxgoN7VHYV1REKgwz9H
O3H61Pcb6sA2k0gfogt+aFNRAmWPV63LtW7YwYY70uC+Dpwmys1Pl87hg17EYsMU
q686aDT4PBbZWh2oLEytRxXlFLyhDg==
=CoS0
-----END PGP SIGNATURE-----

--Sig_/wMHWzMzTFiiQiKRnfentyY/--
