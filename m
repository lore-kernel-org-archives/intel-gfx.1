Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D10C072A2
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Nov 2023 11:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DB10E747;
	Fri, 17 Nov 2023 11:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55C10E747
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Nov 2023 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700221415; x=1731757415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G3m5EgdLxJGlRG8BLdTEJyQQJfU9eMrmYiV/z39GfDs=;
 b=U4OOULCuQSkmIPR8lHqWIl7eWqDJJDkCK1SH4cxu2PauxxfQSTGE/mnX
 O888YwSXUTl78y5xtdUle1ojvpaybczjHgP2uz1ItI2rvGfaa9F0ClYCl
 wtUOloKWeljEE7ZoHpKOjbOcBIbYxDvzQ4TxNs2EE7wOiHK4UMPfAzVtp
 BRrZV50PpGghYR/2KobuJIyQgWxLKwEl5p1EcjDJCLfm927o7BMVoUuzH
 zzog+lOaPfMAjRHwcKo1nJ4RadDXLCIYF+B39hCDzerM+YtStqthTv9xA
 KMdQ3Qmn1DN1NOu3ovicjfU2ezVZJznWqrpHjJLcq2B4JnmzTEbx5bDuy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455583936"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="455583936"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012911144"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1012911144"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:43:33 -0800
Date: Fri, 17 Nov 2023 13:43:26 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <ZVdR3jWjHCA0WZCk@intel.com>
References: <20231116131841.1588781-1-imre.deak@intel.com>
 <20231116131841.1588781-10-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116131841.1588781-10-imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/11] drm/i915/dp: Report a rounded-down
 value as the maximum data rate
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 03:18:39PM +0200, Imre Deak wrote:
> Callers of intel_dp_max_data_rate() use the return value as an upper
> bound for the BW a given mode requires. As such the rounding shouldn't
> result in a bigger value than the actual upper bound. Use round-down
> instead of -closest accordingly.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM,

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 120d435d27ff1..209c27167e057 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -413,7 +413,7 @@ intel_dp_max_data_rate(int max_link_rate, int max_lanes)
>  		 */
>  		int max_link_rate_kbps = max_link_rate * 10;
>  
> -		max_link_rate_kbps = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(max_link_rate_kbps, 9671), 10000);
> +		max_link_rate_kbps = DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate_kbps, 9671), 10000);
>  		max_link_rate = max_link_rate_kbps / 8;
>  	}
>  
> @@ -423,7 +423,7 @@ intel_dp_max_data_rate(int max_link_rate, int max_lanes)
>  	 * out to be a nop by coincidence, and can be skipped:
>  	 *
>  	 *	int max_link_rate_kbps = max_link_rate * 10;
> -	 *	max_link_rate_kbps = DIV_ROUND_CLOSEST_ULL(max_link_rate_kbps * 8, 10);
> +	 *	max_link_rate_kbps = DIV_ROUND_DOWN_ULL(max_link_rate_kbps * 8, 10);
>  	 *	max_link_rate = max_link_rate_kbps / 8;
>  	 */
>  
> -- 
> 2.39.2
> 
