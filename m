Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22316C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 08:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973F264E16
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 08:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973F264E16
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E416E40D;
	Thu, 11 Feb 2021 08:57:59 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A886E40D
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 08:57:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23834935-1500050 for multiple; Thu, 11 Feb 2021 08:57:47 +0000
MIME-Version: 1.0
In-Reply-To: <20210211042517.GJ82362@intel.com>
References: <20210210221955.10025-1-chris@chris-wilson.co.uk>
 <20210211042517.GJ82362@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 11 Feb 2021 08:57:45 +0000
Message-ID: <161303386546.13035.3606386396573664382@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/gt: Sanitize GPU during
 prepare-to-suspend
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

Quoting Rodrigo Vivi (2021-02-11 04:25:17)
> On Wed, Feb 10, 2021 at 10:19:50PM +0000, Chris Wilson wrote:
> > After calling intel_gt_suspend_prepare(), the driver starts to turn off
> > various subsystems, such as clearing the GGTT, before calling
> > intel_gt_suspend_late() to relinquish control over the GT. However, if
> > we still have internal GPU state active as we clear the GGTT, the GPU
> > may write back its internal state to the residual GGTT addresses that
> > are now pointing into scratch. Let's reset the GPU to clear that
> > internal state as soon we have idled the GPU in prepare-to-suspend.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index 0bd303d2823e..f41612faa269 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -295,6 +295,9 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
> >       wait_for_suspend(gt);
> 
> you just wedged the gpu here...

Potentially. As a means to clear a stuck GPU and force it to idle.
 
> >       intel_uc_suspend(&gt->uc);
> > +
> > +     /* Flush all the contexts and internal state before turning off GGTT */
> > +     gt_sanitize(gt, false);
> 
> and now we are unsetting wedge here...
> 
> is this right?

But irrelevant, since it is undone on any of the resume pathways which
must be taken by this point.

Resume has been for many years the method to unwedge a GPU; with the
presumption being that the intervening PCI level reset would be enough
to recover the GPU. Otherwise, it would presumably quite quickly go back
into the wedged state.

The wedging on suspend is just there to cancel outstanding work. Which
is not what we want (we just want to remove work), but is what we have
for the moment. The sanitize is to make sure we don't leak our state
beyond our control of the HW.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
