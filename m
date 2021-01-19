Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E8FC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 11:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C37F620760
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 11:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C37F620760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E876E848;
	Tue, 19 Jan 2021 11:08:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D7E6E83D
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 11:08:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23637619-1500050 
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 11:08:03 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 19 Jan 2021 11:07:57 +0000
Message-Id: <20210119110802.22228-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 1/6] drm/i915/gt: One more flush for Baytrail clear
 residuals
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

CI reports that Baytail requires one more invalidate after CACHE_MODE
for it to be happy.

Fixes: ace44e13e577 ("drm/i915/gt: Clear CACHE_MODE prior to clearing residuals")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen7_renderclear.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
index 39478712769f..8551e6de50e8 100644
--- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
+++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
@@ -353,19 +353,21 @@ static void gen7_emit_pipeline_flush(struct batch_chunk *batch)
 
 static void gen7_emit_pipeline_invalidate(struct batch_chunk *batch)
 {
-	u32 *cs = batch_alloc_items(batch, 0, 8);
+	u32 *cs = batch_alloc_items(batch, 0, 10);
 
 	/* ivb: Stall before STATE_CACHE_INVALIDATE */
-	*cs++ = GFX_OP_PIPE_CONTROL(4);
+	*cs++ = GFX_OP_PIPE_CONTROL(5);
 	*cs++ = PIPE_CONTROL_STALL_AT_SCOREBOARD |
 		PIPE_CONTROL_CS_STALL;
 	*cs++ = 0;
 	*cs++ = 0;
+	*cs++ = 0;
 
-	*cs++ = GFX_OP_PIPE_CONTROL(4);
+	*cs++ = GFX_OP_PIPE_CONTROL(5);
 	*cs++ = PIPE_CONTROL_STATE_CACHE_INVALIDATE;
 	*cs++ = 0;
 	*cs++ = 0;
+	*cs++ = 0;
 
 	batch_advance(batch, cs);
 }
@@ -397,6 +399,7 @@ static void emit_batch(struct i915_vma * const vma,
 	batch_add(&cmds, 0xffff0000);
 	batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_1));
 	batch_add(&cmds, 0xffff0000 | PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
+	gen7_emit_pipeline_invalidate(&cmds);
 	gen7_emit_pipeline_flush(&cmds);
 
 	/* Switch to the media pipeline and our base address */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
