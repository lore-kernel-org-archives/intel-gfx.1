Return-Path: <SRS0=l9+3=OG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E03DC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 09:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A50D61185
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 09:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A50D61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A655C6EB3C;
	Thu, 16 Sep 2021 09:48:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FD06EB3C
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 09:48:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209758692"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="209758692"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:48:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="434440038"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO [10.249.254.218])
 ([10.249.254.218])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:48:55 -0700
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210830121006.2978297-1-maarten.lankhorst@linux.intel.com>
 <20210830121006.2978297-18-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <42f9eb28-e07e-a240-489d-2c3cdf585d01@linux.intel.com>
Date: Thu, 16 Sep 2021 11:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830121006.2978297-18-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 17/19] drm/i915: Add functions to set/get
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


On 8/30/21 2:10 PM, Maarten Lankhorst wrote:
> We want to get rid of i915_vma tracking to simplify the code and
> lifetimes. Add a way to set/put the moving fence, in preparation for
> removing the tracking.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 15 +++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  6 ++++++
>   2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 6fb9afb65034..dc0d2da297a0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -32,6 +32,7 @@
>   #include "i915_gem_object.h"
>   #include "i915_memcpy.h"
>   #include "i915_trace.h"
> +#include "i915_gem_ttm.h"
>   
>   static struct kmem_cache *slab_objects;
>   
> @@ -674,6 +675,20 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>   	.export = i915_gem_prime_export,
>   };
>   
> +struct dma_fence *
> +i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
> +{
> +	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
> +}
> +
> +void  i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,

Two spaces after void?

With that fixed:

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> +				       struct dma_fence *fence)
> +{
> +	dma_fence_put(i915_gem_to_ttm(obj)->moving);
> +
> +	i915_gem_to_ttm(obj)->moving = dma_fence_get(fence);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/huge_gem_object.c"
>   #include "selftests/huge_pages.c"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 48112b9d76df..a23acfa98e21 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -520,6 +520,12 @@ i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>   	return engine;
>   }
>   
> +struct dma_fence *
> +i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
> +
> +void  i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
> +				       struct dma_fence *fence);
> +
>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>   					 unsigned int cache_level);
>   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
