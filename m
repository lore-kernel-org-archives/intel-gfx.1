Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD44C4706C
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Jan 2024 08:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750B10EA95;
	Fri, 12 Jan 2024 08:56:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D369210EA95
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Jan 2024 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705049812; x=1736585812;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4NtDL4+pEtMMRZRUqze7HdvrEnAqANh1iy4cLY+3uCU=;
 b=KsTqfys2wvTXBLOVbTWrdVfKaiKmrkw4W4w4WZv/WdbAAyfIDWlliVw4
 kXKWYRzvFwUhJjC8ehgWw51GViioPIfxvjJmUoNW17NApAedU2a94yYKt
 ZJVJmcCxS3jwFLWl++ufPA8BArtonKMx3c7hY+bGXJ33+EumfHm7wAQMi
 bR3K1K42ZQjqXeT8O2VOoOaofNwkXgYMV7aKR+5esbBmuEKC20SWV9hF1
 3G/PQ9ICbOgeMHqHJyi/UTWysHvyL9fqK4anA93rm4FerR4+W37ivvU+5
 V+hh+P3J4zjPA8RsZ3G+K0Kmv/oZaM+gVwIpZCmLWFT/6URyeC5qW2uBy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="20588251"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="20588251"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 00:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="956052875"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="956052875"
Received: from kklimes-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.38.5])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 00:56:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v1 2/2] drm/xe: Modify the cfb size to be page size
 aligned for FBC
In-Reply-To: <20240110110009.28799-3-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240110110009.28799-1-vinod.govindapillai@intel.com>
 <20240110110009.28799-3-vinod.govindapillai@intel.com>
Date: Fri, 12 Jan 2024 10:56:45 +0200
Message-ID: <87edenszea.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ville.syrjala@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> drm_gem_private_object_init expect the object size be page size
> aligned. The xe_bo create functions do not update the size for
> any alignment requirements. So align cfb size to be page size
> aligned in xe stolen memory handling.

Please send this to the intel-xe mailing list.

BR,
Jani.


>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> index 888e7a87a925..bd233007c1b7 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> @@ -19,6 +19,9 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  	int err;
>  	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
>  
> +	if (align)
> +		size = ALIGN(size, align);
> +
>  	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
>  				       NULL, size, start, end,
>  				       ttm_bo_type_kernel, flags);

-- 
Jani Nikula, Intel
