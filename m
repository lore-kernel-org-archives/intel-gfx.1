Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7250C64E75
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 13:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B332224D
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77B332224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15AE6EDBA;
	Fri, 27 Nov 2020 13:35:47 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FC36EDBA;
 Fri, 27 Nov 2020 13:35:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133517-1500050 for multiple; Fri, 27 Nov 2020 13:35:42 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-102-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-102-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:35:42 +0000
Message-ID: <160648414221.2925.764003601534306071@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC PATCH 101/162] drm/i915/gtt/dg1: add PTE_LM
 plumbing for PPGTT
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

Quoting Matthew Auld (2020-11-27 12:06:17)
> For the PTEs we get an LM bit, to signal whether the page resides in
> SMEM or LMEM.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c  | 35 ++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_gtt.h   |  3 +++
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c |  4 +++
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index e2f1dfc48d43..b6fcebeef02a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/log2.h>
>  
> +#include "gem/i915_gem_lmem.h"
>  #include "gen8_ppgtt.h"
>  #include "i915_scatterlist.h"
>  #include "i915_trace.h"
> @@ -50,6 +51,21 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>         return pte;
>  }
>  
> +static u64 gen12_pte_encode(dma_addr_t addr,
> +                           enum i915_cache_level level,
> +                           u32 flags)
> +{
> +       gen8_pte_t pte = addr | _PAGE_PRESENT | _PAGE_RW;
> +
> +       if (unlikely(flags & PTE_READ_ONLY))
> +               pte &= ~_PAGE_RW;
> +
> +       if (flags & PTE_LM)
> +               pte |= GEN12_PPGTT_PTE_LM;
> +
> +       return pte;
> +}
> +
>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
>  {
>         struct drm_i915_private *i915 = ppgtt->vm.i915;
> @@ -365,7 +381,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>                       u32 flags)
>  {
>         struct i915_page_directory *pd;
> -       const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +       const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);

We don't need the vfunc, since that flag will not be sent for gen8.

That bit test will be cheaper than the retpoline.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
