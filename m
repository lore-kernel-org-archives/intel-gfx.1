Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A24CD6E7D
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Jun 2026 15:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC6D112991;
	Fri,  5 Jun 2026 15:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxnVZFK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0A6112991
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780673713; x=1812209713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nzJyQXDnkMF7mQ29xLzePqpozonf0w9Ic8p6gbby7g4=;
 b=JxnVZFK2QkpUC0Z6Tn87pngoadxjpi+XGSkcTgxhNm2xl9gtLVl67BJT
 oRgiWJ9pCh8wfsdxQ0F1+RPiXaEVx4BtHDRkExyEk6xWU8sARDADLWjiZ
 SKwbEb5H2lxliewE0AQuU1L7gn7WDFVkHeFxjzUQ/YjmZ0E86BaRWNmCX
 IZRhxSijI7APAfyIHisIYflR0OV1jrUYIyxVjvBKzMsQwUI9VV8htAwn9
 n59zoPuyodEyjNCBCbfQefVP/6LGVKduJoQ2X0mJQ46X2+uNDAjjyQjlu
 JxOeEVdkacaqf1CLldrliChqW6rHb22VdIlXKqXJ5vuukUUJw5Q8fdEzE w==;
X-CSE-ConnectionGUID: wLa5p7M7RrmV/AfaoumalA==
X-CSE-MsgGUID: bIwrKTZMRB2li8ki1I4R7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81692992"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81692992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 08:35:08 -0700
X-CSE-ConnectionGUID: Rzo0jOU4RF6hSi+Hg5o7mw==
X-CSE-MsgGUID: XvCLr09YRaaZE6d9YnKdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="241893250"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 08:35:06 -0700
Date: Fri, 5 Jun 2026 18:35:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop
Subject: Re: [PATCH 2/2] drm/i915/dsb: handle always_use_vrr_tg in
 pre_commit_is_vrr_active()
Message-ID: <aiLsptasB2CKlwwJ@intel.com>
References: <20260525091159.564066-1-ankit.k.nautiyal@intel.com>
 <20260525091159.564066-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525091159.564066-3-ankit.k.nautiyal@intel.com>
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

On Mon, May 25, 2026 at 02:41:59PM +0530, Ankit Nautiyal wrote:
> When the VRR timing generator is always used, the hardware behaves
> as VRR-active regardless of crtc_state->vrr.enable. Return true
> early so DSB picks the VRR path for chicken bits and the delayed
> vblank wait.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index dae8ea33d069..6cbbd23f7327 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -154,11 +154,15 @@ static void dsb_buffer_flush_map(struct intel_dsb *dsb)
>  static bool pre_commit_is_vrr_active(struct intel_atomic_state *state,
>  				     struct intel_crtc *crtc)
>  {
> +	struct intel_display *display = to_intel_display(state);
>  	const struct intel_crtc_state *old_crtc_state =
>  		intel_atomic_get_old_crtc_state(state, crtc);
>  	const struct intel_crtc_state *new_crtc_state =
>  		intel_atomic_get_new_crtc_state(state, crtc);
>  
> +	if (intel_vrr_always_use_vrr_tg(display))
> +		return true;

I don't think we want this check inside pre_commit_is_vrr_active().
It affects too many things.

I guess we have three places where we do want it, so maybe
wrap this into a pre_commit_use_safe_window() for them.

> +
>  	/* VRR will be enabled afterwards, if necessary */
>  	if (intel_crtc_needs_modeset(new_crtc_state))
>  		return false;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
