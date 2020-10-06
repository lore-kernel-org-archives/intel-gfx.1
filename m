Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F275CC41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 09:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1E220674
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 09:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1E220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82046E44B;
	Tue,  6 Oct 2020 09:54:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57E6E448;
 Tue,  6 Oct 2020 09:54:46 +0000 (UTC)
IronPort-SDR: 12tlb/sHG7serthu/z6sHb1mdlLP7SjU55U7kQxJmcZaNQlsS2SFgaH7M7SM5Gk44YJG3rGvUS
 /FJEC58LbQEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="151361732"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="151361732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 02:54:45 -0700
IronPort-SDR: owCWSADmzJvILTRAtNojOr5Gcg6fN3rNPE388zqohWE8qSQmQbh9UcvFWWYAWbyePwWLJ5o+pd
 F0SaCGZHUBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="342171902"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2020 02:54:44 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 15:17:17 +0530
Message-Id: <20201006094719.24119-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006094719.24119-1-ankit.k.nautiyal@intel.com>
References: <20201006094719.24119-1-ankit.k.nautiyal@intel.com>
Subject: [Intel-gfx] [RFC 6/8] drm/i915: Check for FRL training before DP
 Link training
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patch calls functions to check FRL training requirements
for an HDMI2.1 sink, when connected through PCON.
The call is made before the DP link training. In case FRL is not
required or failure during FRL training, the TMDS mode is selected
for the pcon.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
 drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index b4c520348b3b..94c8a7dab97b 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3489,6 +3489,8 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 
+	intel_dp_check_frl_training(intel_dp);
+
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
 	/*
 	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fd30e025a09e..d3b67c7123d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4165,6 +4165,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_check_frl_training(intel_dp);
 	intel_dp_start_link_train(intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
 
@@ -6099,6 +6100,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 		    !intel_dp_mst_is_master_trans(crtc_state))
 			continue;
 
+		intel_dp_check_frl_training(intel_dp);
 		intel_dp_start_link_train(intel_dp, crtc_state);
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 		break;
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
