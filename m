Return-Path: <SRS0=c36g=FR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3951CC4361B
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 19:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC66239ED
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 19:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AC66239ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A41D89B67;
	Sun, 13 Dec 2020 19:52:06 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106589B67
 for <intel-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 19:52:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23313953-1500050 for multiple; Sun, 13 Dec 2020 19:51:55 +0000
MIME-Version: 1.0
In-Reply-To: <20201210175111.GA26573@sdutt-i7>
References: <20201207193824.18114-1-chris@chris-wilson.co.uk>
 <20201207193824.18114-12-chris@chris-wilson.co.uk>
 <20201210175111.GA26573@sdutt-i7>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Brost <matthew.brost@intel.com>
Date: Sun, 13 Dec 2020 19:51:55 +0000
Message-ID: <160788911579.1732.6367442457951938918@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 12/20] drm/i915/gt: Track the overall
 awake/busy time
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

Quoting Matthew Brost (2020-12-10 17:51:12)
> On Mon, Dec 07, 2020 at 07:38:16PM +0000, Chris Wilson wrote:
> > Since we wake the GT up before executing a request, and go to sleep as
> > soon as it is retired, the GT wake time not only represents how long the
> > device is powered up, but also provides a summary, albeit an overestimate,
> > of the device runtime (i.e. the rc0 time to compare against rc6 time).
> > 
> > v2: s/busy/awake/
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/debugfs_gt_pm.c  |  5 ++-
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c    | 49 ++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.h    |  2 +
> >  drivers/gpu/drm/i915/gt/intel_gt_types.h | 24 ++++++++++++
> >  drivers/gpu/drm/i915/i915_debugfs.c      |  5 ++-
> >  drivers/gpu/drm/i915/i915_pmu.c          |  6 +++
> >  include/uapi/drm/i915_drm.h              |  1 +
> >  7 files changed, 89 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> > index 174a24553322..8975717ace06 100644
> > --- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> > @@ -11,6 +11,7 @@
> >  #include "i915_drv.h"
> >  #include "intel_gt.h"
> >  #include "intel_gt_clock_utils.h"
> > +#include "intel_gt_pm.h"
> >  #include "intel_llc.h"
> >  #include "intel_rc6.h"
> >  #include "intel_rps.h"
> > @@ -558,7 +559,9 @@ static int rps_boost_show(struct seq_file *m, void *data)
> >  
> >       seq_printf(m, "RPS enabled? %s\n", yesno(intel_rps_is_enabled(rps)));
> >       seq_printf(m, "RPS active? %s\n", yesno(intel_rps_is_active(rps)));
> > -     seq_printf(m, "GPU busy? %s\n", yesno(gt->awake));
> > +     seq_printf(m, "GPU busy? %s, %llums\n",
> > +                yesno(gt->awake),
> > +                ktime_to_ms(intel_gt_get_awake_time(gt)));
> 
> I think it would be useful to print the total time the gt has been alive
> too. This would give a nice comparison to total awake time which you
> print here. Should be easy enough to do.

This is the total time for which we hold the wakeref for the GT. What
metric do you have in mind? The C0 counters usually found on the engine?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
