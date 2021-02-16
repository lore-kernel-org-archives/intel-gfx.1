Return-Path: <SRS0=gTf0=HS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A98C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 15:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E021764DF0
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 15:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E021764DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514C76E44A;
	Tue, 16 Feb 2021 15:59:40 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478FC6E446;
 Tue, 16 Feb 2021 15:59:38 +0000 (UTC)
IronPort-SDR: vXxgfFXX3iFmsvY2TdQkFKocSBQa+ZWe6BAmucEm4yooN70VtEmO4H+IzzsDGUXqs4bzVfvygl
 lQwMjd/ENupg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="246989135"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="246989135"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 07:59:36 -0800
IronPort-SDR: +Sgyzlee9s2l+29W0bFVJLNJKZ35iMhkUtJ2rUZ9kdxlcynXfMOG0z1KNvV14sWs4Y8lTEL9HX
 /1nVPGVL+nzQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399559962"
Received: from mostoegl-mobl1.ger.corp.intel.com (HELO [10.249.37.188])
 ([10.249.37.188])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 07:59:35 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
References: <20210216105050.309803-1-tvrtko.ursulin@linux.intel.com>
 <161347977326.8311.2289376711332554853@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5a07f0c2-48c1-1605-e1f5-91d61a213f67@linux.intel.com>
Date: Tue, 16 Feb 2021 15:59:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <161347977326.8311.2289376711332554853@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t] tests/i915/perf_pmu: Subtest to
 measure sampling error for 100% busy
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


On 16/02/2021 12:49, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-16 10:50:50)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Test that periodic reads of engine busyness against a constant 100% load
>> are within the 5000ppm tolerance when comparing perf timestamp versus
>> counter values.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   tests/i915/perf_pmu.c | 46 ++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>> index 50b5c82bc472..728312be5293 100644
>> --- a/tests/i915/perf_pmu.c
>> +++ b/tests/i915/perf_pmu.c
>> @@ -26,6 +26,7 @@
>>   #include <stdio.h>
>>   #include <string.h>
>>   #include <fcntl.h>
>> +#include <float.h>
>>   #include <inttypes.h>
>>   #include <errno.h>
>>   #include <signal.h>
>> @@ -46,6 +47,7 @@
>>   #include "igt_perf.h"
>>   #include "igt_sysfs.h"
>>   #include "igt_pm.h"
>> +#include "igt_stats.h"
>>   #include "sw_sync.h"
>>   
>>   IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>> @@ -278,8 +280,11 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
>>   static void
>>   single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>>   {
>> +       unsigned int loops = flags & FLAG_LONG ? 20 : 1;
>> +       double err_min = DBL_MAX, err_max = -DBL_MAX;
>>          unsigned long slept;
>>          igt_spin_t *spin;
>> +       igt_stats_t s;
>>          uint64_t val;
>>          int fd;
>>   
>> @@ -290,11 +295,40 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>>          else
>>                  spin = NULL;
>>   
>> -       val = pmu_read_single(fd);
>> -       slept = measured_usleep(batch_duration_ns / 1000);
>> -       if (flags & TEST_TRAILING_IDLE)
>> -               end_spin(gem_fd, spin, flags);
>> -       val = pmu_read_single(fd) - val;
>> +       igt_stats_init_with_size(&s, loops);
>> +
>> +       while (--loops) {
> 
> while (loops--)
> 
> /o\

Yeah.. At least I know the oddity is related to sampling. Since even on 
Haswell:

(perf_pmu:1591) DEBUG: time=500207720 busy=500037022 error=-341.25ppm
(perf_pmu:1591) DEBUG: time=500252520 busy=500033517 error=-437.78ppm
(perf_pmu:1591) DEBUG: time=500187490 busy=499999817 error=-375.21ppm
(perf_pmu:1591) DEBUG: time=500244871 busy=499999837 error=-489.83ppm
(perf_pmu:1591) DEBUG: time=500268670 busy=499999477 error=-538.10ppm
(perf_pmu:1591) DEBUG: time=500245246 busy=500000432 error=-489.39ppm
(perf_pmu:1591) DEBUG: time=500245735 busy=499999306 error=-492.62ppm
(perf_pmu:1591) DEBUG: time=500270045 busy=500001747 error=-536.31ppm
(perf_pmu:1591) DEBUG: time=500254286 busy=499998162 error=-511.99ppm
(perf_pmu:1591) DEBUG: time=500247790 busy=500000347 error=-494.64ppm
(perf_pmu:1591) DEBUG: time=500250261 busy=500000257 error=-499.76ppm
(perf_pmu:1591) DEBUG: time=500250005 busy=500008177 error=-483.41ppm
(perf_pmu:1591) DEBUG: time=500249065 busy=499991867 error=-514.14ppm
(perf_pmu:1591) DEBUG: time=500249725 busy=500000371 error=-498.46ppm
(perf_pmu:1591) DEBUG: time=500250335 busy=499999772 error=-500.88ppm
(perf_pmu:1591) DEBUG: time=500258691 busy=499999937 error=-517.24ppm
(perf_pmu:1591) DEBUG: time=500239980 busy=500001037 error=-477.66ppm
(perf_pmu:1591) DEBUG: time=500240791 busy=504999361 error=9512.56ppm

And this last one is way more than one sampling period. I'll be thinking 
about this in the background.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
