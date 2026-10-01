Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17091CA5FCE
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 08:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC8710E327;
	Thu,  1 Oct 2026 08:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCCm2oai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B45110E327
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790842143; x=1822378143;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xWodO8+PPDw20LXX7g3jLfjjQ8ximXCkpahXdImK2AE=;
 b=bCCm2oaib3TCoGV/g7DFm1Y0xqRRq+YJhwOOlGR9kR+8MbdYB0NM8irH
 bM7uRjOSp+pUv1ptyNU0FPtSaL5rVjeXyM1He1qg+uo5AX76RntdHRo+C
 ORWC+32ZZ4UoLMcawuS0rADUjmfhHmaByVaDbnU2EnHVKWV4QTLOPkXFR
 xpUnIxO1HJemQzbtaIkNKa4ZgyZxSRgb1NxD8i7c+v8lC1GaOXFK6sQRy
 LRAG11Tmlq3adR1h6KcwfOI/pJ5QZtZeT78ft4GIxBjiSgD678GEq4237
 BLjYsfjTTp541duO80u/ZdfAQNsHP7lrKaCUgmx3OF5VZty5Il5Jxb/gV Q==;
X-CSE-ConnectionGUID: 7un+QzXgRa26lzefhvF0xQ==
X-CSE-MsgGUID: pJY4dWvtTVCEBYRv3nhdYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90626797"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90626797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:09:02 -0700
X-CSE-ConnectionGUID: GVIowRv7Q7eDG+BP73b8hw==
X-CSE-MsgGUID: xOA3jzc1Qb2bFc7F9+xRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275047092"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.29])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:09:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Do not destroy uninitialized timer
In-Reply-To: <20261001071757.2688815-1-krzysztof.karas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261001071757.2688815-1-krzysztof.karas@intel.com>
Date: Thu, 01 Oct 2026 11:08:57 +0300
Message-ID: <b949384fbed6c626193ac60f4b4e5d881910e70e@intel.com>
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

On Thu, 01 Oct 2026, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
> cleanup is performed on an uninitialized timer.
>
> Prevent that by jumping to a dedicated label for driver removal
> cleanup.
>
> Assisted-by: Copilot-Claude-Opus-5

Nowadays it's sufficient to state, "Assisted-by: LLM".

> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 5b986a7687d9..5e3a9b5a83eb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -651,17 +651,18 @@ static int live_emit_pte_full_ring(void *arg)
>  	len = emit_pte(rq, &it, obj->pat_index, false, 0, CHUNK_SZ);
>  	if (!len) {
>  		err = -EINVAL;
> -		goto out_rq;
> +		goto out_timer;
>  	}
>  	if (len < 0) {
>  		err = len;
> -		goto out_rq;
> +		goto out_timer;
>  	}
>  
> -out_rq:
> -	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
> +out_timer:
>  	timer_delete_sync(&st.timer);
>  	timer_destroy_on_stack(&st.timer);
> +out_rq:
> +	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */

This seems like the proper thing to do.

I can't think of any reason why changing the order would be bad, but
then this is not really my area of expertise. With that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  out_unpin:
>  	intel_context_unpin(ce);
>  out_put:

-- 
Jani Nikula, Intel
