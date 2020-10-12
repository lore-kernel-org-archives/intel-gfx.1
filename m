Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417E5C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 22:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF36B20797
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 22:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF36B20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA65D6E830;
	Mon, 12 Oct 2020 22:40:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D136E830
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 22:40:23 +0000 (UTC)
IronPort-SDR: CmGBfB13LgRvZ3+6/MsSMohY2wMYMh7mq9J7Xw4PDQU4PhNNz/WkfKMo8cqW15X17Ls0jHOHCl
 dwNyDh1DlIig==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250508957"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="250508957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 15:40:22 -0700
IronPort-SDR: qgyepJHGcjiZhpsLWnl1OhugpulaQJtsu7nGZCbZvjjBaQwVNFEtLFDgVYDqeKMGLTO578IT6d
 J/8qHPkTJwYA==
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="463261600"
Received: from smiththe-mobl.amr.corp.intel.com (HELO [10.251.3.216])
 ([10.251.3.216])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 15:40:21 -0700
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20201012212959.871513-1-lucas.demarchi@intel.com>
 <20201012212959.871513-7-lucas.demarchi@intel.com>
From: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <e005474e-75cb-f8d0-4aff-5fece1682e1b@intel.com>
Date: Mon, 12 Oct 2020 15:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012212959.871513-7-lucas.demarchi@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v7 06/15] drm/i915/dg1: Enable DPLL for DG1
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

On 10/12/20 2:29 PM, Lucas De Marchi wrote:
> Add DG1 DPLL Enable register macro and use the macro to enable the
> correct DPLL based on PLL id. Although we use
> _MG_PLL1_ENABLE/_MG_PLL2_ENABLE these are rather combo phys.
> 
> While at it, fix coding style: wrong newlines and use if/else chain
> 
> v2: Rewrite original patch from Aditya Swarup based on refactors
> upstream
> 
> Bspec: 49443, 49206
> 
> Cc: Clinton Taylor <Clinton.A.Taylor@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Aditya Swarup <aditya.swarup@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 12 ++++++------
>  drivers/gpu/drm/i915/i915_reg.h               |  4 ++++
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 6f093e4e6b43..298321cb2bbc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -151,14 +151,14 @@ static i915_reg_t
>  intel_combo_pll_enable_reg(struct drm_i915_private *i915,
>  			   struct intel_shared_dpll *pll)
>  {
> -
> -	if (IS_ELKHARTLAKE(i915) && (pll->info->id == DPLL_ID_EHL_DPLL4))
> +	if (IS_DG1(i915))
> +		return DG1_DPLL_ENABLE(pll->info->id);
> +	else if (IS_ELKHARTLAKE(i915) && (pll->info->id == DPLL_ID_EHL_DPLL4))
>  		return MG_PLL_ENABLE(0);
> -
> -	return CNL_DPLL_ENABLE(pll->info->id);
> -
> -
> +	else
> +		return CNL_DPLL_ENABLE(pll->info->id);
>  }
> +
>  /**
>   * intel_prepare_shared_dpll - call a dpll's prepare hook
>   * @crtc_state: CRTC, and its state, which has a shared dpll
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0b67c868c51d..49945e33f573 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -10316,6 +10316,10 @@ enum skl_power_gate {
>  #define MG_PLL_ENABLE(tc_port)	_MMIO_PORT((tc_port), _MG_PLL1_ENABLE, \
>  					   _MG_PLL2_ENABLE)
>  
> +/* DG1 PLL */
> +#define DG1_DPLL_ENABLE(pll)    _MMIO_PLL3(pll, DPLL0_ENABLE, DPLL1_ENABLE, \
> +					   _MG_PLL1_ENABLE, _MG_PLL2_ENABLE)
> +
>  #define _MG_REFCLKIN_CTL_PORT1				0x16892C
>  #define _MG_REFCLKIN_CTL_PORT2				0x16992C
>  #define _MG_REFCLKIN_CTL_PORT3				0x16A92C
> 

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
