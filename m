Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01ED9C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC55223E4
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC55223E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B452F6E086;
	Mon, 11 Jan 2021 16:27:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D9E6E086
 for <intel-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 16:27:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23561219-1500050 for multiple; Mon, 11 Jan 2021 16:27:50 +0000
MIME-Version: 1.0
In-Reply-To: <24903f8e-4f53-c0bd-4ced-7161b505f06d@linux.intel.com>
References: <20210111105735.21515-1-chris@chris-wilson.co.uk>
 <20210111105735.21515-3-chris@chris-wilson.co.uk>
 <24903f8e-4f53-c0bd-4ced-7161b505f06d@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Mon, 11 Jan 2021 16:27:48 +0000
Message-ID: <161038246850.28181.16757116420949491976@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/gt: Perform an arbitration
 check before busywaiting
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

Quoting Tvrtko Ursulin (2021-01-11 16:19:40)
> 
> On 11/01/2021 10:57, Chris Wilson wrote:
> > During igt_reset_nop_engine, it was observed that an unexpected failed
> > engine reset lead to us busywaiting on the stop-ring semaphore (set
> > during the reset preparations) on the first request afterwards. There was
> > no explicit MI_ARB_CHECK in this sequence as the presumption was that
> > the failed MI_SEMAPHORE_WAIT would itself act as an arbitration point.
> > It did not in this circumstance, so force it.
> 
> In other words MI_SEMAPHORE_POLL is not a preemption point? Can't 
> remember if I knew that or not..

MI_SEMAPHORE_WAIT | POLL is most definitely a preemption point on a
miss.

> 1)
> Why not the same handling in !gen12 version?

Because I think it's a bug in tgl [a0 at least]. I think I've seen the
same symptoms on tgl before, but not earlier. This is the first time the
sequence clicked as to why it was busy spinning. Random engine reset
failures are rare enough -- I was meant to also write a test case to
inject failure.
 
> 2)
> Failed reset leads to busy-hang in following request _tail_? But there 
> is an arb check at the start of following request as well. Or in cases 
> where we context switch into the middle of a previously executing request?

It was the first request submitted after the failed reset. We expect to
clear the ring-stop flag on the CS IDLE->ACTIVE event.

> But why would that busy hang? Hasn't the failed request unpaused the ring?

The engine was idle at the time of the failed reset. We left the
ring-stop set, and submitted the next batch of requests. We hit the
MI_SEMAPHORE_WAIT(ring-stop) at the end of the first request, but
without hitting an arbitration point (first request, no init-breadcrumb
in this case), the semaphore was stuck.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
