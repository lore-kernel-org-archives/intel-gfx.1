Return-Path: <SRS0=1UtA=IB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08157C433DB
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 03:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9112E64E27
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 03:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9112E64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A775589E0D;
	Wed,  3 Mar 2021 03:37:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41789E0D
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 03:37:18 +0000 (UTC)
IronPort-SDR: X4NhyNAGPrimRaMt8J2L8UbSBU22s6P7+7+eCwYD5j/SVtP0rOQFqDeGb3iABVcRVMQ7n266iT
 F9GOdu4eYXhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166981438"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="166981438"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 19:37:18 -0800
IronPort-SDR: VvzSzkVxt6jlrfJ5x1Y3xkSAGs+XKIduTV1HuSnkW0Ch7xhT8bsVp4Z2y/YW5Cewj0JHVmQ80e
 BMtGKfH+/1uA==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="428014686"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 19:37:18 -0800
Date: Tue, 2 Mar 2021 19:37:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20210303033717.GG2690983@mdroper-desk1.amr.corp.intel.com>
References: <20210303010728.3605269-1-lucas.demarchi@intel.com>
 <20210303010728.3605269-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303010728.3605269-4-lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/dg1: WA GPU hang at RCC
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
Cc: Jianjun Liu <Jianjun.liu@intel.com>, intel-gfx@lists.freedesktop.org,
 Zhen Han <zhen.han@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 05:07:28PM -0800, Lucas De Marchi wrote:
> From: Zhen Han <zhen.han@intel.com>
> 
> GPU hangs at RCC. According to Wa_14012131227 we shouldn't have a hang
> due to RHWO, but that is what we are observing, even without media
> compressible render target. Feedback from HW engineers is to leave RHWO
> disabled.

"14012131227" isn't the correct workaround number; that's a
platform-specific identifier.  This should be referred to by its lineage
number 22011054531 which is common across all affected platforms.
From a quick scan, it looks like this isn't just a DG1 workaround, but
also applies to at least TGL and ADL-S as well (and is pending for RKL).

I'm not sure we actually need this workaround in the kernel though.
We're already whitelisting this register for userspace to allow UMD's to
apply workarounds to it directly (and UMD's are already doing their own
programming of the register for Wa_1808121037).  So it may be best to
leave the handling of this additional bit to them as well, especially if
the desired handling doesn't quite match the officially documented
workaround text.


Matt

> 
> Cc: Jianjun Liu <Jianjun.liu@intel.com>
> Cc: Chuansheng Liu <chuansheng.liu@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Zhen Han <zhen.han@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index e678fa8d2ab9..5235fb70a69a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -739,6 +739,17 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	       FF_MODE2,
>  	       FF_MODE2_GS_TIMER_MASK,
>  	       FF_MODE2_GS_TIMER_224, 0);
> +
> +	/*
> +	 * Wa_14012131227
> +	 *
> +	 * Although the WA is described as causing corruption when using media
> +	 * compressible render target, leaving RHWO enabled is also causing
> +	 * gpu hang when using multiple concurrent render and media workloads.
> +	 * Disable it completely for now.
> +	 */
> +	wa_masked_en(wal, GEN7_COMMON_SLICE_CHICKEN1,
> +		     GEN9_RHWO_OPTIMIZATION_DISABLE);
>  }
>  
>  static void
> -- 
> 2.30.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
