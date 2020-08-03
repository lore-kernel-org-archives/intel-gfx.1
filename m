Return-Path: <SRS0=uD7q=BN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED13C433E1
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2020 14:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0CC206D7
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2020 14:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0CC206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7F36E105;
	Mon,  3 Aug 2020 14:01:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91D6E2B6
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 14:01:56 +0000 (UTC)
IronPort-SDR: 2hO9ofkwWImOz66OeN4yjbhLFBW3QfdLghHJiI4QuzNrurzw5rexPOeMdsSUhxyxKIxsLEJJT9
 q+H0Ohdwextw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="216521863"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="216521863"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 07:01:56 -0700
IronPort-SDR: KLewEsEIwZlZMMgVPgxcv8PcRkRFFCyU+7d63aF9uW+yu8Cz4XZGz3UzSezy43GF3sHCc9OcQ3
 u6BxJ0UwkcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="466508014"
Received: from unknown (HELO delly.ger.corp.intel.com) ([10.252.62.231])
 by orsmga005.jf.intel.com with ESMTP; 03 Aug 2020 07:01:55 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  3 Aug 2020 17:01:47 +0300
Message-Id: <20200803140147.316523-4-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200803140147.316523-1-lionel.g.landwerlin@intel.com>
References: <20200803140147.316523-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] drm/i915: peel dma-fence-chains wait fences
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

To allow faster engine to engine synchronization, peel the layer of
dma-fence-chain to expose potential i915 fences so that the
i915-request code can emit HW semaphore wait/signal operations in the
ring which is faster than waking up the host to submit unblocked
workloads after interrupt notification.

v2: Also deal with chains where the last node is not a dma-fence-chain

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1f766431f3a3..dbd7f03c2187 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2390,6 +2390,7 @@ await_fence_array(struct i915_execbuffer *eb)
 
 	for (n = 0; n < eb->n_fences; n++) {
 		struct drm_syncobj *syncobj;
+		struct dma_fence_chain *chain;
 		struct dma_fence *fence;
 		unsigned int flags;
 
@@ -2410,7 +2411,43 @@ await_fence_array(struct i915_execbuffer *eb)
 				continue;
 		}
 
-		err = i915_request_await_dma_fence(eb->request, fence);
+		chain = to_dma_fence_chain(fence);
+		if (chain) {
+			struct dma_fence *iter;
+
+			/*
+			 * If we're dealing with a dma-fence-chain, peel the
+			 * chain by adding all of the unsignaled fences
+			 * (dma_fence_chain_for_each does that for us) the
+			 * chain points to.
+			 *
+			 * This enables us to identify waits on i915 fences
+			 * and allows for faster engine-to-engine
+			 * synchronization using HW semaphores.
+			 */
+			dma_fence_chain_for_each(iter, fence) {
+				struct dma_fence_chain *iter_chain =
+					to_dma_fence_chain(iter);
+
+				/*
+				 * It is possible that the last item in the
+				 * chain is not a dma_fence_chain.
+				 */
+				if (iter_chain) {
+					err = i915_request_await_dma_fence(eb->request,
+									   iter_chain->fence);
+				} else {
+					err = i915_request_await_dma_fence(eb->request, iter);
+				}
+				if (err < 0) {
+					dma_fence_put(iter);
+					break;
+				}
+			}
+		} else {
+			err = i915_request_await_dma_fence(eb->request, fence);
+		}
+
 		dma_fence_put(fence);
 		if (err < 0)
 			return err;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
