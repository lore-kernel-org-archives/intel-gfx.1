Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEFEC56202
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 08:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 024B6208CA
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 08:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 024B6208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EA6E81D;
	Thu, 26 Nov 2020 08:55:02 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997F6E81F;
 Thu, 26 Nov 2020 08:54:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B20E580687;
 Thu, 26 Nov 2020 03:54:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Nov 2020 03:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=T0VOcITP7XJe0ox3OJH4E/HSb4hbqVauYgjMOWqeQNU=; b=Y7aFWBUD
 mJkTSTxuw6949SVnNYbSpfuRkxSSoH8PnyGnT5c+0RDQHFIPKt1d9mH67p4LJ04L
 IW34x96Js8Zu3xP4fPpZPEVS9sFB18pw/q8wtJABF40GXe7zGFgiRxWfePxrahyK
 4VidqLN5ROlkatUGUAH+QY/AZFnmELIVXKJfwIJMguEr2bnFXvb4tirdQ4RJsFiE
 pp28/exQwmLqdMOMjCGs6OBi2K7QDl6yfrqJq7ISXtqb007hJ6VJ2ywuRFLWplHu
 o0QJICp3x6tmRw8a4hYFHlMgytFKeBSSRqlvcxv6QfsE/emiPDhMNmhCe9EMMrh+
 9Reg8ASmGn7mHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=T0VOcITP7XJe0ox3OJH4E/HSb4hbq
 VauYgjMOWqeQNU=; b=LsMOV8G7c9rqJ9+9d5XztCb39CJ6iskUSC/FfPbZnTIIB
 PJ6HY8KP1s/eSBf6/My5VnHNjf1zayg4xvVxUf0yiky4Ol+fS6F9YSZlgK5NrEEH
 bVrf/t687/2NlItCGNzpS9s2OKZf3NvVBe6VDuy6i0NZxQ5iDoFoGC2GcX80E7nG
 dnjWvWroEm+q/znX5TAmkUXbFp4y55chNAQAXLLd5TN9L3wa/hTr8UwQhvSYb0Ai
 sPIReEEsuYYNfw3lh8Lwf8vD9/TS1lyeqtyHkMlllj8WXYWQ90WpEac8hQtEL5+V
 wemVMtcY+RVv7cJpl52XDLY+bx9EfscANdtLWPznQ==
X-ME-Sender: <xms:XG2_X8GzjxQpx9Nn98B_CVY3W27wL67MPVHA6IaEJ1jtD_RsQYemGw>
 <xme:XG2_X1ULkTgsxMsQXJjJps4aDHVvvdc7beCVJTXexOcACOAUWa2Nik3fB2gyEb8ha
 YD2sfszTLN_fjQbHgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehuddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeijefgieefgedvueeutdegleekgeegvedvuddutdefkeeutdegueduudeiuedt
 teenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorh
 hgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XG2_X2KJrIV24UCsa-CrLT89Y51t4THy2WRwPM564dODIWLgGp-adw>
 <xmx:XG2_X-H2H9WEsiwQNmmD6uLgMk7R_kF-kEGGpSpYDZ7SgwsMsaE7cA>
 <xmx:XG2_XyUIGmjllKGV5fN7ylrB2MAHMKGoLzUplynfjHLxP1B1lK3Iog>
 <xmx:Xm2_X2qO-IEqkA85ng0YO9LzMScM3AolMoYEdUWQgIzAvMzPFBR_Kw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4915A3064AA6;
 Thu, 26 Nov 2020 03:54:52 -0500 (EST)
Date: Thu, 26 Nov 2020 09:54:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20201126085450.r3i7wvj7pizsa4l6@gilmour>
MIME-Version: 1.0
Subject: [Intel-gfx] [PULL] drm-misc-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1967738961=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============1967738961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fd5orq2irqcv33hb"
Content-Disposition: inline


--fd5orq2irqcv33hb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week round of fixes for drm-misc

Maxime

drm-misc-fixes-2020-11-26:
A bunch of fixes for vc4 fixing some coexistence issue between wifi and
HDMI, unsupported modes, and vblank timeouts, a fix for ast to reload
the gamma LUT after changing the plane format and a double-free fix for
nouveau
The following changes since commit cdf117d6d38a127026e74114d63f32972f620c06:

  Merge tag 'drm/sun4i-dma-fix-pull-request' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux into drm-misc-fixes (2020-11-19 09:26:07 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-11-26

for you to fetch changes up to 2be65641642ef423f82162c3a5f28c754d1637d2:

  drm/nouveau: fix relocations applying logic and a double-free (2020-11-26 08:04:19 +0100)

----------------------------------------------------------------
A bunch of fixes for vc4 fixing some coexistence issue between wifi and
HDMI, unsupported modes, and vblank timeouts, a fix for ast to reload
the gamma LUT after changing the plane format and a double-free fix for
nouveau

----------------------------------------------------------------
Matti Hamalainen (1):
      drm/nouveau: fix relocations applying logic and a double-free

Maxime Ripard (11):
      drm/vc4: hdmi: Make sure our clock rate is within limits
      drm/vc4: hdmi: Block odd horizontal timings
      drm/vc4: kms: Switch to drmm_add_action_or_reset
      drm/vc4: kms: Remove useless define
      drm/vc4: kms: Rename NUM_CHANNELS
      drm/vc4: kms: Split the HVS muxing check in a separate function
      drm/vc4: kms: Document the muxing corner cases
      dt-bindings: display: Add a property to deal with WiFi coexistence
      drm/vc4: hdmi: Disable Wifi Frequencies
      drm/vc4: kms: Store the unassigned channel list in the state
      drm/vc4: kms: Don't disable the muxing of an active CRTC

Thomas Zimmermann (1):
      drm/ast: Reload gamma LUT after changing primary plane's color format

 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   6 +
 drivers/gpu/drm/ast/ast_mode.c                     |  17 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   8 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   4 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  48 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  11 +
 drivers/gpu/drm/vc4/vc4_kms.c                      | 246 +++++++++++++++------
 7 files changed, 272 insertions(+), 68 deletions(-)

--fd5orq2irqcv33hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX79tWgAKCRDj7w1vZxhR
xZJAAP4ufETTy3Jx9Xl5OCLMcNVsmBszSAJRnmX8sFMZ+VSMxAEAswgE6JWrARws
d3THw97O9ZRiTvQvqvZimbf9O3qGpgY=
=4chX
-----END PGP SIGNATURE-----

--fd5orq2irqcv33hb--

--===============1967738961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1967738961==--
