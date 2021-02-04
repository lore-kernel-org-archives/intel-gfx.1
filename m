Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41069C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 10:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A5B64F5E
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 10:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A5B64F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15566EC90;
	Thu,  4 Feb 2021 10:03:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9AE6EC90
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 10:03:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23784279-1500050 
 for multiple; Thu, 04 Feb 2021 10:03:44 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Feb 2021 10:03:40 +0000
Message-Id: <20210204100341.10211-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/selftests: Restore previous
 heartbeat interval
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

Use the defaults we store on the engine when resetting the heartbeat as
we may have had to adjust it from the config value during initialisation.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index b0bae6676140..8b988a3dd8dd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -11,6 +11,12 @@
 #include "i915_selftest.h"
 #include "selftest_engine_heartbeat.h"
 
+static void reset_heartbeat(struct intel_engine_cs *engine)
+{
+	intel_engine_set_heartbeat(engine,
+				   engine->defaults.heartbeat_interval_ms);
+}
+
 static int timeline_sync(struct intel_timeline *tl)
 {
 	struct dma_fence *fence;
@@ -196,7 +202,8 @@ static int cmp_u32(const void *_a, const void *_b)
 
 static int __live_heartbeat_fast(struct intel_engine_cs *engine)
 {
-	const unsigned int error_threshold = max(20000u, jiffies_to_usecs(6));
+	const unsigned int error_threshold =
+	       	max(3 * TIMEOUT_COMPLETION, jiffies_to_usecs(6));
 	struct intel_context *ce;
 	struct i915_request *rq;
 	ktime_t t0, t1;
@@ -269,7 +276,7 @@ static int __live_heartbeat_fast(struct intel_engine_cs *engine)
 		err = -EINVAL;
 	}
 
-	intel_engine_set_heartbeat(engine, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
+	reset_heartbeat(engine);
 err_pm:
 	intel_engine_pm_put(engine);
 	intel_context_put(ce);
@@ -284,7 +291,7 @@ static int live_heartbeat_fast(void *arg)
 	int err = 0;
 
 	/* Check that the heartbeat ticks at the desired rate. */
-	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
+	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
 		return 0;
 
 	for_each_engine(engine, gt, id) {
@@ -332,7 +339,7 @@ static int __live_heartbeat_off(struct intel_engine_cs *engine)
 	}
 
 err_beat:
-	intel_engine_set_heartbeat(engine, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
+	reset_heartbeat(engine);
 err_pm:
 	intel_engine_pm_put(engine);
 	return err;
@@ -346,7 +353,7 @@ static int live_heartbeat_off(void *arg)
 	int err = 0;
 
 	/* Check that we can turn off heartbeat and not interrupt VIP */
-	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
+	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
 		return 0;
 
 	for_each_engine(engine, gt, id) {
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
