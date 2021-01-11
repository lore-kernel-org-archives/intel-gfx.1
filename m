Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E04C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D7922AAF
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 16:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D7922AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F646E10B;
	Mon, 11 Jan 2021 16:19:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5886E10B
 for <intel-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 16:19:47 +0000 (UTC)
IronPort-SDR: GKyC/0Gh0uG9kGgT9fr6u8qYIDTbiTdug0npmgrKoC38lQlK1Ogo5jIlMogRmh1ys27zkOn9aT
 bUE9dOxtyfgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="241961589"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="241961589"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 08:19:44 -0800
IronPort-SDR: BjktyR0JBchhVIltSsxegjz5t3qlGwguhnq3yMA7vf3kgMKlcZMQyoXmQ6x6jNBKpH+jCgnf6c
 p2TKcutjBfeg==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="352656625"
Received: from sbrooks8-mobl.ger.corp.intel.com (HELO [10.214.224.70])
 ([10.214.224.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 08:19:43 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210111105735.21515-1-chris@chris-wilson.co.uk>
 <20210111105735.21515-3-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <24903f8e-4f53-c0bd-4ced-7161b505f06d@linux.intel.com>
Date: Mon, 11 Jan 2021 16:19:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111105735.21515-3-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/gt: Perform an arbitration
 check before busywaiting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 11/01/2021 10:57, Chris Wilson wrote:
> During igt_reset_nop_engine, it was observed that an unexpected failed
> engine reset lead to us busywaiting on the stop-ring semaphore (set
> during the reset preparations) on the first request afterwards. There was
> no explicit MI_ARB_CHECK in this sequence as the presumption was that
> the failed MI_SEMAPHORE_WAIT would itself act as an arbitration point.
> It did not in this circumstance, so force it.

In other words MI_SEMAPHORE_POLL is not a preemption point? Can't 
remember if I knew that or not..

1)
Why not the same handling in !gen12 version?

2)
Failed reset leads to busy-hang in following request _tail_? But there 
is an arb check at the start of following request as well. Or in cases 
where we context switch into the middle of a previously executing request?

But why would that busy hang? Hasn't the failed request unpaused the ring?

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 9a182652a35e..e9ac281644cc 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -567,6 +567,7 @@ u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>   
>   static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   {
> +	*cs++ = MI_ARB_CHECK;
>   	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
>   		MI_SEMAPHORE_GLOBAL_GTT |
>   		MI_SEMAPHORE_POLL |
> @@ -575,7 +576,6 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   	*cs++ = preempt_address(rq->engine);
>   	*cs++ = 0;
>   	*cs++ = 0;
> -	*cs++ = MI_NOOP;
>   
>   	return cs;
>   }
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
