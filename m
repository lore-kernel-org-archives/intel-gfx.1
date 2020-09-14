Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D273BC433E2
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99AF9208E4
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99AF9208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE656E4A1;
	Mon, 14 Sep 2020 13:13:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA0F6E499
 for <Intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 13:13:14 +0000 (UTC)
IronPort-SDR: M9ETJTFJSw8G11bYOZ5YKkZJ0YEmQOIYgcXPnBhApPDMAzVrH1MzZK+XkY3Ukm/sOVFtZ0PpZv
 rFT4+GhvAT6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="159113434"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="159113434"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 06:13:13 -0700
IronPort-SDR: w38uEcCQPTrbDWsbdhtxT5ACW8JlvhPnwVQPS3VyZT4M99WGedkO7qiTVB904QByPSocfAaYj7
 xQMJTPz2Z7rQ==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="507136374"
Received: from matancoh-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.255.198.45])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 06:13:11 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Mon, 14 Sep 2020 14:12:52 +0100
Message-Id: <20200914131256.89465-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
References: <20200914131256.89465-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 5/9] drm/i915: Track runtime spent in closed GEM
 contexts
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

As GEM contexts are closed we want to have the DRM client remember how
much GPU time they used (per class) so later we can used it for smarter
purposes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 +++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h      |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index a12e926444e1..a50b83659399 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -351,8 +351,18 @@ static void i915_gem_context_free(struct i915_gem_context *ctx)
 
 	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
 
-	if (client)
+	if (client) {
+		unsigned int i;
+
+		/* Transfer accumulated runtime to the parent drm client. */
+		BUILD_BUG_ON(ARRAY_SIZE(client->past_runtime) !=
+			     ARRAY_SIZE(ctx->past_runtime));
+		for (i = 0; i < ARRAY_SIZE(client->past_runtime); i++)
+			atomic64_add(atomic64_read(&ctx->past_runtime[i]),
+				     &client->past_runtime[i]);
+
 		i915_drm_client_put(client);
+	}
 
 	spin_lock(&ctx->i915->gem.contexts.lock);
 	list_del(&ctx->link);
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 11b48383881d..29b116606596 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -15,6 +15,8 @@
 #include <linux/sched.h>
 #include <linux/xarray.h>
 
+#include "gt/intel_engine_types.h"
+
 struct i915_drm_clients {
 	struct xarray xarray;
 	u32 next_id;
@@ -41,6 +43,11 @@ struct i915_drm_client {
 		struct device_attribute pid;
 		struct device_attribute name;
 	} attr;
+
+	/**
+	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
+	 */
+	atomic64_t past_runtime[MAX_ENGINE_CLASS + 1];
 };
 
 void i915_drm_clients_init(struct i915_drm_clients *clients);
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
