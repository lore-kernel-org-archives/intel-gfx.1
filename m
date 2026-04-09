Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4816F364B6
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Apr 2026 21:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C8310E06F;
	Thu,  9 Apr 2026 21:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lf1iogsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5510E06F
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 21:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775769098; x=1807305098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+UTAFOZdEierpJ/Jy1ACLQaKBicBNb3LQsO/40pLYSU=;
 b=lf1iogsligu+ZgbpFc9N9CN2Z8xkrCTX9NR9ZLHiGh312jumjTgTnFqF
 SXSDiwrfb08waJaD+fnc42fXZ0INxHfC4MNIG3jY3hICXrMbNXBSq3r1G
 e8CsT0LtI6TuCo+EBrIhFPWp0IedLYy3Bh24W8k2TzeESN8dzcrtMAt5n
 9OZWOM7QveKXuwEr2foNYjd1V2LBA+hLbGXvgooU3ExXYSibAE6tjQeTy
 sHr4Nvc8jH1D4ECkjyvwes1B+NbouvhdsjMWAcau4lQddt3YPp+jNdPAV
 pX/FvHDjfgz8TsdHcpRH6hP5It9SA37CtWba5/hJKtMgp/ObD6skZHTC6 Q==;
X-CSE-ConnectionGUID: DsQewMvySMa2A6eiuzCi2g==
X-CSE-MsgGUID: Y73PJj0NTIuXVJCaeQsULQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76675401"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76675401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:11:38 -0700
X-CSE-ConnectionGUID: JOuHzg7GRhOcrFujy+YCnw==
X-CSE-MsgGUID: bmH92uM4Tq2ENroRpmLuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="229179894"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:11:36 -0700
Date: Fri, 10 Apr 2026 00:11:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
Subject: Re: [PATCH] drm/i915/display: Check some INVALID_TRANSCODER cases
Message-ID: <adgWBSCegY8YvRxV@intel.com>
References: <20260409210001.64901-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409210001.64901-2-jonathan.cavitt@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Apr 09, 2026 at 09:00:02PM +0000, Jonathan Cavitt wrote:
> There are some cases in intel_ddi.c, such as in intel_ddi_is_audio_enabled
> and intel_ddi_compute_config_late, where we attempt to perform a BIT
> shift using a passed transcoder enum value.  This value may be -1,
> INVALID_TRANSCODER, which can result in undefined behavior if this
> occurs.
> 
> In the former case, we can simply return false if this is the transcoder
> passed (as audio is not enabled on an invalid transcoder).
> 
> In the latter case, the likely expected behavior is to set the
> crtc_state->sync_mode_slaves_mask to zero, so just do that directly and
> avoid a risky bit shift.
> 
> The likelihood of either case occurring during normal execution is
> unknown and possibly very low.  Regardless, this covers a static analyis
> issue.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 178074316a2c..7abeb60779e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3875,7 +3875,8 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
>  static bool intel_ddi_is_audio_enabled(struct intel_display *display,
>  				       enum transcoder cpu_transcoder)
>  {
> -	if (cpu_transcoder == TRANSCODER_EDP)
> +	if (cpu_transcoder == TRANSCODER_EDP ||
> +	    cpu_transcoder == INVALID_TRANSCODER)
>  		return false;
>  
>  	if (!intel_display_power_is_enabled(display, POWER_DOMAIN_AUDIO_MMIO))
> @@ -4637,8 +4638,13 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
>  
>  	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
>  		crtc_state->master_transcoder = INVALID_TRANSCODER;
> -		crtc_state->sync_mode_slaves_mask =
> -			port_sync_transcoders & ~BIT(crtc_state->cpu_transcoder);
> +		if (crtc_state->cpu_transcoder == INVALID_TRANSCODER ||
> +		    !port_sync_transcoders)
> +			crtc_state->sync_mode_slaves_mask = 0;
> +		else
> +
> +			crtc_state->sync_mode_slaves_mask =
> +				port_sync_transcoders & ~BIT(crtc_state->cpu_transcoder);

Making the code convoluted just to satisfy some dumb static
analysis tool is not great.

If we really need to care about this crap then I think it'd be better
to introduce some kind of intel_transcoder_mask() function that
explicitly deals with INVALID_TRANSCODER.

>  	}
>  
>  	return 0;
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
