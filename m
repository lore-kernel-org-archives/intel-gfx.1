Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D126C11F6C
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 10:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E755611CE
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 10:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E755611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79B6E980;
	Wed, 30 Jun 2021 10:06:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F2E6E980;
 Wed, 30 Jun 2021 10:06:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19F6661D0C;
 Wed, 30 Jun 2021 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1625047582;
 bh=avnkog7DAWHGE/DDPBwmxyAibvw4Gdlte4dEESCVyoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udOpBZzVB4JN0HTHVvrO3eSvnwimfuvMyyr+nIaiE9fMU5868YxXBlpFGBWl+jvYl
 XNgb7Sg904LwLnqu4UWSmwKUnyd6PlkLPwPMARE8fgHpm6t1k4yt2JD9n5GJD0v7BE
 PcbmgK+YE/poI/xZfbc45WpiErOJU74fyjWXXbhE=
Date: Wed, 30 Jun 2021 12:06:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YNxCHDGA+x2Xe9pM@kroah.com>
References: <20210630095228.6665-1-tzimmermann@suse.de>
 <20210630095228.6665-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630095228.6665-3-tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915: Drop all references to DRM
 IRQ midlayer
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 lucas.demarchi@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 11:52:28AM +0200, Thomas Zimmermann wrote:
> Remove all references to DRM's IRQ midlayer. i915 uses Linux' interrupt
> functions directly.
> =

> v2:
> 	* also remove an outdated comment
> 	* move IRQ fix into separate patch
> 	* update Fixes tag (Daniel)
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b318b82455bd ("drm/i915: Nuke drm_driver irq vfuncs")
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.4+
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 1 -
>  drivers/gpu/drm/i915/i915_irq.c | 5 -----
>  2 files changed, 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index 850b499c71c8..73de45472f60 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -42,7 +42,6 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_ioctl.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  =

> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 2203dca19895..1d4c683c9de9 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -33,7 +33,6 @@
>  #include <linux/sysrq.h>
>  =

>  #include <drm/drm_drv.h>
> -#include <drm/drm_irq.h>
>  =

>  #include "display/intel_de.h"
>  #include "display/intel_display_types.h"
> @@ -4564,10 +4563,6 @@ void intel_runtime_pm_enable_interrupts(struct drm=
_i915_private *dev_priv)
>  =

>  bool intel_irqs_enabled(struct drm_i915_private *dev_priv)
>  {
> -	/*
> -	 * We only use drm_irq_uninstall() at unload and VT switch, so
> -	 * this is the only thing we need to check.
> -	 */
>  	return dev_priv->runtime_pm.irqs_enabled;
>  }
>  =

> -- =

> 2.32.0
> =


How is this a stable-kernel-related fix?

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
