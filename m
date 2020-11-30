Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66126C64E7B
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 20:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D13C2073C
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 20:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D13C2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA426E860;
	Mon, 30 Nov 2020 20:14:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98A889B9E
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 20:14:31 +0000 (UTC)
IronPort-SDR: ElIienufWNFi6Ml/0jvSrI7jvx6z5mARyxuFq8FzxG+a0m9Dut7p+YPWxIN9UECR74J/ps0AA1
 jY0kQcofLJHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="190893004"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="190893004"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 12:14:31 -0800
IronPort-SDR: WOu4/NZe1w38PfduwY5380brObo1hnUdxaGJTcC2wysBPZxerz58fiw7d7cBRohDwYmLBHq1R6
 aaZselQx8Axw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="372472391"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 12:14:30 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 02:17:38 +0530
Message-Id: <20201130204738.2443-16-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130204738.2443-1-uma.shankar@intel.com>
References: <20201130204738.2443-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v14 15/15] drm/i915/display: [NOT FOR MERGE] Reduce
 blanking to support 4k60@10bpp for LSPCON
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

Blanking needs to be reduced to incorporate DP and HDMI timing/link
bandwidth limitations for CEA modes (4k@60 at 10 bpp). DP can drive
17.28Gbs while 4k modes (VIC97 etc) at 10 bpp required 17.8 Gbps.
This will cause mode to blank out. Reduced Htotal by shortening the
back porch and front porch within permissible limits.

Note: This is for reference for userspace, not to be merged in kernel.

v2: This is marked as Not for merge and the responsibilty to program
these custom timings will be on userspace. This patch is just for
reference purposes. This is based on Ville's recommendation.

v3: updated commit message.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 21a0ca6ae2a6..15e9c46af1d9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -741,8 +741,10 @@ intel_dp_mode_valid(struct drm_connector *connector,
 {
 	struct intel_dp *intel_dp = intel_attached_dp(to_intel_connector(connector));
 	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_encoder *intel_encoder = intel_attached_encoder(intel_connector);
 	struct drm_display_mode *fixed_mode = intel_connector->panel.fixed_mode;
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct intel_lspcon *lspcon = enc_to_intel_lspcon(intel_encoder);
 	int target_clock = mode->clock;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	int max_dotclk = dev_priv->max_dotclk_freq;
@@ -778,6 +780,21 @@ intel_dp_mode_valid(struct drm_connector *connector,
 	if (target_clock > max_dotclk)
 		return MODE_CLOCK_HIGH;
 
+	/*
+	 * Reducing Blanking to incorporate DP and HDMI timing/link bandwidth
+	 * limitations for CEA modes (4k@60 at 10 bpp). DP can drive 17.28Gbs
+	 * while 4k modes (VIC97 etc) at 10 bpp required 17.8 Gbps. This will
+	 * cause mode to blank out. Reduced Htotal by shortening the back porch
+	 * and front porch within permissible limits.
+	 */
+	if (lspcon->active && lspcon->hdr_supported &&
+	    mode->clock > 570000) {
+		mode->clock = 570000;
+		mode->htotal -= 180;
+		mode->hsync_start -= 72;
+		mode->hsync_end -= 72;
+	}
+
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
