Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CFDC43216
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 00:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E4561074
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 00:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38E4561074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DC38949C;
	Thu,  2 Sep 2021 00:16:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4388949C
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Sep 2021 00:16:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="304476857"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="304476857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:16:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="601990095"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:16:40 -0700
Date: Wed, 1 Sep 2021 17:16:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Message-ID: <20210902001639.GG461228@mdroper-desk1.amr.corp.intel.com>
References: <20210830162240.3891502-1-ayaz.siddiqui@intel.com>
 <20210830162240.3891502-8-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830162240.3891502-8-ayaz.siddiqui@intel.com>
Subject: Re: [Intel-gfx] [PATCH V3 7/8] drm/i915/gt: Initialize L3CC table
 in mocs init
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

On Mon, Aug 30, 2021 at 09:52:39PM +0530, Ayaz A Siddiqui wrote:
> From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
> 
> Initialize the L3CC table as part of mocs initalization to program
> LNCFCMOCSx registers, so that the mocs settings are available for
> selection for subsequent memory transactions in driver load path.
> 
> Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_mocs.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 577a78dfedf99..405374f1d8ed2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -717,10 +717,9 @@ static u32 l3cc_combine(u16 low, u16 high)
>  	     0; \
>  	     i++)
>  
> -static void init_l3cc_table(struct intel_engine_cs *engine,
> +static void init_l3cc_table(struct intel_uncore *uncore,
>  			    const struct drm_i915_mocs_table *table)
>  {
> -	struct intel_uncore *uncore = engine->uncore;
>  	unsigned int i;
>  	u32 l3cc;
>  
> @@ -746,7 +745,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_mocs_table(engine, &table);
>  
>  	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
> -		init_l3cc_table(engine, &table);
> +		init_l3cc_table(engine->uncore, &table);

Can you clarify in the commit message why we still need to re-call this
in intel_mocs_init_engine() if we've already done it in
intel_mocs_init()?  I'm assuming it's because we lose these register
values on engine resets, so in the execlist path we need to make sure
they get re-applied after the reset?


Matt

>  
>  	aux = build_aux_regs(engine, &table);
>  	apply_aux_regs_engine(engine, aux);
> @@ -776,6 +775,14 @@ void intel_mocs_init(struct intel_gt *gt)
>  	if (flags & HAS_GLOBAL_MOCS)
>  		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
>  	set_mocs_index(gt, &table);
> +
> +	/*
> +	 * Initialize the L3CC table as part of mocs initalization to make
> +	 * sure the LNCFCMOCSx registers are programmed for the subsequent
> +	 * memory transactions including guc transactions
> +	 */
> +	if (flags & HAS_RENDER_L3CC)
> +		init_l3cc_table(gt->uncore, &table);
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> -- 
> 2.26.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
