Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6822BC63798
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FD8206D8
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2FD8206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591346EDDB;
	Fri, 27 Nov 2020 14:11:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C856EDDA;
 Fri, 27 Nov 2020 14:11:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134046-1500050 for multiple; Fri, 27 Nov 2020 14:11:01 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-135-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-135-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:11:01 +0000
Message-ID: <160648626145.2925.9047512326060437476@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC PATCH 134/162] drm/i915/dg1: Measure swap
 in/out timing stats
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:50)
> From: Sudeep Dutt <sudeep.dutt@intel.com>
> 
> Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_region.c | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/i915_debugfs.c        |  3 +++
>  drivers/gpu/drm/i915/i915_drv.h            |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index ed108dbcb34e..4fab9f6b4bee 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -15,6 +15,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>  {
>         struct drm_i915_private *i915 = to_i915(obj->base.dev);
>         struct drm_i915_gem_object *dst, *src;
> +       unsigned long start, diff, msec;
>         int err;
>  
>         GEM_BUG_ON(obj->swapto);
> @@ -24,6 +25,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>         GEM_BUG_ON(!i915->params.enable_eviction);
>  
>         assert_object_held(obj);
> +       start = jiffies;
>  
>         /* create a shadow object on smem region */
>         dst = i915_gem_object_create_shmem(i915, obj->base.size);
> @@ -64,8 +66,12 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>         else
>                 i915_gem_object_put(dst);
>  
> -       if (!err)
> +       if (!err) {
> +               diff = jiffies - start;
> +               msec = diff * 1000 / HZ;
> +               atomic_long_add(msec, &i915->time_swap_out_ms);
>                 atomic_long_add(sizes, &i915->num_bytes_swapped_out);
> +       }

This can be done using a kprobe, and with prettier statistics as builtin
functionality.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
