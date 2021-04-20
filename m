Return-Path: <SRS0=wM0p=JR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585FBC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 16:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF55F613CE
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 16:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF55F613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6B36E848;
	Tue, 20 Apr 2021 16:14:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB16E848;
 Tue, 20 Apr 2021 16:14:52 +0000 (UTC)
IronPort-SDR: s5ikmti5b2FWooZcr1RtGPRpuTad6KGskbQs5rQxBM+7HiMyS8ippDQmO0DVKg9bY5L60Vd950
 Aa2HqUCU6Hug==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175022506"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="175022506"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:14:51 -0700
IronPort-SDR: CKVpKWM9mCUJwUNP1Zsot4EFuRdMHf+o5Zrx+kHHu9v13dZvd6r+n64DdloTVVLS6TuLzkd4HO
 6gM7QP8aTt2g==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="385396661"
Received: from nmuniand-mobl1.gar.corp.intel.com (HELO [10.213.128.245])
 ([10.213.128.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:14:48 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210420131842.164163-1-matthew.auld@intel.com>
 <20210420131842.164163-4-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8559c955-3882-aec4-f87c-afbe82052e5b@linux.intel.com>
Date: Tue, 20 Apr 2021 17:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420131842.164163-4-matthew.auld@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/stolen: pass the allocation
 flags
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 20/04/2021 14:18, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Stolen memory is always allocated as physically contiguous pages, mark
> the object flags as such.
> 
> v2: move setting I915_BO_ALLOC_CONTIGUOUS into create_stolen
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 4f9fe5aca37e..46f79b240df7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -633,14 +633,21 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
>   
>   static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
>   					   struct drm_i915_gem_object *obj,
> -					   struct drm_mm_node *stolen)
> +					   struct drm_mm_node *stolen,
> +					   unsigned int flags)
>   {
>   	static struct lock_class_key lock_class;
>   	unsigned int cache_level;
>   	int err;
>   
> +	/*
> +	 * Stolen objects are always physically contiguous since we just
> +	 * allocate one big block underneath using the drm_mm range allocator.
> +	 */
> +	flags |= I915_BO_ALLOC_CONTIGUOUS;
> +
>   	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
> -	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
>   
>   	obj->stolen = stolen;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
> @@ -682,7 +689,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
>   	if (ret)
>   		goto err_free;
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);

Hm odd that previously the flags were ignored in here. I guess no 
callers were passing any when creating stolen objects. If none are 
supported should we add a GEM_BUG_ON to check for that?

Regards,

Tvrtko

>   	if (ret)
>   		goto err_remove;
>   
> @@ -700,7 +707,7 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   			      resource_size_t size)
>   {
>   	return i915_gem_object_create_region(i915->mm.stolen_region,
> -					     size, I915_BO_ALLOC_CONTIGUOUS);
> +					     size, 0);
>   }
>   
>   static int init_stolen_smem(struct intel_memory_region *mem)
> @@ -866,7 +873,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
>   		goto err_stolen;
>   	}
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen, 0);
>   	if (ret)
>   		goto err_object_free;
>   
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
