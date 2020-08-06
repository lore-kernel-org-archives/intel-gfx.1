Return-Path: <SRS0=UD61=BQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079B4C433DF
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2020 14:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD0523132
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2020 14:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD0523132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A02F6E8BC;
	Thu,  6 Aug 2020 14:54:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328CE6E8BC
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 Aug 2020 14:54:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22051338-1500050 for multiple; Thu, 06 Aug 2020 15:54:47 +0100
MIME-Version: 1.0
In-Reply-To: <20200806143536.16012-1-chris@chris-wilson.co.uk>
References: <20200806143338.15864-1-chris@chris-wilson.co.uk>
 <20200806143536.16012-1-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 06 Aug 2020 15:54:46 +0100
Message-ID: <159672568634.25811.1757068684090294737@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Prevent selecting 0 for
 our random width/align
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
Cc: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2020-08-06 15:35:36)
> When igt_random_offset() is a given a range of [0, PAGE_SIZE], it is
> allowed to return 0. However, attempting to use a size of 0 for the
> igt_lmem_write_cpu() byte poking, leads to call igt_random_offset() with
> a range of [offset, offset + 0] and ask it to find a length of 4 within
> it. This triggers the bug on that the requested length should fit within
> the range!
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
> I feel into the same trap of not fixing up the random return of 0
> ---
>  drivers/gpu/drm/i915/selftests/intel_memory_region.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index 6e80d99048e4..54e683bb220b 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -522,9 +522,10 @@ static int igt_lmem_write_cpu(void *arg)
>                 goto out_unpin;
>         }
>  
> -       /* We want to throw in a random width/align */
> -       bytes[0] = igt_random_offset(&prng, 0, PAGE_SIZE, sizeof(u32),
> -                                    sizeof(u32));
> +       /* A random multiple of u32, picked between [64, PAGE_SIZE - 64] */
> +       bytes[0] = 1 + prandom_u32_state(&prng);

But what about if it returns -1.

Gah.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
