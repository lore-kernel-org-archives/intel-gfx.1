Return-Path: <SRS0=eTAM=DV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75465C43457
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 10:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF1F20878
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 10:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CF1F20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA516EA47;
	Wed, 14 Oct 2020 10:40:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB7589C99;
 Wed, 14 Oct 2020 10:40:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22711493-1500050 
 for multiple; Wed, 14 Oct 2020 11:40:41 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2020 11:40:34 +0100
Message-Id: <20201014104038.2554985-6-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 06/10] i915/gem_exec_reloc: Continuing the
 trend of checking userptr
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

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_reloc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index cb1a04b11..fc2bd0a56 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -429,7 +429,7 @@ static unsigned int offset_in_page(void *addr)
 	return (uintptr_t)addr & 4095;
 }
 
-static void active_spin(int fd, unsigned engine)
+static void active_spin(int fd, unsigned engine, unsigned long flags)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_relocation_entry reloc;
@@ -439,7 +439,7 @@ static void active_spin(int fd, unsigned engine)
 
 	spin = igt_spin_new(fd,
 			    .engine = engine,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
+			    .flags = IGT_SPIN_NO_PREEMPTION | flags);
 
 	memset(obj, 0, sizeof(obj));
 	obj[0] = spin->obj[IGT_SPIN_BATCH];
@@ -1266,7 +1266,14 @@ igt_main
 	igt_subtest_with_dynamic("basic-spin") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
-				active_spin(fd, e->flags);
+				active_spin(fd, e->flags, 0);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-spin-user") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active_spin(fd, e->flags, IGT_SPIN_USERPTR);
 		}
 	}
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
