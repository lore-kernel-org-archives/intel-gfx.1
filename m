Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C48C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 03:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981E364E8B
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 03:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981E364E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E706E3C6;
	Thu, 11 Feb 2021 03:19:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEF86E3C6;
 Thu, 11 Feb 2021 03:19:46 +0000 (UTC)
IronPort-SDR: xLLQ1xhOkbiI2vTB6gV1j69qp0fAaI+vILYCxmAOxPPG71ndZ8UfqtlxaNTBJG1rTMQI9ZMWj6
 QNJJUz1gXdsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161938043"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="161938043"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:19:45 -0800
IronPort-SDR: WkkssKA/viF5ouDPH5JLBaAT60vsIrjtDowwCutkPdW8O2BBYnNHt4UtIl5sr7n8Eh48zYSqq4
 ko2HA6PV+Ocw==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="588271083"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:19:44 -0800
Date: Wed, 10 Feb 2021 22:19:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20210211031943.GB82362@intel.com>
References: <20210209212832.1401815-1-lyude@redhat.com>
 <20210209212832.1401815-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209212832.1401815-2-lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/4] drm/i915/gen9_bc: Recognize TGP PCH
 + CML combos
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Yijun Shen <Yijun.Shen@dell.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 04:28:28PM -0500, Lyude Paul wrote:
> Since Intel has introduced the gen9_bc platform, a combination of
> Tigerpoint PCHs and CML CPUs, let's recognize such platforms as valid and
> avoid WARNing on them.
> 
> Changes since v4:
> * Split this into it's own patch - vsyrjala
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> [originally from Tejas's work]
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_pch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
> index 4813207fc053..7476f0e063c6 100644
> --- a/drivers/gpu/drm/i915/intel_pch.c
> +++ b/drivers/gpu/drm/i915/intel_pch.c
> @@ -121,7 +121,8 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
>  	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
>  		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
>  		drm_WARN_ON(&dev_priv->drm, !IS_TIGERLAKE(dev_priv) &&
> -			    !IS_ROCKETLAKE(dev_priv));
> +			    !IS_ROCKETLAKE(dev_priv) &&
> +			    !IS_GEN9_BC(dev_priv));
>  		return PCH_TGP;
>  	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
>  	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
