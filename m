Return-Path: <SRS0=Us6R=MC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36CDC07E95
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 05:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78825613D2
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 05:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78825613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCB86EAD6;
	Sat, 10 Jul 2021 05:41:26 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95A6EAD6
 for <intel-gfx@lists.freedesktop.org>; Sat, 10 Jul 2021 05:41:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="231585007"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="231585007"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 22:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="458574265"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 22:41:23 -0700
Date: Fri, 9 Jul 2021 22:41:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20210710054122.GS951094@mdroper-desk1.amr.corp.intel.com>
References: <20210708211827.288601-1-jose.souza@intel.com>
 <20210708211827.288601-6-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708211827.288601-6-jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/display/adl_p: Correctly
 program MBUS DBOX A credits
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

On Thu, Jul 08, 2021 at 02:18:26PM -0700, Jos=E9 Roberto de Souza wrote:
> Alderlake-P have different values for MBUS DBOX A credits depending
> if MBUS join is enabled or not.
> =

> BSpec: 50343
> BSpec: 54369
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 65ddb6ca16e67..fe380896eb99e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -3400,13 +3400,17 @@ static void glk_pipe_scaler_clock_gating_wa(struc=
t drm_i915_private *dev_priv,
>  	intel_de_write(dev_priv, CLKGATE_DIS_PSL(pipe), val);
>  }
>  =

> -static void icl_pipe_mbus_enable(struct intel_crtc *crtc)
> +static void icl_pipe_mbus_enable(struct intel_crtc *crtc, bool joined_mb=
us)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	enum pipe pipe =3D crtc->pipe;
>  	u32 val;
>  =

> -	val =3D MBUS_DBOX_A_CREDIT(2);
> +	/* Wa_22010947358:adl-p */
> +	if (IS_ALDERLAKE_P(dev_priv))
> +		val =3D joined_mbus ? MBUS_DBOX_A_CREDIT(6) : MBUS_DBOX_A_CREDIT(4);
> +	else
> +		val =3D MBUS_DBOX_A_CREDIT(2);

If we're in single-pipe / joined-mbus mode, then we'll program the
credits to 6.  If we later turn on another pipe, reallocate the DDB, and
turn off joined-mbus mode, we'll set that other pipe's credits to 4
during the sequence of hsw_crtc_enable() -> icl_pipe_mbus_enable().  But
don't we also need to go back re-program the credits down to 4 on the
first pipe too (which is already enabled and won't be re-calling
hsw_crtc_enable())?

I might be missing something; it's been a while since I really looked at
any of the dbuf stuff...


Matt

>  =

>  	if (DISPLAY_VER(dev_priv) >=3D 12) {
>  		val |=3D MBUS_DBOX_BW_CREDIT(2);
> @@ -3561,8 +3565,12 @@ static void hsw_crtc_enable(struct intel_atomic_st=
ate *state,
>  	if (dev_priv->display.initial_watermarks)
>  		dev_priv->display.initial_watermarks(state, crtc);
>  =

> -	if (DISPLAY_VER(dev_priv) >=3D 11)
> -		icl_pipe_mbus_enable(crtc);
> +	if (DISPLAY_VER(dev_priv) >=3D 11) {
> +		const struct intel_dbuf_state *dbuf_state =3D
> +				intel_atomic_get_new_dbuf_state(state);
> +
> +		icl_pipe_mbus_enable(crtc, dbuf_state->joined_mbus);
> +	}
>  =

>  	if (new_crtc_state->bigjoiner_slave)
>  		intel_crtc_vblank_on(new_crtc_state);
> -- =

> 2.32.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

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
