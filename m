Return-Path: <SRS0=vghI=FG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C2CC64E7B
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 16:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2E720872
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 16:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2E720872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8C8931D;
	Wed,  2 Dec 2020 16:56:38 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A32F8931D
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Dec 2020 16:56:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23192936-1500050 for multiple; Wed, 02 Dec 2020 16:56:28 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMyWDR6PKxwS0rGeiJjDU8orD1Ms0=LOh=LC8A2=UtbeQ@mail.gmail.com>
References: <20201202155139.15143-1-chris@chris-wilson.co.uk>
 <20201202155139.15143-2-chris@chris-wilson.co.uk>
 <CAM0jSHMyWDR6PKxwS0rGeiJjDU8orD1Ms0=LOh=LC8A2=UtbeQ@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 02 Dec 2020 16:56:26 +0000
Message-ID: <160692818681.15703.5212727038349277570@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2 2/2] Revert "drm/i915/lmem: Limit block
 size to 4G"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-12-02 16:40:36)
> On Wed, 2 Dec 2020 at 15:51, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Mixing I915_ALLOC_CONTIGUOUS and I915_ALLOC_MAX_SEGMENT_SIZE fared
> > badly. The two directives conflict, with the contiguous request setting
> > the min_order to the full size of the object, and the max-segment-size
> > setting the max_order to the limit of the DMA mapper, resulting in a
> > situation where max_order < min_order, causing our sanity checks to
> > fail.
> >
> > Instead of limiting the buddy block size, in the previous patch we split
> > the oversized buddy into multiple scatterlist elements.
> >
> > Fixes: d2cf0125d4a1 ("drm/i915/lmem: Limit block size to 4G")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> > +       for (sg = obj->mm.pages->sgl; sg; sg = sg_next(sg)) {
> > +               if (sg->length > max_segment) {
> > +                       pr_err("%s: Created an oversized scatterlist entry, %u > %u\n",
> > +                              __func__, sg->length, max_segment);
> 
> err = -EINVAL;

Indeed. Thanks,
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
