Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B013FC63777
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 07:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E409820B80
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 07:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E409820B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EAA6E09C;
	Thu,  3 Dec 2020 07:46:36 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506AE6E09C
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 07:46:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23197761-1500050 
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Dec 2020 07:46:31 +0000
MIME-Version: 1.0
In-Reply-To: <20201203005731.18385-1-chris@chris-wilson.co.uk>
References: <20201203005731.18385-1-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
Cc: 
To: intel-gfx@lists.freedesktop.org
Date: Thu, 03 Dec 2020 07:46:30 +0000
Message-ID: <160698159032.26639.9590627415541886084@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Clear the execlists timers
 before restarting
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

Quoting Chris Wilson (2020-12-03 00:57:31)
> Across a reset, we stop the engine but not the timers. This leaves a
> window where the timers have inconsistent state with the engine, causing
> false timeslicing/preemption decisions to be made immediately upon
> resume.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
> This fits the trace of a failure across reset, and has a certain ring of
> truth to it, but the preempt timer should have been cleared with the
> first submission after the reset (and before the first submission should
> not be an issue). I fear there's something else lurking here with the
> timer vs reset.
> 
> For reference, the issue is the immediate reset following the first,
> both due to preeempt timeout, but there was not a submission during the
> reset to prime the preempt timer:
> 
> [   27.184920] kworker/-121       3.... 27095209us : execlists_reset: 0000:00:02.0 bcs0: reset for preemption time out
> [   27.184962] kworker/-121       3d..1 27095309us : active_context: 0000:00:02.0 bcs0: ccid found at active:0
> [   27.185005] kworker/-121       3d..1 27095312us : execlists_hold: 0000:00:02.0 bcs0: fence 1c:45, current 44 on hold
> [   27.185048] kworker/-121       3d..1 27095313us : execlists_hold: 0000:00:02.0 bcs0: fence 1c:46, current 44 on hold
> [   27.185091] kworker/-121       3d..1 27095314us : execlists_hold: 0000:00:02.0 bcs0: fence 1c:47, current 44 on hold
> [   27.185135] kworker/-121       3.... 27095316us : intel_engine_reset: 0000:00:02.0 bcs0: flags=8
> [   27.185178] kworker/-121       3.... 27095345us : execlists_reset_prepare: 0000:00:02.0 bcs0: depth<-1
> [   27.185218] kworker/-121       3.... 27095346us : intel_engine_stop_cs: 0000:00:02.0 bcs0: 
> [   27.185259] kworker/-121       3.... 27096347us : intel_engine_stop_cs: 0000:00:02.0 bcs0: timed out on STOP_RING -> IDLE
> [   27.185304] kworker/-121       3.... 27096367us : __intel_gt_reset: 0000:00:02.0 engine_mask=2
> [   27.185345] kworker/-121       3.... 27097297us : intel_engine_cancel_stop_cs: 0000:00:02.0 bcs0: 

I see what happened here that quietly slipped by.

The reset failed. And since we didn't reset the engine, the inflight
tracking stays intact, hence why we do immediately attempt the reset
again.

We don't have the immediate fallback to a device reset here as we are in
the atomic engine-reset path.

Tricky.

> [   27.185388] kworker/-121       3.... 27097299us : execlists_reset_finish: 0000:00:02.0 bcs0: depth->1
> [   27.185440] kworker/-121       3d..2 27097348us : __i915_schedule: 0000:00:02.0 bcs0: bumping queue-priority-hint:1025 for rq:13:20, inflight:1c:47 prio 0
> [   27.185485] kworker/-121       3..s1 27097350us : execlists_reset: 0000:00:02.0 bcs0: reset for preemption time out
> [   27.185528] kworker/-121       3d.s2 27097454us : active_context: 0000:00:02.0 bcs0: ccid found at active:0
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
