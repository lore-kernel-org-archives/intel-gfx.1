Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5199C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 21:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391E322D00
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 21:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391E322D00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795A789DD3;
	Mon, 11 Jan 2021 21:02:47 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82F089DD3
 for <intel-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 21:02:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23564406-1500050 for multiple; Mon, 11 Jan 2021 21:02:44 +0000
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB3799F7F212E15B8F61A30FF5A9AB0@BYAPR11MB3799.namprd11.prod.outlook.com>
References: <20210109154931.10098-1-chris@chris-wilson.co.uk>
 <BYAPR11MB3799F7F212E15B8F61A30FF5A9AB0@BYAPR11MB3799.namprd11.prod.outlook.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Abodunrin, Akeem G" <akeem.g.abodunrin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Mon, 11 Jan 2021 21:02:41 +0000
Message-ID: <161039896179.28181.10910257314289620584@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/gt: Limit VFE threads based on
 GT
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
Cc: Randy Wright <rwright@hpe.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Abodunrin, Akeem G (2021-01-11 20:25:34)
> >  static void
> >  batch_get_defaults(struct drm_i915_private *i915, struct batch_vals *bv)  {
> >       if (IS_HASWELL(i915)) {
> > -             bv->max_primitives = 280;
> > -             bv->max_urb_entries = MAX_URB_ENTRIES;
> > +             switch (INTEL_INFO(i915)->gt) {
> > +             default:
> > +             case 1:
> > +                     bv->max_threads = 70;
> > +                     break;
> > +             case 2:
> > +                     bv->max_threads = 140;
> > +                     break;
> > +             case 3:
> > +                     bv->max_threads = 280;
> > +                     break;
> > +             }
> >               bv->surface_height = 16 * 16;
> >               bv->surface_width = 32 * 2 * 16;
> >       } else {
> > -             bv->max_primitives = 128;
> > -             bv->max_urb_entries = MAX_URB_ENTRIES / 2;
> > +             switch (INTEL_INFO(i915)->gt) {
> > +             default:
> > +             case 1: /* including vlv */
> > +                     bv->max_threads = 36;
> > +                     break;
> > +             case 2:
> > +                     bv->max_threads = 128;
> > +                     break;
> > +             }
> Do we really need to hardcode max number of threads per gt/platform? Why not calculating the number of active threads from the no_of_slices * 1024? - Also, is "64" not the minimum number of threads supported?

ivb,byt,hsw each has different numbers of threads per subslice, and each
gt has a different number of subslice/slice (and not a simple doubling
of subslice/slice from 1 -> 2 -> 3, although the total is!).

It's a choice between encoding a tuple for (num_threads, num_subslices,
num_slices) or the combined value.

The goal is to run a shader in each HW thread to clear the thread-local
registers, and only one shader in each.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
