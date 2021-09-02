Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF83C4320E
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 12:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC4B60EC0
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 12:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBC4B60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A23A6E51A;
	Thu,  2 Sep 2021 12:11:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D13E89134
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Sep 2021 12:11:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="206218019"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="206218019"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 05:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="461627534"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.12])
 by fmsmga007.fm.intel.com with ESMTP; 02 Sep 2021 05:11:25 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 vandita.kulkarni@intel.com, cooper.chiou@intel.com,
 william.tseng@intel.com, Lee Shawn C <shawn.c.lee@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu,  2 Sep 2021 20:14:29 +0800
Message-Id: <20210902121429.27606-6-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902121429.27606-1-shawn.c.lee@intel.com>
References: <20210902121429.27606-1-shawn.c.lee@intel.com>
Subject: [Intel-gfx] [v3 5/5] drm/i915/dsi: Read/write proper brightness
 value via MIPI DCS command
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

Driver has to swap the endian before send brightness level value
to tcon.

v2: Use __be16 instead of u16 to fix sparse warning.
v3: Send one or two bytes brightness value depend on the precision.
v4: get data length of brightness value more easily.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Cooper Chiou <cooper.chiou@intel.com>
Cc: William Tseng <william.tseng@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 .../i915/display/intel_dsi_dcs_backlight.c    | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index 567c086602d5..f61ed82e8867 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -47,33 +47,42 @@ static u32 dcs_get_backlight(struct intel_connector *connector, enum pipe unused
 {
 	struct intel_encoder *encoder = intel_attached_encoder(connector);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
+	struct intel_panel *panel = &connector->panel;
 	struct mipi_dsi_device *dsi_device;
-	u8 data = 0;
+	u8 data[2] = {};
 	enum port port;
+	size_t len = panel->backlight.max > U8_MAX ? 2 : 1;
 
-	/* FIXME: Need to take care of 16 bit brightness level */
 	for_each_dsi_port(port, intel_dsi->dcs_backlight_ports) {
 		dsi_device = intel_dsi->dsi_hosts[port]->device;
 		mipi_dsi_dcs_read(dsi_device, MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
-				  &data, sizeof(data));
+				  &data, len);
 		break;
 	}
 
-	return data;
+	return (data[1] << 8) | data[0];
 }
 
 static void dcs_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(conn_state->best_encoder));
+	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
 	struct mipi_dsi_device *dsi_device;
-	u8 data = level;
+	u8 data[2] = {};
 	enum port port;
+	size_t len = panel->backlight.max > U8_MAX ? 2 : 1;
+
+	if (len == 1) {
+		data[0] = level;
+	} else {
+		data[0] = level >> 8;
+		data[1] = level;
+	}
 
-	/* FIXME: Need to take care of 16 bit brightness level */
 	for_each_dsi_port(port, intel_dsi->dcs_backlight_ports) {
 		dsi_device = intel_dsi->dsi_hosts[port]->device;
 		mipi_dsi_dcs_write(dsi_device, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
-				   &data, sizeof(data));
+				   &data, len);
 	}
 }
 
-- 
2.17.1

