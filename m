Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F74C2B9F8
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 19:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA21C61404
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA21C61404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C5589204;
	Tue, 25 May 2021 19:38:05 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D0A89173;
 Tue, 25 May 2021 19:38:03 +0000 (UTC)
IronPort-SDR: 7b2uyByDSzbOkUu9EgoUEkPe4WI0jLfUM5gxGv9cR3L+CBuoG1L2kvRY9l+QA/PXcBWF7HvEhO
 vP3XNN4S62iA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182607710"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="182607710"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 12:37:54 -0700
IronPort-SDR: fRxFIQSgu6abP/wlBsnxMf0q9KC+iyqFuER1j70z0cQt3ApLKH6vFb29kMlqhwhLw4gDD0FlZe
 eJryUNrZjTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="442701529"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 25 May 2021 12:37:52 -0700
Received: from [10.249.148.145] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.148.145])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14PJbpYH009433; Tue, 25 May 2021 20:37:51 +0100
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-16-matthew.brost@intel.com>
 <20210525180800.GA23177@sdutt-i7>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <7ff46b4b-23d9-f3f9-3041-0c5c95bd4d88@intel.com>
Date: Tue, 25 May 2021 21:37:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525180800.GA23177@sdutt-i7>
Content-Language: en-US
Subject: Re: [Intel-gfx] [RFC PATCH 15/97] drm/i915/guc: Relax CTB response
 timeout
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



On 25.05.2021 20:08, Matthew Brost wrote:
> On Thu, May 06, 2021 at 12:13:29PM -0700, Matthew Brost wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> In upcoming patch we will allow more CTB requests to be sent in
>> parallel to the GuC for procesing, so we shouldn't assume any more
>> that GuC will always reply without 10ms.
>>
>> Use bigger value from CONFIG_DRM_I915_HEARTBEAT_INTERVAL instead.
>>
> 
> I think this should be its own config option or we combine it with a
> config option suggested in patch 37.
> 
> What do you think Michal? If you agree I can fix this up in the post of
> these patches.

+ Tvrtko

yep, use of dedicated GuC CONFIG is what we also agree internally,
existing HEARTBEAT_INTERVAL was just fastest way to bypass 10ms

so, yes, please go ahead and do it right

> 
> Matt
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index c87a0a8bef26..a4b2e7fe318b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -436,17 +436,23 @@ static int ct_write(struct intel_guc_ct *ct,
>>   */
>>  static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>>  {
>> +	long timeout;
>>  	int err;
>>  
>>  	/*
>>  	 * Fast commands should complete in less than 10us, so sample quickly
>>  	 * up to that length of time, then switch to a slower sleep-wait loop.
>>  	 * No GuC command should ever take longer than 10ms.
>> +	 *
>> +	 * However, there might be other CT requests in flight before this one,
>> +	 * so use @CONFIG_DRM_I915_HEARTBEAT_INTERVAL as backup timeout value.
>>  	 */
>> +	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
>> +
>>  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
>>  	err = wait_for_us(done, 10);
>>  	if (err)
>> -		err = wait_for(done, 10);
>> +		err = wait_for(done, timeout);
>>  #undef done
>>  
>>  	if (unlikely(err))
>> -- 
>> 2.28.0
>>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
