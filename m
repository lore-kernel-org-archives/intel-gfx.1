Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DE0C433DF
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 13:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A0420738
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 13:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A0420738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71E889DD5;
	Sun,  2 Aug 2020 13:18:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4789DD5;
 Sun,  2 Aug 2020 13:18:13 +0000 (UTC)
IronPort-SDR: Mil/R7c9MTdfGovtWFmdLaTHtYlOkOTjz945LzBbkwkcxCCtai+uGM/o0wCc16KV0xlakJI90b
 5DWfVLkXkGgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="149804418"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="149804418"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 06:18:13 -0700
IronPort-SDR: D0XnYzrieY4fJFknkIn+xxzWKYgbCdjdSTI2rYUnCxaJcO5PpvCPzo7wH34w0rjIiMQc6QlL9A
 RF1kyDOpmLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="331622703"
Received: from cahanley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.10.182])
 by orsmga007.jf.intel.com with ESMTP; 02 Aug 2020 06:18:09 -0700
Date: Sun, 2 Aug 2020 16:18:09 +0300
From: Andi Shyti <andi.shyti@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20200802131809.GE4705@intel.intel>
References: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
 <20200802114044.GD4705@intel.intel>
 <159636908251.23037.6183292610375916917@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159636908251.23037.6183292610375916917@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix wrong return value
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
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tianjia.zhang@alibaba.com,
 matthew.auld@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

> > > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> > > index d960d0be5bd2..cc017e3cc9c5 100644
> > > --- a/drivers/gpu/drm/i915/i915_active.c
> > > +++ b/drivers/gpu/drm/i915/i915_active.c
> > > @@ -758,7 +758,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
> > >       intel_engine_mask_t tmp, mask = engine->mask;
> > >       struct llist_node *first = NULL, *last = NULL;
> > >       struct intel_gt *gt = engine->gt;
> > > -     int err;
> > > +     int err = 0;
> > 
> > you don't need the initialization here.
> 
> But it's close enough that I can munge the patch inline.
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

sure... you can also remove it before merging it and it might
also need:

Fixes: d8af05ff38ae7 ("drm/i915: Allow sharing the idle-barrier from other kernel requests)

but, yeah...

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

... as well :)

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
