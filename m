Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1950CCF2E3
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C78A10ED26;
	Mon, 19 Oct 2026 13:15:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BEF10ED25
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415750; x=1823951750;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=47TTg0sGyYLQRwoQDBr0RN01JQj4AVRpjCrqdwO7DW8=;
 b=D0rzn1KmSRM8WCR7PWBa/EkDeDyxzps54QEgF7fZ9JCGQat7Dle2kVm5
 21O6KsaD5EPq1tYxFDLeo+Jimfk+bCja76FOiTSS947Y73PT+Y9oF80EC
 vcRqxyO17ddC5JyhpZye0O4D0ZEOgxrzo9IIYgqkHL/2HCNEIVRuSJUzi
 DFTfqpYou3HnuhXvDd9TTPcNZbFx5gIXvB+G6QjMu82pa+SdqP8qQeMFF
 KECL5oHa/aUk1Ks5n6MaCQjo4jjn/orCpLEHZmp9VmgJ4VoDOKDmA1xd7
 cDK18moGg2g1upMI881x/xqVGxsKY3AQWW9UTQ+lLfeKMMz7nZsA5FucH Q==;
X-CSE-ConnectionGUID: rjWiwfuUQsKubmkARkJq1Q==
X-CSE-MsgGUID: obb9HCCRSO2z2BudMDzsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106050"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:50 -0700
X-CSE-ConnectionGUID: 1P5XXhaRQe+kMnAqKhDY2g==
X-CSE-MsgGUID: xqVQfkMDRlikp0QtWUQFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2870294"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/rps: Flatten intel_rps_boost()
Date: Mon, 19 Oct 2026 16:15:36 +0300
Message-ID: <20261019131542.28822-2-ville.syrjala@linux.intel.com>
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

intel_rps_boost() is a mess. Start the cleanup by flattening
it by a few indentation levels.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 0f9b4f1dd3cb..4cfa0b15e80e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1021,6 +1021,7 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 void intel_rps_boost(struct i915_request *rq)
 {
 	struct intel_guc_slpc *slpc;
+	struct intel_rps *rps;
 
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
 		return;
@@ -1030,34 +1031,35 @@ void intel_rps_boost(struct i915_request *rq)
 		return;
 
 	/* Serializes with i915_request_retire() */
-	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
-		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
+	if (test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags))
+		return;
 
-		if (rps_uses_slpc(rps)) {
-			slpc = rps_to_slpc(rps);
+	rps = &READ_ONCE(rq->engine)->gt->rps;
 
-			/* Waitboost should not be done with power saving profile */
-			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
-				return;
+	if (rps_uses_slpc(rps)) {
+		slpc = rps_to_slpc(rps);
 
-			/* Return if old value is non zero */
-			if (!atomic_fetch_inc(&slpc->num_waiters)) {
-				/*
-				 * Skip queuing boost work if frequency is already boosted,
-				 * but still increment num_waiters.
-				 */
-				if (slpc->min_freq_softlimit >= slpc->boost_freq)
-					return;
+		/* Waitboost should not be done with power saving profile */
+		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
+			return;
 
-				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
-					 rq->fence.context, rq->fence.seqno);
-				queue_work(rps_to_gt(rps)->i915->unordered_wq,
-					   &slpc->boost_work);
-			}
+		/* Return if old value is non zero */
+		if (atomic_fetch_inc(&slpc->num_waiters))
+			return;
 
+		/*
+		 * Skip queuing boost work if frequency is already boosted,
+		 * but still increment num_waiters.
+		 */
+		if (slpc->min_freq_softlimit >= slpc->boost_freq)
 			return;
-		}
 
+		GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
+			 rq->fence.context, rq->fence.seqno);
+
+		queue_work(rps_to_gt(rps)->i915->unordered_wq,
+			   &slpc->boost_work);
+	} else {
 		if (atomic_fetch_inc(&rps->num_waiters))
 			return;
 
-- 
2.55.0

