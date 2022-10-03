Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BDC433FE
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Oct 2022 11:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567FE10E30B;
	Mon,  3 Oct 2022 11:16:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C6C10E308
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Oct 2022 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664795757; x=1696331757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=li8uA9smJX/p1Kbj9xmvCp5pQDaUi8u/BVYwbJVzt60=;
 b=nNIjCiijF9pomIEqVPhJoyncRi5qDr/5y0aSVWJfq8fDPZeRJw//TGVV
 4LJXSTq8JlcNVqBfPlvtSrNWjJhm5eP+mId5msqh8rh0ddCei58vJJKVI
 9VKzfMoecY8kUj/qqmSZqBNCvGukTiBzZBlnTw9dE0E6aCfVrdioFP+6K
 O1YrW02/EuOf5jT9JvKvUkEJWRNFw5fjffx0YEo41ZQPkNTEhG3n3ygUQ
 6r0IAVTk2pwGS+EMLa1kRX6cTde2zhVbFS/H8mO83vG2bUhvjUg6wEpgw
 QxAtspPS3tIf/3MJrgbYbvux8nU3efPGcRe/jAULrS7hWvLy5fh+a0pUi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366650653"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="366650653"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 04:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="618696702"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="618696702"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 03 Oct 2022 04:15:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Oct 2022 14:15:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  3 Oct 2022 14:15:41 +0300
Message-Id: <20221003111544.8007-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003111544.8007-1-ville.syrjala@linux.intel.com>
References: <20221003111544.8007-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 3/6] drm/i915: Fix watermark calculations for
 gen12+ CCS+CC modifier
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
Cc: stable@vger.kernel.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Take the gen12+ CCS+CC modifier into account when calculating the
watermarks. Othwerwise we'll calculate the watermarks thinking this
Y-tiled modifier is linear.

The rc_surface part is actually a nop since that is not used
for any glk+ platform.

Cc: stable@vger.kernel.org
Fixes: d1e2775e9b96 ("drm/i915/tgl: Add Clear Color support for TGL Render Decompression")
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 1b8f5970cbf7..0ff3ece166fe 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1712,12 +1712,14 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
 		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
+		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
+		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 	wp->x_tiled = modifier == I915_FORMAT_MOD_X_TILED;
 	wp->rc_surface = modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 			 modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
 			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
+			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
+			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 	wp->is_planar = intel_format_info_is_yuv_semiplanar(format, modifier);
 
 	wp->width = width;
-- 
2.35.1

