Return-Path: <SRS0=Vm3B=GL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0523C433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 17:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD0E23A61
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 17:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD0E23A61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABA86E867;
	Fri,  8 Jan 2021 17:46:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5056E867
 for <intel-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 17:46:35 +0000 (UTC)
IronPort-SDR: FQROjoZ4oWoSJh5W01EVlIrtmiCVHdm8WgBbxSEmyZwJymuDUnrXHubNK2ezxcnI/SqrAdaKgB
 xtEAE/at91aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="262402328"
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="262402328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 09:46:35 -0800
IronPort-SDR: BnBGz1dMt9Hc5XPoIVRKCCjQYxAinFO5neXTaNt8pMan8G0KWpAd8BXWXrrmsFjWP3vPgGFFyJ
 HLJowvUObgjA==
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="380192023"
Received: from rgwhiteh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.205.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 09:46:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
In-Reply-To: <20201229064751.GD11717@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1608648128.git.jani.nikula@intel.com>
 <511ebda7b1fe5402e0312b20f7cf642318da9132.1608648128.git.jani.nikula@intel.com>
 <20201229064751.GD11717@intel.com>
Date: Fri, 08 Jan 2021 19:46:30 +0200
Message-ID: <87czyfxqx5.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 06/13] drm/i915/pps: abstract
 intel_pps_vdd_off_sync
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 29 Dec 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> On 2020-12-22 at 20:19:46 +0530, Jani Nikula wrote:
>> Add a locked version of intel_pps_vdd_off_sync_unlocked() that does
>> everything the callers expect it to.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c  | 31 +++---------------------
>>  drivers/gpu/drm/i915/display/intel_pps.c | 17 ++++++++++++-
>>  drivers/gpu/drm/i915/display/intel_pps.h |  2 +-
>>  3 files changed, 20 insertions(+), 30 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index f2794cc4292a..1a34c9351c30 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -5809,17 +5809,8 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder)
>>  	struct intel_dp *intel_dp = &dig_port->dp;
>>  
>>  	intel_dp_mst_encoder_cleanup(dig_port);
>> -	if (intel_dp_is_edp(intel_dp)) {
>> -		intel_wakeref_t wakeref;
>>  
>> -		cancel_delayed_work_sync(&intel_dp->panel_vdd_work);
>> -		/*
>> -		 * vdd might still be enabled do to the delayed vdd off.
>> -		 * Make sure vdd is actually turned off here.
>> -		 */
>> -		with_intel_pps_lock(intel_dp, wakeref)
>> -			intel_pps_vdd_off_sync_unlocked(intel_dp);
>> -	}
>> +	intel_pps_vdd_off_sync(intel_dp);
>>  
>>  	intel_dp_aux_fini(intel_dp);
>>  }
>> @@ -5835,18 +5826,8 @@ static void intel_dp_encoder_destroy(struct drm_encoder *encoder)
>>  void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
>>  {
>>  	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
>> -	intel_wakeref_t wakeref;
>> -
>> -	if (!intel_dp_is_edp(intel_dp))
>> -		return;
>>  
>> -	/*
>> -	 * vdd might still be enabled do to the delayed vdd off.
>> -	 * Make sure vdd is actually turned off here.
>> -	 */
>> -	cancel_delayed_work_sync(&intel_dp->panel_vdd_work);
>> -	with_intel_pps_lock(intel_dp, wakeref)
>> -		intel_pps_vdd_off_sync_unlocked(intel_dp);
>> +	intel_pps_vdd_off_sync(intel_dp);
>>  }
>>  
>>  void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
>> @@ -6700,13 +6681,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>  	return true;
>>  
>>  out_vdd_off:
>> -	cancel_delayed_work_sync(&intel_dp->panel_vdd_work);
>> -	/*
>> -	 * vdd might still be enabled do to the delayed vdd off.
>> -	 * Make sure vdd is actually turned off here.
>> -	 */
>> -	with_intel_pps_lock(intel_dp, wakeref)
>> -		intel_pps_vdd_off_sync_unlocked(intel_dp);
>> +	intel_pps_vdd_off_sync(intel_dp);
>>  
>>  	return false;
>>  }
>> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
>> index 01c9e69f4e3a..acd6d0092bc6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_pps.c
>> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
>> @@ -641,7 +641,7 @@ void intel_pps_vdd_on(struct intel_dp *intel_dp)
>>  			dp_to_dig_port(intel_dp)->base.base.name);
>>  }
>>  
>> -void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>> +static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>>  {
>>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>>  	struct intel_digital_port *dig_port =
>> @@ -682,6 +682,21 @@ void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>>  				fetch_and_zero(&intel_dp->vdd_wakeref));
>>  }
>>  
>> +void intel_pps_vdd_off_sync(struct intel_dp *intel_dp)
>> +{
>> +	intel_wakeref_t wakeref;
>> +	if (!intel_dp_is_edp(intel_dp))
>> +		return;
>> +
>> +	cancel_delayed_work_sync(&intel_dp->panel_vdd_work);
>> +	/*
>> +	 * vdd might still be enabled do to the delayed vdd off.
> 	I belive there is a typo here "do -> due"

I just copy-pasted this over, but fixed in v2.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
