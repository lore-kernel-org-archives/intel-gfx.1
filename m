Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95D7C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 10:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9155660FC1
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 10:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9155660FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70D6ED03;
	Thu, 23 Sep 2021 10:13:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97ED6ED03;
 Thu, 23 Sep 2021 10:13:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="284821952"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="284821952"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 03:13:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702664976"
Received: from gerardqu-mobl.ger.corp.intel.com (HELO [10.213.243.237])
 ([10.213.243.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 03:13:14 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20210922062527.865433-1-thomas.hellstrom@linux.intel.com>
 <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f276fe3d-5ed8-7ac9-440d-3703f6f0e5e5@linux.intel.com>
Date: Thu, 23 Sep 2021 11:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v6 3/9] drm/i915/gt: Increase suspend timeout
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


On 22/09/2021 07:25, Thomas Hellström wrote:
> With GuC submission on DG1, the execution of the requests times out
> for the gem_exec_suspend igt test case after executing around 800-900
> of 1000 submitted requests.
> 
> Given the time we allow elsewhere for fences to signal (in the order of
> seconds), increase the timeout before we mark the gt wedged and proceed.

I suspect it is not about requests not retiring in time but about the 
intel_guc_wait_for_idle part of intel_gt_wait_for_idle. Although I don't 
know which G2H message is the code waiting for at suspend time so 
perhaps something to run past the GuC experts.

Anyway, if that turns out to be correct then perhaps it would be better 
to split the two timeouts (like if required GuC timeout is perhaps 
fundamentally independent) so it's clear who needs how much time. Adding 
Matt and John to comment.

To be clear, as timeout is AFAIK an arbitrary value, I don't have 
fundamental objections here. Just think it would be good to have 
accurate story in the commit message.

Regards,

Tvrtko

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dea8e2479897..f84f2bfe2de0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -19,6 +19,8 @@
>   #include "intel_rps.h"
>   #include "intel_wakeref.h"
>   
> +#define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
> +
>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>   {
>   	int count = atomic_read(&gt->user_wakeref);
> @@ -279,7 +281,7 @@ static void wait_for_suspend(struct intel_gt *gt)
>   	if (!intel_gt_pm_is_awake(gt))
>   		return;
>   
> -	if (intel_gt_wait_for_idle(gt, I915_GEM_IDLE_TIMEOUT) == -ETIME) {
> +	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
>   		/*
>   		 * Forcibly cancel outstanding work and leave
>   		 * the gpu quiet.
> 
