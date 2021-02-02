Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4448AC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C82F64ECF
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C82F64ECF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0462E89FD1;
	Tue,  2 Feb 2021 13:27:50 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D589FD1
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 13:27:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23772258-1500050 for multiple; Tue, 02 Feb 2021 13:27:43 +0000
MIME-Version: 1.0
In-Reply-To: <77b97a4c-5bcb-5025-cf4a-f2f4b75a0f47@linux.intel.com>
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
 <20210201085715.27435-17-chris@chris-wilson.co.uk>
 <77b97a4c-5bcb-5025-cf4a-f2f4b75a0f47@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 02 Feb 2021 13:27:44 +0000
Message-ID: <161227246439.1150.11558689575002322169@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 17/57] drm/i915: Extract request suspension
 from the execlists
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

Quoting Tvrtko Ursulin (2021-02-02 13:15:52)
> 
> On 01/02/2021 08:56, Chris Wilson wrote:
> > Make the ability to suspend and resume a request and its dependents
> > generic.

> > +bool __i915_sched_suspend_request(struct intel_engine_cs *engine,
> > +                               struct i915_request *rq)
> > +{
> > +     LIST_HEAD(list);
> > +
> > +     lockdep_assert_held(&engine->active.lock);
> > +     GEM_BUG_ON(rq->engine != engine);
> > +
> > +     if (__i915_request_is_complete(rq)) /* too late! */
> > +             return false;
> > +
> > +     if (i915_request_on_hold(rq))
> > +             return false;
> 
> This was a GEM_BUG_ON before so not pure extraction / code movement.

It was part of making it generic to allow other callers.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
