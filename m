Return-Path: <SRS0=BxN5=NI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A81C4320A
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Aug 2021 05:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A45D60F35
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Aug 2021 05:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A45D60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65A96E0FC;
	Tue, 17 Aug 2021 05:41:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B7A6E0FC
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Aug 2021 05:41:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214150158"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="214150158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 22:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="520302932"
Received: from bbartede-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.41.183])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 22:41:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20210816204927.GK1556418@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210813123330.31431-1-jani.nikula@intel.com>
 <20210816204927.GK1556418@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 17 Aug 2021 08:40:58 +0300
Message-ID: <87bl5wiq6t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: DG2 intermediate DP source
 rates are different from CNL+
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

On Mon, 16 Aug 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Fri, Aug 13, 2021 at 03:33:30PM +0300, Jani Nikula wrote:
>> DG2 has 243000 but not 648000.
>
> Am I looking in the wrong place?  When I check the bspec page I still
> see:
>
>         eDP/DP link bit rates: 1.62, 2.16, 2.7, 3.24, 4.32, 5.4, 6.48,
>         8.1 GHz, SSC and Non-SSC
>
> which matches the ICL rates list (i.e., 648000 included, but no
> reference to 243000).

I see the same thing. I can see no recent edits on the page either, so I
can only assume I've screwed up something, somehow when I wrote the
patch.

Never mind, and sorry for the noise.

BR,
Jani.



>
>
> Matt
>
>> 
>> Bspec: 54034
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 75d4ebc66941..e21de08fea32 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -247,6 +247,9 @@ static void
>>  intel_dp_set_source_rates(struct intel_dp *intel_dp)
>>  {
>>  	/* The values must be in increasing order */
>> +	static const int dg2_rates[] = {
>> +		162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000,
>> +	};
>>  	static const int icl_rates[] = {
>>  		162000, 216000, 270000, 324000, 432000, 540000, 648000, 810000
>>  	};
>> @@ -272,7 +275,10 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>>  	drm_WARN_ON(&dev_priv->drm,
>>  		    intel_dp->source_rates || intel_dp->num_source_rates);
>>  
>> -	if (DISPLAY_VER(dev_priv) >= 11) {
>> +	if (IS_DG2(dev_priv)) {
>> +		source_rates = dg2_rates;
>> +		size = ARRAY_SIZE(dg2_rates);
>> +	} else if (DISPLAY_VER(dev_priv) >= 11) {
>>  		source_rates = icl_rates;
>>  		size = ARRAY_SIZE(icl_rates);
>>  		if (IS_JSL_EHL(dev_priv))
>> -- 
>> 2.20.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
