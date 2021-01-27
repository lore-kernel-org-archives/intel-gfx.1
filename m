Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA021C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 14:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B53520799
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 14:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B53520799
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53A76E823;
	Wed, 27 Jan 2021 14:13:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C8A6E823
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 14:13:17 +0000 (UTC)
IronPort-SDR: 1Vy9RCInZIrpAUdCSh/MRVmrq3UCJoiJkkZPW83ZXs4MvnYhHQKNCGjC2eUIev16CeSbS1ABU+
 MoCBsWKecl7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176561590"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="176561590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 06:13:16 -0800
IronPort-SDR: WiO/X37L4oBg9AL8E42OWVL3uz4Rj1RiIFqf3+dXiM6lBE9O88QEOwwLWBOOYoG+GkwRD1foG2
 k0Y9xgSNiXOw==
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="388321753"
Received: from aohana-mobl1.ger.corp.intel.com (HELO [10.214.230.73])
 ([10.214.230.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 06:13:13 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210125140136.10494-1-chris@chris-wilson.co.uk>
 <20210125140136.10494-19-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <41a8c76f-d3aa-539d-1742-faa32c05d397@linux.intel.com>
Date: Wed, 27 Jan 2021 14:13:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210125140136.10494-19-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 19/41] drm/i915/gt: Show scheduler queues
 when dumping state
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
Cc: thomas.hellstrom@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 25/01/2021 14:01, Chris Wilson wrote:
> Move the scheduler pretty printer from out of the execlists state to
> match its more common location.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 34 +++++++++++++----------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index cdd07aeada05..2f9a8960144b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1443,20 +1443,15 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
>   
>   	if (intel_engine_in_guc_submission_mode(engine)) {
>   		/* nothing to print yet */
> -	} else if (HAS_EXECLISTS(dev_priv)) {
> -		struct i915_request * const *port, *rq;
>   		const u32 *hws =
>   			&engine->status_page.addr[I915_HWS_CSB_BUF0_INDEX];
>   		const u8 num_entries = execlists->csb_size;
>   		unsigned int idx;
>   		u8 read, write;
>   
> -		drm_printf(m, "\tExeclist tasklet queued? %s (%s), preempt? %s, timeslice? %s\n",
> -			   yesno(test_bit(TASKLET_STATE_SCHED,
> -					  &engine->active.tasklet.state)),
> -			   enableddisabled(!atomic_read(&engine->active.tasklet.count)),
> -			   repr_timer(&engine->execlists.preempt),
> -			   repr_timer(&engine->execlists.timer));
> +		drm_printf(m, "\tExeclists preempt? %s, timeslice? %s\n",
> +			   repr_timer(&execlists->preempt),
> +			   repr_timer(&execlists->timer));
>   
>   		read = execlists->csb_head;
>   		write = READ_ONCE(*execlists->csb_write);
> @@ -1477,6 +1472,22 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
>   			drm_printf(m, "\tExeclist CSB[%d]: 0x%08x, context: %d\n",
>   				   idx, hws[idx * 2], hws[idx * 2 + 1]);
>   		}
> +	} else if (INTEL_GEN(dev_priv) > 6) {
> +		drm_printf(m, "\tPP_DIR_BASE: 0x%08x\n",
> +			   ENGINE_READ(engine, RING_PP_DIR_BASE));
> +		drm_printf(m, "\tPP_DIR_BASE_READ: 0x%08x\n",
> +			   ENGINE_READ(engine, RING_PP_DIR_BASE_READ));
> +		drm_printf(m, "\tPP_DIR_DCLV: 0x%08x\n",
> +			   ENGINE_READ(engine, RING_PP_DIR_DCLV));
> +	}
> +
> +	if (engine->active.tasklet.func) {
> +		struct i915_request * const *port, *rq;
> +
> +		drm_printf(m, "\tTasklet queued? %s (%s)\n",
> +			   yesno(test_bit(TASKLET_STATE_SCHED,
> +					  &engine->active.tasklet.state)),
> +			   enableddisabled(!atomic_read(&engine->active.tasklet.count)));

Or have i915_sched_print_state() exported? Again it will depend on how 
clean split will be possible.

Regards,

Tvrtko

>   
>   		i915_sched_lock_bh(&engine->active);
>   		rcu_read_lock();
> @@ -1510,13 +1521,6 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
>   		}
>   		rcu_read_unlock();
>   		i915_sched_unlock_bh(&engine->active);
> -	} else if (INTEL_GEN(dev_priv) > 6) {
> -		drm_printf(m, "\tPP_DIR_BASE: 0x%08x\n",
> -			   ENGINE_READ(engine, RING_PP_DIR_BASE));
> -		drm_printf(m, "\tPP_DIR_BASE_READ: 0x%08x\n",
> -			   ENGINE_READ(engine, RING_PP_DIR_BASE_READ));
> -		drm_printf(m, "\tPP_DIR_DCLV: 0x%08x\n",
> -			   ENGINE_READ(engine, RING_PP_DIR_DCLV));
>   	}
>   }
>   
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
