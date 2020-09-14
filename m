Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40360C433E2
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EBA20E65
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EBA20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCE46E581;
	Mon, 14 Sep 2020 20:25:07 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50B66E581
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 20:25:05 +0000 (UTC)
IronPort-SDR: sJmdAGcn5AQKwj2j+1risX1wr7jDH6eGwbMHp1SbbU3v4AqWXcv0LOu53pd4qMMtArQNBEkgNb
 w2JO6VsjPS/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223340790"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="223340790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:05 -0700
IronPort-SDR: APL3Huiykw0JXAJWdm9+MZBXQDAvIcVXz2h8ahLVYrSyN0QJ/TtvShs57ivRbjSksnTgx6esUl
 Ic5ZqLlYpoqA==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="306307123"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:04 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2020 02:30:40 +0530
Message-Id: <20200914210047.11972-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914210047.11972-1-uma.shankar@intel.com>
References: <20200914210047.11972-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v6 04/11] drm/i915/display: Enable BT2020 for HDR on
 LSPCON devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Enable Colorspace as BT2020 if driving HDR content.Sending Colorimetry
data for HDR using AVI infoframe. LSPCON firmware expects this and though
SOC drives DP, for HDMI panel AVI infoframe is sent to the LSPCON device
which transfers the same to HDMI sink.

v2: Dropped state managed in drm core as per Jani Nikula's suggestion.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index fd05210f4405..b0ca494f1110 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -507,6 +507,11 @@ void lspcon_read_infoframe(struct intel_encoder *encoder,
 	/* FIXME implement this */
 }
 
+/* HDMI HDR Colorspace Spec Definitions */
+#define NORMAL_COLORIMETRY_MASK		0x3
+#define EXTENDED_COLORIMETRY_MASK	0x7
+#define HDMI_COLORIMETRY_BT2020_YCC	((3 << 0) | (6 << 2) | (0 << 5))
+
 void lspcon_set_infoframes(struct intel_encoder *encoder,
 			   bool enable,
 			   const struct intel_crtc_state *crtc_state,
@@ -551,6 +556,19 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 					   HDMI_QUANTIZATION_RANGE_LIMITED :
 					   HDMI_QUANTIZATION_RANGE_FULL);
 
+	/*
+	 * Set BT2020 colorspace if driving HDR data
+	 * ToDo: Make this generic and expose all colorspaces for lspcon
+	 */
+	if (lspcon->active && lspcon->hdr_supported) {
+		frame.avi.colorimetry =
+				HDMI_COLORIMETRY_BT2020_YCC &
+				NORMAL_COLORIMETRY_MASK;
+		frame.avi.extended_colorimetry =
+				(HDMI_COLORIMETRY_BT2020_YCC >> 2) &
+				 EXTENDED_COLORIMETRY_MASK;
+	}
+
 	ret = hdmi_infoframe_pack(&frame, buf, sizeof(buf));
 	if (ret < 0) {
 		DRM_ERROR("Failed to pack AVI IF\n");
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
