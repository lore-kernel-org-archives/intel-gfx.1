Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAD1C433C1
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 15:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632576198D
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 15:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632576198D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ED96E4DE;
	Mon, 22 Mar 2021 15:19:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E286E4DE
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 15:19:30 +0000 (UTC)
IronPort-SDR: mFZkAp7jeCzfdmuZFYAA8ijuuOwHOO2r1pXW732W7+VLKPas2n2bwUE1e87prWWwOsK8sArTtf
 B87PnXtkUtGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210359845"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210359845"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 08:19:29 -0700
IronPort-SDR: L6plhl374j1gBGP6Opyvle5I9KeFqFbQyum7rqk3mo3/R3orWCc3NNc2M2NHXfqUVe2yqdGIrT
 0UOH1yrnPupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="513347213"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 22 Mar 2021 08:19:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Mar 2021 17:19:26 +0200
Date: Mon, 22 Mar 2021 17:19:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YFi1fqa1wsqm6Gn4@intel.com>
References: <20210320044245.3920043-1-matthew.d.roper@intel.com>
 <20210320044245.3920043-7-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320044245.3920043-7-matthew.d.roper@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/display: Simplify GLK display
 version tests
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
Cc: intel-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 09:42:45PM -0700, Matt Roper wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 4be848d0d156..eb1121e05c0d 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1433,7 +1433,7 @@ static void bxt_get_cdclk(struct drm_i915_private *=
dev_priv,
>  		break;
>  	case BXT_CDCLK_CD2X_DIV_SEL_1_5:
>  		drm_WARN(&dev_priv->drm,
> -			 IS_GEMINILAKE(dev_priv) || DISPLAY_VER(dev_priv) >=3D 10,
> +			 DISPLAY_VER(dev_priv) >=3D 10,
>  			 "Unsupported divider\n");
>  		div =3D 3;
>  		break;
> @@ -1591,7 +1591,7 @@ static void bxt_set_cdclk(struct drm_i915_private *=
dev_priv,
>  		break;
>  	case 3:
>  		drm_WARN(&dev_priv->drm,
> -			 IS_GEMINILAKE(dev_priv) || DISPLAY_VER(dev_priv) >=3D 10,
> +			 DISPLAY_VER(dev_priv) >=3D 10,
>  			 "Unsupported divider\n");
>  		divider =3D BXT_CDCLK_CD2X_DIV_SEL_1_5;
>  		break;

Looks like you still end up with the wrong thing here for the case 8?
Atm it has a gen>=3D10 check, after this it should have gen>=3D11||is_cnl.

The approach I was thinking should work for this would be somehting
along the lines of:
gen>9 -> gen>=3D10
gen>=3D10 -> gen>=3D11||is_cnl
is_cnl||is_glk -> gen10
gen>=3D11||gen10 -> gen>=3D10

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
