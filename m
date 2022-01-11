Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218B3C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Jan 2022 10:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7310210E6B9;
	Tue, 11 Jan 2022 10:26:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1510E6B9;
 Tue, 11 Jan 2022 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641896770; x=1673432770;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ARxasz8w9czeiodYacB+PZSOdJ2LfMsLx3EBjShtHfA=;
 b=kGstgODMGNsMo1xqqDeP1XK6yusEiGT+XuhxhTy7vNItOfxw/CpoKn5K
 hpLZPyaAOXxl6y0sUdbYFyRPRBWpF1Wf0fjwsyB7x7z9JkBzx4QN719xa
 LuOATVPf1r5lHN430rqSB1afbAjx3qsQC7JnGjcnF3Ug0B6MbzXboKvXs
 Xe7E7RI426yvhZxpLIpbzacawPBKit9CwPVBCkvNK2oyIMvKZZqLA7hYi
 3zM/aNLaGBy6RIbnDSBUnp3meE+u6bTLmrb+6LawOjuP2zIcTrbor7JsN
 X+Udkvh91sCYFtJash1i2dmHyEKPPc8aCMGXslp/LNT44S/Z234Ol7HqF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243249531"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243249531"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 02:26:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="558318453"
Received: from noblecat-mobl.ger.corp.intel.com (HELO [10.213.217.217])
 ([10.213.217.217])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 02:26:07 -0800
Message-ID: <c7d4c7b5-e100-7a26-6a92-06b2e2a4b276@linux.intel.com>
Date: Tue, 11 Jan 2022 10:26:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220109203152.51414-1-colin.i.king@gmail.com>
 <5da796b5-a19e-e07b-7cb5-7a30726bd2ff@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <5da796b5-a19e-e07b-7cb5-7a30726bd2ff@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH] i915: make array flex_regs static const
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 11/01/2022 09:13, Tvrtko Ursulin wrote:
> On 09/01/2022 20:31, Colin Ian King wrote:
>> Don't populate the read-only array flex_regs on the stack but
>> instead it static const. Also makes the object code a little smaller.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_perf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index e27f3b7cf094..df698960fdc0 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -2114,7 +2114,7 @@ gen8_update_reg_state_unlocked(const struct 
>> intel_context *ce,
>>       u32 ctx_oactxctrl = stream->perf->ctx_oactxctrl_offset;
>>       u32 ctx_flexeu0 = stream->perf->ctx_flexeu0_offset;
>>       /* The MMIO offsets for Flex EU registers aren't contiguous */
>> -    i915_reg_t flex_regs[] = {
>> +    static const i915_reg_t flex_regs[] = {
>>           EU_PERF_CNTL0,
>>           EU_PERF_CNTL1,
>>           EU_PERF_CNTL2,
>>
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> And will merge shortly, thanks for the patch.

Actually I couldn't merge it because you have a Author and Signed-off-by 
mismatch due your entry in .mailmap. Is this something you can update or 
send the patch from an address which matches it?

Regards,

Tvrtko
