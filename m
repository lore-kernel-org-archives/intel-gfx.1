Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1585ACCF2DE
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11510ED24;
	Mon, 19 Oct 2026 13:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF110ED38
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415771; x=1823951771;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xP2qcMQPrpBq41g8FhGVT43GnpjJDlCGxI7It4quBdw=;
 b=SWKgMW82fO16Pz6uo7D8e1fzf5aA0N6fIiVppZQvpbIgS3CLeti1kCoI
 aqvB7pHVy2kW2xKwLYU5q16Uee/2urWpdeNGiM7iloOSyUM77hDJaMeia
 yKXQLpUit+XOQ/DF4qsaBUuHWiCzGbM35SPjCwDGcgFOHkCkDeRZoln8q
 E9VQ4HQUoKdbZ0eMVuuJntFw6H1COAgG2FtBStm+bx9bzxCggZ2G3JGvr
 vuAkYebIUZFJG/ZZgWlzwI4FbfR28XgA83sebK7EBspsQJtU7EQBmzDcA
 fw5kxaPmM6ZnSoV/GGfyLPrUCJ618/DToSyG/hMsy23iNiFrirugMLZkU A==;
X-CSE-ConnectionGUID: 471jYGsnTKSa+7Qwl5H9qw==
X-CSE-MsgGUID: Q1Kzt0ppQkOBmxBYA3sQxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106083"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:10 -0700
X-CSE-ConnectionGUID: w38HXYeeSs67nV7auLP+pA==
X-CSE-MsgGUID: rEH8ZcX/RUWXKJS9wOCM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2870399"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/rps: Move 'slpc' variables into tighter scope
Date: Mon, 19 Oct 2026 16:15:42 +0300
Message-ID: <20261019131542.28822-8-ville.syrjala@linux.intel.com>
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

The slpc variables have no meaning outside the rps_uses_slpc()
paths. Move the variable declarations into the scope where they
get used.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 70 +++++++++++++++--------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index a5c455b67bd7..65bdc61b8a7c 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -956,10 +956,8 @@ void intel_rps_park(struct intel_rps *rps)
 
 u32 intel_rps_get_boost_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc;
-
 	if (rps_uses_slpc(rps)) {
-		slpc = rps_to_slpc(rps);
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
 		return slpc->boost_freq;
 	} else {
@@ -990,10 +988,8 @@ static int rps_set_boost_freq(struct intel_rps *rps, u32 val)
 
 int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq)
 {
-	struct intel_guc_slpc *slpc;
-
 	if (rps_uses_slpc(rps)) {
-		slpc = rps_to_slpc(rps);
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
 		return intel_guc_slpc_set_boost_freq(slpc, freq);
 	} else {
@@ -1022,10 +1018,8 @@ static bool rps_boost(struct intel_rps *rps)
 
 void intel_rps_dec_waiters(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc;
-
 	if (rps_uses_slpc(rps)) {
-		slpc = rps_to_slpc(rps);
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
 		intel_guc_slpc_dec_waiters(slpc);
 	} else {
@@ -1035,7 +1029,6 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 
 void intel_rps_boost(struct i915_request *rq)
 {
-	struct intel_guc_slpc *slpc;
 	struct intel_rps *rps;
 
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
@@ -1052,7 +1045,7 @@ void intel_rps_boost(struct i915_request *rq)
 	rps = &READ_ONCE(rq->engine)->gt->rps;
 
 	if (rps_uses_slpc(rps)) {
-		slpc = rps_to_slpc(rps);
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
 		if (!intel_guc_slpc_boost(slpc))
 			return;
@@ -2194,12 +2187,13 @@ u32 intel_rps_get_requested_frequency(struct intel_rps *rps)
 
 u32 intel_rps_get_max_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return slpc->max_freq_softlimit;
-	else
+	} else {
 		return intel_gpu_freq(rps, rps->max_freq_softlimit);
+	}
 }
 
 /**
@@ -2211,10 +2205,11 @@ u32 intel_rps_get_max_frequency(struct intel_rps *rps)
  */
 u32 intel_rps_get_max_raw_freq(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 	u32 freq;
 
 	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+
 		return DIV_ROUND_CLOSEST(slpc->rp0_freq,
 					 GT_FREQUENCY_MULTIPLIER);
 	} else {
@@ -2229,32 +2224,35 @@ u32 intel_rps_get_max_raw_freq(struct intel_rps *rps)
 
 u32 intel_rps_get_rp0_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return slpc->rp0_freq;
-	else
+	} else {
 		return intel_gpu_freq(rps, rps->rp0_freq);
+	}
 }
 
 u32 intel_rps_get_rp1_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return slpc->rp1_freq;
-	else
+	} else {
 		return intel_gpu_freq(rps, rps->rp1_freq);
+	}
 }
 
 u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return slpc->min_freq;
-	else
+	} else {
 		return intel_gpu_freq(rps, rps->min_freq);
+	}
 }
 
 static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
@@ -2504,22 +2502,24 @@ static int set_max_freq(struct intel_rps *rps, u32 val)
 
 int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return intel_guc_slpc_set_max_freq(slpc, val);
-	else
+	} else {
 		return set_max_freq(rps, val);
+	}
 }
 
 u32 intel_rps_get_min_frequency(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return slpc->min_freq_softlimit;
-	else
+	} else {
 		return intel_gpu_freq(rps, rps->min_freq_softlimit);
+	}
 }
 
 /**
@@ -2531,10 +2531,11 @@ u32 intel_rps_get_min_frequency(struct intel_rps *rps)
  */
 u32 intel_rps_get_min_raw_freq(struct intel_rps *rps)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 	u32 freq;
 
 	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+
 		return DIV_ROUND_CLOSEST(slpc->min_freq,
 					 GT_FREQUENCY_MULTIPLIER);
 	} else {
@@ -2582,12 +2583,13 @@ static int set_min_freq(struct intel_rps *rps, u32 val)
 
 int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
 {
-	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+	if (rps_uses_slpc(rps)) {
+		struct intel_guc_slpc *slpc = rps_to_slpc(rps);
 
-	if (rps_uses_slpc(rps))
 		return intel_guc_slpc_set_min_freq(slpc, val);
-	else
+	} else {
 		return set_min_freq(rps, val);
+	}
 }
 
 u8 intel_rps_get_up_threshold(struct intel_rps *rps)
-- 
2.55.0

