Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85F5C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 10:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFAF60F44
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 10:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CFAF60F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708226EB43;
	Mon, 26 Jul 2021 10:15:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CC96EB3B;
 Mon, 26 Jul 2021 10:15:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212243527"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="212243527"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:15:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="416500930"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:14:59 -0700
Date: Mon, 26 Jul 2021 06:14:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <YP6LIYHtgZna/bog@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-22-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-22-lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 21/30] drm/i915: remove explicit CNL
 handling from intel_pch.c
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:05PM -0700, Lucas De Marchi wrote:
> Remove references for CNL from pch detection.

for a moment I almost thought you were removing the CNP support...

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_pch.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
> index cc44164e242b..d1d4b97b86f5 100644
> --- a/drivers/gpu/drm/i915/intel_pch.c
> +++ b/drivers/gpu/drm/i915/intel_pch.c
> @@ -81,7 +81,6 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
>  	case INTEL_PCH_CNP_DEVICE_ID_TYPE:
>  		drm_dbg_kms(&dev_priv->drm, "Found Cannon Lake PCH (CNP)\n");
>  		drm_WARN_ON(&dev_priv->drm,
> -			    !IS_CANNONLAKE(dev_priv) &&
>  			    !IS_COFFEELAKE(dev_priv) &&
>  			    !IS_COMETLAKE(dev_priv));
>  		return PCH_CNP;
> @@ -89,7 +88,6 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "Found Cannon Lake LP PCH (CNP-LP)\n");
>  		drm_WARN_ON(&dev_priv->drm,
> -			    !IS_CANNONLAKE(dev_priv) &&
>  			    !IS_COFFEELAKE(dev_priv) &&
>  			    !IS_COMETLAKE(dev_priv));
>  		return PCH_CNP;
> @@ -171,8 +169,7 @@ intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
>  		id = INTEL_PCH_MCC_DEVICE_ID_TYPE;
>  	else if (IS_ICELAKE(dev_priv))
>  		id = INTEL_PCH_ICP_DEVICE_ID_TYPE;
> -	else if (IS_CANNONLAKE(dev_priv) ||
> -		 IS_COFFEELAKE(dev_priv) ||
> +	else if (IS_COFFEELAKE(dev_priv) ||
>  		 IS_COMETLAKE(dev_priv))
>  		id = INTEL_PCH_CNP_DEVICE_ID_TYPE;
>  	else if (IS_KABYLAKE(dev_priv) || IS_SKYLAKE(dev_priv))
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
