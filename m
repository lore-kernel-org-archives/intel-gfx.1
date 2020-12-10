Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F334C4167B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 17:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5790523A7C
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 17:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5790523A7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC76EAAC;
	Thu, 10 Dec 2020 17:33:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59E6E435
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 17:33:48 +0000 (UTC)
IronPort-SDR: qsTMPWfI26yHXgWan33RrNt8+oSTbOHC44whQchOJa0J8N5WqU187VvEWKRPMnClJHN86Yb23h
 y1zNVNWtfj4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174410664"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="174410664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:33:46 -0800
IronPort-SDR: iC/JaJN3m9PcJcqH2fmlIliGAdC7gATM3yJ/SgI5sr3TLNMMXQ9h/KP3na9RwiSKf2INUeeh8y
 7nZifG0f03Ow==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="320185818"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:33:46 -0800
Date: Thu, 10 Dec 2020 09:28:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20201210172758.GB21533@sdutt-i7>
References: <20201207193824.18114-1-chris@chris-wilson.co.uk>
 <20201207193824.18114-6-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207193824.18114-6-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 06/20] drm/i915/gt: Remove virtual
 breadcrumb before transfer
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 07:38:10PM +0000, Chris Wilson wrote:
> The issue with stale virtual breadcrumbs remain. Now we have the problem
> that if the irq-signaler is still referencing the stale breadcrumb as we
> transfer it to a new sibling, the list becomes spaghetti. This is a very
> small window, but that doesn't stop it being hit infrequently. To
> prevent the lists being tangled (the iterator starting on one engine's
> b->signalers but walking onto another list), always decouple the virtual
> breadcrumb on schedule-out and make sure that the walker has stepped out
> of the lists.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Makes sense to me.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  5 +++--
>  drivers/gpu/drm/i915/gt/intel_lrc.c         | 15 +++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index 00918300f53f..63900edbde88 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -454,15 +454,16 @@ void i915_request_cancel_breadcrumb(struct i915_request *rq)
>  {
>  	struct intel_breadcrumbs *b = READ_ONCE(rq->engine)->breadcrumbs;
>  	struct intel_context *ce = rq->context;
> +	unsigned long flags;
>  	bool release;
>  
>  	if (!test_and_clear_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags))
>  		return;
>  
> -	spin_lock(&ce->signal_lock);
> +	spin_lock_irqsave(&ce->signal_lock, flags);
>  	list_del_rcu(&rq->signal_link);
>  	release = remove_signaling_context(b, ce);
> -	spin_unlock(&ce->signal_lock);
> +	spin_unlock_irqrestore(&ce->signal_lock, flags);
>  	if (release)
>  		intel_context_put(ce);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 0b7e86240f3b..b3db16b2a5a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1388,6 +1388,21 @@ static inline void execlists_schedule_in(struct i915_request *rq, int idx)
>  static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
>  {
>  	struct virtual_engine *ve = container_of(ce, typeof(*ve), context);
> +	struct intel_engine_cs *engine = rq->engine;
> +
> +	/* Flush concurrent rcu iterators in signal_irq_work */
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &rq->fence.flags)) {
> +		/*
> +		 * After this point, the rq may be transferred to a new
> +		 * sibling, so before we clear ce->inflight make sure that
> +		 * the context has been removed from the b->signalers and
> +		 * furthermore we need to make sure that the concurrent
> +		 * iterator in signal_irq_work is no longer following
> +		 * ce->signal_link.
> +		 */
> +		i915_request_cancel_breadcrumb(rq);
> +		irq_work_sync(&engine->breadcrumbs->irq_work);
> +	}
>  
>  	if (READ_ONCE(ve->request))
>  		tasklet_hi_schedule(&ve->base.execlists.tasklet);
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
