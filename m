Return-Path: <SRS0=wM0p=JR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C99C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 14:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5EC60FF3
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5EC60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B490889C9B;
	Tue, 20 Apr 2021 14:48:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0689C37
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Apr 2021 14:48:13 +0000 (UTC)
IronPort-SDR: xKep0E41EbXHYtfRQj3x64SaZhwrVv1ngE5zljB7lAfoXWQ9Ku8z18xPihdVm7mHu4L8hq38n5
 PFc/NXHKGqMQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="193395046"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="193395046"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 07:48:12 -0700
IronPort-SDR: UgK68iaZxGKptnxzW9swC9MlzNTWvbcQ/EHH6ZXLUQOV92sq2NUfkUbJjOwJzdcCMrbnsrbz2h
 OiRc5cIKv6rw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="463132275"
Received: from jyick-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.57.228])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 07:48:10 -0700
Date: Tue, 20 Apr 2021 10:48:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 uma.shankar@intel.com
Message-ID: <YH7pqNrpkhPRkCS8@intel.com>
References: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
 <20210328225709.18541-15-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210328225709.18541-15-daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 14/16] drm/i915/pxp: Add plane decryption
 support
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
Cc: Gaurav Kumar <kumar.gaurav@intel.com>, intel-gfx@lists.freedesktop.org,
 Huang Sean Z <sean.z.huang@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Mar 28, 2021 at 03:57:06PM -0700, Daniele Ceraolo Spurio wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Add support to enable/disable PLANE_SURF Decryption Request bit.
> It requires only to enable plane decryption support when following
> condition met.
> 1. PXP session is enabled.
> 2. Buffer object is protected.
> 
> v2:
> - Used gen fb obj user_flags instead gem_object_metadata. [Krishna]
> 
> v3:
> - intel_pxp_gem_object_status() API changes.
> 
> v4: use intel_pxp_is_active (Daniele)
> v5: rebase and use the new protected object status checker (Daniele)
> 
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Huang Sean Z <sean.z.huang@intel.com>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 14 +++++++++++---
>  drivers/gpu/drm/i915/i915_reg.h                    |  1 +
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index c6d7b6c054b5..b21bfb5be876 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -16,6 +16,7 @@
>  #include "intel_sprite.h"
>  #include "skl_scaler.h"
>  #include "skl_universal_plane.h"
> +#include "pxp/intel_pxp.h"
>  
>  static const u32 skl_plane_formats[] = {
>  	DRM_FORMAT_C8,
> @@ -971,7 +972,7 @@ skl_program_plane(struct intel_plane *plane,
>  	u8 alpha = plane_state->hw.alpha >> 8;
>  	u32 plane_color_ctl = 0, aux_dist = 0;
>  	unsigned long irqflags;
> -	u32 keymsk, keymax;
> +	u32 keymsk, keymax, plane_surf;
>  	u32 plane_ctl = plane_state->ctl;
>  
>  	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
> @@ -1051,8 +1052,15 @@ skl_program_plane(struct intel_plane *plane,
>  	 * the control register just before the surface register.
>  	 */
>  	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
> -	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
> -			  intel_plane_ggtt_offset(plane_state) + surf_addr);
> +	plane_surf = intel_plane_ggtt_offset(plane_state) + surf_addr;
> +
> +	if (intel_pxp_is_active(&dev_priv->gt.pxp) &&
> +	    i915_gem_object_has_valid_protection(intel_fb_obj(fb)))
> +		plane_surf |= PLANE_SURF_DECRYPTION_ENABLED;
> +	else
> +		plane_surf &= ~PLANE_SURF_DECRYPTION_ENABLED;

This part looks right. But what should we do about the async_flip path?
Jani? Ville? Uma? thoughts?

> +
> +	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), plane_surf);
>  
>  	if (plane_state->scaler_id >= 0)
>  		skl_program_plane_scaler(plane, crtc_state, plane_state);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1fe42f4a4e4b..a0313d718905 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7234,6 +7234,7 @@ enum {
>  #define _PLANE_SURF_3(pipe)	_PIPE(pipe, _PLANE_SURF_3_A, _PLANE_SURF_3_B)
>  #define PLANE_SURF(pipe, plane)	\
>  	_MMIO_PLANE(plane, _PLANE_SURF_1(pipe), _PLANE_SURF_2(pipe))
> +#define   PLANE_SURF_DECRYPTION_ENABLED		REG_BIT(2)
>  
>  #define _PLANE_OFFSET_1_B			0x711a4
>  #define _PLANE_OFFSET_2_B			0x712a4
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
