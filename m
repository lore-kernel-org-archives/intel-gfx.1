Return-Path: <SRS0=Bjkn=NP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F95FC4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 11:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B743610E9
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 11:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B743610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A079A89872;
	Tue, 24 Aug 2021 11:49:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7796889C93;
 Tue, 24 Aug 2021 10:04:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5C0101E;
 Tue, 24 Aug 2021 03:04:33 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66B393F66F;
 Tue, 24 Aug 2021 03:04:31 -0700 (PDT)
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <dbf1018fb773785e0b3b40e601246ed6438e645e.1629666258.git.christophe.jaillet@wanadoo.fr>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0cd61d5b-ac88-31e8-99ad-143af480416f@arm.com>
Date: Tue, 24 Aug 2021 11:04:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dbf1018fb773785e0b3b40e601246ed6438e645e.1629666258.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Aug 2021 11:49:50 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: switch from 'pci_' to 'dma_' API
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

FWIW this patch itself looks fine, but it does highlight some things 
which could be further cleaned up if anyone's interested...

On 2021-08-22 22:06, Christophe JAILLET wrote:
[...]
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index a74b72f50cc9..afb35d2e5c73 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -32,7 +32,7 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
>   	mem->remap_addr = dma_map_resource(i915->drm.dev,
>   					   mem->region.start,
>   					   mem->fake_mappable.size,
> -					   PCI_DMA_BIDIRECTIONAL,
> +					   DMA_BIDIRECTIONAL,
>   					   DMA_ATTR_FORCE_CONTIGUOUS);

DMA_ATTR_FORCE_CONTIGUOUS is nonsensical here (and below) as it is only 
meaningful for coherent buffers allocated by dma_alloc_attrs().

>   	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
>   		drm_mm_remove_node(&mem->fake_mappable);
> @@ -62,7 +62,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
>   	dma_unmap_resource(mem->i915->drm.dev,
>   			   mem->remap_addr,
>   			   mem->fake_mappable.size,
> -			   PCI_DMA_BIDIRECTIONAL,
> +			   DMA_BIDIRECTIONAL,
>   			   DMA_ATTR_FORCE_CONTIGUOUS);
>   }
>   
[...]
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index 36489be4896b..cd5f2348a187 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -30,7 +30,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>   	do {
>   		if (dma_map_sg_attrs(obj->base.dev->dev,
>   				     pages->sgl, pages->nents,
> -				     PCI_DMA_BIDIRECTIONAL,
> +				     DMA_BIDIRECTIONAL,
>   				     DMA_ATTR_SKIP_CPU_SYNC |
>   				     DMA_ATTR_NO_KERNEL_MAPPING |
>   				     DMA_ATTR_NO_WARN))

Similarly DMA_ATTR_NO_KERNEL_MAPPING and DMA_ATTR_NO_WARN are also for 
coherent allocations rather than streaming mappings.

I'll see if I can whip up a patch to make the API documentation clearer...

Thanks,
Robin.

> @@ -64,7 +64,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   		usleep_range(100, 250);
>   
>   	dma_unmap_sg(i915->drm.dev, pages->sgl, pages->nents,
> -		     PCI_DMA_BIDIRECTIONAL);
> +		     DMA_BIDIRECTIONAL);
>   }
>   
>   /**
> 
