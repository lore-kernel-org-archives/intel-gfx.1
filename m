Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD56CA5FA1
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 11:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB2D10EE42;
	Tue, 29 Sep 2026 11:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5474WlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87510EE42
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790680796; x=1822216796;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZRDWMNKenf4Agix3S6Hfy0PmuHfoCAxokSMKFqWcPFY=;
 b=h5474WlRASEa6f/uPMmgWuPub2EhPFWumT0ksU+cziUNteVDHGeaMOaH
 J0M8i1QCSF0uIe/8eWpAo2rNrKR2s0tQtONaHIuJXlzK3j/66SocX6QVL
 +CbEDcjPzLt5IhycCGRynPqs84H/Cb6eM4DHxB4O9v3NMEiD7DmA+0HZh
 HdWPbmZdih0YYF90XKTRU+pBnOiZ6l443bRr9IhbrYWKoIKmNTyhXTGk9
 oHpsbHuTvWGIkWevCrTJJJFKSFe1ccmzxYfIDJEZrfM/3KBu7Xttw003/
 ojeOwZjhe1TQPjXVsqwjZ8Pm8E//6d7hube9Ss1nUfQdgauAz9f6G/jGU w==;
X-CSE-ConnectionGUID: 3DvfNma8Qmy6USCkHyiHYA==
X-CSE-MsgGUID: lqrstzP7TG2jfdIMc5kBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91417589"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91417589"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:19:56 -0700
X-CSE-ConnectionGUID: QysvDfOmQP+Zz+iMmV9zrg==
X-CSE-MsgGUID: ss/AudyYRWSP9mBpX5xUfg==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:19:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Do not destroy uninitialized timer
In-Reply-To: <20260929111259.2359138-1-krzysztof.karas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929111259.2359138-1-krzysztof.karas@intel.com>
Date: Tue, 29 Sep 2026 14:19:50 +0300
Message-ID: <6fe898848efe8a91c7794d5c461fe34b98fec683@intel.com>
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

On Tue, 29 Sep 2026, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
> cleanup is performed on an uninitialized timer.
>
> Check if the timer has been set up, before trying to remove it.
>
> Assisted-by: Copilot-Claude-Opus-5
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 5b986a7687d9..6793ba028146 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -552,6 +552,7 @@ static int live_emit_pte_full_ring(void *arg)
>  	struct intel_context *ce;
>  	struct i915_request *rq, *prev;
>  	struct spinner_timer st;
> +	bool timer_set = false;
>  	struct sgt_dma it;
>  	int len, sz, err;
>  	u32 *cs;
> @@ -641,6 +642,7 @@ static int live_emit_pte_full_ring(void *arg)
>  
>  	timer_setup_on_stack(&st.timer, spinner_kill, 0);
>  	mod_timer(&st.timer, jiffies + 2 * HZ);
> +	timer_set = true;
>  
>  	/*
>  	 * This should wait for the spinner to be killed, otherwise we should go
> @@ -660,8 +662,10 @@ static int live_emit_pte_full_ring(void *arg)
>  
>  out_rq:
>  	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
> -	timer_delete_sync(&st.timer);
> -	timer_destroy_on_stack(&st.timer);
> +	if (timer_set) {
> +		timer_delete_sync(&st.timer);
> +		timer_destroy_on_stack(&st.timer);
> +	}

Usually you'd have separate goto labels for the cleanup you do. Like, we
have "out_unpin" for when "out_rq" is not needed. We should have one for
timer cleanup as well.

BR,
Jani.

>  out_unpin:
>  	intel_context_unpin(ce);
>  out_put:

-- 
Jani Nikula, Intel
