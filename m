Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0DCC4320A
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 10:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D37760F55
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 10:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D37760F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C45A6EAD3;
	Mon, 26 Jul 2021 10:09:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BCC6EA9F;
 Mon, 26 Jul 2021 10:09:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="297775391"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="297775391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:09:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="504839476"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:09:32 -0700
Date: Mon, 26 Jul 2021 06:09:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <YP6J208qFZWZKnJ3@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-30-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-30-lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 29/30] drm/i915: replace random CNL comments
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:13PM -0700, Lucas De Marchi wrote:
> Cleanup remaining cases that we find CNL in the codebase.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c     | 2 +-
>  drivers/gpu/drm/i915/display/intel_display.c  | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c   | 1 -
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 1 -
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
>  drivers/gpu/drm/i915/intel_device_info.h      | 2 +-
>  6 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 4172c8ee6aa6..e86e6ed2d3bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1998,7 +1998,7 @@ static void parse_ddi_port(struct drm_i915_private *i915,
>  			    "Port %c VBT HDMI boost level: %d\n",
>  			    port_name(port), hdmi_boost_level);
>  
> -	/* DP max link rate for CNL+ */
> +	/* DP max link rate for GLK+ */
>  	if (i915->vbt.version >= 216) {
>  		if (i915->vbt.version >= 230)
>  			info->dp_max_link_rate = parse_bdb_230_dp_max_link_rate(child->dp_max_link_rate);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index ee6d5f8de24b..b49bf380baab 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9778,7 +9778,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
>  
>  		/*
>  		 * FIXME: This check is kept generic for all platforms.
> -		 * Need to verify this for all gen9 and gen10 platforms to enable
> +		 * Need to verify this for all gen9 platforms to enable
>  		 * this selectively if required.
>  		 */
>  		switch (new_plane_state->hw.fb->modifier) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 7c048d2ecf43..f483f479dd0b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -158,7 +158,6 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>  	/*
>  	 * Max timeout values:
>  	 * SKL-GLK: 1.6ms
> -	 * CNL: 3.2ms
>  	 * ICL+: 4ms
>  	 */
>  	ret = DP_AUX_CH_CTL_SEND_BUSY |
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> index 7fd031a70cfd..6b19f74efd61 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> @@ -206,7 +206,6 @@ struct intel_dpll_hw_state {
>  
>  	/* cnl */
>  	u32 cfgcr0;
> -	/* CNL also uses cfgcr1 */
>  
>  	/* bxt */
>  	u32 ebb0, ebb4, pll0, pll1, pll2, pll3, pll6, pll8, pll9, pll10, pcsdw12;
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> index dbe24d7e7375..330077c2e588 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -456,7 +456,7 @@ struct child_device_config {
>  	u16 dp_gpio_pin_num;					/* 195 */
>  	u8 dp_iboost_level:4;					/* 196 */
>  	u8 hdmi_iboost_level:4;					/* 196 */
> -	u8 dp_max_link_rate:3;					/* 216/230 CNL+ */
> +	u8 dp_max_link_rate:3;					/* 216/230 GLK+ */
>  	u8 dp_max_link_rate_reserved:5;				/* 216/230 */
>  } __packed;
>  
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 057c9aa6f9c6..ef1eecd259e0 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -103,7 +103,7 @@ enum intel_platform {
>  #define INTEL_SUBPLATFORM_ULT	(0)
>  #define INTEL_SUBPLATFORM_ULX	(1)
>  
> -/* CNL/ICL */
> +/* ICL */
>  #define INTEL_SUBPLATFORM_PORTF	(0)
>  
>  /* DG2 */
> -- 
> 2.31.1
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
