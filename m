Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC502C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 14:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6281064DDE
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 14:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6281064DDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202C6ED25;
	Thu,  4 Feb 2021 14:09:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559E66ED25
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 14:09:25 +0000 (UTC)
IronPort-SDR: vhpT6WyxePsip5fpgvK3oogDyUUh6n9WXtnSlKJhtVT050EblKwiSR1RDIsezdAytv6P0Rd9K8
 h9BCy816pdjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="161000082"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="161000082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 06:09:24 -0800
IronPort-SDR: S93rn5OLo8p6OSF4xXgV9nj7U/3J5vKX3g9bsj9MrxTa9EsVw1J5vbUo7Q6yt09FL3uY3hwnKp
 eVO0mrxLFkXw==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="393179424"
Received: from acanalx-mobl.ger.corp.intel.com (HELO [10.249.32.114])
 ([10.249.32.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 06:09:23 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
 <20210201085715.27435-24-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4f33e3ea-d28d-fc95-4f0b-d7305dcb1163@linux.intel.com>
Date: Thu, 4 Feb 2021 14:09:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201085715.27435-24-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 24/57] drm/i915/gt: Only kick the scheduler
 on timeslice/preemption change
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


On 01/02/2021 08:56, Chris Wilson wrote:
> Kick the scheduler to allow it to see the timeslice duration change,
> don't peek into execlists.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gt/sysfs_engines.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 57ef5383dd4e..526f8402cfb7 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -9,6 +9,7 @@
>   #include "i915_drv.h"
>   #include "intel_engine.h"
>   #include "intel_engine_heartbeat.h"
> +#include "intel_engine_pm.h"
>   #include "sysfs_engines.h"
>   
>   struct kobj_engine {
> @@ -222,9 +223,8 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
> -
> -	if (execlists_active(&engine->execlists))
> -		set_timer_ms(&engine->execlists.timer, duration);
> +	if (intel_engine_pm_is_awake(engine))
> +		intel_engine_kick_scheduler(engine);
>   
>   	return count;
>   }
> @@ -326,9 +326,8 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
> -
> -	if (READ_ONCE(engine->execlists.pending[0]))
> -		set_timer_ms(&engine->execlists.preempt, timeout);
> +	if (intel_engine_pm_is_awake(engine))
> +		intel_engine_kick_scheduler(engine);
>   
>   	return count;
>   }
> 

Almost feels like from sysfs layer intel_engine_kick_scheduler should 
dtrt without the need to check intel_engine_pm_is_awake. Even if that 
means having __intel_engine_kick_scheduler for more intimate callers, if 
required.
  But anyway it is no worse than it was.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
