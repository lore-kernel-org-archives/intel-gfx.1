Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F31C433DB
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 10:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093AC64E3E
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 10:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093AC64E3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD76EA5F;
	Wed,  3 Feb 2021 10:31:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7316EA4F;
 Wed,  3 Feb 2021 10:31:10 +0000 (UTC)
IronPort-SDR: J3Pw33KeLegXv1mvWhHIhGuLk7NK4e8TTomZVC1Jy1hx+SQGdbARrZY41LWR0e5HtMC4DIRqbd
 OIiF1ir4982A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265852784"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="265852784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 02:31:09 -0800
IronPort-SDR: a4NG2vucBPsvm1X1cd2AQnEL1TjflckG8y+wwMrNRbd/5UAPJ7ycem6ILN7BzdzU7JHffjCbeQ
 c88ZChScXoEA==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="392385250"
Received: from eransege-mobl.ger.corp.intel.com (HELO [10.214.208.106])
 ([10.214.208.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 02:31:07 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
References: <20210201115756.876351-1-tvrtko.ursulin@linux.intel.com>
 <161218123064.27906.1183308463378840226@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c947cfbc-bb9d-02c4-5b97-ca76d252e778@linux.intel.com>
Date: Wed, 3 Feb 2021 10:31:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161218123064.27906.1183308463378840226@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Wrap interactive header
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 01/02/2021 12:07, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-01 11:57:56)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Slight improvement with regards to wrapping header components to fit
>> console width. If a single element is wider than max it can still
>> overflow but it should now work better for practical console widths.
> 
> <----
> intel-gpu-top: Intel Kabylake (Gen9) @ /dev/dri/card0
>   900/ 949 MHz;   0% RC6;  6.97/18.42 W;        2 irqs/s
>        IMC reads:        6 MiB/s
>       IMC writes:        0 MiB/s
> 
> ---->
> intel-gpu-top: Intel Kabylake (Gen9) @ /dev/dri/card0 -  903/ 954 MHz;   0% RC6
>      7.16/18.40 W;       14 irqs/s
> 
>        IMC reads:       80 MiB/s
>       IMC writes:        0 MiB/s
> 
> I thought it looked reasonably tidy, without adding any lines to the
> header.

Or on a wider terminal:
<----
intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0
    0/   0 MHz; 100% RC6;  0.00/ 1.29 W;        0 irqs/s
       IMC reads:      138 MiB/s
      IMC writes:        6 MiB/s
--->
intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0 -    0/   0 MHz; 100% RC6;  0.00/ 0.00 W;        0 irqs/s

       IMC reads:       77 MiB/s
      IMC writes:        4 MiB/s


So a "fight" between 80 chars vs 120 (or so). :) It may be a bit of an over-engineered solution but I don't like the wrap on a wide terminal, plus I like an extra blank line.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
