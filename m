Return-Path: <SRS0=5qC0=PQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ECFC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 23:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623C560187
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 23:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 623C560187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28B06E858;
	Thu, 28 Oct 2021 23:00:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0A56E856;
 Thu, 28 Oct 2021 23:00:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="227990247"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="227990247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:47:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="538226467"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:47:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>,
	<john.c.harrison@intel.com>
Date: Thu, 28 Oct 2021 15:42:24 -0700
Message-Id: <20211028224224.32693-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/resets: Don't set / test for
 per-engine reset bits with GuC submission
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

Don't set, test for, or clear per-engine reset bits with GuC submission
as the GuC owns the per engine resets not the i915. Setting, testing
for, and clearing these bits is causing issues with the hangcheck
selftest. Rather than change to test to not use these bits, rip the use
of these bits out from the reset code.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 91200c43951f..51b56b8e5003 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1367,20 +1367,27 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	/* Make sure i915_reset_trylock() sees the I915_RESET_BACKOFF */
 	synchronize_rcu_expedited();
 
-	/* Prevent any other reset-engine attempt. */
-	for_each_engine(engine, gt, tmp) {
-		while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
-					&gt->reset.flags))
-			wait_on_bit(&gt->reset.flags,
-				    I915_RESET_ENGINE + engine->id,
-				    TASK_UNINTERRUPTIBLE);
+	/*
+	 * Prevent any other reset-engine attempt. We don't do this for GuC
+	 * submission the GuC owns the per-engine reset, not the i915.
+	 */
+	if (!intel_uc_uses_guc_submission(&gt->uc)) {
+		for_each_engine(engine, gt, tmp) {
+			while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
+						&gt->reset.flags))
+				wait_on_bit(&gt->reset.flags,
+					    I915_RESET_ENGINE + engine->id,
+					    TASK_UNINTERRUPTIBLE);
+		}
 	}
 
 	intel_gt_reset_global(gt, engine_mask, msg);
 
-	for_each_engine(engine, gt, tmp)
-		clear_bit_unlock(I915_RESET_ENGINE + engine->id,
-				 &gt->reset.flags);
+	if (!intel_uc_uses_guc_submission(&gt->uc)) {
+		for_each_engine(engine, gt, tmp)
+			clear_bit_unlock(I915_RESET_ENGINE + engine->id,
+					 &gt->reset.flags);
+	}
 	clear_bit_unlock(I915_RESET_BACKOFF, &gt->reset.flags);
 	smp_mb__after_atomic();
 	wake_up_all(&gt->reset.queue);
-- 
2.32.0

