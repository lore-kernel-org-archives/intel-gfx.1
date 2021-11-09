Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CFDC433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 08:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B66B610E9
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 08:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B66B610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE76E82C;
	Tue,  9 Nov 2021 08:25:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2736E82B
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Nov 2021 08:25:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="318602042"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="318602042"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 00:25:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="545153169"
Received: from tsengwil-desk1.itwn.intel.com (HELO gar) ([10.5.253.7])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 00:25:02 -0800
From: William Tseng <william.tseng@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Nov 2021 16:24:58 +0800
Message-Id: <20211109082458.13740-1-william.tseng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109065013.12717-1-william.tseng@intel.com>
References: <20211109065013.12717-1-william.tseng@intel.com>
Subject: [Intel-gfx] [PATCH v2] drm/i915/dsi: transmit brightness command in
 HS state
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

In Video Mode, if DSI transcoder is set to transmit packets
in LP Escape mode, screen flickering would be obseved when
brightness commands are continuously and quickly transmitted
to a panel.

The problem may be resolved by changing the mode to transmit
packets from Low Power to HS.

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Cc: Cooper Chiou <cooper.chiou@intel.com>
Signed-off-by: William Tseng <william.tseng@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index f61ed82e8867..2f788cb0f597 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -81,8 +81,10 @@ static void dcs_set_backlight(const struct drm_connector_state *conn_state, u32
 
 	for_each_dsi_port(port, intel_dsi->dcs_backlight_ports) {
 		dsi_device = intel_dsi->dsi_hosts[port]->device;
+		dsi_device->mode_flags &= ~MIPI_DSI_MODE_LPM;
 		mipi_dsi_dcs_write(dsi_device, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
 				   &data, len);
+		dsi_device->mode_flags |= MIPI_DSI_MODE_LPM;
 	}
 }
 
-- 
2.17.1

