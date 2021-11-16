Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F278FC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 14:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A47619E1
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 14:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91A47619E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0737D6E093;
	Tue, 16 Nov 2021 14:50:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A106E093
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Nov 2021 14:50:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220591051"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="220591051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:50:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="472342670"
Received: from jprocter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.135])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:50:10 -0800
Date: Tue, 16 Nov 2021 09:50:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <YZPFIcMXsYPD/o2S@intel.com>
References: <20211116135813.19806-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116135813.19806-1-jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: fix includes for headers in
 include/drm
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 03:58:13PM +0200, Jani Nikula wrote:
> Use <> not "" for including headers from include/drm.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 3 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index d02732f04757..598840b73dfa 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -3,7 +3,8 @@
>   * Copyright(c) 2020, Intel Corporation. All rights reserved.
>   */
>  
> -#include "drm/i915_drm.h"
> +#include <drm/i915_drm.h>
> +
>  #include "i915_drv.h"
>  
>  #include "intel_pxp.h"
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 49508f31dcb7..5d169624ad60 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -4,8 +4,10 @@
>   */
>  
>  #include <linux/component.h>
> -#include "drm/i915_pxp_tee_interface.h"
> -#include "drm/i915_component.h"
> +
> +#include <drm/i915_pxp_tee_interface.h>
> +#include <drm/i915_component.h>
> +
>  #include "i915_drv.h"
>  #include "intel_pxp.h"
>  #include "intel_pxp_session.h"
> -- 
> 2.30.2
> 
