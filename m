Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6B9C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 08:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 308F160F6C
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 08:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 308F160F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D858C6E87E;
	Mon, 26 Jul 2021 08:35:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74F46E87E;
 Mon, 26 Jul 2021 08:35:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="210297235"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="210297235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 01:35:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="436685839"
Received: from jdonohue-mobl.ger.corp.intel.com (HELO [10.213.215.117])
 ([10.213.215.117])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 01:35:23 -0700
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0edb5c4d-1faf-4b24-a21d-fd2e5be6591d@linux.intel.com>
Date: Mon, 26 Jul 2021 09:35:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915: move intel_context slab to
 direct module init/exit
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 23/07/2021 20:29, Daniel Vetter wrote:
> With the global kmem_cache shrink infrastructure gone there's nothing
> special and we can convert them over.
> 
> I'm doing this split up into each patch because there's quite a bit of
> noise with removing the static global.slab_ce to just a
> slab_ce.
> 
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c | 25 ++++++++-----------------
>   drivers/gpu/drm/i915/gt/intel_context.h |  3 +++
>   drivers/gpu/drm/i915/i915_globals.c     |  2 --
>   drivers/gpu/drm/i915/i915_globals.h     |  1 -
>   drivers/gpu/drm/i915/i915_pci.c         |  2 ++
>   5 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index baa05fddd690..283382549a6f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -7,7 +7,6 @@
>   #include "gem/i915_gem_pm.h"
>   
>   #include "i915_drv.h"
> -#include "i915_globals.h"
>   #include "i915_trace.h"
>   
>   #include "intel_context.h"
> @@ -15,14 +14,11 @@
>   #include "intel_engine_pm.h"
>   #include "intel_ring.h"
>   
> -static struct i915_global_context {
> -	struct i915_global base;
> -	struct kmem_cache *slab_ce;
> -} global;
> +struct kmem_cache *slab_ce;
>   
>   static struct intel_context *intel_context_alloc(void)
>   {
> -	return kmem_cache_zalloc(global.slab_ce, GFP_KERNEL);
> +	return kmem_cache_zalloc(slab_ce, GFP_KERNEL);
>   }
>   
>   static void rcu_context_free(struct rcu_head *rcu)
> @@ -30,7 +26,7 @@ static void rcu_context_free(struct rcu_head *rcu)
>   	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>   
>   	trace_intel_context_free(ce);
> -	kmem_cache_free(global.slab_ce, ce);
> +	kmem_cache_free(slab_ce, ce);
>   }
>   
>   void intel_context_free(struct intel_context *ce)
> @@ -410,22 +406,17 @@ void intel_context_fini(struct intel_context *ce)
>   	i915_active_fini(&ce->active);
>   }
>   
> -static void i915_global_context_exit(void)
> +void i915_context_module_exit(void)
>   {
> -	kmem_cache_destroy(global.slab_ce);
> +	kmem_cache_destroy(slab_ce);
>   }
>   
> -static struct i915_global_context global = { {
> -	.exit = i915_global_context_exit,
> -} };
> -
> -int __init i915_global_context_init(void)
> +int __init i915_context_module_init(void)
>   {
> -	global.slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> -	if (!global.slab_ce)
> +	slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> +	if (!slab_ce)
>   		return -ENOMEM;
>   
> -	i915_global_register(&global.base);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 974ef85320c2..a0ca82e3c40d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -30,6 +30,9 @@ void intel_context_init(struct intel_context *ce,
>   			struct intel_engine_cs *engine);
>   void intel_context_fini(struct intel_context *ce);
>   
> +void i915_context_module_exit(void);
> +int i915_context_module_init(void);
> +
>   struct intel_context *
>   intel_context_create(struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 3de7cf22ec76..d36eb7dc40aa 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -7,7 +7,6 @@
>   #include <linux/slab.h>
>   #include <linux/workqueue.h>
>   
> -#include "gem/i915_gem_context.h"
>   #include "gem/i915_gem_object.h"
>   #include "i915_globals.h"
>   #include "i915_request.h"
> @@ -32,7 +31,6 @@ static void __i915_globals_cleanup(void)
>   }
>   
>   static __initconst int (* const initfn[])(void) = {
> -	i915_global_context_init,
>   	i915_global_gem_context_init,
>   	i915_global_objects_init,
>   	i915_global_request_init,
> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> index d80901ba75e3..60daa738a188 100644
> --- a/drivers/gpu/drm/i915/i915_globals.h
> +++ b/drivers/gpu/drm/i915/i915_globals.h
> @@ -23,7 +23,6 @@ int i915_globals_init(void);
>   void i915_globals_exit(void);
>   
>   /* constructors */
> -int i915_global_context_init(void);
>   int i915_global_gem_context_init(void);
>   int i915_global_objects_init(void);
>   int i915_global_request_init(void);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index f9527269e30a..266618157775 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -33,6 +33,7 @@
>   #include "i915_active.h"
>   #include "i915_buddy.h"
>   #include "i915_drv.h"
> +#include "gem/i915_gem_context.h"

It's a bit ugly to go to a design where i915_pci.c has to include so 
many random parts of i915. IMO for a complex driver like i915, 
compartmentalizing so much knowledge about the internals was better 
inside the globals layer.

Maybe add a cover letter to explain the perceived pros and cons and 
thinking in general?

Regards,

Tvrtko

>   #include "i915_perf.h"
>   #include "i915_globals.h"
>   #include "i915_selftest.h"
> @@ -1297,6 +1298,7 @@ static const struct {
>   	{ i915_check_nomodeset, NULL },
>   	{ i915_active_module_init, i915_active_module_exit },
>   	{ i915_buddy_module_init, i915_buddy_module_exit },
> +	{ i915_context_module_init, i915_context_module_exit },
>   	{ i915_globals_init, i915_globals_exit },
>   	{ i915_mock_selftests, NULL },
>   	{ i915_pmu_init, i915_pmu_exit },
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
