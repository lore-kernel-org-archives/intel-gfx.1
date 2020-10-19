Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42EC433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 13:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B46222BA
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 13:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B46222BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sfritsch.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1405A6E99C;
	Mon, 19 Oct 2020 13:50:28 +0000 (UTC)
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45EE6E97F
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 13:08:23 +0000 (UTC)
Date: Mon, 19 Oct 2020 15:08:17 +0200 (CEST)
From: Stefan Fritsch <sf@sfritsch.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20201019101523.4145-1-chris@chris-wilson.co.uk>
Message-ID: <alpine.DEB.2.21.2010191506390.5579@manul.sfritsch.de>
References: <20201019101230.29860-1-chris@chris-wilson.co.uk>
 <20201019101523.4145-1-chris@chris-wilson.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Oct 2020 13:50:27 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Force VT'd workarounds when
 running as a guest OS
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Works for me and makes the fault messages disappear. Thanks.

Tested-by: Stefan Fritsch <sf@sfritsch.de>


On Mon, 19 Oct 2020, Chris Wilson wrote:

> If i915.ko is being used as a passthrough device, it does not know if
> the host is using intel_iommu. Mixing the iommu and gfx causing a few
> issues (such as scanout overfetch) which we need to workaround inside
> the driver, so if we detect we are running under a hypervisor, also
> assume the device access is being virtualised.
> 
> Reported-by: Stefan Fritsch <sf@sfritsch.de>
> Suggested-by: Stefan Fritsch <sf@sfritsch.de>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Stefan Fritsch <sf@sfritsch.de>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/i915/i915_drv.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 1a5729932c81..bcd8650603d8 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -33,6 +33,8 @@
>  #include <uapi/drm/i915_drm.h>
>  #include <uapi/drm/drm_fourcc.h>
>  
> +#include <asm/hypervisor.h>
> +
>  #include <linux/io-mapping.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
> @@ -1760,7 +1762,9 @@ static inline bool intel_vtd_active(void)
>  	if (intel_iommu_gfx_mapped)
>  		return true;
>  #endif
> -	return false;
> +
> +	/* Running as a guest, we assume the host is enforcing VT'd */
> +	return !hypervisor_is_type(X86_HYPER_NATIVE);
>  }
>  
>  static inline bool intel_scanout_needs_vtd_wa(struct drm_i915_private *dev_priv)
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
