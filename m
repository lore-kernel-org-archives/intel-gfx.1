Return-Path: <SRS0=Opgb=NH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF42C432BE
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Aug 2021 11:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445F76323D
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Aug 2021 11:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 445F76323D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B405899C7;
	Mon, 16 Aug 2021 11:54:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3C4899C7
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Aug 2021 11:54:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="203045489"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="203045489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 04:54:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="679071362"
Received: from swatish2-mobl1.gar.corp.intel.com (HELO [10.215.193.217])
 ([10.215.193.217])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 04:54:24 -0700
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ville Syrj_l_ <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Manasi Navare <manasi.d.navare@intel.com>,
 Jos_ Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
References: <20210812125845.27787-1-swati2.sharma@intel.com>
 <871r6xn5wd.fsf@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Organization: Intel
Message-ID: <04e2728f-a5e3-a8ee-9fdc-9affe753b59e@intel.com>
Date: Mon, 16 Aug 2021 17:24:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <871r6xn5wd.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Drop redundant debug print
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



On 13-Aug-21 1:16 PM, Jani Nikula wrote:
> On Thu, 12 Aug 2021, Swati Sharma <swati2.sharma@intel.com> wrote:
>> drm_dp_dpcd_read/write already has debug error message.
>> Drop redundant error messages which gives false
>> status even if correct value is read in drm_dp_dpcd_read().
> 
> I guess the only problem is it gets harder to associate the preceding
> low level error messages with intel_dp_check_link_service_irq(). *shrug*
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
Thanks Jani for the review. Can you please merge?

>>
>> Fixes: 9488a030ac91 ("drm/i915: Add support for enabling link status and recovery")
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com> (v2)
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: "Ville Syrj_l_" <ville.syrjala@linux.intel.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: "Jos_ Roberto de Souza" <jose.souza@intel.com>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: <stable@vger.kernel.org> # v5.12+
>>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20201218103723.30844-12-ankit.k.nautiyal@intel.com
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index c386ef8eb200..5c84f51ad41d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3871,16 +3871,12 @@ static void intel_dp_check_link_service_irq(struct intel_dp *intel_dp)
>>   		return;
>>   
>>   	if (drm_dp_dpcd_readb(&intel_dp->aux,
>> -			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) != 1 || !val) {
>> -		drm_dbg_kms(&i915->drm, "Error in reading link service irq vector\n");
>> +			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) != 1 || !val)
>>   		return;
>> -	}
>>   
>>   	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>> -			       DP_LINK_SERVICE_IRQ_VECTOR_ESI0, val) != 1) {
>> -		drm_dbg_kms(&i915->drm, "Error in writing link service irq vector\n");
>> +			       DP_LINK_SERVICE_IRQ_VECTOR_ESI0, val) != 1)
>>   		return;
>> -	}
>>   
>>   	if (val & HDMI_LINK_STATUS_CHANGED)
>>   		intel_dp_handle_hdmi_link_status_change(intel_dp);
> 

-- 
~Swati Sharma
