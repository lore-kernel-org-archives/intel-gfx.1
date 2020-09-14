Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34C6C2BC11
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707FD208E4
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707FD208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AD36E49A;
	Mon, 14 Sep 2020 13:13:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB16E497
 for <Intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 13:13:11 +0000 (UTC)
IronPort-SDR: ruE9gNrovtrOCpzl890UyE9M4ZIT9/vdWvHnOu1/goxRNe+WnArlHIqB/V4q6IN+FmMp9xwyb8
 nW2ACFsrswBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="159113424"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="159113424"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 06:13:11 -0700
IronPort-SDR: 5msE/fxyWGnUje2RjHjiA/GRSbt8EqFs5ejlsr9HKEE7Z+En+nD4NtyuGDKoMtMFwRHkSH7a6s
 DnZJeXiqu9YQ==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="507136361"
Received: from matancoh-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.255.198.45])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 06:13:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Mon, 14 Sep 2020 14:12:51 +0100
Message-Id: <20200914131256.89465-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
References: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/9] drm/i915: Track runtime spent in
 unreachable intel_contexts
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As contexts are abandoned we want to remember how much GPU time they used
(per class) so later we can used it for smarter purposes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 ++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  5 +++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index df5488998d53..a12e926444e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -253,7 +253,19 @@ static void free_engines_rcu(struct rcu_head *rcu)
 {
 	struct i915_gem_engines *engines =
 		container_of(rcu, struct i915_gem_engines, rcu);
+	struct i915_gem_context *ctx = engines->ctx;
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
+
+	/* Transfer accumulated runtime to the parent GEM context. */
+	for_each_gem_engine(ce, engines, it) {
+		unsigned int class = ce->engine->uabi_class;
 
+		GEM_BUG_ON(class >= ARRAY_SIZE(ctx->past_runtime));
+		atomic64_add(ce->runtime.total, &ctx->past_runtime[class]);
+	}
+
+	i915_gem_context_put(ctx);
 	i915_sw_fence_fini(&engines->fence);
 	free_engines(engines);
 }
@@ -274,7 +286,6 @@ engines_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 			list_del(&engines->link);
 			spin_unlock_irqrestore(&ctx->stale.lock, flags);
 		}
-		i915_gem_context_put(engines->ctx);
 		break;
 
 	case FENCE_FREE:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 31a6a30f7ea8..e473984b52c8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -178,6 +178,11 @@ struct i915_gem_context {
 		spinlock_t lock;
 		struct list_head engines;
 	} stale;
+
+	/**
+	 * @past_runtime: Accumulation of freed intel_context pphwsp runtimes.
+	 */
+	atomic64_t past_runtime[MAX_ENGINE_CLASS + 1];
 };
 
 #endif /* __I915_GEM_CONTEXT_TYPES_H__ */
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
