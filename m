Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42EC636C8
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 20:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEEF60FF3
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 20:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEEF60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB66E530;
	Tue, 20 Jul 2021 20:40:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF456E52A;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885379"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885379"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906097"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue, 20 Jul 2021 13:57:57 -0700
Message-Id: <20210720205802.39610-38-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 37/42] drm/i915: Only track object
 dependencies on first request
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Only track object dependencies on the first request generated from the
execbuf, this help with the upcoming multi-bb execbuf extension.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index fe3242f4f2e6..1a91e21132be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2239,7 +2239,7 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_move_to_gpu(struct i915_execbuffer *eb)
+static int eb_move_to_gpu(struct i915_execbuffer *eb, bool first)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i = count;
@@ -2281,7 +2281,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 				flags &= ~EXEC_OBJECT_ASYNC;
 		}
 
-		if (err == 0 && !(flags & EXEC_OBJECT_ASYNC)) {
+		if (err == 0 && first && !(flags & EXEC_OBJECT_ASYNC)) {
 			err = i915_request_await_object
 				(eb->request, obj, flags & EXEC_OBJECT_WRITE);
 		}
@@ -2525,14 +2525,15 @@ static int eb_parse(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch)
+static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch,
+		     bool first)
 {
 	int err;
 
 	if (intel_context_nopreempt(eb->context))
 		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &eb->request->fence.flags);
 
-	err = eb_move_to_gpu(eb);
+	err = eb_move_to_gpu(eb, first);
 	if (err)
 		return err;
 
@@ -3304,7 +3305,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		intel_gt_buffer_pool_mark_active(eb.batch_pool, eb.request);
 
 	trace_i915_request_queue(eb.request, eb.batch_flags);
-	err = eb_submit(&eb, batch);
+	err = eb_submit(&eb, batch, true);
 
 err_request:
 	i915_request_get(eb.request);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
