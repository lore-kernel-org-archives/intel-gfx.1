Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C25C433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 11:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8DE064E37
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 11:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8DE064E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BD66E895;
	Mon,  8 Feb 2021 11:15:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6746E895;
 Mon,  8 Feb 2021 11:15:39 +0000 (UTC)
IronPort-SDR: Cq8auqtioHSL68QP33K4hjEeKKok75QSM/YnHnPUUGABWGT723/gGsXY9a7tw2dW9S2zYRkI0Y
 5na+75+d6N8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180919232"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="180919232"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:15:38 -0800
IronPort-SDR: xFM4foVtcop/M9oY+fRPE7LOVlr30ZvX7IYY6Jb1XtlAhod5gDU0OwW5FuTWNAyMDI34VgqpLN
 Opu6/HF1wmig==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="377627433"
Received: from abodrova-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.34.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:15:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
Date: Mon, 08 Feb 2021 13:15:33 +0200
Message-ID: <87blcueroq.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/display/intel_dp: Read PCON DSC
 ENC caps only for DPCD rev >= 1.4
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 04 Feb 2021, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> DP-HDMI2.1 PCON has DSC encoder caps defined in registers 0x92-0x9E.
> Do not read the registers if DPCD rev < 1.4.
>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/2868

Please use Fixes: to reference commits that this patch fixes.

Please use Closes: to reference issues that this patch fixes.

No need to resend for this, can be fixed while applying, but please tell
me the commit that introduced the problem.

BR,
Jani.


> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8c12d5375607..2b83f0f433a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2489,9 +2489,11 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  
>  	/* Clear the cached register set to avoid using stale values */
> -
>  	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
>  
> +	if (intel_dp->dpcd[DP_DPCD_REV] < 0x14)
> +		return;
> +
>  	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
>  			     intel_dp->pcon_dsc_dpcd,
>  			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
