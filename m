Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193E5C4338F
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD15560184
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD15560184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8EB6E95C;
	Tue,  3 Aug 2021 22:12:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8FF6E8E9;
 Tue,  3 Aug 2021 22:11:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393489"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512744"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue,  3 Aug 2021 15:29:39 -0700
Message-Id: <20210803222943.27686-43-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 42/46] drm/i915: Hold all parallel requests
 until last request, properly handle error
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

Hold all parallel requests, via a submit fence, until the last request
is generated. If an error occurs in the middle of generating the
requests, skip the requests signal the backend of the error via a
request flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 40 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_request.h           |  9 +++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 70784779872a..64af5c704ca7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3351,7 +3351,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	if (out_fence) {
-		/* Move ownership to caller (i915_gem_execbuffer2_ioctl) */
+		/*
+		 * Move ownership to caller (i915_gem_execbuffer2_ioctl), this
+		 * must be done before anything in this function can jump to the
+		 * 'err_request' label so the caller can safely cleanup any
+		 * errors.
+		 */
 		out_fence[batch_number] = dma_fence_get(&eb.request->fence);
 
 		/*
@@ -3402,10 +3407,21 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	err = eb_submit(&eb, batch, first, last);
 
 err_request:
-	if (last)
+	if (last || err)
 		set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
 			&eb.request->fence.flags);
 
+	/*
+	 * If the execbuf IOCTL is generating more than 1 request, we hold all
+	 * the requests until the last request has been generated in case any of
+	 * the requests hit an error. If an error is hit the caller is
+	 * responsible for flaging all the requests generated with an error. The
+	 * caller is always responsible for releasing the fence on the first
+	 * request.
+	 */
+	if (intel_context_is_parallel(eb.context) && first)
+		i915_sw_fence_await(&eb.request->submit);
+
 	i915_request_get(eb.request);
 	err = eb_request_add(&eb, err);
 
@@ -3498,7 +3514,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	struct i915_gem_context *ctx;
 	struct i915_gem_ww_ctx ww;
 	struct intel_context *parent = NULL;
-	unsigned int num_batches = 1, i;
+	unsigned int num_batches = 1, i = 0, j;
 	bool is_parallel = false;
 
 	if (!check_buffer_count(count)) {
@@ -3637,8 +3653,24 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 					     out_fences,
 					     &ww);
 
-	if (is_parallel)
+	if (is_parallel) {
+		/*
+		 * Mark all requests generated with an error if any of the
+		 * requests encountered an error.
+		 */
+		for (j = 0; err && j < i; ++j)
+			if (out_fences[j]) {
+				__i915_request_skip(to_request(out_fences[j]));
+				set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
+					&out_fences[j]->flags);
+			}
+
+		/* Release fence on first request generated */
+		if (out_fences[0])
+			i915_sw_fence_complete(&to_request(out_fences[0])->submit);
+
 		mutex_unlock(&parent->parallel_submit);
+	}
 
 	/*
 	 * Now that we have begun execution of the batchbuffer, we ignore
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index d6d5bf0a5eb5..7f3f66ddf21b 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -153,6 +153,15 @@ enum {
 	 * tail.
 	 */
 	I915_FENCE_FLAG_SUBMIT_PARALLEL,
+
+	/*
+	 * I915_FENCE_FLAG_SKIP_PARALLEL - request with a context in a
+	 * parent-child relationship (parallel submission, multi-lrc) that
+	 * hit an error while generating requests in the execbuf IOCTL.
+	 * Indicates this request should be skipped as another request in
+	 * submission / relationship encoutered an error.
+	 */
+	I915_FENCE_FLAG_SKIP_PARALLEL,
 };
 
 /**
-- 
2.28.0

