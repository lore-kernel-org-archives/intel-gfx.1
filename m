Return-Path: <SRS0=4rgl=NX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0032C432BE
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 16:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722B1610A8
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 16:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 722B1610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACB6E207;
	Wed,  1 Sep 2021 16:14:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB266E1F8
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Sep 2021 16:14:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="199027914"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="199027914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:13:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="690763788"
Received: from frodasgo-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.35])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:13:04 -0700
Date: Wed, 1 Sep 2021 12:13:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <YS+mjy+DNyZ4rMCr@intel.com>
References: <cover.1630327990.git.jani.nikula@intel.com>
 <c7c2db4e1434ed9a3545f2561a03dc593db5e674.1630327990.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c2db4e1434ed9a3545f2561a03dc593db5e674.1630327990.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/debugfs: clean up LPSP status
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

On Mon, Aug 30, 2021 at 03:53:40PM +0300, Jani Nikula wrote:
> Clean up the LPSP status printout. No functional changes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 37 ++++++-------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 8fdacb252bb1..d2a14a9c6857 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1323,9 +1323,6 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
>  	return 0;
>  }
>  
> -#define LPSP_STATUS(COND) (COND ? seq_puts(m, "LPSP: enabled\n") : \
> -				seq_puts(m, "LPSP: disabled\n"))
> -
>  static bool
>  intel_lpsp_power_well_enabled(struct drm_i915_private *i915,
>  			      enum i915_power_well_id power_well_id)
> @@ -1344,32 +1341,20 @@ intel_lpsp_power_well_enabled(struct drm_i915_private *i915,
>  static int i915_lpsp_status(struct seq_file *m, void *unused)
>  {
>  	struct drm_i915_private *i915 = node_to_i915(m->private);
> -
> -	if (DISPLAY_VER(i915) >= 13) {
> -		LPSP_STATUS(!intel_lpsp_power_well_enabled(i915,
> -							   SKL_DISP_PW_2));
> +	bool lpsp_enabled = false;
> +
> +	if (DISPLAY_VER(i915) >= 13 || IS_DISPLAY_VER(i915, 9, 10)) {
> +		lpsp_enabled = !intel_lpsp_power_well_enabled(i915, SKL_DISP_PW_2);
> +	} else if (IS_DISPLAY_VER(i915, 11, 12)) {
> +		lpsp_enabled = !intel_lpsp_power_well_enabled(i915, ICL_DISP_PW_3);
> +	} else if (IS_HASWELL(i915) || IS_BROADWELL(i915)) {
> +		lpsp_enabled = !intel_lpsp_power_well_enabled(i915, HSW_DISP_PW_GLOBAL);
> +	} else {
> +		seq_puts(m, "LPSP: not supported\n");
>  		return 0;
>  	}
>  
> -	switch (DISPLAY_VER(i915)) {
> -	case 12:
> -	case 11:
> -		LPSP_STATUS(!intel_lpsp_power_well_enabled(i915, ICL_DISP_PW_3));
> -		break;
> -	case 10:
> -	case 9:
> -		LPSP_STATUS(!intel_lpsp_power_well_enabled(i915, SKL_DISP_PW_2));
> -		break;
> -	default:
> -		/*
> -		 * Apart from HASWELL/BROADWELL other legacy platform doesn't
> -		 * support lpsp.
> -		 */
> -		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> -			LPSP_STATUS(!intel_lpsp_power_well_enabled(i915, HSW_DISP_PW_GLOBAL));
> -		else
> -			seq_puts(m, "LPSP: not supported\n");
> -	}
> +	seq_printf(m, "LPSP: %s\n", enableddisabled(lpsp_enabled));
>  
>  	return 0;
>  }
> -- 
> 2.20.1
> 
