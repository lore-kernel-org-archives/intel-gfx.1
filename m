Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F246C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11D160720
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 15:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D11D160720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674246E155;
	Thu, 29 Jul 2021 15:08:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E02F6E155
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 15:08:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212628260"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="212628260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 08:08:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="476429469"
Received: from mburby-mobl.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.255.228.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 08:08:17 -0700
Date: Thu, 29 Jul 2021 08:08:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>;,
	intel-gfx@lists.freedesktop.org
Message-ID: <20210729150803.GB3816@msatwood-mobl>
References: <20210723174239.1551352-1-matthew.d.roper@intel.com>
 <20210723174239.1551352-22-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723174239.1551352-22-matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 21/30] drm/i915/dg2: Report INSTDONE_GEOM
 values in error state
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

On Fri, Jul 23, 2021 at 10:42:30AM -0700, Matt Roper wrote:
> Xe_HPG adds some additional INSTDONE_GEOM debug registers; the Mesa team
> has indicated that having these reported in the error state would be
> useful for debugging GPU hangs.  These registers are replicated per-DSS
> with gslice steering.
> 
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  7 +++++++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h |  3 +++
>  drivers/gpu/drm/i915/i915_gpu_error.c        | 10 ++++++++--
>  drivers/gpu/drm/i915/i915_reg.h              |  1 +
>  4 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index fc8538ce47ae..71f6e7d7c3b9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1211,6 +1211,13 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
>  							  GEN7_ROW_INSTDONE);
>  			}
>  		}
> +
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
> +			for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice)
> +				instdone->geom_svg[slice][subslice] =
> +					read_subslice_reg(engine, slice, subslice,
> +							  XEHPG_INSTDONE_GEOM_SVG);
> +		}
>  	} else if (GRAPHICS_VER(i915) >= 7) {
>  		instdone->instdone =
>  			intel_uncore_read(uncore, RING_INSTDONE(mmio_base));
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index b23d76ceea0e..8f9e79074c1c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -76,6 +76,9 @@ struct intel_instdone {
>  	u32 slice_common_extra[2];
>  	u32 sampler[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
>  	u32 row[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
> +
> +	/* Added in XeHPG */
> +	u32 geom_svg[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index c1e744b5ab47..4de7edc451ef 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -431,6 +431,7 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
>  	const struct sseu_dev_info *sseu = &ee->engine->gt->info.sseu;
>  	int slice;
>  	int subslice;
> +	int iter;
>  
>  	err_printf(m, "  INSTDONE: 0x%08x\n",
>  		   ee->instdone.instdone);
> @@ -445,8 +446,6 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
>  		return;
>  
>  	if (GRAPHICS_VER_FULL(m->i915) >= IP_VER(12, 50)) {
> -		int iter;
> -
>  		for_each_instdone_gslice_dss_xehp(m->i915, sseu, iter, slice, subslice)
>  			err_printf(m, "  SAMPLER_INSTDONE[%d][%d]: 0x%08x\n",
>  				   slice, subslice,
> @@ -471,6 +470,13 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
>  	if (GRAPHICS_VER(m->i915) < 12)
>  		return;
>  
> +	if (GRAPHICS_VER_FULL(m->i915) >= IP_VER(12, 55)) {
> +		for_each_instdone_gslice_dss_xehp(m->i915, sseu, iter, slice, subslice)
> +			err_printf(m, "  GEOM_SVGUNIT_INSTDONE[%d][%d]: 0x%08x\n",
> +				   slice, subslice,
> +				   ee->instdone.geom_svg[slice][subslice]);
> +	}
> +
>  	err_printf(m, "  SC_INSTDONE_EXTRA: 0x%08x\n",
>  		   ee->instdone.slice_common_extra[0]);
>  	err_printf(m, "  SC_INSTDONE_EXTRA2: 0x%08x\n",
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index b6ffdb89db6f..45cc76f88738 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2686,6 +2686,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define GEN12_SC_INSTDONE_EXTRA2	_MMIO(0x7108)
>  #define GEN7_SAMPLER_INSTDONE	_MMIO(0xe160)
>  #define GEN7_ROW_INSTDONE	_MMIO(0xe164)
> +#define XEHPG_INSTDONE_GEOM_SVG		_MMIO(0x666c)
>  #define MCFG_MCR_SELECTOR		_MMIO(0xfd0)
>  #define SF_MCR_SELECTOR			_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR		_MMIO(0xfdc)
> -- 
> 2.25.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
