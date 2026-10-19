Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB29CCF2E3
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08A10ED2C;
	Mon, 19 Oct 2026 13:16:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281B10ED30
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415767; x=1823951767;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QYF0zANvOpFW4yaNJbZE1QFriVN5qACY4bc7Y2NypzI=;
 b=VP3xPWzir90KtlQMMpIiUXf3esZQ5k6J3cfUehEnm/r8ulRTsMACAK/F
 ZgCBycBNvk/vy0hW9rAIwY6YCf9xaQtDdbS7x35QWUmf0sMye13fCFSJK
 bUkbt/Uxe4ZwrzZ8/MNrHznM41CPIEOKXA1y2LOS+CTvUdoiwmlOLrEp4
 k6uNgr0IKTwEC6pxfCVS/6XU9CojEE+E6peUsXtdKy1G3N8MaUEevPRSV
 lmJMzxaVyLbmhLp/+VNYeQFFmxIV6dbasWXxwhX+I8GXe6QP2nX+owjNf
 iQJ81LSa23mQuHtFgtD7r6JxRcYTDfE4ydv3nNVBCtp7EyYTWd480Jssq g==;
X-CSE-ConnectionGUID: CvNW5ZjwSdGt0ByS/AqscQ==
X-CSE-MsgGUID: 3lcKS5UNSTGBKLELpNNboA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106805"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:07 -0700
X-CSE-ConnectionGUID: ovxMoDPgTkicMHsqNvzplA==
X-CSE-MsgGUID: HHPKGYQLST6iAD1l1c3EDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2918160"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/rps: Extract rps_dec_waiters()/rps_boost()
Date: Mon, 19 Oct 2026 16:15:41 +0300
Message-ID: <20261019131542.28822-7-ville.syrjala@linux.intel.com>
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

Extract the non-SLPC sides of intel_dec_waiters() and
intel_rps_boost() into small helpers. Now the SLPC vs. non-SLPC
sides are symmetric, making the high level code less confusing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 5f8f51198f5a..a5c455b67bd7 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1001,6 +1001,25 @@ int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq)
 	}
 }
 
+static void rps_dec_waiters(struct intel_rps *rps)
+{
+	atomic_dec(&rps->num_waiters);
+}
+
+static bool rps_boost(struct intel_rps *rps)
+{
+	if (atomic_fetch_inc(&rps->num_waiters))
+		return false;
+
+	if (!intel_rps_is_active(rps))
+		return false;
+
+	if (READ_ONCE(rps->cur_freq) < rps->boost_freq)
+		queue_work(rps_to_gt(rps)->i915->unordered_wq, &rps->work);
+
+	return true;
+}
+
 void intel_rps_dec_waiters(struct intel_rps *rps)
 {
 	struct intel_guc_slpc *slpc;
@@ -1010,7 +1029,7 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 
 		intel_guc_slpc_dec_waiters(slpc);
 	} else {
-		atomic_dec(&rps->num_waiters);
+		rps_dec_waiters(rps);
 	}
 }
 
@@ -1038,14 +1057,8 @@ void intel_rps_boost(struct i915_request *rq)
 		if (!intel_guc_slpc_boost(slpc))
 			return;
 	} else {
-		if (atomic_fetch_inc(&rps->num_waiters))
+		if (!rps_boost(rps))
 			return;
-
-		if (!intel_rps_is_active(rps))
-			return;
-
-		if (READ_ONCE(rps->cur_freq) < rps->boost_freq)
-			queue_work(rps_to_gt(rps)->i915->unordered_wq, &rps->work);
 	}
 
 	GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
-- 
2.55.0

