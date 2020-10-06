Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BB2C41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 16:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F6A206D4
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 16:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F6A206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DCE6E49F;
	Tue,  6 Oct 2020 16:22:27 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7A6E49F
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 16:22:25 +0000 (UTC)
IronPort-SDR: XC1Rt1nuy58ru75CTFKSP74bfISsaE+m3B4bPDxkdwAkbHrAdsBO5uCB+PhN9/OlUS1VTXLVeO
 0ICslrYC0HXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="228698820"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="228698820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 09:20:53 -0700
IronPort-SDR: T2z+3f7PhNYTi9WivgrwuE0SM5nHa8NtDh2Q9Xr/7UT0+cqBRHS2GMhQFPOzZBVr1LnYfDeiGy
 FNlE+V7wYryg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="315718927"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 09:20:50 -0700
Date: Tue, 6 Oct 2020 19:20:46 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20201006162046.GA1523425@ideak-desk.fi.intel.com>
References: <20201006143349.5561-1-ville.syrjala@linux.intel.com>
 <20201006143349.5561-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006143349.5561-16-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 15/20] drm/i915: Don't enable hpd detection
 logic from irq_postinstall()
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 05:33:44PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> No reason that I can see why we should enable the hpd detection logic
> already during irq postinstall phase. We don't even do this on all
> the platforms. We just need it before we actually enable the hotplug
> interrupts in .hpd_irq_setup(), and in fact we already do it there as
> well. Let's just eliminate the redundant early setup.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

It's needed by LSPCON resume, which happens before initing HPD
interrupts. I suppose that could be done later, after HPD interrupt init,
I don't see now why it would need to be done at encoder->reset() time.

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 38 +++------------------------------
>  1 file changed, 3 insertions(+), 35 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 0886369e3890..b1c56a29376c 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -3378,8 +3378,8 @@ static void ilk_hpd_irq_setup(struct drm_i915_priva=
te *dev_priv)
>  	ibx_hpd_irq_setup(dev_priv);
>  }
>  =

> -static void __bxt_hpd_detection_setup(struct drm_i915_private *dev_priv,
> -				      u32 enabled_irqs)
> +static void bxt_hpd_detection_setup(struct drm_i915_private *dev_priv,
> +				    u32 enabled_irqs)
>  {
>  	u32 hotplug;
>  =

> @@ -3410,11 +3410,6 @@ static void __bxt_hpd_detection_setup(struct drm_i=
915_private *dev_priv,
>  	I915_WRITE(PCH_PORT_HOTPLUG, hotplug);
>  }
>  =

> -static void bxt_hpd_detection_setup(struct drm_i915_private *dev_priv)
> -{
> -	__bxt_hpd_detection_setup(dev_priv, BXT_DE_PORT_HOTPLUG_MASK);
> -}
> -
>  static void bxt_hpd_irq_setup(struct drm_i915_private *dev_priv)
>  {
>  	u32 hotplug_irqs, enabled_irqs;
> @@ -3424,7 +3419,7 @@ static void bxt_hpd_irq_setup(struct drm_i915_priva=
te *dev_priv)
>  =

>  	bdw_update_port_irq(dev_priv, hotplug_irqs, enabled_irqs);
>  =

> -	__bxt_hpd_detection_setup(dev_priv, enabled_irqs);
> +	bxt_hpd_detection_setup(dev_priv, enabled_irqs);
>  }
>  =

>  static void ibx_irq_postinstall(struct drm_i915_private *dev_priv)
> @@ -3443,12 +3438,6 @@ static void ibx_irq_postinstall(struct drm_i915_pr=
ivate *dev_priv)
>  =

>  	gen3_assert_iir_is_zero(&dev_priv->uncore, SDEIIR);
>  	I915_WRITE(SDEIMR, ~mask);
> -
> -	if (HAS_PCH_IBX(dev_priv) || HAS_PCH_CPT(dev_priv) ||
> -	    HAS_PCH_LPT(dev_priv))
> -		ibx_hpd_detection_setup(dev_priv);
> -	else
> -		spt_hpd_detection_setup(dev_priv);
>  }
>  =

>  static void ilk_irq_postinstall(struct drm_i915_private *dev_priv)
> @@ -3485,8 +3474,6 @@ static void ilk_irq_postinstall(struct drm_i915_pri=
vate *dev_priv)
>  =

>  	gen5_gt_irq_postinstall(&dev_priv->gt);
>  =

> -	ilk_hpd_detection_setup(dev_priv);
> -
>  	ibx_irq_postinstall(dev_priv);
>  =

>  	if (IS_IRONLAKE_M(dev_priv)) {
> @@ -3618,12 +3605,6 @@ static void gen8_de_irq_postinstall(struct drm_i91=
5_private *dev_priv)
>  =

>  		GEN3_IRQ_INIT(uncore, GEN11_DE_HPD_, ~de_hpd_masked,
>  			      de_hpd_enables);
> -		gen11_tc_hpd_detection_setup(dev_priv);
> -		gen11_tbt_hpd_detection_setup(dev_priv);
> -	} else if (IS_GEN9_LP(dev_priv)) {
> -		bxt_hpd_detection_setup(dev_priv);
> -	} else if (IS_BROADWELL(dev_priv)) {
> -		ilk_hpd_detection_setup(dev_priv);
>  	}
>  }
>  =

> @@ -3651,19 +3632,6 @@ static void icp_irq_postinstall(struct drm_i915_pr=
ivate *dev_priv)
>  =

>  	gen3_assert_iir_is_zero(&dev_priv->uncore, SDEIIR);
>  	I915_WRITE(SDEIMR, ~mask);
> -
> -	if (HAS_PCH_TGP(dev_priv)) {
> -		icp_ddi_hpd_detection_setup(dev_priv, TGP_DDI_HPD_ENABLE_MASK);
> -		icp_tc_hpd_detection_setup(dev_priv, TGP_TC_HPD_ENABLE_MASK);
> -	} else if (HAS_PCH_JSP(dev_priv)) {
> -		icp_ddi_hpd_detection_setup(dev_priv, TGP_DDI_HPD_ENABLE_MASK);
> -	} else if (HAS_PCH_MCC(dev_priv)) {
> -		icp_ddi_hpd_detection_setup(dev_priv, ICP_DDI_HPD_ENABLE_MASK);
> -		icp_tc_hpd_detection_setup(dev_priv, ICP_TC_HPD_ENABLE(HPD_PORT_TC1));
> -	} else {
> -		icp_ddi_hpd_detection_setup(dev_priv, ICP_DDI_HPD_ENABLE_MASK);
> -		icp_tc_hpd_detection_setup(dev_priv, ICP_TC_HPD_ENABLE_MASK);
> -	}
>  }
>  =

>  static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
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
