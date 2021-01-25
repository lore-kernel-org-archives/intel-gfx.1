Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA092C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79347206C1
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79347206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D96E0EA;
	Mon, 25 Jan 2021 14:53:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB106E0EA
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 14:53:13 +0000 (UTC)
IronPort-SDR: +mxOm6VA+bC6hqrf11f93IR0LMHTe6XjlWlTEk799MMdziSf26B7MzdCWqmVxxFD8xuZzE1/fH
 dKSFeMx6bkvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="198517967"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="198517967"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 06:53:12 -0800
IronPort-SDR: ggfLiHMyiWrbdCeKMEa/t1jTMilPOn6uzIGALb9RbOxbSkitmmpBF4FWukeiHcJOdLFr1/Udid
 7vGMQsLzX15g==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="387411912"
Received: from fjohn-mobl1.ger.corp.intel.com (HELO [10.249.46.217])
 ([10.249.46.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 06:53:11 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210125140136.10494-1-chris@chris-wilson.co.uk>
 <20210125140136.10494-2-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <cc84b878-f7eb-962f-ae1e-92d7cdca6609@linux.intel.com>
Date: Mon, 25 Jan 2021 14:53:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210125140136.10494-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 02/41] drm/i915/gt: Move the defer_request
 waiter active assertion
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
Cc: thomas.hellstrom@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 25/01/2021 14:00, Chris Wilson wrote:
> In defer_request() we start with the request we just unsubmitted (that
> should be the active request on the gpu) and then defer all of its
> waiters. No waiter should be ahead of the active request, so none should
> be marked as active. That assert failed.
> 
> Of particular note this machine was undergoing persistent GPU result due

s/result/reset/

> to underlying HW issues, so that may be a clue. A request is also marked
> as active when it is retired, regardless of current queue status, and so
> this assertion failure may be a result of the queue being completed by
> the reset and then subsequently processed by the tasklet.
> 
> We can filter out retired requests here by doing the assertion check
> after the is-ready check (active is a subset of being ready).
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2978
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 24731be6e462..56e36d938851 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1061,7 +1061,6 @@ static void defer_request(struct i915_request *rq, struct list_head * const pl)
>   				   __i915_request_has_started(w) &&
>   				   !__i915_request_is_complete(rq));
>   
> -			GEM_BUG_ON(i915_request_is_active(w));
>   			if (!i915_request_is_ready(w))
>   				continue;
>   
> @@ -1069,6 +1068,7 @@ static void defer_request(struct i915_request *rq, struct list_head * const pl)
>   				continue;
>   
>   			GEM_BUG_ON(rq_prio(w) > rq_prio(rq));
> +			GEM_BUG_ON(i915_request_is_active(w));
>   			list_move_tail(&w->sched.link, &list);
>   		}
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
