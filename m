Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E02C433FE
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 23:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C29322D06
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 23:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C29322D06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91FD6E301;
	Wed,  9 Dec 2020 23:56:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CF6E301;
 Wed,  9 Dec 2020 23:56:16 +0000 (UTC)
IronPort-SDR: GYRF5oNvGwUMfxjQP6GuqmGkTuwHFPgwi5NhHeoghj5YhVinpnxXgmxuYf7KGXLvW1fXNEfAZq
 TFdITYgY8O7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161928036"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="161928036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:56:15 -0800
IronPort-SDR: YFbs6hlI8KMSgq8hsw74iX0qG1la7x2UcV8T6RGL5cIpA4+MLPqvzO/sZ6WdDnYzf8o6IkVvCN
 3T765zQ+6Z4w==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="348555846"
Received: from dannie-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.50.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:56:15 -0800
Date: Wed, 9 Dec 2020 15:56:15 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Message-ID: <20201209235615.GA3636@intel.com>
References: <20201209211828.53193-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209211828.53193-1-sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/tc: Only WARN once for
 bogus tc port flag
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 04:16:36PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> No need to spam syslog/console when we can ignore/fix the flag.

besides that we are calling from multiple places anyway..

> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
>  drivers/gpu/drm/i915/display/intel_tc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 4346bc1a747a..27dc2dad6809 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -262,7 +262,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
>  		mask |= BIT(TC_PORT_LEGACY);
>  
>  	/* The sink can be connected only in a single mode. */
> -	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
> +	if (!drm_WARN_ON_ONCE(&i915->drm, hweight32(mask) > 1))
>  		tc_port_fixup_legacy_flag(dig_port, mask);
>  
>  	return mask;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
