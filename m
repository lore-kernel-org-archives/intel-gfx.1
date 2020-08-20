Return-Path: <SRS0=S5Fm=B6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6696C433E3
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 18:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7FF208B3
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 18:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7FF208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A66E9CF;
	Thu, 20 Aug 2020 18:26:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CF36E9C8;
 Thu, 20 Aug 2020 18:26:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22190674-1500050 
 for multiple; Thu, 20 Aug 2020 19:26:42 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Aug 2020 19:26:38 +0100
Message-Id: <20200820182640.65842-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820182640.65842-1-chris@chris-wilson.co.uk>
References: <20200820182640.65842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/4] i915/gem_exec_fence: Cleanup 32bit
 printfs
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Use PRI[ux]64 for printing 64bit values in a 32bit build.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_fence.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index b240c30bf..0b8ab1400 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2408,7 +2408,7 @@ static void build_wait_bb(struct inter_engine_context *context,
 	uint64_t wait_value =
 		0xffffffffffffffff - (delay * timestamp_frequency) / NSEC_PER_SEC;
 
-	igt_debug("wait_value=0x%lx\n", wait_value);
+	igt_debug("wait_value=0x%"PRIx64"\n", wait_value);
 
 	*bb++ = MI_LOAD_REGISTER_IMM;
 	*bb++ = 0x2000 + HSW_CS_GPR(0);
@@ -2680,7 +2680,7 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 	}
 
 	for (uint32_t i = 0; i < 10; i++)
-		igt_debug("%u = %lu\n", i, fib(i));
+		igt_debug("%u = %"PRIu64"\n", i, fib(i));
 
 	/* Bootstrap the fibonacci sequence */
 	{
@@ -2759,7 +2759,7 @@ static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 
 	/*
@@ -2825,7 +2825,7 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 	igt_assert_eq(counter_output[engines->nengines - 1],
 		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
@@ -2886,7 +2886,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_en
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
 	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
-		igt_debug("engine %i (%s)\t= %016lx\n", i,
+		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
 			  ctx.engines->engines[i].name, counter_output[i]);
 	igt_assert_eq(counter_output[engines->nengines - 1],
 		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
