Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D975CC4727C
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 11:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D47C23B98
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 11:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D47C23B98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B786E198;
	Tue, 29 Sep 2020 11:26:48 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DCA6E198
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 11:26:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22566839-1500050 
 for multiple; Tue, 29 Sep 2020 12:26:35 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 12:26:39 +0100
Message-Id: <20200929112639.24223-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Scrub HW state on remove
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Currently we do a final scrub of the HW state upon release. However,
when rebinding the device, this is too late as the device may either
have been partially rebound or the device is no longer accessible. If
the device has been removed before release, the reset goes astray
leaving the device in an inconsistent state, unlikely to work without a
full PCI reset. Furthermore, if the device is partially rebound before
the HW scrubbing, there may be leftover HW state that should have been
scrubbed. Either way, we need to push the scrubbing earlier before the
removal, so into unregister. The danger is that on older machines,
reseting the GPU also impact the display engine and so the reset should
be after modesetting is disabled (and before reuse we need to recover
modesetting).

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2508
Testcase: igt/core_hotunplug
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 39b428c5049c..44f1d51e5ae5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -614,6 +614,8 @@ void intel_gt_driver_remove(struct intel_gt *gt)
 
 void intel_gt_driver_unregister(struct intel_gt *gt)
 {
+	intel_wakeref_t wakeref;
+
 	intel_rps_driver_unregister(&gt->rps);
 
 	/*
@@ -622,16 +624,15 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	 * resources.
 	 */
 	intel_gt_set_wedged(gt);
+
+	/* Scrub all HW state upon release */
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		__intel_gt_reset(gt, ALL_ENGINES);
 }
 
 void intel_gt_driver_release(struct intel_gt *gt)
 {
 	struct i915_address_space *vm;
-	intel_wakeref_t wakeref;
-
-	/* Scrub all HW state upon release */
-	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		__intel_gt_reset(gt, ALL_ENGINES);
 
 	vm = fetch_and_zero(&gt->vm);
 	if (vm) /* FIXME being called twice on error paths :( */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
