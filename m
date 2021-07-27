Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F9BC4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 18:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C969F60F0F
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 18:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C969F60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738416EA70;
	Tue, 27 Jul 2021 18:03:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0CC6E9EF;
 Tue, 27 Jul 2021 18:03:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="212222304"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="212222304"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:03:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="662922381"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:03:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Jul 2021 11:20:57 -0700
Message-Id: <20210727182057.78409-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727182057.78409-1-matthew.brost@intel.com>
References: <20210727182057.78409-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/1] i915/gem_scheduler: Ensure submission
 order in manycontexts
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

With GuC submission contexts can get reordered (compared to submission
order), if contexts get reordered the sequential nature of the batches
releasing the next batch's semaphore in function timesliceN() get broken
resulting in the test taking much longer than if should. e.g. Every
contexts needs to be timesliced to release the next batch. Corking the
first submission until all the batches have been submitted should ensure
submission order.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_exec_schedule.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index f03842478..41f2591a5 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -597,12 +597,13 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
 	struct drm_i915_gem_execbuffer2 execbuf  = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = engine | I915_EXEC_FENCE_OUT,
+		.flags = engine | I915_EXEC_FENCE_OUT | I915_EXEC_FENCE_SUBMIT,
 	};
 	uint32_t *result =
 		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
 	const intel_ctx_t *ctx;
 	int fence[count];
+	IGT_CORK_FENCE(cork);
 
 	/*
 	 * Create a pair of interlocking batches, that ping pong
@@ -614,6 +615,17 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
+	/*
+	 * With GuC submission contexts can get reordered (compared to
+	 * submission order), if contexts get reordered the sequential
+	 * nature of the batches releasing the next batch's semaphore gets
+	 * broken resulting in the test taking much longer than it should (e.g.
+	 * every context needs to be timesliced to release the next batch).
+	 * Corking the first submission until all batches have been
+	 * submitted should ensure submission order.
+	 */
+	execbuf.rsvd2 = igt_cork_plug(&cork, i915);
+
 	/* No coupling between requests; free to timeslice */
 
 	for (int i = 0; i < count; i++) {
@@ -624,8 +636,10 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
 		intel_ctx_destroy(i915, ctx);
 
 		fence[i] = execbuf.rsvd2 >> 32;
+		execbuf.rsvd2 >>= 32;
 	}
 
+	igt_cork_unplug(&cork);
 	gem_sync(i915, obj.handle);
 	gem_close(i915, obj.handle);
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
