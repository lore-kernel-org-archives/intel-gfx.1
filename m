Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EC8C83F12
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Aug 2023 11:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E7210E278;
	Tue, 29 Aug 2023 11:39:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CCB10E264;
 Tue, 29 Aug 2023 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309179; x=1724845179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L8iCtU3oGxybyifSiYIwNLyNXDXSOS6ICLAa3tUmwL4=;
 b=Qo7IvoYydIetZNqRQIGHPyY5u+p4iJlPsUvn84afoMF6b5ogxo8lmYWP
 PJCMRw0WVgZEa/QnYpS3hCXU7dwexJPQqkw80nqWDlTBdWR5EhO/6KdG8
 4w+42jYw8hskC15JI0m+QkLdC2BNykpkZhwkt0vVFP5mP+8NKRXHvqeP+
 Asolw90T7VTdG5/svRbyYlDfRR37jby0d6G0pZTjd4gcizEcGMZJq8sum
 aOBsp+97EwAiJT7y/OaGXKBtwTpuLgKJJesNp7jAC0aZFqRJJd1NIMQ5F
 pVbSz7GsSTt5WvaMz0NeuW4cnkHbaRP9p4OqaIuC7UMDjrLKtBGLzbSJS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063923"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063923"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669042"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669042"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Aug 2023 14:39:12 +0300
Message-ID: <20230829113920.13713-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 04/12] drm/i915/lvds: Populate connector->ddc
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Populate connector->ddc, and thus create the "ddc" symlink
in sysfs for the LVDS port.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_lvds.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 3ace56979b70..2306e133e3f6 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -837,7 +837,7 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	struct intel_encoder *encoder;
 	i915_reg_t lvds_reg;
 	u32 lvds;
-	u8 pin;
+	u8 ddc_pin;
 
 	/* Skip init on machines we know falsely report LVDS */
 	if (dmi_check_system(intel_no_lvds)) {
@@ -864,8 +864,8 @@ void intel_lvds_init(struct drm_i915_private *i915)
 			return;
 	}
 
-	pin = GMBUS_PIN_PANEL;
-	if (!intel_bios_is_lvds_present(i915, &pin)) {
+	ddc_pin = GMBUS_PIN_PANEL;
+	if (!intel_bios_is_lvds_present(i915, &ddc_pin)) {
 		if ((lvds & LVDS_PORT_EN) == 0) {
 			drm_dbg_kms(&i915->drm,
 				    "LVDS is not present in VBT\n");
@@ -888,8 +888,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	lvds_encoder->attached_connector = connector;
 	encoder = &lvds_encoder->base;
 
-	drm_connector_init(&i915->drm, &connector->base, &intel_lvds_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
+	drm_connector_init_with_ddc(&i915->drm, &connector->base,
+				    &intel_lvds_connector_funcs,
+				    DRM_MODE_CONNECTOR_LVDS,
+				    intel_gmbus_get_adapter(i915, ddc_pin));
 
 	drm_encoder_init(&i915->drm, &encoder->base, &intel_lvds_enc_funcs,
 			 DRM_MODE_ENCODER_LVDS, "LVDS");
@@ -943,13 +945,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	 * preferred mode is the right one.
 	 */
 	mutex_lock(&i915->drm.mode_config.mutex);
-	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
-		drm_edid = drm_edid_read_switcheroo(&connector->base,
-						    intel_gmbus_get_adapter(i915, pin));
-	} else {
-		drm_edid = drm_edid_read_ddc(&connector->base,
-					     intel_gmbus_get_adapter(i915, pin));
-	}
+	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
+		drm_edid = drm_edid_read_switcheroo(&connector->base, connector->base.ddc);
+	else
+		drm_edid = drm_edid_read_ddc(&connector->base, connector->base.ddc);
 	if (drm_edid) {
 		if (drm_edid_connector_update(&connector->base, drm_edid) ||
 		    !drm_edid_connector_add_modes(&connector->base)) {
-- 
2.41.0

