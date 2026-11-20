Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42A606A33D
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YHfc2Dre
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024DA112BA3;
	Fri, 20 Nov 2026 16:13:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14F8112BDC
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795191173; x=1826727173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IXiMyljstBDzrFREuPt9mtCQfK8OLdaSjKyI2AuIWow=;
 b=YHfc2Dre7XS2DQGkG+EQe1A0FFyMg9yeECu1c7zmM/5m6bbZIm+n39W+
 3NWQd9OWXPdr3Hr8hg4av4HthZ2VLucdnaokJjebycV7jTeW0JqUvxTks
 s7xlDoZIyHQOo3jLJLLw+PysUkuRjgtFEcf4DG6Y071bESs19KxRVe3wj
 NRSE5fiRaZYe5F2dPHuIj+hCJXFT1alljZ/rohOwZOOFwT/B7+LLka8U6
 qZenDq8H2VJ2fOCt9AdUcN1/t3RN3Vod7N0j9VhPHrUX3vmek+K+hdCIc
 lmSaAUVzzHW/9qW1KACTWemVQG0fwfE/OicG4zw1NdSUsRw9GauNdnqOy Q==;
X-CSE-ConnectionGUID: JjJKItK8T9qezxiVWt6ibQ==
X-CSE-MsgGUID: +7xVkk8sT2KSZ7w4w8IS6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3963732"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3963732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 08:12:51 -0800
X-CSE-ConnectionGUID: q1TEbIbeS3u5WbtvXI3NfQ==
X-CSE-MsgGUID: 8r2rbTivRQG1v8dLcVFrMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10612025"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 08:12:50 -0800
Date: Fri, 20 Nov 2026 18:12:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gvt: Descend to GVT Makefile through
 kbuild, not include
Message-ID: <awBxf9ixOpSQpj1q@intel.com>
References: <20261120155734.259742-1-jani.nikula@intel.com>
 <20261120155734.259742-2-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120155734.259742-2-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 05:57:34PM +0200, Jani Nikula wrote:
> Treat the gvt/ subdirectory and Makefile like a regular kernel driver
> directory, and descend to it through kbuild, not Makefile include.
> 
> The main change is that the resulting kvmgt.ko is also placed in the
> gvt/ subdirectory in the build directory.

Does this also change where the module gets installed finally?

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile     |  4 +--
>  drivers/gpu/drm/i915/gvt/Makefile | 48 ++++++++++++++++---------------
>  2 files changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index d4e7764621e1..ba7eecfffdca 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -433,10 +433,10 @@ i915-y += \
>  i915-$(CONFIG_DRM_I915_GVT) += \
>  	intel_gvt.o \
>  	intel_gvt_mmio_table.o
> -include $(src)/gvt/Makefile
>  
>  obj-$(CONFIG_DRM_I915) += i915.o
> -obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
> +
> +obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/
>  
>  # kernel-doc test
>  #
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
> index 47f4f6f43c15..dfbf813f672c 100644
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ b/drivers/gpu/drm/i915/gvt/Makefile
> @@ -1,25 +1,27 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -kvmgt-$(CONFIG_DRM_I915_GVT) += \
> -	gvt/aperture_gm.o \
> -	gvt/cfg_space.o \
> -	gvt/cmd_parser.o \
> -	gvt/debugfs.o \
> -	gvt/display.o \
> -	gvt/dmabuf.o \
> -	gvt/edid.o \
> -	gvt/execlist.o \
> -	gvt/fb_decoder.o \
> -	gvt/firmware.o \
> -	gvt/gtt.o \
> -	gvt/handlers.o \
> -	gvt/interrupt.o \
> -	gvt/kvmgt_module.o \
> -	gvt/mmio.o \
> -	gvt/mmio_context.o \
> -	gvt/opregion.o \
> -	gvt/page_track.o \
> -	gvt/sched_policy.o \
> -	gvt/scheduler.o \
> -	gvt/trace_points.o \
> -	gvt/vgpu.o
> +kvmgt-y += \
> +	aperture_gm.o \
> +	cfg_space.o \
> +	cmd_parser.o \
> +	debugfs.o \
> +	display.o \
> +	dmabuf.o \
> +	edid.o \
> +	execlist.o \
> +	fb_decoder.o \
> +	firmware.o \
> +	gtt.o \
> +	handlers.o \
> +	interrupt.o \
> +	kvmgt_module.o \
> +	mmio.o \
> +	mmio_context.o \
> +	opregion.o \
> +	page_track.o \
> +	sched_policy.o \
> +	scheduler.o \
> +	trace_points.o \
> +	vgpu.o
> +
> +obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
