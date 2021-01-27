Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5C2C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 23:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE49560C41
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 23:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE49560C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A276E88D;
	Wed, 27 Jan 2021 23:15:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD746E88D
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 23:15:38 +0000 (UTC)
IronPort-SDR: GXMOxvLKfI71connQ6Vd4Grsbzfwetvk02KJ5H/Rls9vIjScffHxIlDvkxKSl/f43sBFPjte4o
 GHnbTqLbjs/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="179366621"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="179366621"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 15:15:35 -0800
IronPort-SDR: qUtsEGW/6PS5DMR7uD9A8kUrqopzzumZieOEWGL9mw8LqGERQyxZ2j4CqhWByWNesTU/veBZqR
 7LaoK06JLzIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="362614586"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 27 Jan 2021 15:15:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Jan 2021 01:15:32 +0200
Date: Thu, 28 Jan 2021 01:15:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Message-ID: <YBH0FJolpTwO+BJG@intel.com>
References: <20210127100830.162292-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127100830.162292-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gen9bc: Handle TGP PCH during
 suspend/resume
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
Cc: intel-gfx@lists.freedesktop.org, hariom.pandey@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 03:38:30PM +0530, Tejas Upadhyay wrote:
> For Legacy S3 suspend/resume GEN9 BC needs to enable and
> setup TGP PCH.
> =

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 36 ++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index a31980f69120..6dcefc3e24ac 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -3026,8 +3026,20 @@ static void gen8_irq_reset(struct drm_i915_private=
 *dev_priv)
>  	GEN3_IRQ_RESET(uncore, GEN8_DE_MISC_);
>  	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
>  =

> -	if (HAS_PCH_SPLIT(dev_priv))
> +	if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> +		GEN3_IRQ_RESET(uncore, SDE);
> +	else if (HAS_PCH_SPLIT(dev_priv))
>  		ibx_irq_reset(dev_priv);
> +
> +	/* Wa_14010685332:cnp/cmp,tgp,adp */
> +	if (INTEL_PCH_TYPE(dev_priv) =3D=3D PCH_CNP ||
> +	    (INTEL_PCH_TYPE(dev_priv) >=3D PCH_TGP &&
> +	    INTEL_PCH_TYPE(dev_priv) < PCH_DG1)) {
> +		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> +				 SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
> +		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> +				 SBCLK_RUN_REFCLK_DIS, 0);
> +	}

Time to refactor instead of copypasta.

>  }
>  =

>  static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
> @@ -3442,6 +3454,9 @@ static void spt_hpd_irq_setup(struct drm_i915_priva=
te *dev_priv)
>  	ibx_display_interrupt_update(dev_priv, hotplug_irqs, enabled_irqs);
>  =

>  	spt_hpd_detection_setup(dev_priv);
> +
> +	if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> +		icp_hpd_irq_setup(dev_priv);
>  }
>  =

>  static u32 ilk_hotplug_enables(struct drm_i915_private *i915,
> @@ -3729,9 +3744,19 @@ static void gen8_de_irq_postinstall(struct drm_i91=
5_private *dev_priv)
>  	}
>  }
>  =

> +static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> +{
> +	struct intel_uncore *uncore =3D &dev_priv->uncore;
> +	u32 mask =3D SDE_GMBUS_ICP;
> +
> +	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> +}
> +
>  static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
> -	if (HAS_PCH_SPLIT(dev_priv))
> +	if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> +		icp_irq_postinstall(dev_priv);
> +	else if (HAS_PCH_SPLIT(dev_priv))
>  		ibx_irq_postinstall(dev_priv);
>  =

>  	gen8_gt_irq_postinstall(&dev_priv->gt);
> @@ -3740,13 +3765,6 @@ static void gen8_irq_postinstall(struct drm_i915_p=
rivate *dev_priv)
>  	gen8_master_intr_enable(dev_priv->uncore.regs);
>  }
>  =

> -static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_uncore *uncore =3D &dev_priv->uncore;
> -	u32 mask =3D SDE_GMBUS_ICP;
> -
> -	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> -}
>  =

>  static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
> -- =

> 2.30.0
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
