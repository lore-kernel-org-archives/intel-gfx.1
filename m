Return-Path: <SRS0=4rgl=NX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E09CC432BE
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 16:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FB0610A2
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 16:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38FB0610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2D06E197;
	Wed,  1 Sep 2021 16:10:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F1F6E213
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Sep 2021 16:10:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="241065388"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="241065388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:10:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="498952145"
Received: from josearun-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.251.212.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:10:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	jose.souza@intel.com,
	ankit.k.nautiyal@intel.com
Date: Wed,  1 Sep 2021 19:10:00 +0300
Message-Id: <451082780a8befb2b27919439c901a2159ce173f.1630512523.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630512523.git.jani.nikula@intel.com>
References: <cover.1630512523.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 2/7] drm/i915/bios: use max tmds clock
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
 drivers/gpu/drm/i915/display/intel_bios.c | 52 +++++++++++------------
 drivers/gpu/drm/i915/i915_drv.h           |  2 -
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index afb5fcd9dd0c..253a528ba61a 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1876,6 +1876,24 @@ static int _intel_bios_hdmi_level_shift(const struct intel_bios_encoder_data *de
 	return devdata->child.hdmi_level_shifter_value;
 }
 
+static int _intel_bios_max_tmds_clock(const struct intel_bios_encoder_data *devdata)
+{
+	if (!devdata || devdata->i915->vbt.version < 204)
+		return 0;
+
+	switch (devdata->child.hdmi_max_data_rate) {
+	default:
+		MISSING_CASE(devdata->child.hdmi_max_data_rate);
+		fallthrough;
+	case HDMI_MAX_DATA_RATE_PLATFORM:
+		return 0;
+	case HDMI_MAX_DATA_RATE_297:
+		return 297000;
+	case HDMI_MAX_DATA_RATE_165:
+		return 165000;
+	}
+}
+
 static bool is_port_valid(struct drm_i915_private *i915, enum port port)
 {
 	/*
@@ -1895,7 +1913,7 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 	const struct child_device_config *child = &devdata->child;
 	struct ddi_vbt_port_info *info;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_crt, supports_typec_usb, supports_tbt;
-	int dp_boost_level, hdmi_boost_level, hdmi_level_shift;
+	int dp_boost_level, hdmi_boost_level, hdmi_level_shift, max_tmds_clock;
 	enum port port;
 
 	port = dvo_port_to_port(i915, child->dvo_port);
@@ -1964,30 +1982,11 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 			    port_name(port), hdmi_level_shift);
 	}
 
-	if (i915->vbt.version >= 204) {
-		int max_tmds_clock;
-
-		switch (child->hdmi_max_data_rate) {
-		default:
-			MISSING_CASE(child->hdmi_max_data_rate);
-			fallthrough;
-		case HDMI_MAX_DATA_RATE_PLATFORM:
-			max_tmds_clock = 0;
-			break;
-		case HDMI_MAX_DATA_RATE_297:
-			max_tmds_clock = 297000;
-			break;
-		case HDMI_MAX_DATA_RATE_165:
-			max_tmds_clock = 165000;
-			break;
-		}
-
-		if (max_tmds_clock)
-			drm_dbg_kms(&i915->drm,
-				    "Port %c VBT HDMI max TMDS clock: %d kHz\n",
-				    port_name(port), max_tmds_clock);
-		info->max_tmds_clock = max_tmds_clock;
-	}
+	max_tmds_clock = _intel_bios_max_tmds_clock(devdata);
+	if (max_tmds_clock)
+		drm_dbg_kms(&i915->drm,
+			    "Port %c VBT HDMI max TMDS clock: %d kHz\n",
+			    port_name(port), max_tmds_clock);
 
 	/* I_boost config for SKL and above */
 	dp_boost_level = intel_bios_encoder_dp_boost_level(devdata);
@@ -2950,8 +2949,9 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *i915,
 int intel_bios_max_tmds_clock(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	const struct intel_bios_encoder_data *devdata = i915->vbt.ddi_port_info[encoder->port].devdata;
 
-	return i915->vbt.ddi_port_info[encoder->port].max_tmds_clock;
+	return _intel_bios_max_tmds_clock(devdata);
 }
 
 /* This is an index in the HDMI/DVI DDI buffer translation table, or -1 */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 67a9f07550d4..8b4a31265978 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -639,8 +639,6 @@ struct ddi_vbt_port_info {
 	/* Non-NULL if port present. */
 	struct intel_bios_encoder_data *devdata;
 
-	int max_tmds_clock;
-
 	u8 alternate_aux_channel;
 	u8 alternate_ddc_pin;
 
-- 
2.30.2

