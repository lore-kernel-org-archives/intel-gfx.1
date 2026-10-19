Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61974CCF2DB
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB32F10ED2B;
	Mon, 19 Oct 2026 13:16:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E040910ED2B
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415760; x=1823951760;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EDD6JZPt2ydPSSbeyz7Uu56VqGinuRps/+pI2/9OcSM=;
 b=cP/zH3KHXPZn3p7hXhhNCm4NA3j2yyP9jh2FsRmRUUPFu7GdzoEJBviT
 J6bnFcTZfywfZLT07acb+H3j30X3SwA6EmyKMxbwMMsGDtgwr+3dXNG1/
 kFoXmANMNOUc6NajanY9DCooH6K9KQJB0OMgFqW/ECDkqHMizh0XFznMz
 nrNRvLh8KiTx0+tEBidXx3O+50+I5KtP5aLSF8HJNYPbKdgf4iYkfqYS1
 Ysj+hQhyL2fUZloN5WZYqDnIaYKwtIzRrC4zb8DudH2cUwWDQe6/lDt2z
 M0RE3EOjlFDc6GzSi+GQi9rOEqNjIZUDLfhX3j/zeDI4sNP7U+TIDp4TW A==;
X-CSE-ConnectionGUID: O6pkrSo9Qnml3z0NeIvdxg==
X-CSE-MsgGUID: EQESToRlQCSIzvaWuqTToA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="980284"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="980284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:00 -0700
X-CSE-ConnectionGUID: 43Ua+phkSlm5BRkvEzR/AQ==
X-CSE-MsgGUID: Q67vEt2USEOlHK0Bg/X7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2635083"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:59 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/rps: Extract intel_guc_slpc_boost()
Date: Mon, 19 Oct 2026 16:15:39 +0300
Message-ID: <20261019131542.28822-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019131542.28822-1-ville.syrjala@linux.intel.com>
References: <20261019131542.28822-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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

Extract the open coded counterpart of intel_guc_slpc_dec_waiters()
into intel_guc_slpc_boost(). Now the two sides of the mirror at
least look alike.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 13 +------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +-
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4f6fa9a2d6fc..4d8d90872dd5 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1043,19 +1043,8 @@ void intel_rps_boost(struct i915_request *rq)
 		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
 			return;
 
-		/* Return if old value is non zero */
-		if (atomic_fetch_inc(&slpc->num_waiters))
+		if (!intel_guc_slpc_boost(slpc))
 			return;
-
-		/*
-		 * Skip queuing boost work if frequency is already boosted,
-		 * but still increment num_waiters.
-		 */
-		if (slpc->min_freq_softlimit >= slpc->boost_freq)
-			return;
-
-		queue_work(rps_to_gt(rps)->i915->unordered_wq,
-			   &slpc->boost_work);
 	} else {
 		if (atomic_fetch_inc(&rps->num_waiters))
 			return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index a75f05ff1110..3a1bd7b1d9d6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -847,6 +847,25 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 	mutex_unlock(&slpc->lock);
 }
 
+bool intel_guc_slpc_boost(struct intel_guc_slpc *slpc)
+{
+	/* Return if old value is non zero */
+	if (atomic_fetch_inc(&slpc->num_waiters))
+		return false;
+
+	/*
+	 * Skip queuing boost work if frequency is already boosted,
+	 * but still increment num_waiters.
+	 */
+	if (slpc->min_freq_softlimit >= slpc->boost_freq)
+		return false;
+
+	queue_work(slpc_to_i915(slpc)->unordered_wq,
+		   &slpc->boost_work);
+
+	return true;
+}
+
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index fc9f761b4372..8d6814deb3c6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -42,7 +42,7 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
 int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val);
 void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
-void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
+bool intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
 int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
-- 
2.55.0

