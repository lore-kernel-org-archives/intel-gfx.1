Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF0BC2D0E4
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6056221D7A
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6056221D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C706EDE4;
	Fri, 27 Nov 2020 14:19:18 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2B56EDE4;
 Fri, 27 Nov 2020 14:19:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134151-1500050 for multiple; Fri, 27 Nov 2020 14:19:13 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-138-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-138-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:19:13 +0000
Message-ID: <160648675310.2925.6094361348214569444@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC PATCH 137/162] drm/i915: blt copy between objs
 using pre-created vma windows
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:53)
> +int i915_window_blt_copy(struct drm_i915_gem_object *dst,
> +                        struct drm_i915_gem_object *src)
> +{
> +       struct drm_i915_private *i915 = to_i915(src->base.dev);
> +       struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
> +       bool src_is_lmem = i915_gem_object_is_lmem(src);
> +       bool dst_is_lmem = i915_gem_object_is_lmem(dst);
> +       struct scatterlist *last_sgl;
> +       struct i915_vma *src_vma, *dst_vma;
> +       struct i915_request *rq;
> +       u64 cur_win_sz, blt_copied, offset;
> +       long timeout;
> +       u32 size;
> +       int err;
> +
> +       src_vma = src_is_lmem ? i915->mm.lmem_window[0] :
> +                               i915->mm.smem_window[0];
> +       dst_vma = dst_is_lmem ? i915->mm.lmem_window[1] :
> +                               i915->mm.smem_window[1];
> +
> +       if (!src_vma || !dst_vma)
> +               return -ENODEV;
> +
> +       blt_copied = 0;
> +
> +       err = i915_window_blt_copy_prepare_obj(src);
> +       if (err)
> +               return err;
> +
> +       err = i915_window_blt_copy_prepare_obj(dst);
> +       if (err) {
> +               i915_gem_object_unpin_pages(src);
> +               return err;
> +       }
> +
> +       mutex_lock(&i915->mm.window_mutex);
> +       src_vma->obj = src;
> +       dst_vma->obj = dst;
> +       do {
> +               cur_win_sz = min_t(u64, BLT_WINDOW_SZ,
> +                                  (src->base.size - blt_copied));
> +               offset = blt_copied >> PAGE_SHIFT;
> +               size = ALIGN(cur_win_sz, src->mm.region->min_page_size) >>
> +                      PAGE_SHIFT;
> +               intel_partial_pages_for_sg_table(src, src_vma->pages, offset,
> +                                                size, &last_sgl);
> +
> +               /*
> +                * Insert pages into vm, expects the pages to the full
> +                * length of VMA. But we may have the pages of <= vma_size.
> +                * Hence altering the vma size to match the total size of
> +                * the pages attached.
> +                */
> +               src_vma->size = size << PAGE_SHIFT;
> +               i915_insert_vma_pages(src_vma, src_is_lmem);
> +               sg_unmark_end(last_sgl);
> +
> +               /*
> +                * Source obj size could be smaller than the dst obj size,
> +                * due to the varying min_page_size of the mem regions the
> +                * obj belongs to. But when we insert the pages into vm,
> +                * the total size of the pages supposed to be multiples of
> +                * the min page size of that mem region.
> +                */
> +               size = ALIGN(cur_win_sz, dst->mm.region->min_page_size) >>
> +                      PAGE_SHIFT;
> +               intel_partial_pages_for_sg_table(dst, dst_vma->pages, offset,
> +                                                size, &last_sgl);
> +
> +               dst_vma->size = size << PAGE_SHIFT;
> +               i915_insert_vma_pages(dst_vma, dst_is_lmem);
> +               sg_unmark_end(last_sgl);
> +
> +               rq = i915_request_create(ce);
> +               if (IS_ERR(rq)) {
> +                       err = PTR_ERR(rq);
> +                       break;
> +               }
> +               if (rq->engine->emit_init_breadcrumb) {
> +                       err = rq->engine->emit_init_breadcrumb(rq);
> +                       if (unlikely(err)) {
> +                               DRM_ERROR("init_breadcrumb failed. %d\n", err);
> +                               break;
> +                       }
> +               }
> +               err = i915_window_blt_copy_batch_prepare(rq, src_vma, dst_vma,
> +                                                        cur_win_sz);
> +               if (err) {
> +                       DRM_ERROR("Batch preparation failed. %d\n", err);
> +                       i915_request_set_error_once(rq, -EIO);
> +               }
> +
> +               i915_request_get(rq);
> +               i915_request_add(rq);
> +
> +               timeout = i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);

Locked waits.

> +               if (timeout < 0) {
> +                       DRM_ERROR("BLT Request is not completed. %ld\n",
> +                                 timeout);
> +                       err = timeout;
> +                       i915_request_put(rq);
> +                       break;
> +               }
> +
> +               blt_copied += cur_win_sz;
> +               err = 0;
> +               i915_request_put(rq);
> +               flush_work(&i915->gt.engine[BCS0]->retire_work);

Papering (doubtful the paper is successful) over bugs by introducing a
whole load more.

This fails the basic premise that eviction must be pipelined. The PTE
are transient and can be written prior to the copy and kept within the
non-preemptible window of the blt. Thus allowing many evictions to
scheduled in parallel (by either allocating separate contexts, or more
preferably picking a user context).
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
