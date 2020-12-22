Return-Path: <SRS0=+4rd=F2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B43C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38613229C6
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38613229C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C976E87A;
	Tue, 22 Dec 2020 14:50:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423456E87A
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Dec 2020 14:50:41 +0000 (UTC)
IronPort-SDR: h03N6d1dzRU4omdX+hkLBgWZfXnMiiKjgLJbPx9Mr20eg6/0HEf1pcqne6ClwGvs9NEahv4tKg
 o8FmXM67yXRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="237437748"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="237437748"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:50:39 -0800
IronPort-SDR: UpgJwYVHoS74x00D65AydKEZ+NqOVaMZClvTnZLdi95NTjA/tTMauMs8qA6uUuWj5gFqcnF9jh
 0YnUGdwDlM6A==
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="457472667"
Received: from sauterhx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.229])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:50:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 22 Dec 2020 16:49:47 +0200
Message-Id: <83bb1fee149aacc4f208719861327a3e04bb63a7.1608648128.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1608648128.git.jani.nikula@intel.com>
References: <cover.1608648128.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 07/13] drm/i915/pps: add higher level
 intel_pps_init() call
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

Add a new init call to be called only once, unlike some of the other
various init calls. This lets us hide more functions within intel_pps.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c  |  9 +--------
 drivers/gpu/drm/i915/display/intel_pps.c | 17 +++++++++++++++--
 drivers/gpu/drm/i915/display/intel_pps.h |  3 +--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1a34c9351c30..de2642d5be3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6586,14 +6586,11 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct drm_display_mode *downclock_mode = NULL;
 	bool has_dpcd;
 	enum pipe pipe = INVALID_PIPE;
-	intel_wakeref_t wakeref;
 	struct edid *edid;
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
 
-	INIT_DELAYED_WORK(&intel_dp->panel_vdd_work, edp_panel_vdd_work);
-
 	/*
 	 * On IBX/CPT we may get here with LVDS already registered. Since the
 	 * driver uses the only internal power sequencer available for both
@@ -6609,11 +6606,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	with_intel_pps_lock(intel_dp, wakeref) {
-		intel_dp_init_panel_power_timestamps(intel_dp);
-		intel_dp_pps_init(intel_dp);
-		intel_pps_vdd_sanitize(intel_dp);
-	}
+	intel_pps_init(intel_dp);
 
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index acd6d0092bc6..651c79ce4bdd 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -697,7 +697,7 @@ void intel_pps_vdd_off_sync(struct intel_dp *intel_dp)
 		intel_pps_vdd_off_sync_unlocked(intel_dp);
 }
 
-void edp_panel_vdd_work(struct work_struct *__work)
+static void edp_panel_vdd_work(struct work_struct *__work)
 {
 	struct intel_dp *intel_dp =
 		container_of(to_delayed_work(__work),
@@ -1081,7 +1081,7 @@ bool intel_pps_have_power(struct intel_dp *intel_dp)
 	return have_power;
 }
 
-void intel_dp_init_panel_power_timestamps(struct intel_dp *intel_dp)
+static void intel_dp_init_panel_power_timestamps(struct intel_dp *intel_dp)
 {
 	intel_dp->panel_power_off_time = ktime_get_boottime();
 	intel_dp->last_power_on = jiffies;
@@ -1351,3 +1351,16 @@ void intel_dp_pps_init(struct intel_dp *intel_dp)
 		intel_dp_init_panel_power_sequencer_registers(intel_dp, false);
 	}
 }
+
+void intel_pps_init(struct intel_dp *intel_dp)
+{
+	intel_wakeref_t wakeref;
+
+	INIT_DELAYED_WORK(&intel_dp->panel_vdd_work, edp_panel_vdd_work);
+
+	with_intel_pps_lock(intel_dp, wakeref) {
+		intel_dp_init_panel_power_timestamps(intel_dp);
+		intel_dp_pps_init(intel_dp);
+		intel_pps_vdd_sanitize(intel_dp);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_pps.h b/drivers/gpu/drm/i915/display/intel_pps.h
index 3cab183658c6..53c0fafd1440 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.h
+++ b/drivers/gpu/drm/i915/display/intel_pps.h
@@ -31,7 +31,6 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp);
 void intel_pps_vdd_off_unlocked(struct intel_dp *intel_dp, bool sync);
 void intel_pps_on_unlocked(struct intel_dp *intel_dp);
 void intel_pps_off_unlocked(struct intel_dp *intel_dp);
-void edp_panel_vdd_work(struct work_struct *__work);
 
 void intel_pps_vdd_sanitize(struct intel_dp *intel_dp);
 void intel_pps_vdd_on(struct intel_dp *intel_dp);
@@ -42,9 +41,9 @@ bool intel_pps_have_power(struct intel_dp *intel_dp);
 
 void wait_panel_power_cycle(struct intel_dp *intel_dp);
 
+void intel_pps_init(struct intel_dp *intel_dp);
 void intel_dp_pps_init(struct intel_dp *intel_dp);
 void intel_power_sequencer_reset(struct drm_i915_private *i915);
-void intel_dp_init_panel_power_timestamps(struct intel_dp *intel_dp);
 
 void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *crtc_state);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
