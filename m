Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80309C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 16:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2077561090
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2077561090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D26E831;
	Thu,  7 Oct 2021 16:43:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C8B6E831
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Oct 2021 16:43:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="213443982"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="213443982"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="560630320"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 07 Oct 2021 09:39:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 19:39:37 +0300
Date: Thu, 7 Oct 2021 19:39:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 mika.kahola@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jose.souza@intel.com
Message-ID: <YV8iyeS0eVnnoUAM@intel.com>
References: <20211007155729.27812-1-animesh.manna@intel.com>
 <20211007155729.27812-2-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211007155729.27812-2-animesh.manna@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v2 1/4] drm/i915/panelreplay: HAS_PR() macro
 added for panel replay
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

On Thu, Oct 07, 2021 at 09:27:26PM +0530, Animesh Manna wrote:
> Platforms having Display 13 and above will support panel
> replay feature of DP 2.0 monitor. Added a HAS_PR() macro
> to check for panel replay capability.
> 
> v1: Initial version.
> v2: DISPLAY_VER macro used instead of has_pr flag. [Jose]
> 
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 12256218634f..8db0626337e3 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1693,6 +1693,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_DDI(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ddi)
>  #define HAS_FPGA_DBG_UNCLAIMED(dev_priv) (INTEL_INFO(dev_priv)->display.has_fpga_dbg)
>  #define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
> +#define HAS_PR(dev_priv)		 (DISPLAY_VER(dev_priv) >= 13)

Public relations?

>  #define HAS_PSR_HW_TRACKING(dev_priv) \
>  	(INTEL_INFO(dev_priv)->display.has_psr_hw_tracking)
>  #define HAS_PSR2_SEL_FETCH(dev_priv)	 (GRAPHICS_VER(dev_priv) >= 12)
> -- 
> 2.29.0

-- 
Ville Syrjälä
Intel
