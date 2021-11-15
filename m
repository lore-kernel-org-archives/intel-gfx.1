Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F28C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 12:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57DF860EFD
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 12:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57DF860EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0156E96F;
	Mon, 15 Nov 2021 12:39:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF46E96F;
 Mon, 15 Nov 2021 12:39:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="233675915"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="233675915"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:39:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="566425945"
Received: from jmegan-mobl.ger.corp.intel.com (HELO [10.252.8.73])
 ([10.252.8.73])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:39:10 -0800
Message-ID: <bc238bbf-a4df-7b97-ba18-d6c5cc93827e@intel.com>
Date: Mon, 15 Nov 2021 12:39:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
 <20211114111218.623138-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211114111218.623138-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v3 1/6] drm/i915: Add functions to set/get
 moving fence
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

On 14/11/2021 11:12, Thomas Hellström wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> We want to get rid of i915_vma tracking to simplify the code and
> lifetimes. Add a way to set/put the moving fence, in preparation for
> removing the tracking.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 37 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  9 ++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 591ee3cb7275..ec4313836597 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -33,6 +33,7 @@
>   #include "i915_gem_object.h"
>   #include "i915_memcpy.h"
>   #include "i915_trace.h"
> +#include "i915_gem_ttm.h"
>   
>   static struct kmem_cache *slab_objects;
>   
> @@ -726,6 +727,42 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>   	.export = i915_gem_prime_export,
>   };
>   
> +struct dma_fence *
> +i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
> +{
> +	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
> +}
> +
> +void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
> +				      struct dma_fence *fence)
> +{
> +	dma_fence_put(i915_gem_to_ttm(obj)->moving);
> +
> +	i915_gem_to_ttm(obj)->moving = dma_fence_get(fence);
> +}

Are these also assert_object_held()? Should we maybe squash this patch 
with the first user?

> +
> +int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
> +				      bool intr)
> +{
> +	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
> +	int ret;
> +
> +	assert_object_held(obj);
> +	if (!fence)
> +		return 0;
> +
> +	ret = dma_fence_wait(fence, intr);
> +	if (ret)
> +		return ret;
> +
> +	if (fence->error)
> +		return fence->error;
> +
> +	i915_gem_to_ttm(obj)->moving = NULL;
> +	dma_fence_put(fence);
> +	return 0;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/huge_gem_object.c"
>   #include "selftests/huge_pages.c"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 133963b46135..36bf3e2e602f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -517,6 +517,15 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>   	i915_gem_object_unpin_pages(obj);
>   }
>   
> +struct dma_fence *
> +i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
> +
> +void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
> +				      struct dma_fence *fence);
> +
> +int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
> +				      bool intr);
> +
>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>   					 unsigned int cache_level);
>   bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
> 
