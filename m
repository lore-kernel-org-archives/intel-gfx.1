Return-Path: <SRS0=b/6W=GX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83006C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 08:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FBE23131
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 08:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FBE23131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88C46E150;
	Wed, 20 Jan 2021 08:24:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FE16E150
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Jan 2021 08:24:19 +0000 (UTC)
IronPort-SDR: NJ79Hu/r9JIdnxfpESQldjlTUtypY3LOF9Tc59vMvsfCfs6EV/8TX9MM+2xMDzCmp+M4gvlDVC
 JPTPY2SYLiNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158246164"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="158246164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 00:24:18 -0800
IronPort-SDR: UItnTtRdZ8jDigUOqGGa0BjFO+2MiyffHK4yaVRsVUychU3a9caNmvbdoE5ir8yZ0J2m+x363/
 uv0AXI5QT+Ig==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="384634946"
Received: from dgravino-mobl1.ger.corp.intel.com (HELO [10.249.41.166])
 ([10.249.41.166])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 00:24:17 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210119162057.31097-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c77fba54-7d23-0203-b6cd-a44a0fb89532@linux.intel.com>
Date: Wed, 20 Jan 2021 08:24:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210119162057.31097-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Close race between
 enable_breadcrumbs and cancel_breadcrumbs
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 19/01/2021 16:20, Chris Wilson wrote:
> If we enable_breadcrumbs for a request while that request is being
> removed from HW; we may see that the request is active as we take the
> ce->signal_lock and proceed to attach the request to ce->signals.
> However, during unsubmission after marking the request as inactive, we
> see that the request has not yet been added to ce->signals and so skip
> the removal. Pull the check during cancel_breadcrumbs under the same
> spinlock as enabling so that we the two tests are consistent in
> enable/cancel.
> 
> Otherwise, we may insert a request onto ce->signal that we expect should
> not be there:
> 
>    intel_context_remove_breadcrumbs:488 GEM_BUG_ON(!__i915_request_is_complete(rq))
> 
> While updating, we can note that we are always called with
> irqs-disabled, due to the engine->active.lock being held at the single
> caller, and so remove the irqsave/restore.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2931
> Fixes: c18636f76344 ("drm/i915: Remove requirement for holding i915_request.lock for breadcrumbs")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Cc: <stable@vger.kernel.org> # v5.10+
> ---
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index d098fc0c14ec..34a645d6babd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -453,16 +453,17 @@ void i915_request_cancel_breadcrumb(struct i915_request *rq)
>   {
>   	struct intel_breadcrumbs *b = READ_ONCE(rq->engine)->breadcrumbs;
>   	struct intel_context *ce = rq->context;
> -	unsigned long flags;
>   	bool release;
>   
> -	if (!test_and_clear_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags))
> +	spin_lock(&ce->signal_lock);
> +	if (!test_and_clear_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags)) {
> +		spin_unlock(&ce->signal_lock);
>   		return;
> +	}
>   
> -	spin_lock_irqsave(&ce->signal_lock, flags);
>   	list_del_rcu(&rq->signal_link);
>   	release = remove_signaling_context(b, ce);
> -	spin_unlock_irqrestore(&ce->signal_lock, flags);
> +	spin_unlock(&ce->signal_lock);
>   	if (release)
>   		intel_context_put(ce);
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
