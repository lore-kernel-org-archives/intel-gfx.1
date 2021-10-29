Return-Path: <SRS0=3Rq4=PR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA02C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 14:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47F0610FD
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 14:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B47F0610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588F56E110;
	Fri, 29 Oct 2021 14:58:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29F16E110
 for <intel-gfx@lists.freedesktop.org>; Fri, 29 Oct 2021 14:58:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217593214"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="217593214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 07:58:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="448138948"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 07:58:26 -0700
Date: Fri, 29 Oct 2021 17:58:22 +0300
From: Imre Deak <imre.deak@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <20211029145822.GF3194662@ideak-desk.fi.intel.com>
References: <20211028230449.115832-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028230449.115832-1-jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/adlp: Implement workaround
 16013190616
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 04:04:49PM -0700, José Roberto de Souza wrote:
> New workaround added to specification, requiring bit 15 of
> GEN8_CHICKEN_DCPR_1 to be programed before power well 1 is enabled.
> 
> BSpec: 54369
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

The spec doesn't require it, so probably not re-enabling clock gating
after disabling PW#1 won't cause a problem somewhere else. But if so
the wa would be better placed in adlp_init_clock_gating().

> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 5 +++++
>  drivers/gpu/drm/i915/i915_reg.h                    | 7 ++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 6637760d24e0c..344e3d6967020 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -435,6 +435,11 @@ static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
>  
>  		pg = DISPLAY_VER(dev_priv) >= 11 ? ICL_PW_CTL_IDX_TO_PG(pw_idx) :
>  						 SKL_PW_CTL_IDX_TO_PG(pw_idx);
> +
> +		/* Wa_16013190616:adlp */
> +		if (IS_ALDERLAKE_P(dev_priv) && pg == SKL_PG1)
> +			intel_de_rmw(dev_priv, GEN8_CHICKEN_DCPR_1, 0, DISABLE_FLR_SRC);
> +
>  		/*
>  		 * For PW1 we have to wait both for the PW0/PG0 fuse state
>  		 * before enabling the power well and PW1/PG1's own fuse
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index fd58757e846a6..541c16aee90da 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8310,9 +8310,10 @@ enum {
>  #define  RESET_PCH_HANDSHAKE_ENABLE	(1 << 4)
>  
>  #define GEN8_CHICKEN_DCPR_1		_MMIO(0x46430)
> -#define   SKL_SELECT_ALTERNATE_DC_EXIT	(1 << 30)
> -#define   ICL_DELAY_PMRSP		(1 << 22)
> -#define   MASK_WAKEMEM			(1 << 13)
> +#define   SKL_SELECT_ALTERNATE_DC_EXIT	REG_BIT(30)
> +#define   ICL_DELAY_PMRSP		REG_BIT(22)
> +#define   DISABLE_FLR_SRC		REG_BIT(15)
> +#define   MASK_WAKEMEM			REG_BIT(13)
>  
>  #define GEN11_CHICKEN_DCPR_2			_MMIO(0x46434)
>  #define   DCPR_MASK_MAXLATENCY_MEMUP_CLR	REG_BIT(27)
> -- 
> 2.33.1
> 
