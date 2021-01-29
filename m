Return-Path: <SRS0=0PWK=HA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAF0C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 15:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EE564DE9
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EE564DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA226EB5C;
	Fri, 29 Jan 2021 15:24:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCD26EB5C
 for <intel-gfx@lists.freedesktop.org>; Fri, 29 Jan 2021 15:23:59 +0000 (UTC)
IronPort-SDR: KSQ39BMFQZAs5kZ+pZ5Tu8ZfI0LMgBPIUhqTI9j5VFwb7SK5iV+Lgwisrpk4pnunYveTM6wYcf
 B04N2iBJlrUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="168104172"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; d="scan'208";a="168104172"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 07:23:58 -0800
IronPort-SDR: q0AEnp3gNMfqRGDU3yT/KSIPsdDdiEMtMM+x96w08SWI9e0XcWZWRpuY75c4vAOn6heGSMTi2f
 Hu9ttNFOp8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; d="scan'208";a="357823741"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 29 Jan 2021 07:23:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Jan 2021 17:23:55 +0200
Date: Fri, 29 Jan 2021 17:23:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <YBQoi1ACbfpQi7AV@intel.com>
References: <20210127084534.24406-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127084534.24406-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/bios: tidy up child device debug
 logging
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

On Wed, Jan 27, 2021 at 10:45:34AM +0200, Jani Nikula wrote:
> Make the child device details easier to read by turning this:
> =

> [drm:parse_ddi_port [i915]] Port B VBT info: CRT:0 DVI:1 HDMI:1 DP:0 eDP:=
0 LSPCON:0 USB-Type-C:0 TBT:0 DSC:0
> [drm:parse_ddi_port [i915]] VBT HDMI level shift for port B: 8
> [drm:parse_ddi_port [i915]] VBT DP max link rate for port B: 810000
> [drm:parse_ddi_port [i915]] Port C VBT info: CRT:0 DVI:1 HDMI:1 DP:1 eDP:=
0 LSPCON:0 USB-Type-C:0 TBT:0 DSC:0
> [drm:parse_ddi_port [i915]] VBT HDMI level shift for port C: 8
> [drm:parse_ddi_port [i915]] VBT (e)DP boost level for port C: 3
> [drm:parse_ddi_port [i915]] VBT HDMI boost level for port C: 1
> [drm:parse_ddi_port [i915]] VBT DP max link rate for port C: 810000
> =

> into this:
> =

> [drm:parse_ddi_port [i915]] Port B VBT info: CRT:0 DVI:1 HDMI:1 DP:0 eDP:=
0 LSPCON:0 USB-Type-C:0 TBT:0 DSC:0
> [drm:parse_ddi_port [i915]] Port B VBT HDMI level shift: 8
> [drm:parse_ddi_port [i915]] Port B VBT DP max link rate: 810000
> [drm:parse_ddi_port [i915]] Port C VBT info: CRT:0 DVI:1 HDMI:1 DP:1 eDP:=
0 LSPCON:0 USB-Type-C:0 TBT:0 DSC:0
> [drm:parse_ddi_port [i915]] Port C VBT HDMI level shift: 8
> [drm:parse_ddi_port [i915]] Port C VBT (e)DP boost level: 3
> [drm:parse_ddi_port [i915]] Port C VBT HDMI boost level: 1
> [drm:parse_ddi_port [i915]] Port C VBT DP max link rate: 810000
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 04337ac6f8c4..796d6be0ba5d 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1829,7 +1829,7 @@ static void parse_ddi_port(struct drm_i915_private =
*dev_priv,
>  		/* The VBT HDMI level shift values match the table we have. */
>  		u8 hdmi_level_shift =3D child->hdmi_level_shifter_value;
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "VBT HDMI level shift for port %c: %d\n",
> +			    "Port %c VBT HDMI level shift: %d\n",
>  			    port_name(port),
>  			    hdmi_level_shift);
>  		info->hdmi_level_shift =3D hdmi_level_shift;
> @@ -1856,7 +1856,7 @@ static void parse_ddi_port(struct drm_i915_private =
*dev_priv,
>  =

>  		if (max_tmds_clock)
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "VBT HDMI max TMDS clock for port %c: %d kHz\n",
> +				    "Port %c VBT HDMI max TMDS clock: %d kHz\n",
>  				    port_name(port), max_tmds_clock);
>  		info->max_tmds_clock =3D max_tmds_clock;
>  	}
> @@ -1865,11 +1865,11 @@ static void parse_ddi_port(struct drm_i915_privat=
e *dev_priv,
>  	if (bdb_version >=3D 196 && child->iboost) {
>  		info->dp_boost_level =3D translate_iboost(child->dp_iboost_level);
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "VBT (e)DP boost level for port %c: %d\n",
> +			    "Port %c VBT (e)DP boost level: %d\n",
>  			    port_name(port), info->dp_boost_level);
>  		info->hdmi_boost_level =3D translate_iboost(child->hdmi_iboost_level);
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "VBT HDMI boost level for port %c: %d\n",
> +			    "Port %c VBT HDMI boost level: %d\n",
>  			    port_name(port), info->hdmi_boost_level);
>  	}
>  =

> @@ -1891,7 +1891,7 @@ static void parse_ddi_port(struct drm_i915_private =
*dev_priv,
>  			break;
>  		}
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "VBT DP max link rate for port %c: %d\n",
> +			    "Port %c VBT DP max link rate: %d\n",
>  			    port_name(port), info->dp_max_link_rate);
>  	}
>  =

> -- =

> 2.20.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
