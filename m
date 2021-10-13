Return-Path: <SRS0=fYpC=PB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964E9C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 20:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E7161152
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 20:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50E7161152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C96EB6C;
	Wed, 13 Oct 2021 20:56:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45966EB79;
 Wed, 13 Oct 2021 20:55:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214690404"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214690404"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524782794"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Date: Wed, 13 Oct 2021 13:42:28 -0700
Message-Id: <20211013204231.19287-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013204231.19287-1-matthew.brost@intel.com>
References: <20211013204231.19287-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 22/25] drm/i915: Make request conflict tracking
 understand parallel submits
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

If an object in the excl or shared slot is a composite fence from a
parallel submit and the current request in the conflict tracking is from
the same parallel context there is no need to enforce ordering as the
ordering is already implicit. Make the request conflict tracking
understand this by comparing a parallel submit's parent context and
skipping conflict insertion if the values match.

v2:
 (John Harrison)
  - Reword commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 8bdf9f2f9b90..820a1f38b271 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1335,6 +1335,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	return err;
 }
 
+static inline bool is_parallel_rq(struct i915_request *rq)
+{
+	return intel_context_is_parallel(rq->context);
+}
+
+static inline struct intel_context *request_to_parent(struct i915_request *rq)
+{
+	return intel_context_to_parent(rq->context);
+}
+
+static bool is_same_parallel_context(struct i915_request *to,
+				     struct i915_request *from)
+{
+	if (is_parallel_rq(to))
+		return request_to_parent(to) == request_to_parent(from);
+
+	return false;
+}
+
 int
 i915_request_await_execution(struct i915_request *rq,
 			     struct dma_fence *fence)
@@ -1366,11 +1385,14 @@ i915_request_await_execution(struct i915_request *rq,
 		 * want to run our callback in all cases.
 		 */
 
-		if (dma_fence_is_i915(fence))
+		if (dma_fence_is_i915(fence)) {
+			if (is_same_parallel_context(rq, to_request(fence)))
+				continue;
 			ret = __i915_request_await_execution(rq,
 							     to_request(fence));
-		else
+		} else {
 			ret = i915_request_await_external(rq, fence);
+		}
 		if (ret < 0)
 			return ret;
 	} while (--nchild);
@@ -1471,10 +1493,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 						 fence))
 			continue;
 
-		if (dma_fence_is_i915(fence))
+		if (dma_fence_is_i915(fence)) {
+			if (is_same_parallel_context(rq, to_request(fence)))
+				continue;
 			ret = i915_request_await_request(rq, to_request(fence));
-		else
+		} else {
 			ret = i915_request_await_external(rq, fence);
+		}
 		if (ret < 0)
 			return ret;
 
@@ -1525,16 +1550,6 @@ i915_request_await_object(struct i915_request *to,
 	return ret;
 }
 
-static inline bool is_parallel_rq(struct i915_request *rq)
-{
-	return intel_context_is_parallel(rq->context);
-}
-
-static inline struct intel_context *request_to_parent(struct i915_request *rq)
-{
-	return intel_context_to_parent(rq->context);
-}
-
 static struct i915_request *
 __i915_request_ensure_parallel_ordering(struct i915_request *rq,
 					struct intel_timeline *timeline)
-- 
2.32.0

