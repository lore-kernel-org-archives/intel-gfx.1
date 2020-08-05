Return-Path: <SRS0=TleC=BP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F75C433EA
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD9B22D2B
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD9B22D2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5C06E5C3;
	Wed,  5 Aug 2020 12:23:00 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150C56E573
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 12:22:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22039496-1500050 
 for multiple; Wed, 05 Aug 2020 13:22:37 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  5 Aug 2020 13:22:31 +0100
Message-Id: <20200805122231.23313-38-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200805122231.23313-1-chris@chris-wilson.co.uk>
References: <20200805122231.23313-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 37/37] drm/i915/gem: Delay attach mmu-notifier
 until we acquire the pinned userptr
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

On the fast path, we first try to pin the user pages and then attach the
mmu-notifier. On the slow path, we did it the opposite way around,
carrying the mmu-notifier over from the tail of the fast path. However,
if we are mapping a fresh batch of user pages, we will always hit a pmd
split operation (to replace the zero pages with real pages), triggering
an invalidate-range callback for this userptr, and so we have to cancel
the work [after completing the pinning] and cause the caller to retry
(an extra EAGAIN return from an ioctl for some paths). If we follow the
fast path approach and attach the callback after completion, we only see
the invalidate-range for revocations of our pages.

The risk (the same as for the fast path) is that if the mmu-notifier
should have been run during the page lookup, we will have missed it and
the pages will be mixed. One might conclude that the fast path is wrong,
and we should always attach the mmu-notifier first and bear the cost of
redundant repetition.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 80907c00c6fd..ba1f01650eeb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -500,14 +500,13 @@ __i915_gem_userptr_get_pages_worker(struct work_struct *_work)
 			pages = __i915_gem_userptr_alloc_pages(obj, pvec,
 							       npages);
 			if (!IS_ERR(pages)) {
+				__i915_gem_userptr_set_active(obj, true);
 				pinned = 0;
 				pages = NULL;
 			}
 		}
 
 		obj->userptr.work = ERR_CAST(pages);
-		if (IS_ERR(pages))
-			__i915_gem_userptr_set_active(obj, false);
 	}
 	i915_gem_object_unlock(obj);
 
@@ -566,7 +565,6 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	struct mm_struct *mm = obj->userptr.mm->mm;
 	struct page **pvec;
 	struct sg_table *pages;
-	bool active;
 	int pinned;
 	unsigned int gup_flags = 0;
 
@@ -621,19 +619,16 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 		}
 	}
 
-	active = false;
 	if (pinned < 0) {
 		pages = ERR_PTR(pinned);
 		pinned = 0;
 	} else if (pinned < num_pages) {
 		pages = __i915_gem_userptr_get_pages_schedule(obj);
-		active = pages == ERR_PTR(-EAGAIN);
 	} else {
 		pages = __i915_gem_userptr_alloc_pages(obj, pvec, num_pages);
-		active = !IS_ERR(pages);
+		if (!IS_ERR(pages))
+			__i915_gem_userptr_set_active(obj, true);
 	}
-	if (active)
-		__i915_gem_userptr_set_active(obj, true);
 
 	if (IS_ERR(pages))
 		unpin_user_pages(pvec, pinned);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
