Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8B3C433E6
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 22:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509292343B
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 22:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509292343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0D6E4B7;
	Thu,  7 Jan 2021 22:05:40 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D846E4B7
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 22:05:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23532673-1500050 for multiple; Thu, 07 Jan 2021 22:04:48 +0000
MIME-Version: 1.0
In-Reply-To: <20210107195037.GA7228@intel.com>
References: <20201016175411.30406-1-chris@chris-wilson.co.uk>
 <20210107195037.GA7228@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 07 Jan 2021 22:04:46 +0000
Message-ID: <161005708697.28368.4209742988334494636@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Limit VFE threads based on GT
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

Quoting Rodrigo Vivi (2021-01-07 19:50:37)
> On Fri, Oct 16, 2020 at 06:54:11PM +0100, Chris Wilson wrote:
> > MEDIA_STATE_VFE only accepts the 'maximum number of threads' in the
> > range [0, n-1] where n is #EU * (#threads/EU) with the number of threads
> > based on plaform and the number of EU based on the number of slices and
> > subslices. This is a fixed number per platform/gt, so appropriately
> > limit the number of threads we spawn to match the device.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2024
> 
> we need to get this closed...

Unfortunately this failed the validation test. And as that test is still
not in CI, I cannot say why. My vote would be to remove the
clear_residuals until it works on all target platforms. Plus we clearly
need a hsw-gt1 in CI.
 
> >       bv->scratch_size = bv->surface_height * bv->surface_width;
> > @@ -244,7 +258,6 @@ gen7_emit_vfe_state(struct batch_chunk *batch,
> >                   u32 urb_size, u32 curbe_size,
> >                   u32 mode)
> >  {
> > -     u32 urb_entries = bv->max_urb_entries;
> >       u32 threads = bv->max_primitives - 1;
> >       u32 *cs = batch_alloc_items(batch, 32, 8);
> >  
> > @@ -254,7 +267,7 @@ gen7_emit_vfe_state(struct batch_chunk *batch,
> >       *cs++ = 0;
> >  
> >       /* number of threads & urb entries for GPGPU vs Media Mode */
> > -     *cs++ = threads << 16 | urb_entries << 8 | mode << 2;
> > +     *cs++ = threads << 16 | 1 << 8 | mode << 2;
> 
> why urb_entries = 1 ?

We only used a single entry. There was no measurable benefit from
assigning more entries, and the importance of any side effects from doing
so unknown.

> the range is 0,64 and 0,128 depending on the sku.
> 
> in general there's a min of 32 URBs

Don't forget num_entries * entry_size must fit within the URB
allocation/allotment.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
