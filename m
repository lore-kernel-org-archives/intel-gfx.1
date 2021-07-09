Return-Path: <SRS0=9WF3=MB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49337C07E99
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 23:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F1361289
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 23:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F1361289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C226E9AD;
	Fri,  9 Jul 2021 23:03:25 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181886E9AD;
 Fri,  9 Jul 2021 23:03:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="207969359"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="207969359"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 16:03:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="649663637"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.142.243])
 ([10.212.142.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 16:03:15 -0700
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-19-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bb7c547e-bb3d-ce63-75b4-dada8d501c58@intel.com>
Date: Fri, 9 Jul 2021 16:03:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-19-matthew.brost@intel.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH 18/47] drm/i915: Disable preempt busywait
 when using GuC scheduling
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

On 6/24/2021 00:04, Matthew Brost wrote:
> Disable preempt busywait when using GuC scheduling. This isn't need as
needed

> the GuC control preemption when scheduling.
controls

With the above fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 87b06572fd2e..f7aae502ec3d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -506,7 +506,8 @@ gen8_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   	*cs++ = MI_USER_INTERRUPT;
>   
>   	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> -	if (intel_engine_has_semaphores(rq->engine))
> +	if (intel_engine_has_semaphores(rq->engine) &&
> +	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
>   		cs = emit_preempt_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);
> @@ -598,7 +599,8 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   	*cs++ = MI_USER_INTERRUPT;
>   
>   	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> -	if (intel_engine_has_semaphores(rq->engine))
> +	if (intel_engine_has_semaphores(rq->engine) &&
> +	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
>   		cs = gen12_emit_preempt_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
