Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F505C43458
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Jun 2026 08:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E510E724;
	Mon, 29 Jun 2026 08:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8e3VAv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B266010E724
 for <intel-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782720883; x=1814256883;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/7CSb9dlG5t8qmx+OdfR+THKu3zymgkhUfFXhuR74r8=;
 b=n8e3VAv+XTSRAi8iu5eIFQpHAwxy4qWe0KZYsOI0/fCTRCn64SL5EA4h
 YBrozE1x1OZ43YQFPCl6G5ZAPzpkcjzkB40tbUsUd60A98ivE6D768Odo
 7Ibv2EEijpvzAHzVdOAaDNB2y/R22wSX7psFl/E5fdtMEfx22/igqnnNQ
 RrvnS9ZkGzFqvmMUrRBBzvJGgpQbNocHOoMhm7uJTVpNJwWG66ho3cQOO
 suJ/2HVVXlL7huOgiBQfJ+9Fdx0Pvqj8f+b12r109j2WUfqjZ+pFYbbsa
 FDuqvMzzi6EV1x4T0Lc8uq89Kwly0SN9Qu8NTheTINLmaUl62DZMS8T1V g==;
X-CSE-ConnectionGUID: idnFCxk7Tu+hVCH5GBPcSg==
X-CSE-MsgGUID: ErF7kQSVQUKlJxd5YTjIoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85951060"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="85951060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:14:43 -0700
X-CSE-ConnectionGUID: 7hbruyaVSVqdt4Pi8G/OdA==
X-CSE-MsgGUID: j92UezPmSq+32uUOKETCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="245526854"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:14:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com
Subject: Re: [PATCH] drm/i915/gt: Enforce some loop limits
In-Reply-To: <20260303181531.9953-2-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260303181531.9953-2-jonathan.cavitt@intel.com>
Date: Mon, 29 Jun 2026 11:14:38 +0300
Message-ID: <f524eb479dd39e56d4cfc5815a6ae6b62ccfff96@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 03 Mar 2026, Jonathan Cavitt <jonathan.cavitt@intel.com> wrote:
> The functions intel_guc_send_busy_loop and ct_send can theoretically
> loop forever.  In the former case, intel_guc_send_busy_loop can iterate
> forever if intel_guc_send_nb repeatedly returns -EBUSY.  In the latter
> case, ct_send can loop forever if the guc-to-host or host-to-guc buffers
> get stuck in a full state.
>
> Rework the sleep_period_ms values here to count the number of loops that
> have occurred and exit after 20.  This lets both functions run for 10
> minutes before escaping with -EBUSY (except in the former case if atomic
> execution is enabled, but 20 consecutive failures in that case should
> still be reported regardless).
>
> This also technically solves a static analysis issue wherein
> sleep_period_ms could overflow, but it would take over three weeks of
> perpetual sleeping on these functions to ever hit that overflow, so it's
> debatable whether this actually needed fixing or not.  At any rate, it's
> better to exit early in the error case.

Overall feels like a conversion to iopoll.h poll_timeout_us() and
friends would be benefitial.

BR,
Jani.


>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 10 +++++++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  8 +++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..b4bf12193f75 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -361,7 +361,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  					   bool loop)
>  {
>  	int err;
> -	unsigned int sleep_period_ms = 1;
> +	unsigned int loop_count = 0;
>  	bool not_atomic = !in_atomic() && !irqs_disabled();
>  
>  	/*
> @@ -377,13 +377,17 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  retry:
>  	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>  	if (unlikely(err == -EBUSY && loop)) {
> +		if (loop_count >= 20)
> +			return -EBUSY;
> +
>  		if (likely(not_atomic)) {
> -			if (msleep_interruptible(sleep_period_ms))
> +			if (msleep_interruptible(1 << loop_count))
>  				return -EINTR;
> -			sleep_period_ms = sleep_period_ms << 1;
>  		} else {
>  			cpu_relax();
>  		}
> +
> +		loop_count++;
>  		goto retry;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 8c4da526d461..e4a5697622c8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -716,7 +716,7 @@ static int ct_send(struct intel_guc_ct *ct,
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct ct_request request;
>  	unsigned long flags;
> -	unsigned int sleep_period_ms = 1;
> +	unsigned int loop_count = 0;
>  	bool send_again;
>  	u32 fence;
>  	int err;
> @@ -747,9 +747,11 @@ static int ct_send(struct intel_guc_ct *ct,
>  		if (unlikely(ct_deadlocked(ct)))
>  			return -EPIPE;
>  
> -		if (msleep_interruptible(sleep_period_ms))
> +		if (loop_count >= 20)
> +			return -EBUSY;
> +
> +		if (msleep_interruptible(1 << loop_count++))
>  			return -EINTR;
> -		sleep_period_ms = sleep_period_ms << 1;
>  
>  		goto retry;
>  	}

-- 
Jani Nikula, Intel
