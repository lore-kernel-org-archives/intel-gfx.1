Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434F6C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 14:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3AF60C3E
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 14:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB3AF60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703DA6E12D;
	Wed,  8 Sep 2021 14:10:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3F96E0D9;
 Wed,  8 Sep 2021 14:10:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="218630141"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="218630141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 07:10:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="465645639"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 07:10:09 -0700
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-8-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b71fcfd1-0566-ed09-9d40-a0b57d9f9734@linux.intel.com>
Date: Wed, 8 Sep 2021 15:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907171916.2548047-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915/xehp: Enable ccs/dual-ctx in
 RCU_MODE
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


On 07/09/2021 18:19, Matt Roper wrote:
> We have to specify in the Render Control Unit Mode register
> when CCS is enabled.
> 
> Bspec: 46034
> Original-patch-by: Michel Thierry
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   .../drm/i915/gt/intel_execlists_submission.c  | 26 +++++++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++++++++++++++++
>   drivers/gpu/drm/i915/i915_reg.h               |  3 +++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 2b36ec7f3a04..046f7da67ba6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2874,6 +2874,29 @@ static int execlists_resume(struct intel_engine_cs *engine)
>   	return 0;
>   }
>   
> +static int gen12_rcs_resume(struct intel_engine_cs *engine)
> +{
> +	int ret;
> +
> +	ret = execlists_resume(engine);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Multi Context programming.
> +	 * just need to program this register once no matter how many CCS

Just

> +	 * engines there are. Since some of the CCS engines might be fused off,
> +	 * we can't do this as part of the init of a specific CCS and we do
> +	 * it during RCS init instead. RCS and all CCS engines are reset

I don't really understand the "can't" part - clearly it would be doable 
if a specific vfunc was assigned to one ccs only, the one which is 
present of course. Not saying that would be nicer since I think it has 
it's own downside.

Perhaps nicest solution is to add an engine flag saying "enables rcu" 
and then execlists and guc resume check that and do stuff?

No strong opinion yet, just discussing.

> +	 * together, so post-reset re-init is covered as well.
> +	 */
> +	if (CCS_MASK(engine->gt))
> +		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
> +			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
> +
> +	return 0;
> +}
> +
>   static void execlists_reset_prepare(struct intel_engine_cs *engine)
>   {
>   	ENGINE_TRACE(engine, "depth<-%d\n",
> @@ -3394,6 +3417,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
>   		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
>   		break;
>   	}
> +
> +	if (engine->class == RENDER_CLASS)
> +		engine->resume = gen12_rcs_resume;
>   }
>   
>   int intel_execlists_submission_setup(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 2f5bf7aa7e3b..db956255d076 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2350,6 +2350,29 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
>   	return !sched_engine->tasklet.callback;
>   }
>   
> +static int gen12_rcs_resume(struct intel_engine_cs *engine)
> +{
> +	int ret;
> +
> +	ret = guc_resume(engine);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Multi Context programming.
> +	 * just need to program this register once no matter how many CCS
> +	 * engines there are. Since some of the CCS engines might be fused off,
> +	 * we can't do this as part of the init of a specific CCS and we do
> +	 * it during RCS init instead. RCS and all CCS engines are reset
> +	 * together, so post-reset re-init is covered as well.
> +	 */
> +	if (CCS_MASK(engine->gt))
> +		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
> +			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));

Duplicating the write from gen12_rcs_resume looks passable but when with 
the whole comment then hmm.. How about a helper is added which both 
would call? Like intel_engine_enable_rcu_mode() or something?

Regards,

Tvrtko

> +
> +	return 0;
> +}
> +
>   static void guc_set_default_submission(struct intel_engine_cs *engine)
>   {
>   	engine->submit_request = guc_submit_request;
> @@ -2464,6 +2487,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
>   		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
>   		break;
>   	}
> +
> +	if (engine->class == RENDER_CLASS)
> +		engine->resume = gen12_rcs_resume;
>   }
>   
>   static inline void guc_default_irqs(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5b68c02c35af..57f9456f8c61 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -498,6 +498,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>   #define   ECOBITS_PPGTT_CACHE64B	(3 << 8)
>   #define   ECOBITS_PPGTT_CACHE4B		(0 << 8)
>   
> +#define GEN12_RCU_MODE			_MMIO(0x14800)
> +#define   GEN12_RCU_MODE_CCS_ENABLE	REG_BIT(0)
> +
>   #define GAB_CTL				_MMIO(0x24000)
>   #define   GAB_CTL_CONT_AFTER_PAGEFAULT	(1 << 8)
>   
> 
