Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C5C61DF0
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 06:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA52989453;
	Mon, 31 Aug 2026 06:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaifM1Mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812AC10E1ED
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788157952; x=1819693952;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Vl9MECXANttyrEGHW85vZL75VbnUN50LNyMtxswkZw8=;
 b=IaifM1Mff9IHQgUU3vCQg44/f/d4zs54wUEYjaMZeEUeEQ3HzSbdCMWq
 OpcpLABW6D1K9vvAnj+9+EsR37Hs3Pq1nRq4bCBeaBMvVn/NyZI0/B7Jg
 vgUnYcev35wzG8lSvNDoS15oMjeM+3SlVmRfPJTUH0Bu2zMf8PcrCXd1f
 PLwkRiIyX/xTmbn3+9LcwY29STRp9xBJGPzwa08i6WcQltmBX73xgCFHo
 +5RA5yBYDf/PNpV+JFFgu6dWQAg8XoAkd4S82HUPfaHm/eEvGcDgO8oed
 70Q0s3sah2EaDS1AWkYvv9UARQFasyj/QLxykmdM/ekAOWN2GcGQ9i1dR A==;
X-CSE-ConnectionGUID: 0uWDZeiQTI+rRLNXBSOAWA==
X-CSE-MsgGUID: xcGIN8R7S8GNM3gLvUKQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88577684"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88577684"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:32:32 -0700
X-CSE-ConnectionGUID: 0dzZ1vUsQDO/+SfZakxWnw==
X-CSE-MsgGUID: mum9O95USx6Cy29NgtVDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293520198"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:32:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>, Adharsh K
 <adharshkandath@gmail.com>
Subject: Re: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW
 force bit is reset
In-Reply-To: <20260831044036.1236136-1-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
Date: Mon, 31 Aug 2026 09:32:27 +0300
Message-ID: <bcf68c2a0dbb39359d66c805b35db7f809da9371@intel.com>
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

On Mon, 31 Aug 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> pps_vdd_init() takes an AUX power-domain reference into
> intel_dp->pps.vdd_wakeref when it finds EDP_FORCE_VDD already enabled by
> the BIOS, and defers dropping it to a later scheduled VDD off.
>
> intel_pps_vdd_on_unlocked() decides whether it already owns that reference
> by reading the live EDP_FORCE_VDD bit via edp_have_panel_vdd(). That bit
> can be reset under the driver (DC states, DMC, BIOS) while we still hold
> vdd_wakeref. When that happens the function believes it holds nothing,
> overwrites vdd_wakeref with a freshly acquired reference and orphans the
> original one. The leak surfaces at suspend-late as:
>
>   i915 raw-wakerefs=1 wakelocks=1 on cleanup
>
> with the leaked wakeref's backtrace pointing at pps_vdd_init() ->
> intel_pps_init() from driver probe.
>
> Make vdd_wakeref the authoritative record of the reference: only acquire
> a new one when we don't already hold it, and re-assert the HW bit either
> way. This keeps the reference balanced regardless of the volatile HW
> state and drops the now-incorrect WARN_ON().
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477
> Assisted-by: Claude:claude-3-opus
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Tested-by: Adharsh K <adharshkandath@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pps.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index d4c98b150fa2..43e89aaf419f 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -758,9 +758,10 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
>  	if (edp_have_panel_vdd(intel_dp))
>  		return need_to_disable;
>  
> -	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> -	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> -							    intel_aux_power_domain(dig_port));
> +	if (!intel_dp->pps.vdd_wakeref)
> +		intel_dp->pps.vdd_wakeref =
> +			intel_display_power_get(display,
> +						intel_aux_power_domain(dig_port));

This now silently accepts a whole class of mismatched VDD
enable/disable, losing one of the main points of the whole vdd_wakeref.

BR,
Jani.

>  
>  	pp_stat_reg = _pp_stat_reg(intel_dp);
>  	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);

-- 
Jani Nikula, Intel
