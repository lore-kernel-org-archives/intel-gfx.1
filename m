Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B57C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 12:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081E223A50
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 12:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081E223A50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18EA89E05;
	Thu, 14 Jan 2021 12:03:51 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BC889E05
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 12:03:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23594065-1500050 for multiple; Thu, 14 Jan 2021 12:03:33 +0000
MIME-Version: 1.0
In-Reply-To: <X/+z+wPUkADDKCAd@jack.zhora.eu>
References: <20210113124600.656-1-chris@chris-wilson.co.uk>
 <X/+z+wPUkADDKCAd@jack.zhora.eu>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi@etezian.org>
Date: Thu, 14 Jan 2021 12:03:31 +0000
Message-ID: <161062581173.19482.11361639362425651645@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915: Mark up protected uses of
 'i915_request_completed'
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2021-01-14 03:01:15)
> Hi Chris,
> 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 0b1a46a0d866..784c05ac5cca 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -276,7 +276,7 @@ static void remove_from_engine(struct i915_request *rq)
> >  
> >  bool i915_request_retire(struct i915_request *rq)
> >  {
> > -     if (!i915_request_completed(rq))
> > +     if (!__i915_request_is_complete(rq))
> 
> 
> >               return false;
> >  
> >       RQ_TRACE(rq, "\n");
> > @@ -342,8 +342,7 @@ void i915_request_retire_upto(struct i915_request *rq)
> >       struct i915_request *tmp;
> >  
> >       RQ_TRACE(rq, "\n");
> > -
> > -     GEM_BUG_ON(!i915_request_completed(rq));
> > +     GEM_BUG_ON(!__i915_request_is_complete(rq));
> 
> I might be a bit shallow, but where is the lock here?

This holds the request->context->timeline->mutex.

The locking is basically split between frontend/backend:

  construction/destruction - under the timeline->mutex

  execution - under the engine->active.lock (coordinates with
              timeline->mutex)

At all other times, RCU protected access (using the SLAB_TYPESAFE_BY_RCU
so approach with caution).
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
