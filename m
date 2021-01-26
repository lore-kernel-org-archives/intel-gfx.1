Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F48EC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176F922D58
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176F922D58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778616E45C;
	Tue, 26 Jan 2021 15:28:38 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE136E45C
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 15:28:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23705092-1500050 for multiple; Tue, 26 Jan 2021 15:28:31 +0000
MIME-Version: 1.0
In-Reply-To: <161167453590.2943.5378475316898786010@build.alporthouse.com>
References: <20210126151259.253885-1-matthew.auld@intel.com>
 <161167453590.2943.5378475316898786010@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 26 Jan 2021 15:28:32 +0000
Message-ID: <161167491281.2943.9260841815991497562@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: make local-memory probing
 a GT operation
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

Quoting Chris Wilson (2021-01-26 15:22:15)
> Quoting Matthew Auld (2021-01-26 15:12:52)
> > Device local memory is very much a GT thing, therefore it should be the
> > responsibility of the GT to setup the device local memory region.
> > 
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt.c          | 29 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
> >  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  3 ++-
> >  drivers/gpu/drm/i915/gt/intel_region_lmem.h |  4 +--
> >  drivers/gpu/drm/i915/i915_drv.c             |  4 +++
> >  drivers/gpu/drm/i915/intel_memory_region.c  |  5 ++--
> >  6 files changed, 40 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index d8e1ab412634..989cd2106b09 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -39,6 +39,35 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> >         intel_uc_init_early(&gt->uc);
> >  }
> >  
> > +int intel_gt_probe_lmem(struct intel_gt *gt)
> > +{
> > +       struct drm_i915_private *i915 = gt->i915;
> > +       struct intel_memory_region *mem;
> > +       int id;
> > +       int err;
> > +
> > +       id = INTEL_REGION_LMEM;
> > +       if (!HAS_REGION(i915, id))
> 
> GEM_WARN_ON() for CI checking?
> 
> Feels like something that should only be duplicated by programming
> error, so worth the feedback.

Wait this is !HAS_REGION(). That's even odder.

Surely that we have a region is defined first by HW then by mockery. So
the platform mask check is not required at this point.

What we don't want to do is overwrite an existing i915->mm.regions[id].
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
