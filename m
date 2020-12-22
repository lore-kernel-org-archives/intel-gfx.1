Return-Path: <SRS0=+4rd=F2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C7CC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DE0221FC
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DE0221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC476E406;
	Tue, 22 Dec 2020 14:51:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A146E889
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Dec 2020 14:51:03 +0000 (UTC)
IronPort-SDR: yd/UktZMfZc+CMPARNHK+xqa/1YZQ9npYV+y7JUu0oBeznLTr1uVdrP1MtGfHNkUdQA2ArUupf
 MrayZYc7zaUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="260606757"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="260606757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:51:02 -0800
IronPort-SDR: de8YP+xg1iSfdRLhpDcqJm2YpYj18osRPh9QPwh4hIPZFIsOYDDommJWOZSa/SQ7itvuOfUPO+
 d74gLLXm4+jA==
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; d="scan'208";a="341630294"
Received: from sauterhx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.229])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:51:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 22 Dec 2020 16:49:52 +0200
Message-Id: <a0002756dfeab15cb6f948092fe82aba10f44491.1608648128.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1608648128.git.jani.nikula@intel.com>
References: <cover.1608648128.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 12/13] drm/i915/pps: rename
 vlv_init_panel_power_sequencer to vlv_pps_init
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This function is a bit of an outlier, but try to change to a name that
is more in line with the rest of the intel_pps functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_pps.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_pps.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bc3a447f5992..c49ada31363b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3155,7 +3155,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	with_intel_pps_lock(intel_dp, wakeref) {
 		if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-			vlv_init_panel_power_sequencer(encoder, pipe_config);
+			vlv_pps_init(encoder, pipe_config);
 
 		intel_dp_enable_port(intel_dp, pipe_config);
 
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index ceb74967f2b4..492abf372167 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -1008,8 +1008,8 @@ static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 	}
 }
 
-void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
-				    const struct intel_crtc_state *crtc_state)
+void vlv_pps_init(struct intel_encoder *encoder,
+		  const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_pps.h b/drivers/gpu/drm/i915/display/intel_pps.h
index c8766b777501..d9cd57b5b828 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.h
+++ b/drivers/gpu/drm/i915/display/intel_pps.h
@@ -43,7 +43,7 @@ void intel_pps_init(struct intel_dp *intel_dp);
 void intel_pps_reinit(struct intel_dp *intel_dp);
 void intel_pps_reset_all(struct drm_i915_private *i915);
 
-void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
-				    const struct intel_crtc_state *crtc_state);
+void vlv_pps_init(struct intel_encoder *encoder,
+		  const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PPS_H__ */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
