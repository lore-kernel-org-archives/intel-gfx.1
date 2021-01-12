Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684DAC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 03:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B014229CA
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 03:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B014229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2888E38;
	Tue, 12 Jan 2021 03:54:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3B488E38
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 03:54:44 +0000 (UTC)
IronPort-SDR: foAmvIwH8DVbS6fn+O73aaCppsANhqqMfYl8amgkA61PJVYewXLG3TkIdjlNXXfVzui2d+xRzE
 Fs4/TBJod1Ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157754026"
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; d="scan'208";a="157754026"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 19:54:43 -0800
IronPort-SDR: dLh7w5KfcI1B/Ew5yv/1o8OOXqFXplr7fEeYn7FGsHO1GL38AaVQMlWQe7+EXUDLr38IIfspjI
 ZaiJGFtelQLg==
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; d="scan'208";a="363365948"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 19:54:43 -0800
Date: Mon, 11 Jan 2021 19:54:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20210112035442.GD21197@mdroper-desk1.amr.corp.intel.com>
References: <20201205010844.361880-1-aditya.swarup@intel.com>
 <20201205010844.361880-11-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205010844.361880-11-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 10/22] drm/i915/adl_s: Initialize display
 for ADL-S
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 05:08:32PM -0800, Aditya Swarup wrote:
> Initialize display outputs for ADL-S. ADL-S has 5 display
> outputs -> 1 eDP, 2 HDMI and 2 DP++ outputs.
> =

> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Aditya Swarup <aditya.swarup@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 0ff0eeabab8c..19ed51e6c647 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -17627,7 +17627,13 @@ static void intel_setup_outputs(struct drm_i915_=
private *dev_priv)
>  	if (!HAS_DISPLAY(dev_priv))
>  		return;
>  =

> -	if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv)) {
> +	if (IS_ALDERLAKE_S(dev_priv)) {
> +		intel_ddi_init(dev_priv, PORT_A);
> +		intel_ddi_init(dev_priv, PORT_D);	/* DDI TC1 */

It all comes out the same in the end, but we should just pass PORT_TC1
and such for these outputs since that's the formal name in the bspec
(and matches how we handle RKL/DG1 that also have "TC" DDIs that are
actually combo PHYs).


Matt

> +		intel_ddi_init(dev_priv, PORT_E);	/* DDI TC2 */
> +		intel_ddi_init(dev_priv, PORT_F);	/* DDI TC3 */
> +		intel_ddi_init(dev_priv, PORT_G);	/* DDI TC4 */
> +	} else if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv)) {
>  		intel_ddi_init(dev_priv, PORT_A);
>  		intel_ddi_init(dev_priv, PORT_B);
>  		intel_ddi_init(dev_priv, PORT_TC1);
> -- =

> 2.27.0
> =


-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
