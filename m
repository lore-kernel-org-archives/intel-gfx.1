Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D34C64E90
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6640A2076E
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6640A2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579689F5F;
	Mon, 30 Nov 2020 11:10:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2289F27;
 Mon, 30 Nov 2020 11:10:01 +0000 (UTC)
IronPort-SDR: 7QvU+Q35FJUAu011rZ7N4SQzwuDDAzkIQxPdZanBFOZRgPLMqJ47NmELGgV37LYCTxomM7W3Ai
 VoGfDBJqhJQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="171833042"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="171833042"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:10:00 -0800
IronPort-SDR: sA+KxObpPDuIbBScTiloxTAd926WmPkmERdBjZgb14/Qxy7PiNyHucmj1CfYFiM/N5+h5aXBcZ
 dP4Y4u+cS2vw==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="538558124"
Received: from ekiperwa-mobl.ger.corp.intel.com (HELO [10.252.22.113])
 ([10.252.22.113])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:09:59 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-119-matthew.auld@intel.com>
 <160648517402.2925.2248861493310859776@build.alporthouse.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <5177b585-06d5-2432-791f-f9cf0e6f0613@intel.com>
Date: Mon, 30 Nov 2020 11:09:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160648517402.2925.2248861493310859776@build.alporthouse.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [RFC PATCH 118/162] drm/i915/dg1: Reserve first 1MB
 of local memory
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 27/11/2020 13:52, Chris Wilson wrote:
> Quoting Matthew Auld (2020-11-27 12:06:34)
>> From: Imre Deak <imre.deak@intel.com>
>>
>> On DG1 A0/B0 steppings the first 1MB of local memory must be reserved.
>> One reason for this is that the 0xA0000-0xB0000 range is not accessible
>> by the display, probably since this region is redirected to another
>> memory location for legacy VGA compatibility.
>>
>> BSpec: 50586
>> Testcase: igt/kms_big_fb/linear-64bpp-rotate-0
>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>> ---
>>   drivers/gpu/drm/i915/intel_region_lmem.c | 52 ++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
>> index 939cf0d195a5..eafef7034680 100644
>> --- a/drivers/gpu/drm/i915/intel_region_lmem.c
>> +++ b/drivers/gpu/drm/i915/intel_region_lmem.c
>> @@ -137,6 +137,48 @@ intel_setup_fake_lmem(struct drm_i915_private *i915)
>>          return mem;
>>   }
>>   
>> +static void get_legacy_lowmem_region(struct intel_uncore *uncore,
>> +                                    u64 *start, u32 *size)
>> +{
>> +       *start = 0;
>> +       *size = 0;
>> +
>> +       if (!IS_DG1_REVID(uncore->i915, DG1_REVID_A0, DG1_REVID_B0))
>> +               return;
>> +
>> +       *size = SZ_1M;
>> +
>> +       DRM_DEBUG_DRIVER("LMEM: reserved legacy low-memory [0x%llx-0x%llx]\n",
>> +                        *start, *start + *size);
>> +}
>> +
>> +static int reserve_lowmem_region(struct intel_uncore *uncore,
>> +                                struct intel_memory_region *mem)
>> +{
>> +       u64 reserve_start;
>> +       u64 reserve_end;
>> +       u64 region_start;
>> +       u32 region_size;
>> +       int ret;
>> +
>> +       get_legacy_lowmem_region(uncore, &region_start, &region_size);
>> +       reserve_start = region_start;
>> +       reserve_end = region_start + region_size;
>> +
>> +       if (!reserve_end)
>> +               return 0;
>> +
>> +       DRM_INFO("LMEM: reserving low-memory region [0x%llx-0x%llx]\n",
>> +                reserve_start, reserve_end);
>> +       ret = i915_buddy_alloc_range(&mem->mm, &mem->reserved,
>> +                                    reserve_start,
>> +                                    reserve_end - reserve_start);
> 
> Isn't this now relative to the stolen offset? Should this be reserved,
> or excluded like stolen?

AFAIK stolen is just snipped off at the end of lmem, so I don't think it 
really matters if we exclude or reserve. But for this if we exclude then 
the region.start might have "strange" alignment, which is annoying since 
alloc(some_power_of_two) might not give us the expected alignment, 
whereas if we reserve then the allocator is aware, and so we should get 
the proper alignment. Maybe you have better ideas with how to handle 
this, but I think keeping the alignment property is nice.

> -Chris
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
