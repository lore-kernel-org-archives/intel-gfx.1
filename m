Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909D2C79F99
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 10:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190E410E20C;
	Mon,  7 Sep 2026 10:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtJpZJST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5099410E20C
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788777188; x=1820313188;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j8CfSGOP8QV8WWDPVGlKWBs4/yE94xYjQ37k9Alr3ss=;
 b=HtJpZJSTytGix8wa6vKJpTJczI1D6jHhZwS5X6M2fxQGnHCMSmQXusdj
 ERph15l+fYmRHneCBx0wlpAjH8heFSlwi7pXnb2wNvEdj2cVi+J6NL4vu
 wamYoR3BI7wYzd46hrC67hRJl4Mbrt821rGNUHH0N/IRmCe3fGbP+RcQs
 MVzUlasHcVbogW5B0yoI7l+yQpyJP8m/aHdn1R2i5h3YhIpKz0c6hxH6K
 I9diHzho+XgsYYLKOFpPxbqS0zHGRM9GMo/ZsWRnk4IyW3iLspkY1BYHR
 CWy/N1Yv2stUZoKR23GLLbKHBWhlPSoNpqlX0tSerbter8BLNAuRj+meV A==;
X-CSE-ConnectionGUID: UEJeoqv5Rsa5o2TyxLqgew==
X-CSE-MsgGUID: UmTGocJ8SZGYaeI6W++Gxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="114721202"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114721202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:33:08 -0700
X-CSE-ConnectionGUID: VO6fVHA2Rkm5YG0NXiuXqA==
X-CSE-MsgGUID: yu/7Px/9Sm+9ecuA4QcgBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268942820"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:33:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
In-Reply-To: <20260907092707.1823088-1-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
Date: Mon, 07 Sep 2026 13:33:03 +0300
Message-ID: <b7c948a346a6dd55894473296081bafda3ae6307@intel.com>
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

On Mon, 07 Sep 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Its observed that on AUX_CH failure, even if the retry is increased to
> 1000, it does not succeed. Either the command might be wrong or sink in
> an unknown/sleep state can cause this. So try waking the sink device.
> Before reading the DPCD caps wake the sink for eDP.
>
> v2: Use poll_timeout_us (Jani N)
>     Add the reason, why this change is required (Ville)
> v3: Wake sink only for eDP
>     Remove the dpcd probe set to true/false in wake_sink (Imre)
> v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte (Suraj)
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..d4cc5f7e82a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>  	intel_edp_set_data_override_rates(intel_dp);
>  }
>  
> +/* Spec says to try for 3 times, its doubled to add the software overhead */

Where in the spec? What software overhead?

> +#define AUX_CH_WAKE_RETRY	6

There is no guarantee that this is tried 3 or 6 times. The timeout is a
timeout, not retry count.

> +
> +static void intel_edp_wake_sink(struct intel_dp *intel_dp)
> +{
> +	u8 value = 0;
> +	int ret = 0;
> +
> +	/*
> +	 * Wake the sink device
> +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
> +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
> +	 */

So this is now talking about 1 ms, but the timeout used is 6 ms.

> +	ret = poll_timeout_us(ret = drm_dp_dpcd_read_byte(&intel_dp->aux,
> +							  DP_SET_POWER, &value),
> +			      ret == 0, 1000, AUX_CH_WAKE_RETRY * 1000, true);
> +
> +	/*
> +	 * If sink is in D3 then it may not respond to the AUX tx so
> +	 * wake it up to D3_AUX_ON state
> +	 * If the above poll_timeout_us fails, try waking the sink.
> +	 */
> +	if (value == DP_SET_POWER_D3 || ret < 0) {

You need to switch the order here. Value may be garbage if ret < 0.

> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1.2) */
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D0);
> +		fsleep(1000);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D3_AUX_ON);
> +	}
> +}
> +
>  static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
>  {
> @@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
>  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
>  		return false;
>  
> +	intel_edp_wake_sink(intel_dp);
> +
>  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  			 drm_dp_is_branch(intel_dp->dpcd));
>  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);

-- 
Jani Nikula, Intel
