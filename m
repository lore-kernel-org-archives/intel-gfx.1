Return-Path: <SRS0=JOrb=PU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C132C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Nov 2021 23:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFB46052B
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Nov 2021 23:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BFB46052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2196EB5E;
	Mon,  1 Nov 2021 23:33:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890266EB5E;
 Mon,  1 Nov 2021 23:33:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="231001456"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="231001456"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:33:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="500261693"
Received: from ebijkerk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:33:07 -0700
Date: Tue, 2 Nov 2021 00:33:04 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YYB5MJRdoCXmExpn@intel.intel>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
 <20211029032817.3747750-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029032817.3747750-8-matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 07/10] drm/i915/xehp: Determine which
 tile raised an interrupt
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Matt and Paulo,

> @@ -2771,40 +2771,45 @@ static inline void dg1_master_intr_enable(void __iomem * const regs)
>  static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct drm_i915_private * const i915 = arg;
> +	void __iomem * const t0_regs = i915->gt.uncore->regs;
>  	struct intel_gt *gt = &i915->gt;
> -	void __iomem * const regs = gt->uncore->regs;
>  	u32 master_tile_ctl, master_ctl;
> -	u32 gu_misc_iir;
> +	u32 gu_misc_iir = 0;

just a nitpick, this doesn't need to be initialize and you could
also insert it inside the for_each_gt()

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> +	unsigned int i;
>  
>  	if (!intel_irqs_enabled(i915))
>  		return IRQ_NONE;
>  
> -	master_tile_ctl = dg1_master_intr_disable(regs);
> +	master_tile_ctl = dg1_master_intr_disable(t0_regs);
>  	if (!master_tile_ctl) {
> -		dg1_master_intr_enable(regs);
> +		dg1_master_intr_enable(t0_regs);
>  		return IRQ_NONE;
>  	}
>  
> -	/* FIXME: we only support tile 0 for now. */
> -	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
> +	for_each_gt(i915, i, gt) {
> +		void __iomem *const regs = gt->uncore->regs;
> +
> +		if ((master_tile_ctl & DG1_MSTR_TILE(i)) == 0)
> +			continue;
> +
>  		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>  		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
> -	} else {
> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> -		dg1_master_intr_enable(regs);
> -		return IRQ_NONE;
> -	}
>  
> -	gen11_gt_irq_handler(gt, master_ctl);
> +		gen11_gt_irq_handler(gt, master_ctl);
>  
> -	if (master_ctl & GEN11_DISPLAY_IRQ)
> -		gen11_display_irq_handler(i915);
> -
> -	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
> +		/*
> +		 * In practice we'll only get display and gu_misc interrupts
> +		 * for the GSE on tile0, but it's still simplest to process
> +		 * them inside the loop.
> +		 */
> +		if (master_ctl & GEN11_DISPLAY_IRQ)
> +			gen11_display_irq_handler(i915);
>  
> -	dg1_master_intr_enable(regs);
> +		gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
> +		gen11_gu_misc_irq_handler(gt, gu_misc_iir);
> +	}
>  
> -	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
> +	dg1_master_intr_enable(t0_regs);
>  
>  	pmu_irq_stats(i915, IRQ_HANDLED);
>  
> -- 
> 2.33.0
