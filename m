Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B227C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02C2206B5
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02C2206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BCF6E487;
	Tue, 26 Jan 2021 15:16:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51036E487
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 15:16:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23704970-1500050 for multiple; Tue, 26 Jan 2021 15:15:59 +0000
MIME-Version: 1.0
In-Reply-To: <20210126151259.253885-1-matthew.auld@intel.com>
References: <20210126151259.253885-1-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 26 Jan 2021 15:16:01 +0000
Message-ID: <161167416147.2943.773169897292391146@build.alporthouse.com>
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

Quoting Matthew Auld (2021-01-26 15:12:52)
> Device local memory is very much a GT thing, therefore it should be the
> responsibility of the GT to setup the device local memory region.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 29 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  3 ++-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.h |  4 +--
>  drivers/gpu/drm/i915/i915_drv.c             |  4 +++
>  drivers/gpu/drm/i915/intel_memory_region.c  |  5 ++--
>  6 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index d8e1ab412634..989cd2106b09 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -39,6 +39,35 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>         intel_uc_init_early(&gt->uc);
>  }
>  
> +int intel_gt_probe_lmem(struct intel_gt *gt)
> +{
> +       struct drm_i915_private *i915 = gt->i915;
> +       struct intel_memory_region *mem;
> +       int id;
> +       int err;
> +
> +       id = INTEL_REGION_LMEM;
> +       if (!HAS_REGION(i915, id))
> +               return 0;
> +
> +       mem = intel_gt_setup_fake_lmem(gt);
> +       if (IS_ERR(mem)) {
> +               err = PTR_ERR(mem);
> +               drm_err(&i915->drm,
> +                       "Failed to setup region(%d) type=%d\n",
> +                       err, INTEL_MEMORY_LOCAL);
> +               return err;
> +       }
> +
> +       mem->id = id;
> +       mem->type = INTEL_MEMORY_LOCAL;
> +       mem->instance = 0;
> +
> +       i915->mm.regions[id] = mem;
> +
> +       return 0;
> +}
> +
>  void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
>  {
>         gt->ggtt = ggtt;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 9157c7411f60..a17bd8b3195f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -36,6 +36,7 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
>  
>  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
>  void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
> +int intel_gt_probe_lmem(struct intel_gt *gt);
>  int intel_gt_init_mmio(struct intel_gt *gt);
>  int __must_check intel_gt_init_hw(struct intel_gt *gt);
>  int intel_gt_init(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 28a1d5e1fb92..ad80ff0b935c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -102,8 +102,9 @@ static const struct intel_memory_region_ops intel_region_lmem_ops = {
>  };
>  
>  struct intel_memory_region *
> -intel_setup_fake_lmem(struct drm_i915_private *i915)
> +intel_gt_setup_fake_lmem(struct intel_gt *gt)
>  {
> +       struct drm_i915_private *i915 = gt->i915;
>         struct pci_dev *pdev = i915->drm.pdev;
>         struct intel_memory_region *mem;
>         resource_size_t mappable_end;
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.h b/drivers/gpu/drm/i915/gt/intel_region_lmem.h
> index 8ea43e538dab..a4baa0f077a1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.h
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.h
> @@ -6,9 +6,9 @@
>  #ifndef __INTEL_REGION_LMEM_H
>  #define __INTEL_REGION_LMEM_H
>  
> -struct drm_i915_private;
> +struct intel_gt;
>  
>  struct intel_memory_region *
> -intel_setup_fake_lmem(struct drm_i915_private *i915);
> +intel_gt_setup_fake_lmem(struct intel_gt *gt);
>  
>  #endif /* !__INTEL_REGION_LMEM_H */
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 0037b81d991e..7915d0dc7e16 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -574,6 +574,10 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>         if (ret)
>                 goto err_ggtt;
>  
> +       ret = intel_gt_probe_lmem(&dev_priv->gt);
> +       if (ret)
> +               goto err_mem_regions;
> +
>         intel_gt_init_hw_early(&dev_priv->gt, &dev_priv->ggtt);

^^^ save typing later
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
