Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAE8C4828F
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Feb 2024 18:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF79A10FA0D;
	Fri,  9 Feb 2024 18:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZGzvXKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24A610FA09
 for <intel-gfx@lists.freedesktop.org>; Fri,  9 Feb 2024 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503908; x=1739039908;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u8s+TJ7rEwG8gqoZu4zqTVHPP8ukP/jBnIDw7acEWlg=;
 b=WZGzvXKv/1PlJ0mIQIkoVPmIJWlDohr99vDqZYdPV1J0bhygu8YYSwnc
 4U1ompV3I7/amsfvepuhoVYxaq/RAMm5SHzStcKm9s8lJtKCpvW95si65
 lyEA34hCaWD/JB9rUO0BwiNlI2PpPq5UVRrBGAwzsEiHgEq5xOfhXGySd
 ImCOucah+/iV3aRbVi7hGfDE/4WAaIufaKigp8bHKZ21Jnpc0wncb3tWM
 LR5Ea2myzIIyooOJY8Qo7O39iYgXvOZcKI4T4VYC0bNfL4sgd+oDYUq/b
 n/SgxXaxJXgXJ0/hUZXoxEVmHfFPz65dVxkCoMcO4ghHwk1eEYYq4mbQP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="23956534"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="23956534"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825204223"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="825204223"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 09 Feb 2024 10:38:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Feb 2024 20:38:25 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Enable fastboot across the board
Date: Fri,  9 Feb 2024 20:38:09 +0200
Message-ID: <20240209183809.16887-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209183809.16887-1-ville.syrjala@linux.intel.com>
References: <20240209183809.16887-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There's nothing magical about vlv+ platforms vs. fastboot.
If it works somewhere it should work everywhere, assuming
we've not missed any crucial state checks. That seems unlikely
on older platforms with less state to check anyway.

Just enable fastboot across the board, and the remove the
remnants of the optional stuff (we already removed the
modparam for fastboot anyway).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 22 --------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 66ee6749fdae..00ac65a14029 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4937,20 +4937,6 @@ pipe_config_pll_mismatch(bool fastset,
 	}
 }
 
-static bool fastboot_enabled(struct drm_i915_private *dev_priv)
-{
-	/* Enable fastboot by default on Skylake and newer */
-	if (DISPLAY_VER(dev_priv) >= 9)
-		return true;
-
-	/* Enable fastboot by default on VLV and CHV */
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-		return true;
-
-	/* Disabled by default on all others */
-	return false;
-}
-
 bool
 intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			  const struct intel_crtc_state *pipe_config,
@@ -4959,14 +4945,6 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->dev);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	bool ret = true;
-	bool fixup_inherited = fastset &&
-		current_config->inherited && !pipe_config->inherited;
-
-	if (fixup_inherited && !fastboot_enabled(dev_priv)) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "initial modeset and fastboot not set\n");
-		ret = false;
-	}
 
 #define PIPE_CONF_CHECK_X(name) do { \
 	if (current_config->name != pipe_config->name) { \
-- 
2.43.0

