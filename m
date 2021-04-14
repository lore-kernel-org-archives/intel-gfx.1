Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B02C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8C661132
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8C661132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257506E922;
	Wed, 14 Apr 2021 15:09:04 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526826E922;
 Wed, 14 Apr 2021 15:09:03 +0000 (UTC)
IronPort-SDR: bWn26HcKWwcrKFW6KbGUcqPXKYMBaEiZq20E+RMXxeyI82OaacxRTmom12q4/8pO9ieAheBnfY
 61LRB9AcMgaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191471952"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="191471952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:06:24 -0700
IronPort-SDR: 6EB5k3Ux2Jd8ACK6Ehb0tZbjVLUNc6Ys9QccufD6NjMrZ8DlCG9qWIMuBgsO8l6nw50Zoa3BHU
 Uc7N4nHIQz5g==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="418355952"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO [10.213.205.119])
 ([10.213.205.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:06:23 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-5-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <16d84f35-5950-cadb-aed0-85af28a51037@linux.intel.com>
Date: Wed, 14 Apr 2021 16:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412090526.30547-5-matthew.auld@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 04/19] drm/i915/stolen: treat stolen local
 as normal local memory
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
> Underneath it's the same stuff, so things like the PTE_LM bits for the
> GTT should just keep working as-is.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index ce1c83c13d05..017db8f71130 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -19,7 +19,10 @@ const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops = {
>   
>   bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
>   {
> -	return obj->ops == &i915_gem_lmem_obj_ops;
> +	struct intel_memory_region *mr = obj->mm.region;
> +
> +	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
> +		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
>   }
>   
>   struct drm_i915_gem_object *
> 

Passable I guess. Although there is also i915_gem_object_is_stolen so it 
is not immediately clear what are the semantics of 
i915_gem_object_is_lmem vs that one. Almost like we need more 
"hierarchy" in region types, or flags of some sort, but I haven't looked 
at the callers to have a good idea what would work best.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
