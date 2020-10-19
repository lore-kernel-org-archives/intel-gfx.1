Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E199C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 07:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5698822243
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 07:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="IueVv7h3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5698822243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD516E8E7;
	Mon, 19 Oct 2020 07:30:34 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305E36E8DD
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 07:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 4EC813F4B0;
 Mon, 19 Oct 2020 09:30:24 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=IueVv7h3; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kB24_r2qzkWh; Mon, 19 Oct 2020 09:30:23 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A140F3F40E;
 Mon, 19 Oct 2020 09:30:22 +0200 (CEST)
Received: from CitrixDT-070.SSPE.ch.intel.com (jfdmzpr06-ext.jf.intel.com
 [134.134.137.75])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 64400360C00;
 Mon, 19 Oct 2020 09:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1603092627; bh=7fc03Bu5zVy+zlmKMgwJnnjSV8LRTP1wnhsuWG7pc5k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=IueVv7h3/BoibQNSeXiH6ydiTNfBjXczH+uMZ/YxkCMaswA46sA478NkbDVGJImHx
 zidoZCWnDlK1ZG3IVztwJ2ew3ydDyqVh7fGNTl97xGqb+54SsNca7bwDg94Xfh/d4D
 dcP+RWL9P7zfoaQa22V5YjK8UYivCw+AvC/I+8Y0=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-16-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <844623d6-389f-d734-b149-2593dd923ca4@shipmail.org>
Date: Mon, 19 Oct 2020 09:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-16-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 15/61] drm/i915: Fix userptr so we do not
 have to worry about obj->mm.lock, v4.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 10/16/20 12:43 PM, Maarten Lankhorst wrote:
