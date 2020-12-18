Return-Path: <SRS0=vphl=FW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93658C4361B
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Dec 2020 09:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389C723A7D
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Dec 2020 09:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389C723A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F02589801;
	Fri, 18 Dec 2020 09:38:24 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94135897FF;
 Fri, 18 Dec 2020 09:38:22 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23363603-1500050 for multiple; Fri, 18 Dec 2020 09:38:19 +0000
MIME-Version: 1.0
In-Reply-To: <20201218084939.1767210-1-tvrtko.ursulin@linux.intel.com>
References: <20201218084939.1767210-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Fri, 18 Dec 2020 09:38:18 +0000
Message-ID: <160828429823.11872.8276922756082407179@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] lib/igt_perf: Request
 CLOCK_MONOTONIC when opening events
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-12-18 08:49:39)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Ask for CLOCK_MONOTONIC which is more stable than the default perf clock.
> 
> (Ability to select a clock has been available since kernel version 4.1.)
> 
> The change should not have any significant impact on the IGT as whole
> apart from maybe improving the occasional jitter in tests/tools which use
> nanosleep(2) and use time slept together with perf reported time delta
> either in direct or indirect calculations.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  lib/igt_perf.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 418c1c18891c..b743859f5d29 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -1,12 +1,13 @@
> -#include <stdint.h>
> +#include <errno.h>
>  #include <fcntl.h>
> -#include <unistd.h>
> +#include <stdint.h>
>  #include <stdlib.h>
>  #include <string.h>
> -#include <errno.h>
>  #include <sys/stat.h>
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> +#include <time.h>
> +#include <unistd.h>
>  
>  #include "igt_perf.h"
>  
> @@ -111,6 +112,8 @@ _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
>  
>         attr.read_format = format;
>         attr.config = config;
> +       attr.use_clockid = 1;
> +       attr.clockid = CLOCK_MONOTONIC;

Ok, pretty much all are cumulative samples with ktime_get(), and not raw
HW clocks that would prefer MONO_RAW.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
