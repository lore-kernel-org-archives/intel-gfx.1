Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E79EE93804
	for <intel-gfx@archiver.kernel.org>; Sun, 12 Apr 2026 21:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEEA10E2D4;
	Sun, 12 Apr 2026 21:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2z0GE7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652C010E2D4
 for <intel-gfx@lists.freedesktop.org>; Sun, 12 Apr 2026 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776030579; x=1807566579;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MpE5b0WtCERkKtmxicAUKZxqnZoe+EjfyzCDVibLBIU=;
 b=l2z0GE7wHAI/u5jri2bzaVN3wAyB1VUMsDVw6TNm6k4Z/3rPZL8Ao86Y
 Xkd1KbWh6PObAgxidvkuLM2YNvTDAQaHENwVZ7xWyjiPt0qfS83zSOw0z
 hoFFZYGTJRDVBVZuiERetbdOso4RhkUEiwRcizayOo/ExF2MePXVXKV6f
 oysZfYq7mlCDjGfqxSjGsD2TV1rPYnOCih55i8q0SKH1cymvrcPIiK/bm
 7KlSWHNOQXhZLw1ONfLCnhV3z5CQCfVsGE7fzs9zNT8XX+rXVe3yGXJUm
 GC6YDpWWNstHyrzKEjqrWeqt+HrKiTdnDhmzBXxMXJ31LGCoKckuejNvN Q==;
X-CSE-ConnectionGUID: EkexMwUxSrSGS0SHfoACVQ==
X-CSE-MsgGUID: ZW4vawJITxCBVMAkwRylYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76877333"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76877333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 14:49:38 -0700
X-CSE-ConnectionGUID: kaCMwo2JQN6pDCVYi9wb1w==
X-CSE-MsgGUID: Cy/WwcWBT4a0EafNACZ+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="225333600"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 14:49:38 -0700
Date: Sun, 12 Apr 2026 23:49:35 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
cc: intel-gfx@lists.freedesktop.org, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH v2 02/10] drm/i915/casf: rename *_coeff*() into *_coef*()
In-Reply-To: <20260411174526.2850179-3-michal.grzelak@intel.com>
Message-ID: <b0953ba5-58f8-b852-b6e5-a80b4ce831ac@intel.com>
References: <20260411174526.2850179-1-michal.grzelak@intel.com>
 <20260411174526.2850179-3-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1829872638-1776030578=:3082509"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1829872638-1776030578=:3082509
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Title starts to make sense after swapping in it coeff <-> coef. Eh.

On Sat, 11 Apr 2026, Michał Grzelak wrote:
> Stick to the notion of already used *_coeff*() instead of *_coef*().
> Rename that way convert_sharpness_coef_binary() and
> intel_casf_scaler_compute_coef().
>
> v1->v2
> - rename intel_casf_scaler_compute_coef()
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_casf.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 9a306aee21994..c4fabffa369e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -88,7 +88,7 @@ static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> 		crtc_state->pch_pfit.casf.win_size = SHARPNESS_FILTER_SIZE_7X7;
> }
>
> -static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state);
> +static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state);
>
> int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> {
> @@ -118,7 +118,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>
> 	intel_casf_compute_win_size(crtc_state);
>
> -	intel_casf_scaler_compute_coef(crtc_state);
> +	intel_casf_scaler_compute_coeff(crtc_state);
>
> 	return 0;
> }
> @@ -196,7 +196,7 @@ static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_state)
> 	}
> }
>
> -static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> +static void convert_sharpness_coeff_binary(struct scaler_filter_coeff *coeff,
> 					  u16 coefficient)
> {
> 	if (coefficient < 25) {
> @@ -214,7 +214,7 @@ static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> 	}
> }
>
> -static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state)
> +static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
> {
> 	const u16 *filtercoeff;
> 	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> @@ -233,7 +233,7 @@ static void intel_casf_scaler_compute_coef(struct intel_crtc_state *crtc_state)
>
> 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> 		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
> -		convert_sharpness_coef_binary(&crtc_state->pch_pfit.casf.coeff[i],
> +		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
> 					      filter_coeff[i]);
> 	}
> }
> -- 
> 2.45.2
>
>
--8323329-1829872638-1776030578=:3082509--
