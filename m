Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1423C4727D
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEA7206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEA7206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53BC6E48E;
	Tue,  6 Oct 2020 12:33:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C866E48E
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 12:33:22 +0000 (UTC)
IronPort-SDR: iRFOhJ8asSVGSntPsYZWYVGsnGvWPzXceljhHA38TYHWZKlb62lBtr8CclzE2UUQ3tcYsFeRae
 6xQb4vRkfLVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161851725"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161851725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:22 -0700
IronPort-SDR: zkM9PLA15zsiwMXLKMDZ3+sHHF7/3dkFCRSltnxLPC7C1ikV9/U3moPVztstwxzdUbsb0k/uGb
 wZF0wAb6OdVg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527333687"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:20 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 18:36:51 +0530
Message-Id: <20201006130654.331-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006130654.331-1-uma.shankar@intel.com>
References: <20201006130654.331-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 07/10] drm/i915/display: Implement DRM infoframe
 read for LSPCON
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

Implement Read back of HDR metadata infoframes i.e Dynamic Range
and Mastering Infoframe for LSPCON devices.

v2: Added proper bitmask of enabled infoframes as per Ville's
recommendation.

v3: Dropped a redundant wrapper as per Ville's comment.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 7 +++----
 drivers/gpu/drm/i915/display/intel_lspcon.c | 7 ++++++-
 drivers/gpu/drm/i915/display/intel_lspcon.h | 4 ++++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index cc0eb585c654..50bbe3bdb4c7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -555,10 +555,9 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	intel_de_posting_read(dev_priv, ctl_reg);
 }
 
-static void hsw_read_infoframe(struct intel_encoder *encoder,
-			       const struct intel_crtc_state *crtc_state,
-			       unsigned int type,
-			       void *frame, ssize_t len)
+void hsw_read_infoframe(struct intel_encoder *encoder,
+			const struct intel_crtc_state *crtc_state,
+			unsigned int type, void *frame, ssize_t len)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 70f4ae6bbda9..357b54a501e8 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -502,7 +502,12 @@ void lspcon_read_infoframe(struct intel_encoder *encoder,
 			   unsigned int type,
 			   void *frame, ssize_t len)
 {
-	/* FIXME implement this */
+	/* FIXME implement for AVI Infoframe as well */
+	if (type == HDMI_PACKET_TYPE_GAMUT_METADATA) {
+		drm_dbg_kms(encoder->base.dev, "Read HDR metadata for lspcon\n");
+		hsw_read_infoframe(encoder, crtc_state, type,
+				   frame, len);
+	}
 }
 
 void lspcon_set_infoframes(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.h b/drivers/gpu/drm/i915/display/intel_lspcon.h
index 9505e234e2fd..b1f45bd14409 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.h
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.h
@@ -38,5 +38,9 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state,
 			 unsigned int type,
 			const void *frame, ssize_t len);
+void hsw_read_infoframe(struct intel_encoder *encoder,
+			const struct intel_crtc_state *crtc_state,
+			unsigned int type,
+			void *frame, ssize_t len);
 
 #endif /* __INTEL_LSPCON_H__ */
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
