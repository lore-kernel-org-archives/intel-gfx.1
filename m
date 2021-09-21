Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB51C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4776115A
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E4776115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FE66E94A;
	Tue, 21 Sep 2021 11:02:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E3C6E94A
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 11:02:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="202825356"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="202825356"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:02:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="549440537"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:02:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Date: Tue, 21 Sep 2021 14:02:44 +0300
Message-Id: <20210921110244.8666-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/hdmi: convert intel_hdmi_to_dev to
 intel_hdmi_to_i915
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

Prefer i915 over drm pointer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 1bc33766ed39..1e8a87f81e8e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -53,21 +53,20 @@
 #include "intel_panel.h"
 #include "intel_snps_phy.h"
 
-static struct drm_device *intel_hdmi_to_dev(struct intel_hdmi *intel_hdmi)
+static struct drm_i915_private *intel_hdmi_to_i915(struct intel_hdmi *intel_hdmi)
 {
-	return hdmi_to_dig_port(intel_hdmi)->base.base.dev;
+	return to_i915(hdmi_to_dig_port(intel_hdmi)->base.base.dev);
 }
 
 static void
 assert_hdmi_port_disabled(struct intel_hdmi *intel_hdmi)
 {
-	struct drm_device *dev = intel_hdmi_to_dev(intel_hdmi);
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(intel_hdmi);
 	u32 enabled_bits;
 
 	enabled_bits = HAS_DDI(dev_priv) ? DDI_BUF_CTL_ENABLE : SDVO_ENABLE;
 
-	drm_WARN(dev,
+	drm_WARN(&dev_priv->drm,
 		 intel_de_read(dev_priv, intel_hdmi->hdmi_reg) & enabled_bits,
 		 "HDMI port enabled, expecting disabled\n");
 }
@@ -1246,7 +1245,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 
 void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_hdmi_to_dev(hdmi));
+	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(hdmi);
 	struct i2c_adapter *adapter =
 		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
 
@@ -1830,7 +1829,7 @@ hdmi_port_clock_valid(struct intel_hdmi *hdmi,
 		      int clock, bool respect_downstream_limits,
 		      bool has_hdmi_sink)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_hdmi_to_dev(hdmi));
+	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(hdmi);
 
 	if (clock < 25000)
 		return MODE_CLOCK_LOW;
@@ -1946,8 +1945,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 		      struct drm_display_mode *mode)
 {
 	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
-	struct drm_device *dev = intel_hdmi_to_dev(hdmi);
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(hdmi);
 	enum drm_mode_status status;
 	int clock = mode->clock;
 	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
-- 
2.30.2

