Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE9CA0FE6
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Sep 2023 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8A10E7D4;
	Fri,  1 Sep 2023 13:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A35310E7D4
 for <intel-gfx@lists.freedesktop.org>; Fri,  1 Sep 2023 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693573517; x=1725109517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8aNzF1o2Zx978/iDTIjiryCLI6s1hVH/B9s/BIgj72A=;
 b=oH74Iwza0pReL4Tv8uDs6BYUg+phutJn0d94HWw/2TJK4YLwRhjQTyXe
 zv1FG4Cr3hAEx58DvV8gp3SCh/p2tWHbzeZwEQr/3/6T39OBlYvuCQEOO
 oSmD/v1a6OVpFAMAzznpqqQTYSva7U0TCY3RvScJHYad89gyW1fHHGKWV
 egw6fnyfvxGEaFx4zdnoVASBDv0Rm+ad71OVotV5Wuq+f3C3PIy+N1G5F
 nFv4N758anQsS/9cilnwlV0qX2q6m8i65OGByPLA06chDjzZMvObBnh/A
 EZe0nxZ9TrW6/+2yqQ5t0dvcHkxqka6iv7Lmu/suq97UmeIUNdsShxybj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361240659"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361240659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774995055"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="774995055"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 01 Sep 2023 06:05:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Sep 2023 16:05:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  1 Sep 2023 16:04:38 +0300
Message-ID: <20230901130440.2085-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901130440.2085-1-ville.syrjala@linux.intel.com>
References: <20230901130440.2085-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 10/12] drm/i915: Update VRR parameters in fastset
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We should be able to change any of the VRR parameters
during fastsets as long as we toggle VRR off at the start
and then back on at the end. The transcoder will be running
in non-VRR mode during the transition.

Co-developed-by: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 34 +++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cbbee303cd00..f0bb5c70ebfc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -913,18 +913,32 @@ static bool planes_disabling(const struct intel_crtc_state *old_crtc_state,
 	return is_disabling(active_planes, old_crtc_state, new_crtc_state);
 }
 
+static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
+			       const struct intel_crtc_state *new_crtc_state)
+{
+	return old_crtc_state->vrr.flipline != new_crtc_state->vrr.flipline ||
+		old_crtc_state->vrr.vmin != new_crtc_state->vrr.vmin ||
+		old_crtc_state->vrr.vmax != new_crtc_state->vrr.vmax ||
+		old_crtc_state->vrr.guardband != new_crtc_state->vrr.guardband ||
+		old_crtc_state->vrr.pipeline_full != new_crtc_state->vrr.pipeline_full;
+}
+
 static bool vrr_enabling(const struct intel_crtc_state *old_crtc_state,
 			 const struct intel_crtc_state *new_crtc_state)
 {
 	return is_enabling(vrr.enable, old_crtc_state, new_crtc_state) ||
-		(new_crtc_state->vrr.enable && new_crtc_state->update_m_n);
+		(new_crtc_state->vrr.enable &&
+		 (new_crtc_state->update_m_n ||
+		  vrr_params_changed(old_crtc_state, new_crtc_state)));
 }
 
 static bool vrr_disabling(const struct intel_crtc_state *old_crtc_state,
 			  const struct intel_crtc_state *new_crtc_state)
 {
 	return is_disabling(vrr.enable, old_crtc_state, new_crtc_state) ||
-		(old_crtc_state->vrr.enable && new_crtc_state->update_m_n);
+		(old_crtc_state->vrr.enable &&
+		 (new_crtc_state->update_m_n ||
+		  vrr_params_changed(old_crtc_state, new_crtc_state)));
 }
 
 #undef is_disabling
@@ -5342,13 +5356,14 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(splitter.link_count);
 	PIPE_CONF_CHECK_I(splitter.pixel_overlap);
 
-	if (!fastset)
+	if (!fastset) {
 		PIPE_CONF_CHECK_BOOL(vrr.enable);
-	PIPE_CONF_CHECK_I(vrr.vmin);
-	PIPE_CONF_CHECK_I(vrr.vmax);
-	PIPE_CONF_CHECK_I(vrr.flipline);
-	PIPE_CONF_CHECK_I(vrr.pipeline_full);
-	PIPE_CONF_CHECK_I(vrr.guardband);
+		PIPE_CONF_CHECK_I(vrr.vmin);
+		PIPE_CONF_CHECK_I(vrr.vmax);
+		PIPE_CONF_CHECK_I(vrr.flipline);
+		PIPE_CONF_CHECK_I(vrr.pipeline_full);
+		PIPE_CONF_CHECK_I(vrr.guardband);
+	}
 
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
@@ -6554,6 +6569,9 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 		if (DISPLAY_VER(i915) >= 11 &&
 		    intel_crtc_needs_fastset(new_crtc_state))
 			icl_set_pipe_chicken(new_crtc_state);
+
+		if (vrr_params_changed(old_crtc_state, new_crtc_state))
+			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
 	intel_fbc_update(state, crtc);
-- 
2.41.0

