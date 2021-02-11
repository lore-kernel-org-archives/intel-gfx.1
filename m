Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE70C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 04:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59EB64DF0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 04:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59EB64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA016E3B7;
	Thu, 11 Feb 2021 04:25:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15576E3B7
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 04:25:19 +0000 (UTC)
IronPort-SDR: qvfGH8w7tuhDtrhddblkipzePgZ5VzaY7peHf/MBNtr7epBK+ojlmL/E98+7UdPSbEPxv5VHDE
 P9tINAoE/eLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="267033152"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="267033152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 20:25:19 -0800
IronPort-SDR: LzwN8tiMjWJy11tWlPaIq3zLs2+6Nvgc05PAGk+pq5qCBITK3vnVKjR3xuLfSiIjgZhNJNVPPC
 lgpqe2dw8slw==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="380442796"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 20:25:18 -0800
Date: Wed, 10 Feb 2021 23:25:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20210211042517.GJ82362@intel.com>
References: <20210210221955.10025-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210221955.10025-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/gt: Sanitize GPU during
 prepare-to-suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 10:19:50PM +0000, Chris Wilson wrote:
> After calling intel_gt_suspend_prepare(), the driver starts to turn off
> various subsystems, such as clearing the GGTT, before calling
> intel_gt_suspend_late() to relinquish control over the GT. However, if
> we still have internal GPU state active as we clear the GGTT, the GPU
> may write back its internal state to the residual GGTT addresses that
> are now pointing into scratch. Let's reset the GPU to clear that
> internal state as soon we have idled the GPU in prepare-to-suspend.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 0bd303d2823e..f41612faa269 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -295,6 +295,9 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
>  	wait_for_suspend(gt);

you just wedged the gpu here...

>  
>  	intel_uc_suspend(&gt->uc);
> +
> +	/* Flush all the contexts and internal state before turning off GGTT */
> +	gt_sanitize(gt, false);

and now we are unsetting wedge here...

is this right?

>  }
>  
>  static suspend_state_t pm_suspend_target(void)
> @@ -337,7 +340,7 @@ void intel_gt_suspend_late(struct intel_gt *gt)
>  		intel_llc_disable(&gt->llc);
>  	}
>  
> -	gt_sanitize(gt, false);
> +	gt_sanitize(gt, false); /* Be paranoid, remove all residual GPU state */
>  
>  	GT_TRACE(gt, "\n");
>  }
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
