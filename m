Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F123EC6377D
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 08:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD9E6121E
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 08:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD9E6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5358D6E828;
	Thu, 22 Jul 2021 08:13:50 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C106E828;
 Thu, 22 Jul 2021 08:13:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233404900"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="233404900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:13:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470540265"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:13:47 -0700
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-48-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d15aeb2c-3fa1-a78c-2d23-0f64112f3ca3@linux.intel.com>
Date: Thu, 22 Jul 2021 09:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716201724.54804-48-matthew.brost@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 47/51] drm/i915/selftest: Increase some
 timeouts in live_requests
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


On 16/07/2021 21:17, Matthew Brost wrote:
> Requests may take slightly longer with GuC submission, let's increase
> the timeouts in live_requests.

Hm "slightly" ends up 5x longer here and one second feels a lot.

Out of curiosity, given this is about a simple submit of a no-op batches 
in a tight loop, where does the huge amount of extra latency come from? 
Is it single H2G channel shared for all engines, the firmware, or GuC 
speed itself?

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index bd5c96a77ba3..d67710d10615 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +		if (i915_request_wait(rq, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(rq);
>   		if (err)
> @@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
>   	}
>   	igt_spinner_end(&spin);
>   
> -	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
> +	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
>   		err = -EIO;
>   	i915_request_put(rq);
>   
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
