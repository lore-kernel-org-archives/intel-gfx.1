Return-Path: <SRS0=7o8F=KM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35893C433ED
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 14:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02DF613DA
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 14:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02DF613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681656E987;
	Mon, 17 May 2021 14:13:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67076E984
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 May 2021 14:13:39 +0000 (UTC)
IronPort-SDR: teROTPsx+PQ9t73E7aKnho9b/NVHuTn/PkIxKHjCjzTL7cF9Dgnxbn+mgLw3Jtb0SiWxej8gBY
 QYjPNz8+GCsA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="197390068"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="197390068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 07:13:30 -0700
IronPort-SDR: ijsyNGHmCOlNX1q7sRrWaiCWJwGYDxiD/9NGQDIz/ui5xwsodUBHtzTAah+iIzOZyxHaMGFXpq
 a9NypYvwUJnQ==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="472423722"
Received: from sudhirk1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.50.192])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 07:13:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 intel-gfx@lists.freedesktop.org, hariom.pandey@intel.com
In-Reply-To: <20210513122352.176643-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210513122352.176643-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Mon, 17 May 2021 17:13:25 +0300
Message-ID: <87tun1fny2.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH V2] drm/i915/jsl: Add W/A 1409054076 for JSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 13 May 2021, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> When pipe A is disabled and MIPI DSI is enabled on pipe B,
> the AMT KVMR feature will incorrectly see pipe A as enabled.
> Set 0x42080 bit 23=1 before enabling DSI on pipe B and leave
> it set while DSI is enabled on pipe B. No impact to setting
> it all the time.
>
> Changes since V1:
> 	- ./dim checkpatch errors addressed
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 38 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h        |  1 +
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index ce544e20f35c..e5a6660861e8 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -40,6 +40,8 @@
>  #include "skl_scaler.h"
>  #include "skl_universal_plane.h"
>  
> +static bool gen11_dsi_get_hw_state(struct intel_encoder *encoder,
> +				   enum pipe *pipe);
>  static int header_credits_available(struct drm_i915_private *dev_priv,
>  				    enum transcoder dsi_trans)
>  {
> @@ -1036,9 +1038,26 @@ static void gen11_dsi_enable_transcoder(struct intel_encoder *encoder)
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
>  	enum port port;
> +	enum pipe pipe;
>  	enum transcoder dsi_trans;
>  	u32 tmp;
>  
> +	/*
> +	 * WA 1409054076:JSL
> +	 * When pipe A is disabled and MIPI DSI is enabled on pipe B,
> +	 * the AMT KVMR feature will incorrectly see pipe A as enabled.
> +	 * Set 0x42080 bit 23=1 before enabling DSI on pipe B and leave
> +	 * it set while DSI is enabled on pipe B
> +	 */
> +	gen11_dsi_get_hw_state(encoder, &pipe);

That function is only for reading the state for taking over hardware
state at probe and hardware/software state verification after modeset.

It reads the state that is being set later in this function, so it's
never going to be correct here! Also, we try not to do stuff based on
the hardware state, but rather the software state.

> +	if (IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) &&
> +	    pipe == PIPE_B &&
> +	    dev_priv->active_pipes != BIT(PIPE_A) &&
> +	    !(intel_de_read(dev_priv, CHICKEN_PAR1_1) &
> +			    IGNORE_KVMR_PIPE_A)) {
> +		intel_de_write(dev_priv, CHICKEN_PAR1_1,
> +			       intel_de_read(dev_priv, CHICKEN_PAR1_1) | IGNORE_KVMR_PIPE_A);
> +	}

As far as I understand the explanation, we can set this regardless of
whether pipe A is disabled or not, and we can just set it based on where
DSI is enabled.

It should probably also be IS_JSL_EHL().

With pipe from new_crtc_state:

	if (IS_JSL_EHL(dev_priv) && pipe == PIPE_B)
        	intel_de_rmw(dev_priv, CHICKEN_PAR1_1, 0, IGNORE_KVMR_PIPE_A);

To disable, with pipe from old_crtc_state:

	if (IS_JSL_EHL(dev_priv) && pipe == PIPE_B)
        	intel_de_rmw(dev_priv, CHICKEN_PAR1_1, IGNORE_KVMR_PIPE_A, 0);

At the right locations.

>  	for_each_dsi_port(port, intel_dsi->ports) {
>  		dsi_trans = dsi_port_to_transcoder(port);
>  		tmp = intel_de_read(dev_priv, PIPECONF(dsi_trans));
> @@ -1245,6 +1264,7 @@ static void gen11_dsi_enable(struct intel_atomic_state *state,
>  
>  	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
>  
> +
>  	/* step6d: enable dsi transcoder */
>  	gen11_dsi_enable_transcoder(encoder);
>  
> @@ -1260,9 +1280,27 @@ static void gen11_dsi_disable_transcoder(struct intel_encoder *encoder)
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
>  	enum port port;
> +	enum pipe pipe;
>  	enum transcoder dsi_trans;
>  	u32 tmp;
>  
> +	/*
> +	 * WA 1409054076:JSL
> +	 * When pipe A is disabled and MIPI DSI is enabled on pipe B,
> +	 * the AMT KVMR feature will incorrectly see pipe A as enabled.
> +	 * Set 0x42080 bit 23=1 before enabling DSI on pipe B and leave
> +	 * it set while DSI is enabled on pipe B
> +	 */
> +	gen11_dsi_get_hw_state(encoder, &pipe);
> +	if (IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) &&
> +	    pipe == PIPE_B &&
> +	    dev_priv->active_pipes != BIT(PIPE_A) &&
> +	    (intel_de_read(dev_priv, CHICKEN_PAR1_1) &
> +			   IGNORE_KVMR_PIPE_A)) {
> +		intel_de_write(dev_priv, CHICKEN_PAR1_1,
> +			       intel_de_read(dev_priv, CHICKEN_PAR1_1) &
> +						!IGNORE_KVMR_PIPE_A);
> +	}
>  	for_each_dsi_port(port, intel_dsi->ports) {
>  		dsi_trans = dsi_port_to_transcoder(port);
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 871d839dfcb8..8b67cd14ff7e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8039,6 +8039,7 @@ enum {
>  # define CHICKEN3_DGMG_DONE_FIX_DISABLE		(1 << 2)
>  
>  #define CHICKEN_PAR1_1			_MMIO(0x42080)
> +#define  IGNORE_KVMR_PIPE_A		BIT(23)

REG_BIT(), not BIT(). Please read the big comment near the top of the
file. Please observe the REG_BIT() on the very next line.

>  #define  KBL_ARB_FILL_SPARE_22		REG_BIT(22)
>  #define  DIS_RAM_BYPASS_PSR2_MAN_TRACK	(1 << 16)
>  #define  SKL_DE_COMPRESSED_HASH_MODE	(1 << 15)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
