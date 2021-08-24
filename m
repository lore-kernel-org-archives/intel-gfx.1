Return-Path: <SRS0=Bjkn=NP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22922C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 13:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D412F6127B
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 13:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D412F6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF606E02D;
	Tue, 24 Aug 2021 13:34:39 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16ED6E02D
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Aug 2021 13:34:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="217034648"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="217034648"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 06:34:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="535805678"
Received: from romerosa-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.44.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 06:34:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 24 Aug 2021 16:34:13 +0300
Message-Id: <d5c777911aad99e5b209aa6b5031da112d2200d6.1629811722.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629811722.git.jani.nikula@intel.com>
References: <cover.1629811722.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/7] drm/i915/bios: use hdmi level shift
 directly from child data
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

Avoid extra caching of the data.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 26 +++++++++++++----------
 drivers/gpu/drm/i915/i915_drv.h           |  4 ----
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index e86e6ed2d3bf..afb5fcd9dd0c 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1868,6 +1868,14 @@ intel_bios_encoder_supports_edp(const struct intel_bios_encoder_data *devdata)
 		devdata->child.device_type & DEVICE_TYPE_INTERNAL_CONNECTOR;
 }
 
+static int _intel_bios_hdmi_level_shift(const struct intel_bios_encoder_data *devdata)
+{
+	if (!devdata || devdata->i915->vbt.version < 158)
+		return -1;
+
+	return devdata->child.hdmi_level_shifter_value;
+}
+
 static bool is_port_valid(struct drm_i915_private *i915, enum port port)
 {
 	/*
@@ -1887,7 +1895,7 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 	const struct child_device_config *child = &devdata->child;
 	struct ddi_vbt_port_info *info;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_crt, supports_typec_usb, supports_tbt;
-	int dp_boost_level, hdmi_boost_level;
+	int dp_boost_level, hdmi_boost_level, hdmi_level_shift;
 	enum port port;
 
 	port = dvo_port_to_port(i915, child->dvo_port);
@@ -1949,15 +1957,11 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 		sanitize_aux_ch(i915, port);
 	}
 
-	if (i915->vbt.version >= 158) {
-		/* The VBT HDMI level shift values match the table we have. */
-		u8 hdmi_level_shift = child->hdmi_level_shifter_value;
+	hdmi_level_shift = _intel_bios_hdmi_level_shift(devdata);
+	if (hdmi_level_shift >= 0) {
 		drm_dbg_kms(&i915->drm,
 			    "Port %c VBT HDMI level shift: %d\n",
-			    port_name(port),
-			    hdmi_level_shift);
-		info->hdmi_level_shift = hdmi_level_shift;
-		info->hdmi_level_shift_set = true;
+			    port_name(port), hdmi_level_shift);
 	}
 
 	if (i915->vbt.version >= 204) {
@@ -2950,13 +2954,13 @@ int intel_bios_max_tmds_clock(struct intel_encoder *encoder)
 	return i915->vbt.ddi_port_info[encoder->port].max_tmds_clock;
 }
 
+/* This is an index in the HDMI/DVI DDI buffer translation table, or -1 */
 int intel_bios_hdmi_level_shift(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-	const struct ddi_vbt_port_info *info =
-		&i915->vbt.ddi_port_info[encoder->port];
+	const struct intel_bios_encoder_data *devdata = i915->vbt.ddi_port_info[encoder->port].devdata;
 
-	return info->hdmi_level_shift_set ? info->hdmi_level_shift : -1;
+	return _intel_bios_hdmi_level_shift(devdata);
 }
 
 int intel_bios_encoder_dp_boost_level(const struct intel_bios_encoder_data *devdata)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0a2b63072ff5..431408789826 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -642,10 +642,6 @@ struct ddi_vbt_port_info {
 
 	int max_tmds_clock;
 
-	/* This is an index in the HDMI/DVI DDI buffer translation table. */
-	u8 hdmi_level_shift;
-	u8 hdmi_level_shift_set:1;
-
 	u8 alternate_aux_channel;
 	u8 alternate_ddc_pin;
 
-- 
2.20.1

