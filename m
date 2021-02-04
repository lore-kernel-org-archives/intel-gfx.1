Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82D0C433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 12:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF5E64E34
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 12:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DF5E64E34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1296ECB2;
	Thu,  4 Feb 2021 12:57:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083556ECB2
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 12:57:55 +0000 (UTC)
IronPort-SDR: tdV2bgknj8WAtlBKdmQ7/ICk2gynwM0m98Z2vhq/VvZKE89WqkpZAOwhFloyHI11swi385EgG8
 cqJtdK/3FCrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="178669289"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="178669289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 04:57:54 -0800
IronPort-SDR: jCY6rR76O5huUsjx/XjS0xBlXK0TCy6hwam/GQ7lDcfxb1Xpb9CyKDBfl91o/yY47ECiy3pAOC
 VIk5AZY1Qccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="407201631"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2021 04:57:53 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id C5BB95C1F9C; Thu,  4 Feb 2021 14:57:46 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210204110620.32422-2-chris@chris-wilson.co.uk>
References: <20210204110620.32422-1-chris@chris-wilson.co.uk>
 <20210204110620.32422-2-chris@chris-wilson.co.uk>
Date: Thu, 04 Feb 2021 14:57:46 +0200
Message-ID: <87zh0kt2gl.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gt: Double check heartbeat
 timeout before resetting
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Check that we have actually passed the heartbeat interval since last
> checking the request before resetting the device.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2780
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 48a91c0dbad6..93741a65924a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -31,7 +31,7 @@ static bool next_heartbeat(struct intel_engine_cs *engine)
>  	delay = msecs_to_jiffies_timeout(delay);
>  	if (delay >= HZ)
>  		delay = round_jiffies_up_relative(delay);
> -	mod_delayed_work(system_highpri_wq, &engine->heartbeat.work, delay);
> +	mod_delayed_work(system_highpri_wq, &engine->heartbeat.work, delay + 1);
>  
>  	return true;
>  }
> @@ -103,6 +103,13 @@ static void heartbeat(struct work_struct *wrk)
>  		goto out;
>  
>  	if (engine->heartbeat.systole) {
> +		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
> +
> +		/* Safeguard against too-fast worker invocations */
> +		if (!time_after(jiffies,
> +				rq->emitted_jiffies + msecs_to_jiffies(delay)))
> +			goto out;
> +
>  		if (!i915_sw_fence_signaled(&rq->submit)) {
>  			/*
>  			 * Not yet submitted, system is stalled.
> @@ -139,6 +146,8 @@ static void heartbeat(struct work_struct *wrk)
>  					      "stopped heartbeat on %s",
>  					      engine->name);
>  		}
> +
> +		rq->emitted_jiffies = jiffies;

Would possibly interfere with throttle. But who would get handle to
internal request.

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

>  		goto out;
>  	}
>  
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
