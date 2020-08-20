Return-Path: <SRS0=S5Fm=B6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA03C433E1
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 18:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A6B208B3
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A6B208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528536E9CE;
	Thu, 20 Aug 2020 18:26:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9056E9CB;
 Thu, 20 Aug 2020 18:26:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22190675-1500050 
 for multiple; Thu, 20 Aug 2020 19:26:42 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Aug 2020 19:26:39 +0100
Message-Id: <20200820182640.65842-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820182640.65842-1-chris@chris-wilson.co.uk>
References: <20200820182640.65842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 3/4] i915/bb: Cleanup 32bit printfs
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

Use PRIx64 for 64b addresses on a 32b build.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/api_intel_bb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 6967fc5d0..cf7f6e91b 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -260,9 +260,9 @@ static void blit(struct buf_ops *bops,
 	poff_bb = intel_bb_get_object_offset(ibb, ibb->handle);
 	poff_src = intel_bb_get_object_offset(ibb, src->handle);
 	poff_dst = intel_bb_get_object_offset(ibb, dst->handle);
-	igt_debug("bb  presumed offset: 0x%lx\n", poff_bb);
-	igt_debug("src presumed offset: 0x%lx\n", poff_src);
-	igt_debug("dst presumed offset: 0x%lx\n", poff_dst);
+	igt_debug("bb  presumed offset: 0x%"PRIx64"\n", poff_bb);
+	igt_debug("src presumed offset: 0x%"PRIx64"\n", poff_src);
+	igt_debug("dst presumed offset: 0x%"PRIx64"\n", poff_dst);
 	if (reloc_obj == RELOC) {
 		igt_assert(poff_bb == 0);
 		igt_assert(poff_src == 0);
@@ -289,12 +289,12 @@ static void blit(struct buf_ops *bops,
 	poff2_dst = intel_bb_get_object_offset(ibb, dst->handle);
 
 	igt_debug("purge: %d, relocs: %d\n", purge_cache, do_relocs);
-	igt_debug("bb  presumed offset: 0x%lx\n", poff_bb);
-	igt_debug("src presumed offset: 0x%lx\n", poff_src);
-	igt_debug("dst presumed offset: 0x%lx\n", poff_dst);
-	igt_debug("bb2  presumed offset: 0x%lx\n", poff2_bb);
-	igt_debug("src2 presumed offset: 0x%lx\n", poff2_src);
-	igt_debug("dst2 presumed offset: 0x%lx\n", poff2_dst);
+	igt_debug("bb  presumed offset: 0x%"PRIx64"\n", poff_bb);
+	igt_debug("src presumed offset: 0x%"PRIx64"\n", poff_src);
+	igt_debug("dst presumed offset: 0x%"PRIx64"\n", poff_dst);
+	igt_debug("bb2  presumed offset: 0x%"PRIx64"\n", poff2_bb);
+	igt_debug("src2 presumed offset: 0x%"PRIx64"\n", poff2_src);
+	igt_debug("dst2 presumed offset: 0x%"PRIx64"\n", poff2_dst);
 	if (purge_cache) {
 		if (do_relocs) {
 			igt_assert(poff2_bb == 0);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
