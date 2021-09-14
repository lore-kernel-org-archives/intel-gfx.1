Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7998C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 12:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96BAE60FBF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 12:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96BAE60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9F06E49A;
	Tue, 14 Sep 2021 12:42:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8D6E49D;
 Tue, 14 Sep 2021 12:42:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="222034162"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="222034162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:42:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544055574"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116])
 ([10.213.234.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:42:52 -0700
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-18-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <23f10a18-925f-cffe-a335-3d6c745d263a@linux.intel.com>
Date: Tue, 14 Sep 2021 13:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-18-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH 17/26] drm/i915: use new iterator in
 i915_gem_object_wait_priority
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


On 13/09/2021 14:16, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 29 ++++--------------------
>   1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 13174541f6c8..e2173a55e527 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -120,31 +120,12 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
>   			      unsigned int flags,
>   			      const struct i915_sched_attr *attr)
>   {
> -	struct dma_fence *excl;
> -
> -	if (flags & I915_WAIT_ALL) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -		int ret;
> -
> -		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
> -					  &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			i915_gem_fence_wait_priority(shared[i], attr);
> -			dma_fence_put(shared[i]);
> -		}
> -
> -		kfree(shared);
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(obj->base.resv);
> -	}
> +	struct dma_resv_cursor cursor;
> +	struct dma_fence *fence;
>   
> -	if (excl) {
> -		i915_gem_fence_wait_priority(excl, attr);
> -		dma_fence_put(excl);
> +	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor,
> +					 flags & I915_WAIT_ALL, fence) {
> +		i915_gem_fence_wait_priority(fence, attr);

Do you know if the RCU lock is actually held here? I tried following the 
KMS code paths but got lost in core helpers and driver vfuncs.

Regards,

Tvrtko

>   	}
>   	return 0;
>   }
> 
