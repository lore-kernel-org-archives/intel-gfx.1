Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3ED606A323
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBJEYJcy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2404C10F004;
	Tue, 24 Nov 2026 18:17:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B47510F004
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795544235; x=1827080235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qn7LKRODAHgZaH+3P/1Fk503YyNEVOU4Qlhpe+rFlsA=;
 b=oBJEYJcyGrcegUfm7q9a7ouAQFzWerM5E94YxON8WxdsT/rp9QCFbvKv
 UHyiQmQ+1lF5kz/OcWzaThrevEZr4XHV1s36W+kAo1XLnGZn/7mKES8b/
 hiR6ERyHAold/rp32KoqJpNpgQzNfUYEqr9qs3eLe4SmTzG88JHQISoUi
 IKGXaUErfC4FJDJ6Oahkni3qpoovc6ZvF6ALZOzTzI9wWl5SBPnpp6Wmt
 DQFYb8lGtxITbppSJQjgEKgTPwEcC/NXbY1fnx8EHsRC49Q1y1sJVkZBx
 QN/P9H2Swg7YhWsfATfBqGwPB3xG6vpB0XkGm9ZSp3FYn+e0zDXuiA18G w==;
X-CSE-ConnectionGUID: Cp6T62/dTTaxGT/4r+qxug==
X-CSE-MsgGUID: V97Xyc/zRcWkxsGy49qquA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4293954"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4293954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:06:50 -0800
X-CSE-ConnectionGUID: sjSzM12ZTEyKa8jRHpsrRA==
X-CSE-MsgGUID: 1l/ZGC07Rnaf+4ItotJjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11753700"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:06:47 -0800
Date: Tue, 24 Nov 2026 20:06:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915: separate RPL-U from RPL-P
Message-ID: <awXSND47i2nv9z-H@intel.com>
References: <20261124173521.1619675-1-jani.nikula@intel.com>
 <20261124173521.1619675-2-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124173521.1619675-2-jani.nikula@intel.com>
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

On Tue, Nov 24, 2026 at 07:35:21PM +0200, Jani Nikula wrote:
> RPL-S is a subplatform of ADL-S and RPL-P is a subplatform of
> ADL-P. It's a bit much that RPL-P also matches RPL-U. Separate RPL-U
> from RPL-P, and make RPL-U a standalone subplatform of ADL-P.

My head spins every time I look at the subplatform mess.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 7 +++----
>  drivers/gpu/drm/i915/intel_step.c        | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 2014a8f07e61..23a6d7c939bc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -178,7 +178,6 @@ static const u16 subplatform_n_ids[] = {
>  
>  static const u16 subplatform_rpl_ids[] = {
>  	INTEL_RPLS_IDS(ID),
> -	INTEL_RPLU_IDS(ID),
>  	INTEL_RPLP_IDS(ID),

I don't even know why RPL-S and RPL-P are grouped together here.
IIRC one is an ADL-S (one of the franken-TGLs) derivative, and the
other is an ADL-P (actual ADL) derivative.

And I *think* RPL-U is just a variant of RPL-P, just like ADL-N is
just a variant of ADL-P.

Hmm, oh this is GT stuff. Yeah, no real idea what's a derivative
of what on that side. But IS_RAPTORLAKE_U() seems to be completely
unused on that side, so I think you might just want to nuke the
RPL-U subplatform and call it a RPL-P.

There are also incredible constructs such as
'IS_ALDERLAKE_P(i915) && !IS_ALDERLAKE_P_N(i915)' somewhere in
the code.

I think the only way this can be made sensible in any way is
to have a rule that if you have even a single subplatform, then
you add subplatforms for all the variants of that platform.
Unfortunately I don't have a good idea how to deal with ADL-S
and its derivatives. With ADL-P you can avoid that issue by making
the platform name just "ADL", with ADL-P being one of its
subplatforms. But ADL-S has to be both a platform and subplatform :/

>  };
>  
> @@ -257,9 +256,9 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>  	} else if (find_devid(devid, subplatform_rpl_ids,
>  			      ARRAY_SIZE(subplatform_rpl_ids))) {
>  		mask = BIT(INTEL_SUBPLATFORM_RPL);
> -		if (find_devid(devid, subplatform_rplu_ids,
> -			       ARRAY_SIZE(subplatform_rplu_ids)))
> -			mask |= BIT(INTEL_SUBPLATFORM_RPLU);
> +	} else if (find_devid(devid, subplatform_rplu_ids,
> +			      ARRAY_SIZE(subplatform_rplu_ids))) {
> +		mask |= BIT(INTEL_SUBPLATFORM_RPLU);
>  	} else if (find_devid(devid, subplatform_g10_ids,
>  			      ARRAY_SIZE(subplatform_g10_ids))) {
>  		mask = BIT(INTEL_SUBPLATFORM_G10);
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 60a2af5307fc..91055c185d52 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -177,7 +177,7 @@ void intel_step_init(struct drm_i915_private *i915)
>  	} else if (IS_ALDERLAKE_P_N(i915)) {
>  		revids = adlp_n_revids;
>  		size = ARRAY_SIZE(adlp_n_revids);
> -	} else if (IS_RAPTORLAKE_P(i915)) {
> +	} else if (IS_RAPTORLAKE_P(i915) || IS_RAPTORLAKE_U(i915)) {
>  		revids = adlp_rplp_revids;
>  		size = ARRAY_SIZE(adlp_rplp_revids);
>  	} else if (IS_ALDERLAKE_P(i915)) {
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
