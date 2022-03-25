Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A3FC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Mar 2022 14:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3089210E20C;
	Fri, 25 Mar 2022 14:32:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F062E10E20C
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Mar 2022 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648218732; x=1679754732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a+pY/oRuO+jdniTI5NY1rKx3c5up31sdV8sXEe4zrGQ=;
 b=IkvMNedQ7Kh+o76luDwlGz6ARxlepEcRepuJpauWJbXatsk6+3HvwdVc
 +79HjLkqKIjiVesPC6rmG5Bj7YjyxuG/ZLeYAwovIYxCe0hOZQp1RlbIA
 kOr/k2HR1xi/PJEwGFG98cTn3QwAB7PGTW3cnVmsJIqHlvTnMRmbKn1CQ
 EQnFg/F4Xo4gfzMpCWfAekPhv8WFrCRZVdpyKYq5Xt1dqbtEgAuREWXII
 wv/UjFGdiSbyh2y7yBjglZLQf5SiXq5rKUd2/mPcvJSou8BpyQcVlWth2
 YYqCZQBim85GOnNDV9tOah75SNUlX72qykI3ibuMW/k85xbVSunHSdSOm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258611355"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258611355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 07:32:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="561853074"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 07:32:12 -0700
Date: Fri, 25 Mar 2022 07:32:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <Yj3SarO9Ns4yFbEu@mdroper-desk1.amr.corp.intel.com>
References: <20220325142249.81443-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325142249.81443-1-jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Add Wa_22014226127
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 07:22:49AM -0700, José Roberto de Souza wrote:
> New DG2 workaround added to specification.
> 
> BSpec: 54077
> BSpec: 66622
> BSpec: 54833
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 62e0f075b1de7..17432b075d970 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1088,6 +1088,7 @@
>  #define EU_PERF_CNTL3				_MMIO(0xe758)
>  
>  #define LSC_CHICKEN_BIT_0			_MMIO(0xe7c8)
> +#define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
>  #define LSC_CHICKEN_BIT_0_UDW			_MMIO(0xe7c8 + 4)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index dc0ffff6f655a..29c8cd0a81b6f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2624,6 +2624,11 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
>  				GLOBAL_INVALIDATION_MODE);
>  	}
> +
> +	if (IS_DG2(i915)) {
> +		/* Wa_22014226127:dg2 */
> +		wa_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
> +	}
>  }
>  
>  static void
> -- 
> 2.35.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
