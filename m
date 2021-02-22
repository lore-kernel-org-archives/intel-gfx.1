Return-Path: <SRS0=ktOb=HY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7060C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 16:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9033A64E2F
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 16:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9033A64E2F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1126E573;
	Mon, 22 Feb 2021 16:31:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE646E573
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 16:31:37 +0000 (UTC)
IronPort-SDR: o7BZrWx/8RGh6eVgVssKkuS82Qz7qh8Ua8m3Xc6MU9HLvDG7XQ/6p8q+N81v40QPRXLitnh2Gn
 Nr26rT0yMK1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181061314"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="181061314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:31:37 -0800
IronPort-SDR: MNdqnF0HJf6Z4fGIlMKqrKCtvPFQE0q3EGwXoDuIgTLhqYdO1U3tQ6WWUrTpCu9d0ArKURTprG
 uts1QIBVE2hw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="402672577"
Received: from reifs-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:31:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar\, Uma" <uma.shankar@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
In-Reply-To: <25a367036994445ea3d1c0f080f97656@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1613054234.git.jani.nikula@intel.com>
 <443ad1fbf908800ee4e09315cb6a7ba26c64d136.1613054234.git.jani.nikula@intel.com>
 <25a367036994445ea3d1c0f080f97656@intel.com>
Date: Mon, 22 Feb 2021 18:31:26 +0200
Message-ID: <87h7m4f4ip.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 5/9] drm/i915/reg: add stream splitter
 configuration definitions
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
Cc: "Varide, Nischal" <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 22 Feb 2021, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani Nikula
>> Sent: Thursday, February 11, 2021 8:22 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>; Varide, Nischal <nischal.varide@intel.com>
>> Subject: [Intel-gfx] [PATCH v3 5/9] drm/i915/reg: add stream splitter configuration
>> definitions
>> 
>> The splitter configuration is required for eDP MSO.
>
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Thanks for the review, pushed up to and including this patch.

BR,
Jani.

>
>> Bspec: 50174
>> Cc: Nischal Varide <nischal.varide@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg.h | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 224ad897af34..e5dd0203991b 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -11448,6 +11448,9 @@ enum skl_power_gate {
>>  #define  BIG_JOINER_ENABLE			(1 << 29)
>>  #define  MASTER_BIG_JOINER_ENABLE		(1 << 28)
>>  #define  VGA_CENTERING_ENABLE			(1 << 27)
>> +#define  SPLITTER_CONFIGURATION_MASK		REG_GENMASK(26, 25)
>> +#define  SPLITTER_CONFIGURATION_2_SEGMENT
>> 	REG_FIELD_PREP(SPLITTER_CONFIGURATION_MASK, 0)
>> +#define  SPLITTER_CONFIGURATION_4_SEGMENT
>> 	REG_FIELD_PREP(SPLITTER_CONFIGURATION_MASK, 1)
>> 
>>  #define _ICL_PIPE_DSS_CTL2_PB			0x78204
>>  #define _ICL_PIPE_DSS_CTL2_PC			0x78404
>> --
>> 2.20.1
>> 
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
