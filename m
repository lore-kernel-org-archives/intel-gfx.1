Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0B7C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 09:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA1623333
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 09:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA1623333
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C598F6E409;
	Thu,  7 Jan 2021 09:25:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145A6E409
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 09:25:48 +0000 (UTC)
IronPort-SDR: 24BQBi0wOW0qiErCP66/FXgIl/vmAUlsscSa0Y6zApRFSOwrFN76k0MtR+3FWKir0FnGH/PAUB
 AAvMUelBLVGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="262171873"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="262171873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:25:48 -0800
IronPort-SDR: ie0C+NlaBJrVZWuKFH1c17F7QeJePZBrnmrLMxjacfPb1FWPdNmjpNyE40WDJdNEkkyjLvCDyP
 lJFXWU98jPkA==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="379649586"
Received: from obenha-mobl2.ger.corp.intel.com (HELO [10.252.62.192])
 ([10.252.62.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:25:47 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210106163642.4405-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8734de99-93eb-54a6-035f-75023180b13a@linux.intel.com>
Date: Thu, 7 Jan 2021 09:25:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210106163642.4405-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Wrap our
 timer_list.expires checking
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


On 06/01/2021 16:36, Chris Wilson wrote:
> Refactor our timer_list.expires checking into its own timer_active()
> helper.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_utils.c | 2 +-
>   drivers/gpu/drm/i915/i915_utils.h | 7 ++++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
> index 4c305d838016..f9e780dee9de 100644
> --- a/drivers/gpu/drm/i915/i915_utils.c
> +++ b/drivers/gpu/drm/i915/i915_utils.c
> @@ -87,7 +87,7 @@ bool i915_error_injected(void)
>   
>   void cancel_timer(struct timer_list *t)
>   {
> -	if (!READ_ONCE(t->expires))
> +	if (!timer_active(t))
>   		return;
>   
>   	del_timer(t);
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 54773371e6bd..abd4dcd9f79c 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -438,9 +438,14 @@ static inline void __add_taint_for_CI(unsigned int taint)
>   void cancel_timer(struct timer_list *t);
>   void set_timer_ms(struct timer_list *t, unsigned long timeout);
>   
> +static inline bool timer_active(const struct timer_list *t)
> +{
> +	return READ_ONCE(t->expires);
> +}
> +
>   static inline bool timer_expired(const struct timer_list *t)
>   {
> -	return READ_ONCE(t->expires) && !timer_pending(t);
> +	return timer_active(t) && !timer_pending(t);
>   }
>   
>   /*
> 

Don't know really, it's a bit dodgy to prefix with generic timer_ when 
semantics are i915 specific and apply only to timers managed with our 
set_timer_ms().

Have it for now and perhaps we can revisit to tidy later.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
