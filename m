Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF192C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 09:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B286610F8
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 09:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B286610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A8F89856;
	Wed,  8 Sep 2021 09:26:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45AC89856;
 Wed,  8 Sep 2021 09:26:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="207548421"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="207548421"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 02:26:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="465451883"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 02:26:30 -0700
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210907232704.12982-1-vinay.belgaumkar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f6dce84f-0a07-ed0c-8812-7f79dc4af0c3@linux.intel.com>
Date: Wed, 8 Sep 2021 10:26:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907232704.12982-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Get PM ref before accessing HW
 register
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


On 08/09/2021 00:27, Vinay Belgaumkar wrote:
> Seeing these errors when GT is likely in suspend state-
> "RPM wakelock ref not held during HW access"
> 
> Ensure GT is awake before trying to access HW registers. Avoid
> reading the register if that is not the case.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Fixes: 41e5c17ebfc2 ("drm/i915/guc/slpc: Sysfs hooks for SLPC")
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 3489f5f0cac1..e1a198bbd135 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1969,8 +1969,14 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   u32 intel_rps_read_punit_req(struct intel_rps *rps)
>   {
>   	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
> +	intel_wakeref_t wakeref;
> +	u32 freq = 0;
>   
> -	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
> +	with_intel_runtime_pm_if_in_use(rpm, wakeref)
> +		freq = intel_uncore_read(uncore, GEN6_RPNSWREQ);
> +
> +	return freq;
>   }
>   
>   static u32 intel_rps_get_req(u32 pureq)
> 
