Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D7DC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 15:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF1A233ED
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 15:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF1A233ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D676EA3D;
	Wed, 13 Jan 2021 15:29:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9326EA3D
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 15:29:25 +0000 (UTC)
IronPort-SDR: CaQpYzhSr82IHCmuN+NmmapF5hyNmt9ovFoK8pAlKwp/xTE29kjGkz4rHqr8zJ+P1cB1Vqb2Fv
 wuDLtKyBgjog==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165892988"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="165892988"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:24 -0800
IronPort-SDR: ivhz8Mi59/uLV3GIv4hyKzHUgO/zvRxPkDXC+tXZ/XStF5Aiqzf8z18zoY2Db5GtlyEQb3s4aR
 p778FtqL/RGg==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="353517685"
Received: from iklein-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.83])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210113152224.29794-1-chris@chris-wilson.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210113152224.29794-1-chris@chris-wilson.co.uk>
Date: Wed, 13 Jan 2021 17:29:19 +0200
Message-ID: <87k0sgsvn4.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Prune inlines
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Remove all the manual inlines from non-critical sections in gt/
>
> add/remove: 2/0 grow/shrink: 0/3 up/down: 762/-1473 (-711)
> Function                                     old     new   delta
> mi_set_context.isra                            -     602    +602
> write_dma_entry                                -     160    +160
> __set_pd_entry                               214      69    -145
> clear_pd_entry                               190      42    -148
> ring_request_alloc                          2021     841   -1180
> Total: Before=1605086, After=1604375, chg -0.04%
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Jani Nikula <jani.nikula@intel.com>

> @@ -98,13 +98,13 @@ static inline void __timeline_mark_unlock(struct intel_context *ce,
>  
>  #else
>  
> -static inline unsigned long __timeline_mark_lock(struct intel_context *ce)
> +static unsigned long __timeline_mark_lock(struct intel_context *ce)
>  {
>  	return 0;
>  }
>  
> -static inline void __timeline_mark_unlock(struct intel_context *ce,
> -					  unsigned long flags)
> +static void __timeline_mark_unlock(struct intel_context *ce,
> +				   unsigned long flags)
>  {
>  }

I don't mind inlines for stubs, but probably doesn't make a difference.

> @@ -113,9 +114,10 @@ clear_pd_entry(struct i915_page_directory * const pd,
>  {
>  	GEM_BUG_ON(atomic_read(px_used(pd)) == 0);
>  
> -	write_dma_entry(px_base(pd), idx, scratch->encode);
> -	pd->entry[idx] = NULL;
>  	atomic_dec(px_used(pd));
> +	pd->entry[idx] = NULL;
> +
> +	write_dma_entry(px_base(pd), idx, scratch->encode);

With the changes in this hunk removed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
