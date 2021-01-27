Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EAEC433E9
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 05:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F233520707
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 05:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F233520707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF6A6E52F;
	Wed, 27 Jan 2021 05:32:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDA56E52F
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 05:32:44 +0000 (UTC)
IronPort-SDR: FVijrGQ2yzJawqm0KYgdFV3OKp5sOmXMG6eCcidyRNr1b6+Cc5ogx6WiyNmaRLXg+pnf5YS7bA
 ZrWcWhU6xgDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="180164611"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="180164611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 21:32:44 -0800
IronPort-SDR: ThJZSKafXMwnHpUlE8FSGD7taZLpNXfvfsYyOuTj5CP5uliIBfjRGkvE9XlzjelIWSjxpLYf+G
 jFvg8ZrsnvoQ==
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="369361314"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 21:32:43 -0800
Date: Tue, 26 Jan 2021 21:32:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20210127053242.GN787460@mdroper-desk1.amr.corp.intel.com>
References: <20210127041159.136409-1-aditya.swarup@intel.com>
 <20210127041159.136409-4-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127041159.136409-4-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915/adl_s: Add power wells
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 08:11:53PM -0800, Aditya Swarup wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> TGL power wells can be re-used for ADL-S with the exception of the fake
> power well for TC_COLD, just like DG-1.
> 
> Bspec: 53597

I think the bspec reference should actually be page 49231.  But aside
from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Aditya Swarup <aditya.swarup@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 708f0b7e0990..cccfd45a67cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -4689,7 +4689,7 @@ int intel_power_domains_init(struct drm_i915_private *dev_priv)
>  	 * The enabling order will be from lower to higher indexed wells,
>  	 * the disabling order is reversed.
>  	 */
> -	if (IS_DG1(dev_priv)) {
> +	if (IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv)) {
>  		err = set_power_wells_mask(power_domains, tgl_power_wells,
>  					   BIT_ULL(TGL_DISP_PW_TC_COLD_OFF));
>  	} else if (IS_ROCKETLAKE(dev_priv)) {
> -- 
> 2.27.0
> 

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
