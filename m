Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBB1C433E0
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 19:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F3420738
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 19:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F3420738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B276E043;
	Sun,  2 Aug 2020 19:36:59 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83FE6E043
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2020 19:36:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22011445-1500050 for multiple; Sun, 02 Aug 2020 20:36:54 +0100
MIME-Version: 1.0
In-Reply-To: <CAPM=9twmsrNehJjFZrehwORg-Nyzo_cEq8CiY5=bzsOv8G7pPA@mail.gmail.com>
References: <20200802164412.2738-1-chris@chris-wilson.co.uk>
 <CAPM=9twmsrNehJjFZrehwORg-Nyzo_cEq8CiY5=bzsOv8G7pPA@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Dave Airlie <airlied@gmail.com>
Date: Sun, 02 Aug 2020 20:36:54 +0100
Message-ID: <159639701401.26228.4061968059817196468@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] Time, where did it go?
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Dave Airlie (2020-08-02 18:56:44)
> On Mon, 3 Aug 2020 at 02:44, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Lots of small incremental improvements to reduce execution latency
> > which basically offsets the small regressions incurred when compared to
> > 5.7. And then there are some major fixes found while staring agape at
> > lockstat.
> 
> What introduced the 5.7 regressions? are they documented somewhere.

No. There's a 5.8-rc1 bisect (to the merge but not into rc1) for
something in the core causing perf fluctuations, but I have not yet
reproduced that one to bisect into the rc1 merge. [The system that showed
the issue has historically seen strong swings from p-state setup, might
be that again?]. This is from measuring simulated transcode workloads that
we've built up to track KPI. That we can then compare against the real
workloads run by other groups.
 
> What is the goal here, is there a benchmark or application that this
> benefits that you can quantify the benefits?

Entirely motivated by not wanting to have to explain why there's even a
1% regression in their client metrics. They wouldn't even notice for a
few releases by which point the problem is likely compounded and we
suddenly have crisis meetings.
 
> Is the lack of userspace command submission a problem vs other vendors here?

If you mean HW scheduling (which is the bit that we are most in dire need
of for replacing this series), not really, our closest equivalent has not
yet proven itself, at least in previous incarnations, adequate to their
requirements.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
