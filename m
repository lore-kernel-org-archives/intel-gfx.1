Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196D4C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 16:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAF623A1E
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 16:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EAF623A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD916E0D7;
	Thu, 21 Jan 2021 16:10:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376E66E0D7
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 16:10:17 +0000 (UTC)
IronPort-SDR: BCwwt25aVFXgpACjb/5ry/77Wc3G7nvxwfELWmUsC+I3ZJjmhRlcgxbTkPOlEJueFPlLMIkWQw
 OT3/HRZSenUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176720430"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="176720430"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 08:10:16 -0800
IronPort-SDR: +xWmu5cF9XvJiJs3hNsy2OkcpV3chcvATwjT8GZGpmggXS4AR8i60ClqmsEg+wtiewsZ3dFIFj
 2boNGQZshfeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="392016442"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga007.jf.intel.com with ESMTP; 21 Jan 2021 08:10:15 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id 8ECED5C20E9; Thu, 21 Jan 2021 18:07:28 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210121154950.19898-1-chris@chris-wilson.co.uk>
References: <20210121154950.19898-1-chris@chris-wilson.co.uk>
Date: Thu, 21 Jan 2021 18:07:28 +0200
Message-ID: <87k0s6jmtb.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [CI 1/3] drm/i915/gt: Flush GT interrupt handler
 before changing interrupt state
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

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Before we clear any state that may be being written by an interrupt
> handler on another core, flush the interrupt handlers.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index b31ce0d60028..e8c20f80e353 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2656,7 +2656,10 @@ static void enable_error_interrupt(struct intel_engine_cs *engine)
>  {
>  	u32 status;
>  
> +	/* Flush ongoing GT interrupts before touching interrupt state */
> +	synchronize_hardirq(engine->i915->drm.irq);
>  	engine->execlists.error_interrupt = 0;
> +
>  	ENGINE_WRITE(engine, RING_EMR, ~0u);
>  	ENGINE_WRITE(engine, RING_EIR, ~0u); /* clear all existing errors */
>  
> -- 
> 2.20.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
