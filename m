Return-Path: <SRS0=vegk=G3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4006CC433E6
	for <intel-gfx@archiver.kernel.org>; Sun, 24 Jan 2021 15:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E638522E03
	for <intel-gfx@archiver.kernel.org>; Sun, 24 Jan 2021 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E638522E03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D2889EA6;
	Sun, 24 Jan 2021 15:31:46 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD289E65
 for <intel-gfx@lists.freedesktop.org>; Sun, 24 Jan 2021 15:31:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23686707-1500050 
 for <intel-gfx@lists.freedesktop.org>; Sun, 24 Jan 2021 15:31:35 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sun, 24 Jan 2021 15:31:33 +0000
Message-Id: <20210124153136.19124-5-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124153136.19124-1-chris@chris-wilson.co.uk>
References: <20210124153136.19124-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 5/8] drm/i915: Track runtime spent in closed and
 unreachable GEM contexts
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

As GEM contexts are closed we want to have the DRM client remember how
much GPU time they used (per class) so later we can used it for smarter
purposes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-5-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_drm_client.h      |  7 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f0cc3edffebf..0e3a513eedf6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -260,23 +260,43 @@ static void free_engines_rcu(struct rcu_head *rcu)
 	free_engines(engines);
 }
 
+static void accumulate_runtime(struct i915_drm_client *client,
+			       struct i915_gem_engines *engines)
+{
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
+
+	if (!client)
+		return;
+
+	/* Transfer accumulated runtime to the parent GEM context. */
+	for_each_gem_engine(ce, engines, it) {
+		unsigned int class = ce->engine->uabi_class;
+
+		GEM_BUG_ON(class >= ARRAY_SIZE(client->past_runtime));
+		atomic64_add(intel_context_get_total_runtime_ns(ce),
+			     &client->past_runtime[class]);
+	}
+}
+
 static int __i915_sw_fence_call
 engines_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct i915_gem_engines *engines =
 		container_of(fence, typeof(*engines), fence);
+	struct i915_gem_context *ctx = engines->ctx;
 
 	switch (state) {
 	case FENCE_COMPLETE:
 		if (!list_empty(&engines->link)) {
-			struct i915_gem_context *ctx = engines->ctx;
 			unsigned long flags;
 
 			spin_lock_irqsave(&ctx->stale.lock, flags);
 			list_del(&engines->link);
 			spin_unlock_irqrestore(&ctx->stale.lock, flags);
 		}
-		i915_gem_context_put(engines->ctx);
+		accumulate_runtime(ctx->client, engines);
+		i915_gem_context_put(ctx);
 		break;
 
 	case FENCE_FREE:
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 556a59d6b834..6f25e754e978 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -15,6 +15,8 @@
 #include <linux/sched.h>
 #include <linux/xarray.h>
 
+#include "gt/intel_engine_types.h"
+
 struct drm_i915_private;
 
 struct i915_drm_clients {
@@ -51,6 +53,11 @@ struct i915_drm_client {
 		struct device_attribute pid;
 		struct device_attribute name;
 	} attr;
+
+	/**
+	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
+	 */
+	atomic64_t past_runtime[MAX_ENGINE_CLASS + 1];
 };
 
 void i915_drm_clients_init(struct i915_drm_clients *clients,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
