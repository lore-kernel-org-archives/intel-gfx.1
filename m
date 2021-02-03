Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA012C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 11:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B4D364E34
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 11:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B4D364E34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03F989C98;
	Wed,  3 Feb 2021 11:49:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958A989C98;
 Wed,  3 Feb 2021 11:49:47 +0000 (UTC)
IronPort-SDR: vn4nDYNwulbYQiEB8NIOz9BJEN/zeaLi00QHAtm9QSfEdEIfjxzLNaWe+tYjoBM26lU7r9yeir
 EF3Uul2Bc0lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181102417"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="181102417"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 03:49:46 -0800
IronPort-SDR: lHNr/pYlc9gp6783hGkAhuMjuhG+FLK1t/RoeUtKJwLtTcgAO1R/8guAV1vxk6KPtM6WLBpMsN
 9BTlFeKIxYDQ==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="392407588"
Received: from eransege-mobl.ger.corp.intel.com (HELO [10.214.208.106])
 ([10.214.208.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 03:49:44 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
References: <20210203114456.895974-1-tvrtko.ursulin@linux.intel.com>
 <161235286280.6538.17980167968377203664@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ab1294ff-2df9-d571-4f9a-04ee7f2293a4@linux.intel.com>
Date: Wed, 3 Feb 2021 11:49:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161235286280.6538.17980167968377203664@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 1/2] intel_gpu_top: Show
 banner messages when cycling sort modes
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


On 03/02/2021 11:47, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-03 11:44:55)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> It is useful to let the user know what is the currently active sort mode.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   tools/intel_gpu_top.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 584aa21b198a..b409106f3718 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -1479,6 +1479,8 @@ print_header_token(const char *cont, int lines, int con_w, int con_h, int *rem,
>>          return lines;
>>   }
>>   
>> +static const char *header_msg;
>> +
>>   static int
>>   print_header(const struct igt_device_card *card,
>>               const char *codename,
>> @@ -1593,8 +1595,14 @@ print_header(const struct igt_device_card *card,
>>                  if (lines++ < con_h)
>>                          printf("\n");
>>   
>> -               if (lines++ < con_h)
>> -                       printf("\n");
>> +               if (lines++ < con_h) {
>> +                       if (header_msg) {
>> +                               printf(" >>> %s\n", header_msg);
>> +                               header_msg = NULL;
> 
> I was just about to ask if we showed it once, then cleared it 1s later.
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
>> +                       } else {
>> +                               printf("\n");
>> +                       }
>> +               }
>>          }
>>   
>>          return lines;
>> @@ -2146,12 +2154,15 @@ static void select_client_sort(void)
>>          switch (++client_sort % 3) {
>>          case 0:
>>                  client_cmp = client_last_cmp;
>> +               header_msg = "Sorting clients by current GPU usage.";
>>                  break;
>>          case 1:
>>                  client_cmp = client_total_cmp;
>> +               header_msg = "Sorting clients by accummulated GPU usage.";
>>                  break;
>>          case 2:
>>                  client_cmp = client_id_cmp;
>> +               header_msg = "Sorting clients by sysfs id.";
> 
> Do we care about "sysfs"? Just "Sorting clients by id."?

I was even doubting if having this sort is justified at all. Drop after 
next patch (pid sort)?

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
