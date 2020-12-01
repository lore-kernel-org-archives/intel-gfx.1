Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15DFC64E7A
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 13:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC7020705
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 13:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC7020705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D016E546;
	Tue,  1 Dec 2020 13:53:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FAA6E546
 for <Intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 13:53:03 +0000 (UTC)
IronPort-SDR: I4ueZNWjSN/3qqqw7C4nwo1E5o3cR7kTuOb+hjjh9EFjrTwwPsRQS2EaSBIWpYV6gHvzRnh/SK
 xwAqTf70uhUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169325404"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="169325404"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 05:53:02 -0800
IronPort-SDR: b0Vnd1qv1FSWUXLComYH5kh8mVh40kCuwM464hS/C5xIj3fz/IznmcU+fYZM8ydK8qmySVRrl1
 j90UIPZQDzPw==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="481102375"
Received: from lkuch-mobl.ger.corp.intel.com (HELO [10.214.220.169])
 ([10.214.220.169])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 05:53:00 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, Intel-gfx@lists.freedesktop.org
References: <20201127100109.1968571-1-tvrtko.ursulin@linux.intel.com>
 <20201201131757.206367-1-tvrtko.ursulin@linux.intel.com>
 <160682899564.4024.6593348558878544128@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bcb7fd16-915a-0710-74a6-042f1734788b@linux.intel.com>
Date: Tue, 1 Dec 2020 13:52:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160682899564.4024.6593348558878544128@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/pmu: Deprecate I915_PMU_LAST
 and optimize state tracking
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


On 01/12/2020 13:23, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-12-01 13:17:57)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index fa1f3d62f9a6..6edcb2b6c708 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -178,7 +178,7 @@ enum drm_i915_pmu_engine_sample {
>>   #define I915_PMU_INTERRUPTS            __I915_PMU_OTHER(2)
>>   #define I915_PMU_RC6_RESIDENCY         __I915_PMU_OTHER(3)
>>   
>> -#define I915_PMU_LAST I915_PMU_RC6_RESIDENCY
>> +#define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
> 
> Do we still update the value, or let it rot?

Rot for a while and then zap was my plan. As soon as I wean perf_pmu of 
it. Too bold and reckless?

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
