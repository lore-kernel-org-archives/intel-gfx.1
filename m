Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B8EC433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 09:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EB121883
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 09:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EB121883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687276EA42;
	Fri, 31 Jul 2020 09:15:57 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02ED6EA41;
 Fri, 31 Jul 2020 09:15:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21990655-1500050 
 for multiple; Fri, 31 Jul 2020 10:15:49 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 31 Jul 2020 10:15:48 +0100
Message-Id: <20200731091548.815898-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_ringsize: Manually control
 timeout
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Manually setup the signal handler for SIGARLM so that we can dump some
debug information for test failures.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_ringsize.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_ringsize.c b/tests/i915/gem_ctx_ringsize.c
index c8e661472..4530b242f 100644
--- a/tests/i915/gem_ctx_ringsize.c
+++ b/tests/i915/gem_ctx_ringsize.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <math.h>
+#include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
 #include <unistd.h>
@@ -214,6 +215,10 @@ static uint32_t batch_create(int i915)
 	return __batch_create(i915, 0);
 }
 
+static void sighandler(int sig)
+{
+}
+
 static unsigned int measure_inflight(int i915, unsigned int engine, int timeout)
 {
 	IGT_CORK_FENCE(cork);
@@ -230,15 +235,18 @@ static unsigned int measure_inflight(int i915, unsigned int engine, int timeout)
 	int err;
 
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
-	igt_set_timeout(timeout, "execbuf blocked!");
+	signal(SIGALRM, sighandler);
+	alarm(timeout);
 
 	gem_execbuf(i915, &execbuf);
 	for (count = 1; (err = __execbuf(i915, &execbuf)) == 0; count++)
 		;
+	igt_debugfs_dump(i915, "i915_engine_info");
 	igt_assert_eq(err, -EWOULDBLOCK);
 	close(execbuf.rsvd2);
 
-	igt_reset_timeout();
+	alarm(0);
+	signal(SIGALRM, SIG_DFL);
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
 
 	igt_cork_unplug(&cork);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
