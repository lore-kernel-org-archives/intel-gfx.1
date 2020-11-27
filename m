Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED08C63798
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 13:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528252224E
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 13:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528252224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B356EDC0;
	Fri, 27 Nov 2020 13:37:25 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923B6EDBF;
 Fri, 27 Nov 2020 13:37:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133542-1500050 for multiple; Fri, 27 Nov 2020 13:37:20 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-104-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-104-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:37:20 +0000
Message-ID: <160648424005.2925.3851197595431719032@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC PATCH 103/162] drm/i915: allocate context from
 LMEM
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:19)
> Based on a patch from Michel Thierry.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> ---
>  .../drm/i915/gt/intel_execlists_submission.c  | 31 ++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 582a9044727e..c640b90711fd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -108,6 +108,8 @@
>   */
>  #include <linux/interrupt.h>
>  
> +#include "gem/i915_gem_lmem.h"
> +
>  #include "i915_drv.h"
>  #include "i915_perf.h"
>  #include "i915_trace.h"
> @@ -4660,6 +4662,21 @@ static struct intel_timeline *pinned_timeline(struct intel_context *ce)
>                                                  page_unmask_bits(tl));
>  }
>  
> +static int context_clear_lmem(struct drm_i915_gem_object *ctx_obj)
> +{
> +       void *vaddr;
> +
> +       vaddr = i915_gem_object_pin_map(ctx_obj, I915_MAP_WC);
> +       if (IS_ERR(vaddr))
> +               return PTR_ERR(vaddr);
> +
> +       memset64(vaddr, 0, ctx_obj->base.size / sizeof(u64));
> +
> +       i915_gem_object_unpin_map(ctx_obj);

What? We copy over the entire object with the default state.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
