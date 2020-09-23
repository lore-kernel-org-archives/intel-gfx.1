Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E00BC2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 11:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB73020663
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 11:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB73020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D96E976;
	Wed, 23 Sep 2020 11:42:13 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337A56E976
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 11:42:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22512109-1500050 
 for multiple; Wed, 23 Sep 2020 12:41:57 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2020 12:41:56 +0100
Message-Id: <20200923114156.17749-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: Switch 4k kmalloc to use
 get_free_page for alignment
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
Cc: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

In generating the reference LRC, we want a page-aligned address for
simplicity in computing the offsets within. This then shares the
computation for the HW LRC which is mapped and so page aligned, making
the comparison straightforward. It seems that kmalloc(4k) is not always
returning from a 4k-aligned slab cache (which would give us a page aligned
address) so force alignment by explicitly allocating a page.

Reported-by: "Gote, Nitin R" <nitin.r.gote@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "Gote, Nitin R" <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index c8753559c44c..a885f2fb6e66 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -4761,7 +4761,7 @@ static int live_lrc_layout(void *arg)
 	 * match the layout saved by HW.
 	 */
 
-	lrc = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	lrc = (u32 *)__get_free_page(GFP_KERNEL);
 	if (!lrc)
 		return -ENOMEM;
 
@@ -4850,7 +4850,7 @@ static int live_lrc_layout(void *arg)
 			break;
 	}
 
-	kfree(lrc);
+	free_page((unsigned long)lrc);
 	return err;
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
