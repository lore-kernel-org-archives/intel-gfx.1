Return-Path: <SRS0=+CuI=FT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D249C4361B
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 21:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D9422CB8
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 21:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D9422CB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E5E89683;
	Tue, 15 Dec 2020 21:05:42 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFAF89683
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 21:05:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23337643-1500050 
 for multiple; Tue, 15 Dec 2020 21:05:26 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Dec 2020 21:05:26 +0000
Message-Id: <20201215210527.1188654-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/2] i915/gem_exec_params: Assert a 4G
 object does _not_ fit without 48b
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
Cc: igt-dev@lists.freedsktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Without opting into 48B addressing, objects are strictly limited to
being placed only the first (4G - 4K). This is to avoid an issue with
stateless 32b addressing being unable to access the last 32b page.
Assert that we do indeed fail to fit in a 4G object without setting the
EXEC_OBJECT_SUPPORTS_48B_ADDRESS flag.

Reported-by: CQ Tang <cq.tang@intel.com>
References:: 48ea1e32c39d ("drm/i915/gen9: Set PIN_ZONE_4G end to 4GB - 1 page")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: CQ Tang <cq.tang@intel.com>
---
 tests/i915/gem_exec_params.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index c405f4eb7..e679c512a 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -340,7 +340,13 @@ static void test_larger_than_life_batch(int fd)
        for_each_engine(e, fd) {
 	       /* Keep the batch_len implicit [0] */
 	       execbuf.flags = eb_ring(e);
-	       gem_execbuf(fd, &execbuf);
+
+	       /* non-48b objects are limited to the low (4G - 4K) */
+	       igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOSPC);
+
+	       exec.flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	       igt_assert_eq(__gem_execbuf(fd, &execbuf), 0);
+	       exec.flags = 0;
        }
 
        gem_sync(fd, exec.handle);
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
