Return-Path: <SRS0=Zd9y=GI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE38C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 23:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2B62075B
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2B62075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA86E0F2;
	Tue,  5 Jan 2021 23:38:08 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D54A6E0F2
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Jan 2021 23:38:06 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23512768-1500050 for multiple; Tue, 05 Jan 2021 23:38:04 +0000
MIME-Version: 1.0
In-Reply-To: <20210105231947.31235-6-daniele.ceraolospurio@intel.com>
References: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
 <20210105231947.31235-6-daniele.ceraolospurio@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 05 Jan 2021 23:38:02 +0000
Message-ID: <160988988224.14894.10188123155348129183@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/guc: enable only the user
 interrupt when using GuC submission
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Daniele Ceraolo Spurio (2021-01-05 23:19:47)
> In GuC submission mode the CS is owned by the GuC FW, so all CS status
> interrupts are handled by it. We only need the user interrupt as that
> signals request completion.
> 
> Since we're now starting the engines directly in GuC submission mode
> when selected, we can stop switching back and forth between the
> execlists and the GuC programming and select directly the correct
> interrupt mask.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 18 ++++++-----
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 31 -------------------
>  2 files changed, 11 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 9830342aa6f4..7b2b8cb2d2be 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -237,14 +237,18 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  
>  void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
> -       const u32 irqs =
> -               GT_CS_MASTER_ERROR_INTERRUPT |
> -               GT_RENDER_USER_INTERRUPT |
> -               GT_CONTEXT_SWITCH_INTERRUPT |
> -               GT_WAIT_SEMAPHORE_INTERRUPT;
>         struct intel_uncore *uncore = gt->uncore;
> -       const u32 dmask = irqs << 16 | irqs;
> -       const u32 smask = irqs << 16;
> +       u32 irqs = GT_RENDER_USER_INTERRUPT;
> +       u32 dmask;
> +       u32 smask;
> +
> +       if (!intel_uc_wants_guc_submission(&gt->uc))
> +               irqs |= GT_CS_MASTER_ERROR_INTERRUPT |
> +                       GT_CONTEXT_SWITCH_INTERRUPT |
> +                       GT_WAIT_SEMAPHORE_INTERRUPT;

Hmm, we should stop performing this by default then, and make the
execlists setup request the interrupt vector it desires.

That's certainly a bit more fiddly to untangle the packed iir across
multiple gen. :|
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
