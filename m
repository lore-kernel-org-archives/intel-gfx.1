Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60022C432BE
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 18:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27577610C7
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27577610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E21D6E402;
	Wed, 25 Aug 2021 18:26:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1756E402
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 18:26:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204786633"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="204786633"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 11:26:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="536472108"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 11:26:53 -0700
Date: Wed, 25 Aug 2021 11:21:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Message-ID: <20210825182143.GA27208@jons-linux-dev-box>
References: <20210823163137.19770-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823163137.19770-1-daniele.ceraolospurio@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: drop guc_communication_enabled
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

On Mon, Aug 23, 2021 at 09:31:37AM -0700, Daniele Ceraolo Spurio wrote:
> The function is only used from within GEM_BUG_ON(), which is causing
> warnings with Wunneeded-internal-declaration in some builds. Since the
> function is a simple wrapper around a CT function, we can just call the
> CT function directly instead.
> 
> Fixes: 1fb12c587152 ("drm/i915/guc: skip disabling CTBs before sanitizing the GuC")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index b104fb7607eb..86c318516e14 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -172,11 +172,6 @@ void intel_uc_driver_remove(struct intel_uc *uc)
>  	__uc_free_load_err_log(uc);
>  }
>  
> -static inline bool guc_communication_enabled(struct intel_guc *guc)
> -{
> -	return intel_guc_ct_enabled(&guc->ct);
> -}
> -
>  /*
>   * Events triggered while CT buffers are disabled are logged in the SCRATCH_15
>   * register using the same bits used in the CT message payload. Since our
> @@ -210,7 +205,7 @@ static void guc_get_mmio_msg(struct intel_guc *guc)
>  static void guc_handle_mmio_msg(struct intel_guc *guc)
>  {
>  	/* we need communication to be enabled to reply to GuC */
> -	GEM_BUG_ON(!guc_communication_enabled(guc));
> +	GEM_BUG_ON(!intel_guc_ct_enabled(&guc->ct));
>  
>  	spin_lock_irq(&guc->irq_lock);
>  	if (guc->mmio_msg) {
> @@ -226,7 +221,7 @@ static int guc_enable_communication(struct intel_guc *guc)
>  	struct drm_i915_private *i915 = gt->i915;
>  	int ret;
>  
> -	GEM_BUG_ON(guc_communication_enabled(guc));
> +	GEM_BUG_ON(intel_guc_ct_enabled(&guc->ct));
>  
>  	ret = i915_inject_probe_error(i915, -ENXIO);
>  	if (ret)
> @@ -662,7 +657,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>  		return 0;
>  
>  	/* Make sure we enable communication if and only if it's disabled */
> -	GEM_BUG_ON(enable_communication == guc_communication_enabled(guc));
> +	GEM_BUG_ON(enable_communication == intel_guc_ct_enabled(&guc->ct));
>  
>  	if (enable_communication)
>  		guc_enable_communication(guc);
> -- 
> 2.33.0
> 
