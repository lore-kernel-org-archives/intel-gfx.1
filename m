Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59181EE20A2
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Feb 2026 13:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690710E649;
	Fri,  6 Feb 2026 13:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWA/4zpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991A410E649
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Feb 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770384301; x=1801920301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=u3TfFSTSAmDx1AnVemDrV75J3EAuZ411aVgHnYzckHw=;
 b=NWA/4zpZV2fBA6a8CYhypLpzs6c2+xS35acSlx7Wm8t3puRGcPFkPxQE
 1y5FT+xTJRLVb+IUakzBJX5KEKuLOK3jsxyip6i2DRLk/6muUQMVymzIT
 P/fu2kJ2Nqn+CPYboDvf5sQ3AGLQGurpVAQIxdxYfieogQyBsA4CXTCDO
 y2syjnE6bC613O3bVpXf4cg69cowdbJHX3z3oSBv3XQmULmOiJXoP5PZr
 5Tx1V4xaYTPbxKN07Tlhkdw1c0RPwSQvW2XmoQiA2mH6YP7/K3iNr9c8w
 eIV8pbMLcvmxe4l4YZ6riT/9xQDzG2JWyoFdJfMNyicAcA5YT4atKKSUp w==;
X-CSE-ConnectionGUID: +EkXNoDhT5mHVM51uIBqPg==
X-CSE-MsgGUID: 9JKs8CORRNae96Ee21lW6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71490673"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71490673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 05:25:01 -0800
X-CSE-ConnectionGUID: A/A8Uk59SWSh7Z5U1RWCbA==
X-CSE-MsgGUID: zTeQGbZkSwqDq+PgO5oOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="233814301"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 05:24:59 -0800
Date: Fri, 6 Feb 2026 15:24:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/overlay: remove dead code with MTL platform
 checks
Message-ID: <aYXrqU7f-SJvmH4X@intel.com>
References: <20260206125949.243643-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206125949.243643-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Feb 06, 2026 at 02:59:49PM +0200, Jani Nikula wrote:
> Commit c5741c5c1122 ("drm/i915/display: Do not use stolen on MTL") added
> some checks for MTL in overlay code. However, this is never run on
> MTL. Clean it up.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 88eb7ae5765c..ae2a3527645f 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -1358,12 +1358,11 @@ static int get_registers(struct intel_overlay *overlay, bool use_phys)
>  {
>  	struct intel_display *display = overlay->display;
>  	struct drm_i915_private *i915 = to_i915(display->drm);
> -	struct drm_i915_gem_object *obj = ERR_PTR(-ENODEV);
> +	struct drm_i915_gem_object *obj;
>  	struct i915_vma *vma;
>  	int err;
>  
> -	if (!display->platform.meteorlake) /* Wa_22018444074 */
> -		obj = i915_gem_object_create_stolen(i915, PAGE_SIZE);
> +	obj = i915_gem_object_create_stolen(i915, PAGE_SIZE);
>  	if (IS_ERR(obj))
>  		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
>  	if (IS_ERR(obj))
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
