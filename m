Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C4C433C1
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 11:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D7B61A3F
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 11:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D7B61A3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EE66E12E;
	Fri, 26 Mar 2021 11:20:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98BC6E12E;
 Fri, 26 Mar 2021 11:20:47 +0000 (UTC)
IronPort-SDR: nCKQEil8a9WRxaA0Cy3CONDBXyvGHdTHr2CvUegYKDMJQsyHP6JmiFEN+Qmx7l7FWwOHKamkCI
 eEmxKNq4wb0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="191159431"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="191159431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 04:20:46 -0700
IronPort-SDR: cbNbwO3rS0YN3Gh3f1Hqy7Q5yuel5hxMQqg9+KY0lEsufxuampDcvacD/ZWCUYWyS5wGp+qA9V
 q175cF+Dro8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="453478461"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga001.jf.intel.com with ESMTP; 26 Mar 2021 04:20:45 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id E3ADE5C1F43; Fri, 26 Mar 2021 13:20:36 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
In-Reply-To: <20210326105759.2387104-1-tvrtko.ursulin@linux.intel.com>
References: <20210326105759.2387104-1-tvrtko.ursulin@linux.intel.com>
Date: Fri, 26 Mar 2021 13:20:36 +0200
Message-ID: <87tuoyyxdn.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Take request reference before
 arming the watchdog timer
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Reference needs to be taken before arming the timer. Luckily, given the
> default timer period of 20s, the potential to hit the race is extremely
> unlikely.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 9b4d0598ee94 ("drm/i915: Request watchdog infrastructure")
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
> Test-with: 20210318162400.2065097-1-tvrtko.ursulin@linux.intel.com
> ---
>  drivers/gpu/drm/i915/i915_request.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 9165971c3c47..bec9c3652188 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -350,6 +350,8 @@ static void __rq_arm_watchdog(struct i915_request *rq)
>  	if (!ce->watchdog.timeout_us)
>  		return;
>  
> +	i915_request_get(rq);
> +
>  	hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	wdg->timer.function = __rq_watchdog_expired;
>  	hrtimer_start_range_ns(&wdg->timer,
> @@ -357,7 +359,6 @@ static void __rq_arm_watchdog(struct i915_request *rq)
>  					   NSEC_PER_USEC),
>  			       NSEC_PER_MSEC,
>  			       HRTIMER_MODE_REL);
> -	i915_request_get(rq);
>  }
>  
>  static void __rq_cancel_watchdog(struct i915_request *rq)
> -- 
> 2.27.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
