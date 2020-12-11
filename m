Return-Path: <SRS0=6ulK=FP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9BFC4361B
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Dec 2020 13:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F37207A6
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Dec 2020 13:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F37207A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028986EDE4;
	Fri, 11 Dec 2020 13:18:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665756EDE4;
 Fri, 11 Dec 2020 13:18:46 +0000 (UTC)
IronPort-SDR: qMc8vBAj2rWm4H+etkuqI1qypZ/eQOiK07je6bzbIP52McXTXx2Ku9cpDJu8Qq9hj10ERYNXZM
 V5nt8Z80jdaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="153661533"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="153661533"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:18:45 -0800
IronPort-SDR: bP/S2cyuKunZ0ZfswESazukdFn6UgOYieyAQsU2ha3wK1SwYGWTFrq2PcB8b8EltkOtH0bBEjA
 l5gft72LwT/A==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="349457555"
Received: from dkreft-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.158.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:18:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
In-Reply-To: <20201209235615.GA3636@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201209211828.53193-1-sean@poorly.run>
 <20201209235615.GA3636@intel.com>
Date: Fri, 11 Dec 2020 15:18:39 +0200
Message-ID: <87mtyk7a6o.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/tc: Only WARN once for
 bogus tc port flag
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Dec 09, 2020 at 04:16:36PM -0500, Sean Paul wrote:
>> From: Sean Paul <seanpaul@chromium.org>
>> 
>> No need to spam syslog/console when we can ignore/fix the flag.
>
> besides that we are calling from multiple places anyway..
>
>> 
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, pushed to din.

BR,
Jani.

>
>
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_tc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
>> index 4346bc1a747a..27dc2dad6809 100644
>> --- a/drivers/gpu/drm/i915/display/intel_tc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
>> @@ -262,7 +262,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
>>  		mask |= BIT(TC_PORT_LEGACY);
>>  
>>  	/* The sink can be connected only in a single mode. */
>> -	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
>> +	if (!drm_WARN_ON_ONCE(&i915->drm, hweight32(mask) > 1))
>>  		tc_port_fixup_legacy_flag(dig_port, mask);
>>  
>>  	return mask;
>> -- 
>> Sean Paul, Software Engineer, Google / Chromium OS
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
