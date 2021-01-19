Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B5DC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 11:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC162168B
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 11:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC162168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DD6E84F;
	Tue, 19 Jan 2021 11:11:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB606E84F
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 11:11:27 +0000 (UTC)
IronPort-SDR: 2J4wSoNcVMGLK+dDrETIZ5p0Rrxf4kvXGVUGx6dhPKz7s4+gMnHS06szvGjr34lZ8lvdSNJjaY
 t1P+TmU0xpUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="175407127"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="175407127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 03:11:26 -0800
IronPort-SDR: HiJ+mYy4481/QSC1opdfkpVJym4vk19qjZ17i5KnczvjFK6AZ6wbNWXr3uMJ/p32g8G8c8924Q
 XrZ3v1513+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="383887681"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga008.jf.intel.com with ESMTP; 19 Jan 2021 03:11:25 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id A25935C20E6; Tue, 19 Jan 2021 13:08:39 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210119110802.22228-4-chris@chris-wilson.co.uk>
References: <20210119110802.22228-1-chris@chris-wilson.co.uk>
 <20210119110802.22228-4-chris@chris-wilson.co.uk>
Date: Tue, 19 Jan 2021 13:08:39 +0200
Message-ID: <87ft2xgp54.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [CI 4/6] drm/i915/gt: Disable the ring before
 resetting HEAD/TAIL
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

> During the reset of ring submission, we first stop the engine by
> clearing the HEAD/TAIL and marking the ring as disabled. However, it
> would be safer to disable the ring (after emptying) before resetting the
> HEAD/TAIL.
>
> Suggested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 44159595d909..8a5314b97b04 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -301,13 +301,17 @@ static void xcs_sanitize(struct intel_engine_cs *engine)
>  
>  static bool stop_ring(struct intel_engine_cs *engine)
>  {
> +	/* Empty the ring by skipping to the end */
>  	ENGINE_WRITE_FW(engine, RING_HEAD, ENGINE_READ_FW(engine, RING_TAIL));
> -
> -	ENGINE_WRITE_FW(engine, RING_HEAD, 0);
> -	ENGINE_WRITE_FW(engine, RING_TAIL, 0);
> +	ENGINE_POSTING_READ(engine, RING_HEAD);
>  
>  	/* The ring must be empty before it is disabled */
>  	ENGINE_WRITE_FW(engine, RING_CTL, 0);
> +	ENGINE_POSTING_READ(engine, RING_CTL);
> +
> +	/* Then reset the disabled ring */
> +	ENGINE_WRITE_FW(engine, RING_HEAD, 0);
> +	ENGINE_WRITE_FW(engine, RING_TAIL, 0);
>  
>  	return (ENGINE_READ_FW(engine, RING_HEAD) & HEAD_ADDR) == 0;
>  }
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
