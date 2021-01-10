Return-Path: <SRS0=lzRC=GN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5307C433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 10 Jan 2021 15:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D13229EF
	for <intel-gfx@archiver.kernel.org>; Sun, 10 Jan 2021 15:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D13229EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03146E0C4;
	Sun, 10 Jan 2021 15:04:17 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D926E0C1
 for <intel-gfx@lists.freedesktop.org>; Sun, 10 Jan 2021 15:04:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23553101-1500050 
 for multiple; Sun, 10 Jan 2021 15:04:07 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sun, 10 Jan 2021 15:03:59 +0000
Message-Id: <20210110150404.19535-6-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210110150404.19535-1-chris@chris-wilson.co.uk>
References: <20210110150404.19535-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 06/11] drm/i915/gt: Replace open-coded
 intel_engine_stop_cs()
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

In the legacy ringbuffer submission, we still had an open-coded version
of intel_engine_stop_cs() with one addition verification step. Transfer
that verification to intel_engine_stop_cs() itself, and call it.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 15 +++++++++--
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 25 +------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1847d3c2ea99..58c900a12c13 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1048,8 +1048,19 @@ int intel_engine_stop_cs(struct intel_engine_cs *engine)
 
 	ENGINE_TRACE(engine, "\n");
 	if (__intel_engine_stop_cs(engine, 1000, stop_timeout(engine))) {
-		ENGINE_TRACE(engine, "timed out on STOP_RING -> IDLE\n");
-		err = -ETIMEDOUT;
+		ENGINE_TRACE(engine,
+			     "timed out on STOP_RING -> IDLE; HEAD:%04x, TAIL:%04x\n",
+			     ENGINE_READ_FW(engine, RING_HEAD) & HEAD_ADDR,
+			     ENGINE_READ_FW(engine, RING_TAIL) & TAIL_ADDR);
+
+		/*
+		 * Sometimes we observe that the idle flag is not
+		 * set even though the ring is empty. So double
+		 * check before giving up.
+		 */
+		if ((ENGINE_READ_FW(engine, RING_HEAD) & HEAD_ADDR) !=
+		    (ENGINE_READ_FW(engine, RING_TAIL) & TAIL_ADDR))
+			err = -ETIMEDOUT;
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 657afd8ebc14..20f42722be8b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -159,30 +159,7 @@ static void ring_setup_status_page(struct intel_engine_cs *engine)
 
 static bool stop_ring(struct intel_engine_cs *engine)
 {
-	struct drm_i915_private *dev_priv = engine->i915;
-
-	if (INTEL_GEN(dev_priv) > 2) {
-		ENGINE_WRITE(engine,
-			     RING_MI_MODE, _MASKED_BIT_ENABLE(STOP_RING));
-		if (intel_wait_for_register(engine->uncore,
-					    RING_MI_MODE(engine->mmio_base),
-					    MODE_IDLE,
-					    MODE_IDLE,
-					    1000)) {
-			drm_err(&dev_priv->drm,
-				"%s : timed out trying to stop ring\n",
-				engine->name);
-
-			/*
-			 * Sometimes we observe that the idle flag is not
-			 * set even though the ring is empty. So double
-			 * check before giving up.
-			 */
-			if (ENGINE_READ(engine, RING_HEAD) !=
-			    ENGINE_READ(engine, RING_TAIL))
-				return false;
-		}
-	}
+	intel_engine_stop_cs(engine);
 
 	ENGINE_WRITE(engine, RING_HEAD, ENGINE_READ(engine, RING_TAIL));
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
