Return-Path: <SRS0=TzMs=BR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03934C433E1
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 08:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D72A422CAE
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D72A422CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EB66E976;
	Fri,  7 Aug 2020 08:37:55 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95236E976
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 08:37:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22057830-1500050 
 for <intel-gfx@lists.freedesktop.org>; Fri, 07 Aug 2020 09:37:51 +0100
MIME-Version: 1.0
In-Reply-To: <20200807083256.32761-3-chris@chris-wilson.co.uk>
References: <20200807083256.32761-1-chris@chris-wilson.co.uk>
 <20200807083256.32761-3-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
Cc: 
To: intel-gfx@lists.freedesktop.org
Date: Fri, 07 Aug 2020 09:37:50 +0100
Message-ID: <159678947012.16647.17301317712496958876@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/gt: Defer enabling the
 breadcrumb interrupt to after submission
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

Quoting Chris Wilson (2020-08-07 09:32:52)
> Move the register slow register write and readback from out of the
> critical path for execlists submission and delay it until the following
> worker, shaving off around 200us. Note that the same signal_irq_work() is
> allowed to run concurrently on each CPU (but it will only be queued once,
> once running though it can be requeued and reexecuted) so we have to
> remember to lock the global interactions as we cannot rely on the
> signal_irq_work() itself providing the serialisation (in constrast to a
> tasklet).
> 
> By pushing the arm/disarm into the central signaling worker we can close
> the race for disarming the interrupt (and dropping its associated
> GT wakeref) on parking the engine. If we loose the race, that GT wakeref
> may be held indefinitely, preventing the machine from sleeping while
> the GPU is ostensibly idle.
> 
> v2: Move the self-arming parking of the signal_irq_work to a flush of
> the irq-work from intel_breadcrumbs_park().
 
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2271
> Fixes: dfeba1ae34c8 ("drm/i915/gt: Hold context/request reference while breadcrumbs are active")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
