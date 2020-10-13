Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4D2C433E7
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 14:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24098247D3
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 14:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24098247D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555046E145;
	Tue, 13 Oct 2020 14:11:55 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB5D6E145
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 14:11:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22703265-1500050 for multiple; Tue, 13 Oct 2020 15:11:51 +0100
MIME-Version: 1.0
In-Reply-To: <86397c19-8571-ef86-634b-d46c57eaf99e@intel.com>
References: <20201013111839.96637-1-matthew.auld@intel.com>
 <160259031106.2946.5754638300794869595@build.alporthouse.com>
 <86397c19-8571-ef86-634b-d46c57eaf99e@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 13 Oct 2020 15:11:50 +0100
Message-ID: <160259831029.2946.3511848481107289626@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/execbuf: don't allow zero batch_len
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

Quoting Matthew Auld (2020-10-13 15:07:46)
> On 13/10/2020 12:58, Chris Wilson wrote:
> > Quoting Matthew Auld (2020-10-13 12:18:39)
> >> As per the ABI batch_len is u32, however if the batch_len is left unset,
> >> then the kernel will just assume batch_len is the size of the whole
> >> batch object, however since the vma->size is u64, while the batch_len is
> >> just u32 we can end up with batch_len = 0 if we are given too large batch
> >> object(e.g 1ULL << 32), which doesn't look the intended behaviour and
> >> probably leads to explosions on some HW.
> >>
> >> Testcase: igt/gem_exec_params/larger-than-life-batch
> >> Fixes: 0b5372727be3 ("drm/i915/cmdparser: Use cached vmappings")
> > 
> > Nah. That's setting exec_len used for dispatch, not for parsing, which
> > is still using
> > 
> > i915_gem_execbuffer_parse(engine, &shadow_exec_entry,
> >                         params->batch->obj,
> >                         eb,
> >                         args->batch_start_offset,
> >                         args->batch_len,
> >                         drm_is_current_master(file));
> > (and args->batch_len is straight from userspace and passed onwards)
> > 
> > It's right up until 435e8fc059db ("drm/i915: Allow parsing of unsized batches")
> > where we are using the user value of batch_len for allocating the shadow
> > object and parsing.
> > 
> > Fixes: 435e8fc059db ("drm/i915: Allow parsing of unsized batches")
> 
> On the topic of that patch, why is it looking at args->batch_len(might 
> be zero), even though it looks like it is trying to move the 
> eb->batch_len calculation to before we call eb_use_cmdparser(), so it 
> can use it(the commit message seems to suggest that?), but then it only 
> looks at the args version anyway. I don't get it.

iirc, it was so that we could change the order around and later modify
eb.batch_len before eb_use_cmdparser() [so eb.batch_len no longer would
be zero, defeating the cheat].
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
