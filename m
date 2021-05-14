Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBDCC433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 17:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5854C6144A
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 17:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5854C6144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15ED6F3AE;
	Fri, 14 May 2021 17:20:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9206F3AE
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 May 2021 17:20:43 +0000 (UTC)
IronPort-SDR: UBlt+tTmjQ3eCEFldHvL4PX8u/zgGHQwKr2Em4iWq5UeQbS3I9JiUaALMm8+/qH1iD4Rf4pZf8
 u8GTtejKnTQw==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="285735247"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="285735247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 10:20:42 -0700
IronPort-SDR: 6gPR36Dm5qY0F58jvmO33A8biRSvRNUQdUr/g+KJHLjqVOyNSQj1K3AvsezS6SA5EVif/Mz4Se
 WdULL/H2P6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="402257485"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 14 May 2021 10:20:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 May 2021 20:20:39 +0300
Date: Fri, 14 May 2021 20:20:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <YJ6xZ+WNrhO5n0wM@intel.com>
References: <cover.1620825897.git.jani.nikula@intel.com>
 <b145dbc20c3051f18795ed72848cba02503a2475.1620825897.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b145dbc20c3051f18795ed72848cba02503a2475.1620825897.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/panel: mass rename functions
 to have intel_panel_ prefix
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

On Wed, May 12, 2021 at 04:30:46PM +0300, Jani Nikula wrote:
> Follow the usual naming conventions. Also pull HAS_GMCH() check to
> intel_panel_fitting(). No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c     |  4 ++--
>  drivers/gpu/drm/i915/display/intel_dp.c    |  9 +++-----
>  drivers/gpu/drm/i915/display/intel_dvo.c   |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c  |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c  |  7 ++----
>  drivers/gpu/drm/i915/display/intel_panel.c | 25 ++++++++++++++++------
>  drivers/gpu/drm/i915/display/intel_panel.h |  8 +++----
>  drivers/gpu/drm/i915/display/vlv_dsi.c     |  7 ++----
>  8 files changed, 32 insertions(+), 32 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index da1b00859f3b..024b2e2107d5 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1594,9 +1594,9 @@ static int gen11_dsi_compute_config(struct intel_en=
coder *encoder,
>  	int ret;
>  =

>  	pipe_config->output_format =3D INTEL_OUTPUT_FORMAT_RGB;
> -	intel_fixed_panel_mode(fixed_mode, adjusted_mode);
> +	intel_panel_fixed_mode(fixed_mode, adjusted_mode);
>  =

> -	ret =3D intel_pch_panel_fitting(pipe_config, conn_state);
> +	ret =3D intel_panel_fitting(pipe_config, conn_state);
>  	if (ret)
>  		return ret;
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index efb7a249393c..5624f3fad859 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1652,7 +1652,7 @@ intel_dp_compute_config(struct intel_encoder *encod=
er,
>  							    adjusted_mode);
>  =

>  	if (pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420) {
> -		ret =3D intel_pch_panel_fitting(pipe_config, conn_state);
> +		ret =3D intel_panel_fitting(pipe_config, conn_state);
>  		if (ret)
>  			return ret;
>  	}
> @@ -1665,13 +1665,10 @@ intel_dp_compute_config(struct intel_encoder *enc=
oder,
>  		pipe_config->has_audio =3D intel_conn_state->force_audio =3D=3D HDMI_A=
UDIO_ON;
>  =

>  	if (intel_dp_is_edp(intel_dp) && intel_connector->panel.fixed_mode) {
> -		intel_fixed_panel_mode(intel_connector->panel.fixed_mode,
> +		intel_panel_fixed_mode(intel_connector->panel.fixed_mode,
>  				       adjusted_mode);
>  =

> -		if (HAS_GMCH(dev_priv))
> -			ret =3D intel_gmch_panel_fitting(pipe_config, conn_state);
> -		else
> -			ret =3D intel_pch_panel_fitting(pipe_config, conn_state);
> +		ret =3D intel_panel_fitting(pipe_config, conn_state);

Hmm. I though there was something a bit more subtle going on here...
Ah, I think I'm recalling the tv margin stuff that's still sitting
in my branch. That will need to make a bit of distinction between
gmch vs. not here, but this should be fine even then.

Series is more or less
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
(didn't read the code motion patch too closely).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
