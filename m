Return-Path: <SRS0=Fv+K=CC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC19C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Aug 2020 10:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893102071E
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Aug 2020 10:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893102071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557B6E1E6;
	Mon, 24 Aug 2020 10:54:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42FE6E1E6
 for <intel-gfx@lists.freedesktop.org>; Mon, 24 Aug 2020 10:54:02 +0000 (UTC)
IronPort-SDR: NekvgxEU4rPjNT9HUipKFTWcTibntCsaDLrtd2SYsVqYx5891Ort4bnavtC9S1oLR87PC1kVZR
 Vpi9pLMSf9ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="135419683"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="135419683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 03:54:02 -0700
IronPort-SDR: q/FUI6k4PalzOzZOZ64YwEVu+gSnV1+yhqRPLUns7XMsRRX0hbowqXMC/EpxPpHrUxe6AT4lub
 H3HHQr7PayOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="372643675"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga001.jf.intel.com with ESMTP; 24 Aug 2020 03:54:01 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id 13B585C276C; Mon, 24 Aug 2020 13:53:08 +0300 (EEST)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20200820141546.21194-1-chris@chris-wilson.co.uk>
References: <20200820141546.21194-1-chris@chris-wilson.co.uk>
Date: Mon, 24 Aug 2020 13:53:08 +0300
Message-ID: <877dto1fjf.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Break up error capture
 compression loops with cond_resched()
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
Cc: stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> As the error capture will compress user buffers as directed to by the
> user, it can take an arbitrary amount of time and space. Break up the
> compression loops with a call to cond_resched(), that will allow other
> processes to schedule (avoiding the soft lockups) and also serve as a
> warning should we try to make this loop atomic in the future.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 6a3a2ce0b394..6551ff04d5a6 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -311,6 +311,8 @@ static int compress_page(struct i915_vma_compress *c,
>  
>  		if (zlib_deflate(zstream, Z_NO_FLUSH) != Z_OK)
>  			return -EIO;
> +
> +		cond_resched();
>  	} while (zstream->avail_in);
>  
>  	/* Fallback to uncompressed if we increase size? */
> @@ -397,6 +399,7 @@ static int compress_page(struct i915_vma_compress *c,
>  	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
>  		memcpy(ptr, src, PAGE_SIZE);
>  	dst->pages[dst->page_count++] = ptr;
> +	cond_resched();
>  
>  	return 0;
>  }
> -- 
> 2.20.1
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
