Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA1EC41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8F3206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8F3206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B776E48B;
	Tue,  6 Oct 2020 12:33:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0D46E48E
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 12:33:19 +0000 (UTC)
IronPort-SDR: nxKYYzMz4lZQyFnEItMp9vPr3Ak4MvlGe25MqonQSFe3l3ssSAQRtI0fjQLdtNc9zCdtiP4mv9
 qVzXk7IVSLew==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161851714"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161851714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:19 -0700
IronPort-SDR: 4PUQ7lh7DSNkQEF71mYcCtgHuKKc0r7gVllGHVYOM/0nuVOwkgzEORqZZEFmnYCIhIzroA1Wxc
 pJeyN0oPGXmQ==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527333668"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:17 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 18:36:49 +0530
Message-Id: <20201006130654.331-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006130654.331-1-uma.shankar@intel.com>
References: <20201006130654.331-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 05/10] drm/i915/display: Enable HDR for Parade
 based lspcon
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
Cc: Vipin Anand <vipin.anand@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Enable HDR for LSPCON based on Parade along with MCA.

v2: Added a helper for status reg as suggested by Ville.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vipin Anand <vipin.anand@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 9ffa36797daf..7ae01f2a8596 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -36,6 +36,7 @@
 #define LSPCON_VENDOR_MCA_OUI 0x0060AD
 
 #define DPCD_MCA_LSPCON_HDR_STATUS	0x70003
+#define DPCD_PARADE_LSPCON_HDR_STATUS	0x00511
 
 /* AUX addresses to write MCA AVI IF */
 #define LSPCON_MCA_AVI_IF_WRITE_OFFSET 0x5C0
@@ -106,21 +107,28 @@ static bool lspcon_detect_vendor(struct intel_lspcon *lspcon)
 	return true;
 }
 
+static u32 get_hdr_status_reg(struct intel_lspcon *lspcon)
+{
+	if (lspcon->vendor == LSPCON_VENDOR_MCA)
+		return DPCD_MCA_LSPCON_HDR_STATUS;
+	else
+		return DPCD_PARADE_LSPCON_HDR_STATUS;
+}
+
 static void lspcon_detect_hdr_capability(struct intel_lspcon *lspcon)
 {
 	struct intel_digital_port *intel_dig_port =
 		container_of(lspcon, struct intel_digital_port, lspcon);
 	struct drm_device *dev = intel_dig_port->base.base.dev;
 	struct intel_dp *dp = lspcon_to_intel_dp(lspcon);
+	u32 lspcon_hdr_status_reg;
 	u8 hdr_caps;
 	int ret;
 
-	/* Enable HDR for MCA based LSPCON devices */
-	if (lspcon->vendor == LSPCON_VENDOR_MCA)
-		ret = drm_dp_dpcd_read(&dp->aux, DPCD_MCA_LSPCON_HDR_STATUS,
-				       &hdr_caps, 1);
-	else
-		return;
+	lspcon_hdr_status_reg = get_hdr_status_reg(lspcon);
+
+	ret = drm_dp_dpcd_read(&dp->aux, lspcon_hdr_status_reg,
+			       &hdr_caps, 1);
 
 	if (ret < 0) {
 		drm_dbg_kms(dev, "hdr capability detection failed\n");
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
