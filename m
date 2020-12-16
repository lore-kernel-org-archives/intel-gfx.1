Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F2BC4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 11:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936E22339F
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 11:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936E22339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11D56E19B;
	Wed, 16 Dec 2020 11:58:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1083D6E19B
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 11:58:32 +0000 (UTC)
IronPort-SDR: fXlizl11l5+ijFIeexordFRWU39yBjSj0wApgZI6Jlb0ekMrkQRDvecFpXsd7d2WVmVeqLIw0L
 jlr4omwmfn4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="162102019"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="162102019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 03:58:31 -0800
IronPort-SDR: KZxBcfGmqkykrXYsdSQEDfuB5Ts6zqlsRrkYE1glv1PRNo8ALBwLX5wjl+KVhFSuNbyOm54ZL9
 3WLMCMCtqbVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="368988503"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 16 Dec 2020 03:58:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Dec 2020 13:58:28 +0200
Date: Wed, 16 Dec 2020 13:58:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <X9n2ZJT+4NzN4tBV@intel.com>
References: <cover.1608117676.git.jani.nikula@intel.com>
 <08c0b7cc1371d98e09861cf53a89db927b12b47f.1608117676.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08c0b7cc1371d98e09861cf53a89db927b12b47f.1608117676.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v4 06/11] drm/i915: refactor pll code out
 into intel_dpll.c
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 01:29:13PM +0200, Jani Nikula wrote:
<snip>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index dfa3966e5fa1..37a9f304cb55 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1811,4 +1811,17 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
>  	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
>  }
>  =

> +static inline bool intel_panel_use_ssc(struct drm_i915_private *dev_priv)
> +{
> +	if (dev_priv->params.panel_use_ssc >=3D 0)
> +		return dev_priv->params.panel_use_ssc !=3D 0;
> +	return dev_priv->vbt.lvds_use_ssc
> +		&& !(dev_priv->quirks & QUIRK_LVDS_SSC_DISABLE);
> +}
> +
> +static inline u32 i9xx_dpll_compute_fp(struct dpll *dpll)
> +{
> +	return dpll->n << 16 | dpll->m1 << 8 | dpll->m2;
> +}

Was wondering why this is here, but looks like it's the i830 pipe power
well thing that needs it.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
