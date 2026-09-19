Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAFEC982F7
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D210E39B;
	Mon, 21 Sep 2026 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HMwK7xfi";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1510E1BD
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 16:19:39 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so16671415e9.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789834778; x=1790439578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gk69ow4/E2h7xxpQkzC/eKEn41R17ZHs1BgJ7qcqGDM=;
 b=HMwK7xfiC8DgCMviIMCTmdksiGuh1gxVRjK61M2V7TfhBJ6og1TgV81Qh6Vo9wYg42
 xHzzQuCoBs4WDZaezayHbU19iiPD+Sek4nXEKNH8PL01mTdR8/G1yEPtnxpIa+AChLfa
 XC/6A7X98TEu0TQhueIWcejZkUuU/rQG3Z9Acj5c0KtsFuzoG97ohrtxST2LyFbuYaQr
 1oxMUlzZPoyRFrxFOwspno2BnSTpkAg8P23kAFu2jtlwM5mCBefLYclszZUCJ2oYR1ui
 CLAw3uf9jFbTcerd4U2ZsOHfM/r/GiSAL5HwO8HZilNDKfFQs5Ho0S5Ea7gXP/wu1kHD
 SjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789834778; x=1790439578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gk69ow4/E2h7xxpQkzC/eKEn41R17ZHs1BgJ7qcqGDM=;
 b=bxowY080AV7aUZEVrHzYQLK7iDpX8n4cVmqInHdPRj41tQazdvBbxlFkC4lwvXZY/d
 MuXr3FuZt6LulXYZirNRVBgkbhvfI5t9HqLWDk/a58+iRS79NYmQx3UaSLkjC6aNB1LB
 nxBt66xIjaeG4Y09T7nHT98xqTvZ2IUdoOOZN9x6S5rUoSacPhRhcfwldDlfcUGAK+80
 INW5rxMNkX/jVs+agdJ/mxWYTZuXJp40q1mtycnElftybradRxZvA0lPDDrTPaBvirT1
 +b2bFbQR2IOqSA26yLUAC6A5yBl8hB3hwiNsewAA6M+rwIDOlHwXXELaMu7IB7U2aUM7
 mSmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOGQCDer3SZjCdc9PbqiTiWOFuw8MI0mVczjmuw/z558xyjdfweZQ6RiEj0p8u4rbtPZHA8MOsmFk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mHnrmwn30LxHzWOXg1HXMzx7MR9GgSl/ewhWcezQPuSY4PF/rs
 duyzqEpNMjjcttUN61OsHx5elzXeeLmEShqfJaW+RmVlcOeXYr694pZy
X-Gm-Gg: AYBFou0RD8f9ty9bDgzWzg7Vm5jaHo6+er4u3VfuQEYxTk7JcZ9yhplbUSC2a1ZvB9m
 l2S2zjksi97L9sKqEdLT7c10v1qKbtgySDSW9YDIqoV3ASCnM5Zxl3sljmh40pUV85cBgl+Ghi2
 z5zsuS/DqUWa1HRRA7UACQYu1o2Zda5cOkFLcMaBHUsAo6q/cI2FqNuR4tBTvwPBWPVaI334wwS
 0DrQouKf9o8OLv5LE4Ma5cMXK/L0I5PXxRFfLHNC+QJ45aNJ9i69/MyVYqHFvYYEkc9W/gvVI9/
 mUtnjDvyhXVObVXQjywf/1u11aYYA0gQpPSvc2x3GhYFPQMJ/izkFQD3hv6SwYZvuNEPRX4vc4r
 430yUw8Rz4qdWEcZkbyIE6fN+i5zbqM4v0VSHwWQOqEp8F5uBvMXXnT05RIzGMIROXaQtXGhd+Y
 yl1zqZa8hAahS7a/V7eySVnOSJ7vglqrDN6lyjZl4OEfvU8RgzhyiRCSjhbsVgi+sA//vrWNQ=
X-Received: by 2002:a05:600c:34c1:b0:49e:799a:8951 with SMTP id
 5b1f17b1804b1-49fc56aba0dmr91554815e9.11.1789834778003; 
 Sat, 19 Sep 2026 09:19:38 -0700 (PDT)
Received: from fedora ([2a02:587:200a:7d00:31a7:37b6:ee54:4eca])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0eabfcsm87048025e9.3.2026.09.19.09.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 09:19:37 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mail@taterr.org
Subject: [PATCH] drm/i915/display: Replace bw_constrained with max_link_bpp_x16
Date: Sat, 19 Sep 2026 19:19:27 +0300
Message-ID: <20260919161927.98829-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2026 12:56:44 +0000
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

In intel_crt.c (VGA displays) and intel_lvds.c (old laptop displays),

both files were using a legacy boolean flag crtc_state->bw_constrained

to guess if the display link was bandwidth limited.

To fix this, replaced the bw_constrained boolean checks with direct

comparisons against the max_link_bpp_x16 fixed-point API.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/gpu/drm/i915/display/intel_crt.c  | 5 ++---
 drivers/gpu/drm/i915/display/intel_lvds.c | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 5b8968197fbc..3da9547f2c6e 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -459,10 +459,9 @@ static int hsw_crt_compute_config(struct intel_atomic_state *state,
 
 	/* LPT FDI RX only supports 8bpc. */
 	if (HAS_PCH_LPT(display)) {
-		/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-		if (crtc_state->bw_constrained && crtc_state->pipe_bpp < 24) {
+		if (crtc_state->max_link_bpp_x16 < fxp_q4_from_int(24)) {
 			drm_dbg_kms(display->drm,
-				    "LPT only supports 24bpp\n");
+				   "LPT only supports 24bpp\n");
 			return -EINVAL;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 872753478cf2..6bbd13ab5da7 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -443,10 +443,10 @@ static int intel_lvds_compute_config(struct intel_atomic_state *state,
 	else
 		lvds_bpp = 6*3;
 
-	/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-	if (lvds_bpp != crtc_state->pipe_bpp && !crtc_state->bw_constrained) {
+	if (lvds_bpp != crtc_state->pipe_bpp &&
+	    crtc_state->max_link_bpp_x16 >= fxp_q4_from_int(lvds_bpp)) {
 		drm_dbg_kms(display->drm,
-			    "forcing display bpp (was %d) to LVDS (%d)\n",
+			   "forcing display bpp (was %d) to LVDS (%d)\n",
 			    crtc_state->pipe_bpp, lvds_bpp);
 		crtc_state->pipe_bpp = lvds_bpp;
 	}
-- 
2.55.0

