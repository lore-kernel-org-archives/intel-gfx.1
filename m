Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C5CC4741F
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 00:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6A9206B5
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 00:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6A9206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9426E850;
	Thu,  5 Nov 2020 00:21:34 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E626E850;
 Thu,  5 Nov 2020 00:21:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22896869-1500050 
 for multiple; Thu, 05 Nov 2020 00:21:26 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  5 Nov 2020 00:21:23 +0000
Message-Id: <20201105002124.37888-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/2] i915/gem_exec_whisper: Reopen
 existing device
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

Reopen the existing device, rather than relying on the filtering in
drm_open_driver().

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_whisper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 9acf6c306..b63d791d1 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -87,12 +87,12 @@ struct hang {
 	int fd;
 };
 
-static void init_hang(struct hang *h)
+static void init_hang(struct hang *h, int fd)
 {
 	uint32_t *batch;
 	int i, gen;
 
-	h->fd = drm_open_driver(DRIVER_INTEL);
+	h->fd = gem_reopen_driver(fd);
 	igt_allow_hang(h->fd, 0, 0);
 
 	gen = intel_gen(intel_get_drm_devid(h->fd));
@@ -224,7 +224,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		igt_require(gem_has_queues(fd));
 
 	if (flags & HANG)
-		init_hang(&hang);
+		init_hang(&hang, fd);
 
 	nchild = 1;
 	if (flags & FORKED)
@@ -304,7 +304,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		}
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++)
-				fds[n] = drm_open_driver(DRIVER_INTEL);
+				fds[n] = gem_reopen_driver(fd);
 		}
 
 		memset(batches, 0, sizeof(batches));
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
