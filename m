Return-Path: <SRS0=D79Q=PW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56711C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 22:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAFC6052B
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 22:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAAFC6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DE36F407;
	Wed,  3 Nov 2021 22:47:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7896F407
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Nov 2021 22:47:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211665574"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="211665574"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 15:47:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="729097116"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 15:47:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed,  3 Nov 2021 15:47:08 -0700
Message-Id: <20211103224708.1931-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/pmu: Fix synchronization of PMU
 callback with reset
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

Since the PMU callback runs in irq context, it synchronizes with gt
reset using the reset count. We could run into a case where the PMU
callback could read the reset count before it is updated. This has a
potential of corrupting the busyness stats.

In addition to the reset count, check if the reset bit is set before
capturing busyness.

In addition save the previous stats only if you intend to update them.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 5cc49c0b3889..d83ade77ca07 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1183,6 +1183,7 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	u64 total, gt_stamp_saved;
 	unsigned long flags;
 	u32 reset_count;
+	bool in_reset;
 
 	spin_lock_irqsave(&guc->timestamp.lock, flags);
 
@@ -1191,7 +1192,9 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	 * engine busyness from GuC, so we just use the driver stored
 	 * copy of busyness. Synchronize with gt reset using reset_count.
 	 */
-	reset_count = i915_reset_count(gpu_error);
+	rcu_read_lock();
+	in_reset = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
+	rcu_read_unlock();
 
 	*now = ktime_get();
 
@@ -1201,9 +1204,10 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	 * start_gt_clk is derived from GuC state. To get a consistent
 	 * view of activity, we query the GuC state only if gt is awake.
 	 */
-	stats_saved = *stats;
-	gt_stamp_saved = guc->timestamp.gt_stamp;
-	if (intel_gt_pm_get_if_awake(gt)) {
+	if (intel_gt_pm_get_if_awake(gt) && !in_reset) {
+		stats_saved = *stats;
+		gt_stamp_saved = guc->timestamp.gt_stamp;
+		reset_count = i915_reset_count(gpu_error);
 		guc_update_engine_gt_clks(engine);
 		guc_update_pm_timestamp(guc, engine, now);
 		intel_gt_pm_put_async(gt);
-- 
2.20.1

