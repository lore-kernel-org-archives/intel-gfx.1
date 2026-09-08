Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E6C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0610EDE7;
	Tue,  8 Sep 2026 23:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjG79vfG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6DF10E0E7
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909806; x=1820445806;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uf1gw3WgmFhBk7RlTLkjkjKi+JcBAcSU1a9jV2LnQd8=;
 b=ZjG79vfG+dvra4axZaHdAM2ms2cSI9c66qGW49SVscbZU4d1GYTPsrop
 xAgrFkwk/QJNZTZbHS7dDDaw1ktwTNB8ekKgn/njnGl+7D8JHP75BIvRv
 bz88jJcNI5lYpr6IlyCEak7DmY0hGyqPQSPvoxNwIw3HRsVxqnXcrAARD
 ls9tFhJHhfFAjtiCtRjNj7WSRhSdjcu+QXqaLGHQS8A05c8GR8bmoZOA5
 rL2p7zwXYsIustb5Ma/52NVsZZB4Om2Lgnm7iMJ13G4rw+bYj/M/oFmx3
 6ZtHZFpMt1ewWu3fYLlAQl/tD+75tBC5GcvZScuiyiUfTDGZdq4KGCRAV A==;
X-CSE-ConnectionGUID: TVYz2X1tRT+NN13pv/tmaA==
X-CSE-MsgGUID: 0rc6wTxmRfOj7poXIhrpvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93191026"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="93191026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:25 -0700
X-CSE-ConnectionGUID: H6CO42yWTc6WX52YE6jdYQ==
X-CSE-MsgGUID: 200zJC6PTOuyHcAYkUwCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271131587"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 2/2] drm/i915/guc: Reject unsolicited deregister-done G2H
Date: Tue,  8 Sep 2026 16:23:26 -0700
Message-ID: <20260908232323.1220407-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
References: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
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

intel_guc_deregister_done_process_msg() takes the ctx_id straight out of
the G2H payload, resolves it via g2h_context_lookup() and then calls
decr_outstanding_submission_g2h() unconditionally. Ensure that we are
expecting a DEREGISTER_DONE G2H for that context before changing
outstanding_submission state. Return EPROTO on error.

Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9d3bd16adf40..85fbef30dbec 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -5065,6 +5065,18 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	if (unlikely(!ce))
 		return -EPROTO;
 
+	/*
+	 * A deregister H2G is only ever sent for a context that has been put in
+	 * one of these two states first, so anything else means this G2H does
+	 * not correspond to an outstanding request of ours.
+	 */
+	if (unlikely(!context_wait_for_deregister_to_register(ce) &&
+		     !context_destroyed(ce))) {
+		guc_err(guc, "Unexpected deregister done, ctx_id %u sched_state 0x%x\n",
+			ctx_id, ce->guc_state.sched_state);
+		return -EPROTO;
+	}
+
 	trace_intel_context_deregister_done(ce);
 
 #ifdef CONFIG_DRM_I915_SELFTEST
-- 
2.53.0

