Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9582CC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 23:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A96220769
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 23:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A96220769
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A26E977;
	Thu, 21 Jan 2021 23:29:08 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2C6E977
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 23:29:06 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23666207-1500050 
 for multiple; Thu, 21 Jan 2021 23:28:07 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 21 Jan 2021 23:28:07 +0000
Message-Id: <20210121232807.16618-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Always flush the active worker before
 returning from the wait
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
Cc: Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The first thing the active retirement worker does is decrement the
i915_active count.

The first thing we do during i915_active_wait is try to increment the
i915_active count, but only if already active [non-zero].

The wait may see that the retirement is already started and so marked the
i915_active as idle, and skip waiting for the retirement handler.
However, the caller of i915_active_wait may immediately free the
i915_active upon returning (e.g. i915_vma_destroy) so we must not return
before the concurrent access from the worker are completed. We must
always flush the worker.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2473
Fixes: 274cbf20fd10 ("drm/i915: Push the i915_active.retire into a worker")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: <stable@vger.kernel.org> # v5.5+
---
 drivers/gpu/drm/i915/i915_active.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index ab4382841c6b..3bc616cc1ad2 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -628,24 +628,26 @@ static int flush_lazy_signals(struct i915_active *ref)
 
 int __i915_active_wait(struct i915_active *ref, int state)
 {
-	int err;
-
 	might_sleep();
 
-	if (!i915_active_acquire_if_busy(ref))
-		return 0;
-
 	/* Any fence added after the wait begins will not be auto-signaled */
-	err = flush_lazy_signals(ref);
-	i915_active_release(ref);
-	if (err)
-		return err;
+	if (i915_active_acquire_if_busy(ref)) {
+		int err;
 
-	if (!i915_active_is_idle(ref) &&
-	    ___wait_var_event(ref, i915_active_is_idle(ref),
-			      state, 0, 0, schedule()))
-		return -EINTR;
+		err = flush_lazy_signals(ref);
+		i915_active_release(ref);
+		if (err)
+			return err;
 
+		if (___wait_var_event(ref, i915_active_is_idle(ref),
+				      state, 0, 0, schedule()))
+			return -EINTR;
+	}
+
+	/*
+	 * After the wait is complete, the caller may free the active.
+	 * We have to flush any concurrent retirement before returning.
+	 */
 	flush_work(&ref->work);
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
