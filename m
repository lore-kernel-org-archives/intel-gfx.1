Return-Path: <SRS0=JclI=ET=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B5BC55ABD
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 15:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3525822261
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 15:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3525822261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48F56E4DD;
	Fri, 13 Nov 2020 15:23:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B1A6E4DD
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 15:23:57 +0000 (UTC)
IronPort-SDR: +9ezGAudHIV4M72JgkhScMt+w5G3SHw5GgLFexJlKwjMxs/2MqIalHwTQvWqHaUEey7/G1Dqq9
 x71zv17MBpkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="167907557"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="167907557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 07:23:56 -0800
IronPort-SDR: LdTlcpi3Bpx/VLTO31hoY+n6zWDQxtVdt8twY2V9o5ngoHw2hr2rBhqMQF5joPGqf8P0OVDkoC
 CpGdQ9tGEapg==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="542687291"
Received: from unknown (HELO intel.com) ([10.237.72.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 07:23:54 -0800
Date: Fri, 13 Nov 2020 17:24:31 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20201113152431.GA17194@intel.com>
References: <20201106173042.7534-1-ville.syrjala@linux.intel.com>
 <20201106173042.7534-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106173042.7534-7-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915: Remove
 skl_adjusted_plane_pixel_rate()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 07:30:42PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Replace skl_adjusted_plane_pixel_rate() with the generic
> intel_plane_pixel_rate(). The two should produce identical
> results.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> =

> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index 8865f37d6297..bc59dc8f44e0 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_plane_helper.h>
>  =

>  #include "display/intel_atomic.h"
> +#include "display/intel_atomic_plane.h"
>  #include "display/intel_bw.h"
>  #include "display/intel_display_types.h"
>  #include "display/intel_fbc.h"
> @@ -5102,30 +5103,6 @@ intel_get_linetime_us(const struct intel_crtc_stat=
e *crtc_state)
>  	return linetime_us;
>  }
>  =

> -static u32
> -skl_adjusted_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
> -			      const struct intel_plane_state *plane_state)
> -{
> -	struct drm_i915_private *dev_priv =3D to_i915(crtc_state->uapi.crtc->de=
v);
> -	u64 adjusted_pixel_rate;
> -	uint_fixed_16_16_t downscale_amount;
> -
> -	/* Shouldn't reach here on disabled planes... */
> -	if (drm_WARN_ON(&dev_priv->drm,
> -			!intel_wm_plane_visible(crtc_state, plane_state)))
> -		return 0;
> -
> -	/*
> -	 * Adjusted plane pixel rate is just the pipe's adjusted pixel rate
> -	 * with additional adjustments for plane-specific scaling.
> -	 */
> -	adjusted_pixel_rate =3D crtc_state->pixel_rate;
> -	downscale_amount =3D skl_plane_downscale_amount(crtc_state, plane_state=
);
> -
> -	return mul_round_up_u32_fixed16(adjusted_pixel_rate,
> -					    downscale_amount);
> -}
> -
>  static int
>  skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
>  		      int width, const struct drm_format_info *format,
> @@ -5238,7 +5215,7 @@ skl_compute_plane_wm_params(const struct intel_crtc=
_state *crtc_state,
>  	return skl_compute_wm_params(crtc_state, width,
>  				     fb->format, fb->modifier,
>  				     plane_state->hw.rotation,
> -				     skl_adjusted_plane_pixel_rate(crtc_state, plane_state),
> +				     intel_plane_pixel_rate(crtc_state, plane_state),
>  				     wp, color_plane);
>  }
>  =

> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
