Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F87BCCF2DE
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4010ED32;
	Mon, 19 Oct 2026 13:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D59110ED2D
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415764; x=1823951764;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JdS6Gzm2YesG6hPkL0dV2/cT6SA0h9s68hPdBgUKJW0=;
 b=XSYCnoV1D75LcxOgF5n2lMD8aAUk5P0SS74msjO7AzwAbIpG0fI0NX8S
 aBd9esyedR/vfRhg+kCq7gJ7fL6KRlzcyKb8pX54qPdy4rvvagUg/zOJa
 QnW3OXgh7BOheQ2HxM4IEbFAM2B5GrOqFvG3qAHGaYv1Sa7/FzSY7X8zC
 d+VTp3VaVqlJcMBtEr5zoh4XiboOJY3B3o7/iA2/xFiFmqEy1lpV0Jt4p
 3boRg5OWZA2GdbSirLrnHZX+9d2tdMTboM9qbpR3pJbJHqP1ijhKaRIN6
 s64b+0iW7Qr1faGKj9Cm9cfRB8cLsr9pye5yUEBoS7ozfdNTqA1zpX8hc g==;
X-CSE-ConnectionGUID: xtpQUD09Tt2U46TingyMmg==
X-CSE-MsgGUID: m0Kh3OBASSiLJOaMzEd0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106804"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:03 -0700
X-CSE-ConnectionGUID: TPCCmyLnSwuUhB497xz2sw==
X-CSE-MsgGUID: xT2nVziHSou/Fwvfloh4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2918149"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:16:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/rps: Move SLPC power profile checks into SLPC
 code
Date: Mon, 19 Oct 2026 16:15:40 +0300
Message-ID: <20261019131542.28822-6-ville.syrjala@linux.intel.com>
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

Move the SLPC power profile checks from the high level RPS
code into the SLPC specific functions. The high level code
doesn't need to know about this stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 8 --------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4d8d90872dd5..5f8f51198f5a 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1008,10 +1008,6 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 	if (rps_uses_slpc(rps)) {
 		slpc = rps_to_slpc(rps);
 
-		/* Don't decrement num_waiters for req where increment was skipped */
-		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
-			return;
-
 		intel_guc_slpc_dec_waiters(slpc);
 	} else {
 		atomic_dec(&rps->num_waiters);
@@ -1039,10 +1035,6 @@ void intel_rps_boost(struct i915_request *rq)
 	if (rps_uses_slpc(rps)) {
 		slpc = rps_to_slpc(rps);
 
-		/* Waitboost should not be done with power saving profile */
-		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
-			return;
-
 		if (!intel_guc_slpc_boost(slpc))
 			return;
 	} else {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 3a1bd7b1d9d6..f941fc3294b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -835,6 +835,10 @@ int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
 
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 {
+	/* Don't decrement num_waiters for req where increment was skipped */
+	if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
+		return;
+
 	/*
 	 * Return min back to the softlimit.
 	 * This is called during request retire,
@@ -849,6 +853,10 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 
 bool intel_guc_slpc_boost(struct intel_guc_slpc *slpc)
 {
+	/* Waitboost should not be done with power saving profile */
+	if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
+		return false;
+
 	/* Return if old value is non zero */
 	if (atomic_fetch_inc(&slpc->num_waiters))
 		return false;
-- 
2.55.0

