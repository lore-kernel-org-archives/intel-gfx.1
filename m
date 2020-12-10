Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEDDC433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B126F23E25
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B126F23E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6E6EB54;
	Thu, 10 Dec 2020 21:01:03 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C046EB54
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 21:01:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23286299-1500050 for multiple; Thu, 10 Dec 2020 21:00:53 +0000
MIME-Version: 1.0
In-Reply-To: <20201210192806.GB6255@sdutt-i7>
References: <20201210080240.24529-1-chris@chris-wilson.co.uk>
 <20201210080240.24529-18-chris@chris-wilson.co.uk>
 <20201210192806.GB6255@sdutt-i7>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Brost <matthew.brost@intel.com>
Date: Thu, 10 Dec 2020 21:00:53 +0000
Message-ID: <160763405359.21588.11912750748685482852@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 18/21] drm/i915/gt: Add timeline "mode"
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

Quoting Matthew Brost (2020-12-10 19:28:06)
> On Thu, Dec 10, 2020 at 08:02:37AM +0000, Chris Wilson wrote:
> > diff --git a/drivers/gpu/drm/i915/gt/intel_timeline_types.h b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
> > index f187c5aac11c..32c51425a0c4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_timeline_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
> > @@ -20,6 +20,12 @@ struct i915_syncmap;
> >  struct intel_gt;
> >  struct intel_timeline_hwsp;
> >  
> > +enum intel_timeline_mode {
> > +     INTEL_TIMELINE_ABSOLUTE = 0,
> > +     INTEL_TIMELINE_CONTEXT = BIT(0),
> > +     INTEL_TIMELINE_GLOBAL = BIT(1),
> > +};
> > +
> 
> Not sure I like these names.
> 
> How about:
> INTEL_TIMELINE_ABSOLUTE_GGTT
> INTEL_TIMELINE_RELATIVE_PPGTT
> INTEL_TIMELINE_RELATIVE_GGTT

They are all in the GGTT, including the ppHWSP.

One is relative to the context, the other relative to the engine.

  INTEL_TIMELINE_ABSOLUTE
  INTEL_TIMELINE_RELATIVE_CONTEXT
  INTEL_TIMELINE_RELATIVE_ENGINE

> Also not convinced we need the 'RELATIVE' modes. See my comments in 'Use
> indices for writing into relative'.

It saves extra allocations for when we don't (e.g. gen8, and other
contexts where we know we will never require disposable slots), and
there's a strong incentive to not use absolute addressing with GVT.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