> Instead of doing what we do currently, which will never work with
> PROVE_LOCKING, do the same as AMD does, and something similar to
> relocation slowpath. When all locks are dropped, we acquire the
> pages for pinning. When the locks are taken, we transfer those
> pages in .get_pages() to the bo. As a final check before installing
> the fences, we ensure that the mmu notifier was not called; if it is,
> we return -EAGAIN to userspace to signal it has to start over.
>
> Changes since v1:
> - Unbinding is done in submit_init only. submit_begin() removed.
> - MMU_NOTFIER -> MMU_NOTIFIER
> Changes since v2:
> - Make i915->mm.notifier a spinlock.
> Changes since v3:
> - Add WARN_ON if there are any page references left, should have been 0.
> - Return 0 on success in submit_init(), bug from spinlock conversion.
> - Release pvec outside of notifier_lock (Thomas).
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
There are a number of failures in gem_userptr_blits (that has a patch by 
Chris enabling it to run properly) that needs investigating.
> ---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  94 ++-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  35 +-
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  10 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 765 +++++-------------
>   drivers/gpu/drm/i915/i915_drv.h               |   9 +-
>   drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>   7 files changed, 334 insertions(+), 586 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 89d7e7980eae..c9db199c4d81 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -52,14 +52,16 @@ enum {
>   /* __EXEC_OBJECT_NO_RESERVE is BIT(31), defined in i915_vma.h */
>   #define __EXEC_OBJECT_HAS_PIN		BIT(30)
>   #define __EXEC_OBJECT_HAS_FENCE		BIT(29)
> -#define __EXEC_OBJECT_NEEDS_MAP		BIT(28)
> -#define __EXEC_OBJECT_NEEDS_BIAS	BIT(27)
> -#define __EXEC_OBJECT_INTERNAL_FLAGS	(~0u << 27) /* all of the above + */
> +#define __EXEC_OBJECT_USERPTR_INIT	BIT(28)
> +#define __EXEC_OBJECT_NEEDS_MAP		BIT(27)
> +#define __EXEC_OBJECT_NEEDS_BIAS	BIT(26)
> +#define __EXEC_OBJECT_INTERNAL_FLAGS	(~0u << 26) /* all of the above + */
>   #define __EXEC_OBJECT_RESERVED (__EXEC_OBJECT_HAS_PIN | __EXEC_OBJECT_HAS_FENCE)
>   
>   #define __EXEC_HAS_RELOC	BIT(31)
>   #define __EXEC_ENGINE_PINNED	BIT(30)
> -#define __EXEC_INTERNAL_FLAGS	(~0u << 30)
> +#define __EXEC_USERPTR_USED	BIT(29)
> +#define __EXEC_INTERNAL_FLAGS	(~0u << 29)
>   #define UPDATE			PIN_OFFSET_FIXED
>   
>   #define BATCH_OFFSET_BIAS (256*1024)
> @@ -865,6 +867,19 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>   		}
>   
>   		eb_add_vma(eb, i, batch, vma);
> +
> +		if (i915_gem_object_is_userptr(vma->obj)) {
> +			err = i915_gem_object_userptr_submit_init(vma->obj);
> +			if (err) {
> +				if (i + 1 < eb->buffer_count)
> +					eb->vma[i + 1].vma = NULL;

Why i+1 here? Perhaps worth a code comment? }

...

>   
> +#ifdef CONFIG_MMU_NOTIFIER
> +	if (!err && (eb->args->flags & __EXEC_USERPTR_USED)) {
> +		spin_lock(&eb->i915->mm.notifier_lock);
> +
> +		/*
> +		 * count is always at least 1, otherwise __EXEC_USERPTR_USED
> +		 * could not have been set
> +		 */
> +		for (i = count - 1; i; i--) {

Aren't we missing index 0 here?

> +			struct eb_vma *ev = &eb->vma[i];
> +			struct drm_i915_gem_object *obj = ev->vma->obj;
> +
> +			if (!i915_gem_object_is_userptr(obj))
> +				continue;
> +
> +			err = i915_gem_object_userptr_submit_done(obj);
> +			if (err)
> +				break;

Is there a chance we could avoid setting the fence for this object if we 
need to restart with -EAGAIN and thus submit an empty batchbuffer? 
Because if we allow setting a fence even when returning -EAGAIN, that 
would likely not be the fence waited for in the invalidation callback, 
but rather a fence waited for during unbind in the next submit_init 
which is undesirable.

> +		}
> +
> +		spin_unlock(&eb->i915->mm.notifier_lock);
> +	}
> +#endif
> +
...
> +/**
> + * i915_gem_userptr_invalidate - callback to notify about mm change
> + *
> + * @mni: the range (mm) is about to update
> + * @range: details on the invalidation
> + * @cur_seq: Value to pass to mmu_interval_set_seq()
> + *
> + * Block for operations on BOs to finish and mark pages as accessed and
> + * potentially dirty.
> + */
> +static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
> +					const struct mmu_notifier_range *range,
> +					unsigned long cur_seq)
>   {
> -	struct i915_mmu_notifier *mn =
> -		container_of(_mn, struct i915_mmu_notifier, mn);
> -	struct interval_tree_node *it;
> -	unsigned long end;
> -	int ret = 0;
> -
> -	if (RB_EMPTY_ROOT(&mn->objects.rb_root))
> -		return 0;
> -
> -	/* interval ranges are inclusive, but invalidate range is exclusive */
> -	end = range->end - 1;
> -
> -	spin_lock(&mn->lock);
> -	it = interval_tree_iter_first(&mn->objects, range->start, end);
> -	while (it) {
> -		struct drm_i915_gem_object *obj;
> -
> -		if (!mmu_notifier_range_blockable(range)) {
> -			ret = -EAGAIN;
> -			break;
> -		}
> +	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	long r;
>   
> -		/*
> -		 * The mmu_object is released late when destroying the
> -		 * GEM object so it is entirely possible to gain a
> -		 * reference on an object in the process of being freed
> -		 * since our serialisation is via the spinlock and not
> -		 * the struct_mutex - and consequently use it after it
> -		 * is freed and then double free it. To prevent that
> -		 * use-after-free we only acquire a reference on the
> -		 * object if it is not in the process of being destroyed.
> -		 */
> -		obj = container_of(it, struct i915_mmu_object, it)->obj;
> -		if (!kref_get_unless_zero(&obj->base.refcount)) {
> -			it = interval_tree_iter_next(it, range->start, end);
> -			continue;
> -		}
> -		spin_unlock(&mn->lock);
> +	if (!mmu_notifier_range_blockable(range))
> +		return false;
>   
> -		ret = i915_gem_object_unbind(obj,
> -					     I915_GEM_OBJECT_UNBIND_ACTIVE |
> -					     I915_GEM_OBJECT_UNBIND_BARRIER);
> -		if (ret == 0)
> -			ret = __i915_gem_object_put_pages(obj);
> -		i915_gem_object_put(obj);
> -		if (ret)
> -			return ret;

If we add an additional fence wait here before setting the seq (which 
takes the invalidation write seqlock), we'd reduce (but definitely not 
eliminate) the chance of waiting inside the invalidation write seqlock, 
which could trigger a wait in submit_init until the write_seqlock is 
released. That would make the new userptr invalidation similarly 
unlikely to trigger a wait in the command submission path as the 
previous userptr invalidation.

> +	spin_lock(&i915->mm.notifier_lock);
>   
> -		spin_lock(&mn->lock);
> +	mmu_interval_set_seq(mni, cur_seq);
>   
> -		/*
> -		 * As we do not (yet) protect the mmu from concurrent insertion
> -		 * over this range, there is no guarantee that this search will
> -		 * terminate give 	if (unlikely(err))
>   		goto err_skip;
>   
> @@ -3347,7 +3414,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   
>   	err = eb_lookup_vmas(&eb);
>   	if (err) {
> -		eb_release_vmas(&eb, true);
> +		eb_release_vmas(&eb, true, true);
>   		goto err_engine;
>   	}
>   
> @@ -3419,6 +3486,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   
>   	trace_i915_request_queue(eb.request, eb.batch_flags);
>   	err = eb_submit(&eb, batch);
> +
>   err_request:
>   	i915_request_get(eb.request);
>   	eb_request_add(&eb);
> @@ -3439,7 +3507,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	i915_request_put(eb.request);
>   
>   err_vma:
> -	eb_release_vmas(&eb, true);
> +	eb_release_vmas(&eb, true, true);
>   	if (eb.trampoline)
>   		i915_vma_unpin(eb.trampoline);
>   	WARN_ON(err == -EDEADLK);

/Thomas


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
