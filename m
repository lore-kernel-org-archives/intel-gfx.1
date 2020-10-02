Return-Path: <SRS0=5YwX=DJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BEFC4363D
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 08:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978B9206B8
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 08:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978B9206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF69C6E0B7;
	Fri,  2 Oct 2020 08:34:47 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25566E0B7
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2020 08:34:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22599388-1500050 
 for multiple; Fri, 02 Oct 2020 09:34:27 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  2 Oct 2020 09:34:25 +0100
Message-Id: <20201002083425.4605-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Undo forced context restores after
 trivial preemptions
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
Cc: stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We may try to preempt the currently executing request, only to find that
after unravelling all the dependencies that the original executing
context is still the earliest in the topological sort and re-submitted
back to HW (if we do detect some change in the ELSP that requires
re-submission). However, due to the way we check for wrap-around during
the unravelling, we mark any context that has been submitted just once
(i.e. with the rq->wa_tail set, but the ring->tail earlier) as
potentially wrapping and requiring a forced restore on resubmission.
This was expected to be not a problem, as it was anticipated that most
unwinding for preemption would result in a context switch and the few
that did not would be lost in the noise. It did not take long for
someone to find one particular workload where the cost of those extra
context restores was measurable.

However, since we know the wa_tail is of fixed size, and we know that a
request must be larger than the wa_tail itself, we can safely maintain
the check for request wrapping and check against a slightly future point
in the ring that includes an expected wa_tail. (That is if the
ring->tail is already set to rq->wa_tail, including another 8 bytes in
the check does not invalidate the incremental wrap detection.)

Fixes: 8ab3a3812aa9 ("drm/i915/gt: Incrementally check for rewinding")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.4+
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 287537089c77..3aa05588834b 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1140,9 +1140,8 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 
 			/* Check in case we rollback so far we wrap [size/2] */
 			if (intel_ring_direction(rq->ring,
-						 intel_ring_wrap(rq->ring,
-								 rq->tail),
-						 rq->ring->tail) > 0)
+						 rq->tail,
+						 rq->ring->tail + 8) > 0)
 				rq->context->lrc.desc |= CTX_DESC_FORCE_RESTORE;
 
 			active = rq;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
