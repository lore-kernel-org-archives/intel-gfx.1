Return-Path: <SRS0=gTf0=HS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95B6C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 12:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7AD64D5D
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 12:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7AD64D5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CE66E94F;
	Tue, 16 Feb 2021 12:49:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8F36E94D;
 Tue, 16 Feb 2021 12:49:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23880829-1500050 for multiple; Tue, 16 Feb 2021 12:49:35 +0000
MIME-Version: 1.0
In-Reply-To: <20210216105050.309803-1-tvrtko.ursulin@linux.intel.com>
References: <20210216105050.309803-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Tue, 16 Feb 2021 12:49:33 +0000
Message-ID: <161347977326.8311.2289376711332554853@build.alporthouse.com>
User-Agent: alot/0.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-16 10:50:50)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Test that periodic reads of engine busyness against a constant 100% load
> are within the 5000ppm tolerance when comparing perf timestamp versus
> counter values.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  tests/i915/perf_pmu.c | 46 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 50b5c82bc472..728312be5293 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -26,6 +26,7 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <fcntl.h>
> +#include <float.h>
>  #include <inttypes.h>
>  #include <errno.h>
>  #include <signal.h>
> @@ -46,6 +47,7 @@
>  #include "igt_perf.h"
>  #include "igt_sysfs.h"
>  #include "igt_pm.h"
> +#include "igt_stats.h"
>  #include "sw_sync.h"
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> @@ -278,8 +280,11 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
>  static void
>  single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>  {
> +       unsigned int loops = flags & FLAG_LONG ? 20 : 1;
> +       double err_min = DBL_MAX, err_max = -DBL_MAX;
>         unsigned long slept;
>         igt_spin_t *spin;
> +       igt_stats_t s;
>         uint64_t val;
>         int fd;
>  
> @@ -290,11 +295,40 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>         else
>                 spin = NULL;
>  
> -       val = pmu_read_single(fd);
> -       slept = measured_usleep(batch_duration_ns / 1000);
> -       if (flags & TEST_TRAILING_IDLE)
> -               end_spin(gem_fd, spin, flags);
> -       val = pmu_read_single(fd) - val;
> +       igt_stats_init_with_size(&s, loops);
> +
> +       while (--loops) {

while (loops--)

/o\
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
