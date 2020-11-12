Return-Path: <SRS0=k0IE=ES=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C9CC2D0E4
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 20:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5AD20872
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 20:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5AD20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3BF6E427;
	Thu, 12 Nov 2020 20:19:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4240A6E427
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2020 20:19:51 +0000 (UTC)
IronPort-SDR: u9n6uiAotvEZhF5jdRmljEP3jjL5MljTMX75ZYhvHhd0Nv8skR+rLJVBLBgs5X98n4YAZuehYm
 K2NMvJS7RyjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170543815"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="170543815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 12:19:49 -0800
IronPort-SDR: SpjITJ+8ViFd1wLwGbDsWDdWxssurLxE9c33TyrNRBPdSeggu2X5lt4o2U8aCYCUoH0QCLxrQX
 z/Zb/nGakPiA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="357227191"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 12:19:49 -0800
Date: Thu, 12 Nov 2020 15:21:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20201112202103.GE1198919@intel.com>
References: <cover.1605181350.git.jani.nikula@intel.com>
 <6bd3045daa74b5789881b690ff0908bb486f34ce.1605181350.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bd3045daa74b5789881b690ff0908bb486f34ce.1605181350.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/9] drm/i915/debugfs: replace
 I915_READ()+I915_WRITE() with intel_uncore_rmw()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 01:44:37PM +0200, Jani Nikula wrote:
> Remove the last I915_WRITE() use in i915_debugfs.c.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 7cbca268cb61..151734a1a496 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -1562,13 +1562,9 @@ i915_cache_sharing_set(void *data, u64 val)
>  	drm_dbg(&dev_priv->drm,
>  		"Manually setting uncore sharing to %llu\n", val);
>  	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref) {
> -		u32 snpcr;
> -
>  		/* Update the cache sharing policy here as well */
> -		snpcr = I915_READ(GEN6_MBCUNIT_SNPCR);
> -		snpcr &= ~GEN6_MBC_SNPCR_MASK;
> -		snpcr |= val << GEN6_MBC_SNPCR_SHIFT;
> -		I915_WRITE(GEN6_MBCUNIT_SNPCR, snpcr);
> +		intel_uncore_rmw(&dev_priv->uncore, GEN6_MBCUNIT_SNPCR,
> +				 GEN6_MBC_SNPCR_MASK, val << GEN6_MBC_SNPCR_SHIFT);
>  	}
>  
>  	return 0;
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
