Return-Path: <SRS0=YrHI=L7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC078C07E95
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 08:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BA161997
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 08:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50BA161997
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58AC6E841;
	Wed,  7 Jul 2021 08:29:24 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E4C6E093
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Jul 2021 08:29:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="206251643"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="206251643"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 01:29:16 -0700
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="486729486"
Received: from rvanakke-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 01:29:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20210707050645.31043-3-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210707050645.31043-1-anusha.srivatsa@intel.com>
 <20210707050645.31043-3-anusha.srivatsa@intel.com>
Date: Wed, 07 Jul 2021 11:29:12 +0300
Message-ID: <875yxm8r3b.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/dmc: Use RUNTIME_INFO->step
 for DMC
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

On Tue, 06 Jul 2021, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> Instead of adding new table for every new platform, lets ues
> the stepping info from RUNTIME_INFO(dev_priv)->step
> This patch uses RUNTIME_INFO->step only for recent
> platforms.
>
> Patches that follow this will address this change for
> remaining platforms + missing platforms.
>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 61 +++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index f8789d4543bf..a38720f25910 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -266,10 +266,12 @@ static const struct stepping_info icl_stepping_info[] = {
>  };
>  
>  static const struct stepping_info no_stepping_info = { '*', '*' };
> +struct stepping_info *display_step;

We can't have driver specific mutable data for this. Almost everything
has to be either device specific or const. The above would be shared
between all devices.

BR,
Jani.

>  
>  static const struct stepping_info *
>  intel_get_stepping_info(struct drm_i915_private *dev_priv)
>  {
> +	struct intel_step_info step = RUNTIME_INFO(dev_priv)->step;
>  	const struct stepping_info *si;
>  	unsigned int size;
>  
> @@ -282,15 +284,60 @@ intel_get_stepping_info(struct drm_i915_private *dev_priv)
>  	} else if (IS_BROXTON(dev_priv)) {
>  		size = ARRAY_SIZE(bxt_stepping_info);
>  		si = bxt_stepping_info;
> -	} else {
> -		size = 0;
> -		si = NULL;
>  	}
>  
> -	if (INTEL_REVID(dev_priv) < size)
> -		return si + INTEL_REVID(dev_priv);
> -
> -	return &no_stepping_info;
> +	if (IS_ICELAKE(dev_priv) || IS_SKYLAKE(dev_priv) || IS_BROXTON(dev_priv))
> +		return INTEL_REVID(dev_priv) < size ? si + INTEL_REVID(dev_priv) : &no_stepping_info;
> +
> +	else {
> +		switch (step.display_step) {
> +		case STEP_A0:
> +			display_step->stepping = 'A';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_A2:
> +			display_step->stepping = 'A';
> +			display_step->substepping = '2';
> +			break;
> +		case STEP_B0:
> +			display_step->stepping = 'B';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_B1:
> +			display_step->stepping = 'B';
> +			display_step->substepping = '1';
> +			break;
> +		case STEP_C0:
> +			display_step->stepping = 'C';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_D0:
> +			display_step->stepping = 'D';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_D1:
> +			display_step->stepping = 'D';
> +			display_step->substepping = '1';
> +			break;
> +		case STEP_E0:
> +			display_step->stepping = 'E';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_F0:
> +			display_step->stepping = 'F';
> +			display_step->substepping = '0';
> +			break;
> +		case STEP_G0:
> +			display_step->stepping = 'G';
> +			display_step->substepping = '0';
> +			break;
> +		default:
> +			display_step->stepping = '*';
> +			display_step->substepping = '*';
> +			break;
> +		}
> +	}
> +	return display_step;
>  }
>  
>  static void gen9_set_dc_state_debugmask(struct drm_i915_private *dev_priv)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
