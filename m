Return-Path: <SRS0=QT0F=GV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5727EC433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 12:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C659D2225C
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 12:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C659D2225C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1A6E1EC;
	Mon, 18 Jan 2021 12:25:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754F56E1EC
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Jan 2021 12:25:57 +0000 (UTC)
IronPort-SDR: YtOkwRJTr9PiA7XfZJWKZAKhcfGjFGcIzTl8NZfLY31oTU9Ji05As6SZ+Snlvwcv5wdV2oaVQ5
 y87AKfgnV6EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="242866652"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="242866652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 04:25:54 -0800
IronPort-SDR: JonGdcjR4mhFFAebtQIFkZ7MPy7aeJsdWKkFW4PhSAERWjsz3Xk64K2KpFGjU9jsl3e004KmvJ
 6uHuFz30rLuw==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="383551290"
Received: from nshalit-mobl.ger.corp.intel.com (HELO [10.214.195.251])
 ([10.214.195.251])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 04:25:52 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210117110418.3361-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e85cbb38-f3ae-e3cd-be86-868d31dab9d2@linux.intel.com>
Date: Mon, 18 Jan 2021 12:25:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210117110418.3361-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Add arbitration check before
 semaphore wait
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


On 17/01/2021 11:04, Chris Wilson wrote:
> Similar to commit 49b20dbf7497 ("drm/i915/gt: Perform an arbitration
> check before busywaiting"), also add a check prior to the busywait
> on gen8+, as we have now seen (because we added a selftest to add fault
> injection into the engine resets) the same engine reset failure leading
> to an indefinite wait on the ring-stop semaphore. So not a Tigerlake
> specific bug after all, though it still seems odd behaviour for the
> busywait as we do get the arbitration point elsewhere on a miss.
> 
> Testcase: igt_reset_fail_engine
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 5b932d2dbfd3..07ba524da90b 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -488,6 +488,7 @@ static u32 *gen8_emit_wa_tail(struct i915_request *rq, u32 *cs)
>   
>   static u32 *emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   {
> +	*cs++ = MI_ARB_CHECK; /* trigger IDLE->ACTIVE first */
>   	*cs++ = MI_SEMAPHORE_WAIT |
>   		MI_SEMAPHORE_GLOBAL_GTT |
>   		MI_SEMAPHORE_POLL |
> @@ -495,6 +496,7 @@ static u32 *emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   	*cs++ = 0;
>   	*cs++ = preempt_address(rq->engine);
>   	*cs++ = 0;
> +	*cs++ = MI_NOOP;
>   
>   	return cs;
>   }
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
