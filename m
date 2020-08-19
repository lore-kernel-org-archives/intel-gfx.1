Return-Path: <SRS0=XCjr=B5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA27C433E1
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 19:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9248E207BB
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9248E207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A686E802;
	Wed, 19 Aug 2020 19:40:57 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322FB6E802
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2020 19:40:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22178220-1500050 for multiple; Wed, 19 Aug 2020 20:40:40 +0100
MIME-Version: 1.0
In-Reply-To: <20200819193326.p62h2dj7jpzfkeyy@duo.ucw.cz>
References: <20200819103952.19083-1-chris@chris-wilson.co.uk>
 <20200819172331.GA4796@amd>
 <159785861047.667.10730572472834322633@build.alporthouse.com>
 <20200819193326.p62h2dj7jpzfkeyy@duo.ucw.cz>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Pavel Machek <pavel@ucw.cz>
Date: Wed, 19 Aug 2020 20:40:42 +0100
Message-ID: <159786604254.667.11923001796829417234@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gem: Replace reloc chain with
 terminator on error unwind
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Pavel Machek (2020-08-19 20:33:26)
> Hi!
> 
> > > > If we hit an error during construction of the reloc chain, we need to
> > > > replace the chain into the next batch with the terminator so that upon
> > > > flushing the relocations so far, we do not execute a hanging batch.
> > > 
> > > Thanks for the patches. I assume this should fix problem from
> > > "5.9-rc1: graphics regression moved from -next to mainline" thread.
> > > 
> > > I have applied them over current -next, and my machine seems to be
> > > working so far (but uptime is less than 30 minutes).
> > > 
> > > If the machine still works tommorow, I'll assume problem is solved.
> > 
> > Aye, best wait until we have to start competing with Chromium for
> > memory... The suspicion is that it was the resource allocation failure
> > path.
> 
> Yep, my machines are low on memory.
> 
> But ... test did not work that well. I have dead X and blinking
> screen. Machine still works reasonably well over ssh, so I guess
> that's an improvement.

> [ 7744.718473] BUG: unable to handle page fault for address: f8c00000
> [ 7744.718484] #PF: supervisor write access in kernel mode
> [ 7744.718487] #PF: error_code(0x0002) - not-present page
> [ 7744.718491] *pdpt = 0000000031b0b001 *pde = 0000000000000000 
> [ 7744.718500] Oops: 0002 [#1] PREEMPT SMP PTI
> [ 7744.718506] CPU: 0 PID: 3004 Comm: Xorg Not tainted 5.9.0-rc1-next-20200819+ #134
> [ 7744.718509] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 ) 03/31/2011
> [ 7744.718518] EIP: eb_relocate_vma+0xdbf/0xf20

To save me guessing, paste the above location into
	./scripts/decode_stacktrace.sh ./vmlinux . ./drivers/gpu/drm/i915

The f8c00000 is something running off the end of a kmap, but I didn't
spot a path were we would ignore an error and keep on writing.
Nevertheless it must exist.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
