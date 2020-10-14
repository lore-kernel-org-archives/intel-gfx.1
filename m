Return-Path: <SRS0=eTAM=DV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DF5C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 08:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3914020BED
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3914020BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCA86EA22;
	Wed, 14 Oct 2020 08:36:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5D86EA22
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 08:36:12 +0000 (UTC)
IronPort-SDR: 3qpgCl59ixjtqh/EAfDGbVvQKgBSunXZ5qdzOPMr05C5rRHaxX2K9JU0KuLAlFDyC4zyG2oDcH
 yXqrwGBr/GlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="230236165"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="230236165"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 01:36:11 -0700
IronPort-SDR: Mjfk/3Gke4zhDc4gghi8VTJ+qvd0CITNx6k0gNRY57X9vsl5m/fVpXbsdoLtWZ75yXG/njklQ5
 vy8lrffXyGFA==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="530740767"
Received: from abrahabi-mobl.ger.corp.intel.com (HELO [10.249.36.244])
 ([10.249.36.244])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 01:36:10 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201013153506.4215-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <475985b5-8e4d-81f3-5f00-58eecbbdf865@linux.intel.com>
Date: Wed, 14 Oct 2020 09:36:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013153506.4215-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Confirm the context survives
 execution
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 13/10/2020 16:35, Chris Wilson wrote:
> Repeat our sanitychecks from before execution to after execution. One
> expects that if we were to see these, the gpu would already be on fire,
> but the timing may be informative.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gt/intel_lrc.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 287537089c77..3dbdd5d0cb60 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1216,7 +1216,8 @@ static void intel_engine_context_out(struct intel_engine_cs *engine)
>   
>   static void
>   execlists_check_context(const struct intel_context *ce,
> -			const struct intel_engine_cs *engine)
> +			const struct intel_engine_cs *engine,
> +			const char *when)
>   {
>   	const struct intel_ring *ring = ce->ring;
>   	u32 *regs = ce->lrc_reg_state;
> @@ -1251,7 +1252,7 @@ execlists_check_context(const struct intel_context *ce,
>   		valid = false;
>   	}
>   
> -	WARN_ONCE(!valid, "Invalid lrc state found before submission\n");
> +	WARN_ONCE(!valid, "Invalid lrc state found %s submission\n", when);
>   }
>   
>   static void restore_default_state(struct intel_context *ce,
> @@ -1347,7 +1348,7 @@ __execlists_schedule_in(struct i915_request *rq)
>   		reset_active(rq, engine);
>   
>   	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> -		execlists_check_context(ce, engine);
> +		execlists_check_context(ce, engine, "before");
>   
>   	if (ce->tag) {
>   		/* Use a fixed tag for OA and friends */
> @@ -1418,6 +1419,9 @@ __execlists_schedule_out(struct i915_request *rq,
>   	 * refrain from doing non-trivial work here.
>   	 */
>   
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> +		execlists_check_context(ce, engine, "after");
> +

CI failures here are either something super scary or a simple mistake 
which I cannot see. Or is engine retire, possible queued up before, 
racing with current schedule_out?

Regards,

Tvrtko

>   	/*
>   	 * If we have just completed this context, the engine may now be
>   	 * idle and we want to re-enter powersaving.
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
