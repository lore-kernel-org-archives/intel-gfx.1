Return-Path: <SRS0=r5PR=IR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D44C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 11:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3640B60234
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 11:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3640B60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20316E9CD;
	Fri, 19 Mar 2021 11:53:43 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDA96E9CD
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 11:53:42 +0000 (UTC)
IronPort-SDR: PVyU5evdbHZyU4xGRvPsyADHhxq9F5vqoh1w9qGlCfHKvFkQDnIJExfkon3G9ywotQAQznCBMo
 bDO9y2/BFLmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="251229758"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="251229758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 04:53:41 -0700
IronPort-SDR: KBsffjmVZWGq3TiSIlumY4x3pURp+EmskZ48sD2cNqZ8KXNOQMpcMI9Il7zzmoETDc04hdUtCQ
 XfUGhuWfCKsg==
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="413482590"
Received: from koehlcla-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 04:53:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 19 Mar 2021 13:53:33 +0200
Message-Id: <20210319115333.8330-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/dsc: fix DSS CTL register usage for
 ICL DSI transcoders
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
Cc: jani.nikula@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Use the correct DSS CTL registers for ICL DSI transcoders.

As a side effect, this also brings back the sanity check for trying to
use pipe DSC registers on pipe A on ICL.

Fixes: 8a029c113b17 ("drm/i915/dp: Modify VDSC helpers to configure DSC for Bigjoiner slave")
References: http://lore.kernel.org/r/87eegxq2lq.fsf@intel.com
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: <stable@vger.kernel.org> # v5.11+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Untested, I don't have the platform.
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index f58cc5700784..a86c57d117f2 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -1014,20 +1014,14 @@ static i915_reg_t dss_ctl1_reg(const struct intel_crtc_state *crtc_state)
 {
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 
-	if (crtc_state->cpu_transcoder == TRANSCODER_EDP)
-		return DSS_CTL1;
-
-	return ICL_PIPE_DSS_CTL1(pipe);
+	return is_pipe_dsc(crtc_state) ? ICL_PIPE_DSS_CTL1(pipe) : DSS_CTL1;
 }
 
 static i915_reg_t dss_ctl2_reg(const struct intel_crtc_state *crtc_state)
 {
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 
-	if (crtc_state->cpu_transcoder == TRANSCODER_EDP)
-		return DSS_CTL2;
-
-	return ICL_PIPE_DSS_CTL2(pipe);
+	return is_pipe_dsc(crtc_state) ? ICL_PIPE_DSS_CTL2(pipe) : DSS_CTL2;
 }
 
 void intel_dsc_enable(struct intel_encoder *encoder,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
