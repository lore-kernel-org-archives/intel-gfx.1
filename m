Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE29C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F0961132
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F0961132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48F6E925;
	Wed, 14 Apr 2021 15:09:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8B6E924;
 Wed, 14 Apr 2021 15:09:22 +0000 (UTC)
IronPort-SDR: dC2hWZsdBiXSU85WEd6ONiJ3V52sg2wXhFFFGUwWimJBKPjG833lvEWoEKdGAoDVgMfGFvD1jN
 2WmATabI/1oA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191472220"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="191472220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:07:07 -0700
IronPort-SDR: W5IwAx3kULAMavkkpQjS21K0huNX63/eWoiO0c6nh5sV5FEEb4lycalSe3lW0muG473AKfzMya
 DJ8PN3wKeYkg==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="418356170"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO [10.213.205.119])
 ([10.213.205.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:07:06 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-6-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <64964b2f-73fc-b584-c54f-96c0bc0ae7c0@linux.intel.com>
Date: Wed, 14 Apr 2021 16:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412090526.30547-6-matthew.auld@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 05/19] drm/i915/stolen: enforce the
 min_page_size contract
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


On 12/04/2021 10:05, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Since stolen can now be device local-memory underneath, we should try to
> enforce any min_page_size restrictions when allocating pages.
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 56dd58bef5ee..f713eabb7671 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -677,7 +677,8 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
>   	if (!stolen)
>   		return -ENOMEM;
>   
> -	ret = i915_gem_stolen_insert_node(i915, stolen, size, 4096);
> +	ret = i915_gem_stolen_insert_node(i915, stolen, size,
> +					  mem->min_page_size);
>   	if (ret)
>   		goto err_free;
>   
> @@ -817,8 +818,8 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
>   
>   	/* KISS and expect everything to be page-aligned */
>   	if (GEM_WARN_ON(size == 0) ||
> -	    GEM_WARN_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
> -	    GEM_WARN_ON(!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
> +	    GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
> +	    GEM_WARN_ON(!IS_ALIGNED(stolen_offset, mem->min_page_size)))
>   		return ERR_PTR(-EINVAL);
>   
>   	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
