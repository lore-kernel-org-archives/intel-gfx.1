Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AA0C98321
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8D10FC33;
	Fri, 25 Sep 2026 19:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLKQ73CZ";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C0910F69F
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 16:50:01 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e66390995so289735e9.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790268600; x=1790873400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
 b=CLKQ73CZiweMFfKrW9BooR36QwT4AI9J9tSTDodBtoIR2ECiTvkNpc4vm6CIctHhuD
 rQhzm7wJRxEcOFKyP4NPATl9U+RfWlQiGstjBA6XgrePoBsqngMLax6JlO3b83sTww1O
 3chmoNsuiFvJcuvA57hyudCGxMH55yzovaaIkz/Sz3BDrrcyiEquavxhmmcpOqfei47b
 HmauFCj6xHIe4AadGEh4cf6yXwUKVlKBFW7Z+yS0FcbUy9IN1MUysficNyQfI0fb6uRS
 2sII8eKILBKC/JiZaowRoWqrS4/iaL40pnC1wiTPGl0lhO05FnEq0RdwdnxDjuXI+cgL
 uUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790268600; x=1790873400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
 b=mhh4I5anhZMPzJ9XEzgMvh8L3vjDVKupiO3Ad7HT9Eh9FRTkgf+sY5L9IwZA1y4N9/
 yUHS6gtbRLKR/FWeXiA/NL5EySpF3qvU9dl/bUz++8VWiJgRIX+tFNr6SBJ4f+/jMbFG
 TS9VzMy5F53HVcJWGx6/OG9O+SC3/1kAzZtOLj0maqBx1SZS3V6r0ymeV0HC+DCISRof
 JqLWj0g7ApynltGINXZPo43/vCe6uKNoSA5Qb16vtbY6Te6k3P+ozCPzb9O4OHAvb6e4
 Pd+v4f6K4O59lTlwXjM2SpM7c8GTOfK/NaJvkvZxy25aZXvzkkAE8pw77fg88yp30U1R
 O87A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzT6SPTP+juQkQtBmjhcFgwaHI9nXw6qxItoQQgsVaFh6BYa+VwJjF8L5D8pjr6Q/cv1P5xru8JArA=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lwXNdq9MvIzFTRM7UmMUCiX6XLVZeQxHg96RtwlgN5rxAO0EcS
 rVC7zCV74mtIVPvu2QbKoY+WHkiEhYojNqb/iEJWnL+T0w5nnkI8Ygv6
X-Gm-Gg: AYBFou22b7fDBsU6bLMxwkTqAeZlve0bq+wnC8/FjtUhyDW/gDyAB/Dvskyu05nQm4c
 ejfnR53aTsimpEjqfS44fS91B78hMXuGqjOZmi1P92jqyla7LOEm1zwe3vevvAq8b7JepO4Z/VC
 wogO0yusayJLgddMfTfsZXZCG2d019Qr/HMRF0YGD6peBRhKWWN7htQWud3L+Do1wssLDEw8QkC
 wb1N+aCcvrOlZd6wK5M+EuBQ9nKZuLuquzRniZNuElPqsBS5xwLqEoqhPh+iPOQ/koJBPWBPdO1
 tnZSxOojzC1HRvtqJsXchnmukp/c4sewCUOElkpglAspPwVd77OoayLpYyy1T0Z0W6QQO3bsA4D
 oKRNm1wgaPru/O51CdA7IiuAKkQ6msFXoPECFF180xW1QrMy9DgnFxaQ327VzdUL6GeMISgPm5n
 n5gvrt66+9jiaD09JsWEEtxJBVa36OqnXX80s2+VVtqr8Smg1A/A9LZaA5FN/z9+PiQIpYVhExl
 T73nQ75
X-Received: by 2002:a05:600c:4e86:b0:49c:ffe3:2b3f with SMTP id
 5b1f17b1804b1-49fe66c8e13mr51367875e9.3.1790268599645; 
 Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fee6ced69sm1219015e9.0.2026.09.24.09.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mail@taterr.org
Subject: [PATCH v2] drm/i915/display: Replace bw_constrained with
 max_link_bpp_x16
Date: Thu, 24 Sep 2026 19:49:53 +0300
Message-ID: <20260924164953.28066-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919161927.98829-1-mail@taterr.org>
References: <20260919161927.98829-1-mail@taterr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:11:15 +0000
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
v2: Remove the dead bw_constrained flag definition and writer entirely,
    as pointed out by the sashiko bot reviewer
 drivers/gpu/drm/i915/display/intel_crt.c           | 5 ++---
 drivers/gpu/drm/i915/display/intel_display.c       | 1 -
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 drivers/gpu/drm/i915/display/intel_lvds.c          | 6 +++---
 4 files changed, 5 insertions(+), 8 deletions(-)

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
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..fa6b11c4df47 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4767,7 +4767,6 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 			    "[CRTC:%d:%s] Link bpp limited to " FXP_Q4_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
 			    FXP_Q4_ARGS(crtc_state->max_link_bpp_x16));
-		crtc_state->bw_constrained = true;
 	}
 
 	base_bpp = crtc_state->pipe_bpp;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 43d53a98dae7..2166c84596c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1146,7 +1146,6 @@ struct intel_crtc_state {
 	 * required. This is set in the 2nd loop of calling encoder's
 	 * ->compute_config if the first pick doesn't work out.
 	 */
-	bool bw_constrained;
 
 	/* Settings for the intel dpll used on pretty much everything but
 	 * haswell. */
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

