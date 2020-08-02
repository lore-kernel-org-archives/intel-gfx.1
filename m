Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F87C433DF
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 15:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2AB20738
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 15:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2AB20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56D6E129;
	Sun,  2 Aug 2020 15:56:09 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0511B89E5A
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2020 15:56:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22010088-1500050 for multiple; Sun, 02 Aug 2020 16:56:03 +0100
MIME-Version: 1.0
In-Reply-To: <20200802153410.2298-2-michal.wajdeczko@intel.com>
References: <20200802153410.2298-1-michal.wajdeczko@intel.com>
 <20200802153410.2298-2-michal.wajdeczko@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Sun, 02 Aug 2020 16:56:03 +0100
Message-ID: <159638376352.26228.851553027586714022@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/ggtt: Add generic i915_ggtt
 ballooning support
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Michal Wajdeczko (2020-08-02 16:34:09)
> Reserving part of the GGTT for the GuC requires same steps
> as in VGT GGTT ballooning. Add generic GGTT ballooning
> helpers to intel_ggtt.c to avoid code duplication.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Xiong Zhang <xiong.y.zhang@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 69 ++++++++++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gtt.h  |  4 ++
>  drivers/gpu/drm/i915/i915_vgpu.c     | 64 +++++---------------------
>  3 files changed, 70 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 33a3f627ddb1..7001252b4703 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -462,29 +462,17 @@ static void ggtt_unbind_vma(struct i915_address_space *vm, struct i915_vma *vma)
>  
>  static int ggtt_reserve_guc_top(struct i915_ggtt *ggtt)
>  {
> -       u64 size;
> -       int ret;
> -
>         if (!intel_uc_uses_guc(&ggtt->vm.gt->uc))
>                 return 0;
>  
>         GEM_BUG_ON(ggtt->vm.total <= GUC_GGTT_TOP);
> -       size = ggtt->vm.total - GUC_GGTT_TOP;
> -
> -       ret = i915_gem_gtt_reserve(&ggtt->vm, &ggtt->uc_fw, size,
> -                                  GUC_GGTT_TOP, I915_COLOR_UNEVICTABLE,
> -                                  PIN_NOEVICT);
> -       if (ret)
> -               drm_dbg(&ggtt->vm.i915->drm,
> -                       "Failed to reserve top of GGTT for GuC\n");
> -
> -       return ret;
> +       return i915_ggtt_balloon(ggtt, GUC_GGTT_TOP, ggtt->vm.total,
> +                                &ggtt->uc_fw);

I still don't buy this, this is definitely not "ballooning". And I'm yet
to be convinced that ballooning is a central concept to the i915_ggtt
itself and not a client coordination facility on top.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
