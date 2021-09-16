Return-Path: <SRS0=l9+3=OG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77EDC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 10:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A28611CA
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 10:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89A28611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAFC882B8;
	Thu, 16 Sep 2021 10:01:27 +0000 (UTC)
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3EB6EB44
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 10:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2AEA8401B1;
 Thu, 16 Sep 2021 12:01:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abExaibYORHM; Thu, 16 Sep 2021 12:01:23 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BA6A93F36B;
 Thu, 16 Sep 2021 12:01:22 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B4E723601AE;
 Thu, 16 Sep 2021 12:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1631786482; bh=52bJcnTosCz6Fy4bT0LUY/ka1QvQPk1kd9B9prCpVEU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eNd4EVuKT7zhwmeKvoPNpUKz2NIKf069ZHC56Kt0b+HfWHk9IzUOqadYGq+8mZxSl
 f9pZWtRYnXNXDplkKrIt7bKQLW6qZNwcxh5t46YU2kNr3JdxUoBZHO+9kdbhAM1mrf
 YH1T4U7/4BbLmJ4srHYHYWmFAPZFQmmCHojxfNbY=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210830121006.2978297-1-maarten.lankhorst@linux.intel.com>
 <20210830121006.2978297-19-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <975c2ca6-05b2-9a51-aa59-f4b0353546f7@shipmail.org>
Date: Thu, 16 Sep 2021 12:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830121006.2978297-19-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 18/19] drm/i915: Add support for
 asynchronous moving fence waiting
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

We're moving towards a failsafe migration on DG1, but on DG2+ we'd have 
to wedge the GPU when an error occurs during initial clearing or swapin. 
But CPU maps don't care whether the GPU is wedged so we need to check 
the error status both below and in the TTM fault handler, I guess.

On 8/30/21 2:10 PM, Maarten Lankhorst wrote:
> For now, we will only allow async migration when TTM is used,
> so the paths we care about are related to TTM.
>
> The mmap path is handled by having the fence in ttm_bo->moving,
> when pinning, the binding only becomes available after the moving
> fence is signaled, and pinning a cpu map will only work after
> the moving fence signals.
>
> This should close all holes where userspace can read a buffer
> before it's fully migrated.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 10 ++++++++++
>   drivers/gpu/drm/i915/i915_vma.c           | 10 ++++++++--
>   2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 8eb1c3a6fc9c..a044d1829729 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -345,6 +345,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>   			      enum i915_map_type type)
>   {
>   	enum i915_map_type has_type;
> +	struct dma_fence *moving;
>   	bool pinned;
>   	void *ptr;
>   	int err;
> @@ -355,6 +356,15 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>   
>   	assert_object_held(obj);
>   
> +	moving = i915_gem_object_get_moving_fence(obj);
> +	if (moving) {
> +		err = dma_fence_wait(moving, true);
> +		dma_fence_put(moving);
> +
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
Error check on the moving fence?
>   	pinned = !(type & I915_MAP_OVERRIDE);
>   	type &= ~I915_MAP_OVERRIDE;
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index bfba299d905c..320678e9b4e1 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -398,7 +398,7 @@ int i915_vma_bind(struct i915_vma *vma,
>   	GEM_BUG_ON(!vma->pages);
>   
>   	trace_i915_vma_bind(vma, bind_flags);
> -	if (work && bind_flags & vma->vm->bind_async_flags) {
> +	if (work) {
>   		struct dma_fence *prev;
>   
>   		work->vma = vma;
> @@ -1145,6 +1145,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   		    u64 size, u64 alignment, u64 flags)
>   {
>   	struct i915_vma_work *work = NULL;
> +	struct dma_fence *moving = NULL;
>   	intel_wakeref_t wakeref = 0;
>   	unsigned int bound;
>   	int err;
> @@ -1168,7 +1169,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	if (flags & PIN_GLOBAL)
>   		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>   
> -	if (flags & vma->vm->bind_async_flags) {
> +	moving = i915_gem_object_get_moving_fence(vma->obj);
> +	if (flags & vma->vm->bind_async_flags || moving) {
>   		/* lock VM */
>   		err = i915_vm_lock_objects(vma->vm, ww);
>   		if (err)
> @@ -1182,6 +1184,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   
>   		work->vm = i915_vm_get(vma->vm);
>   
> +		dma_fence_work_chain(&work->base, moving);
> +

We need to error check the async binding in the dma-fence-work release 
callback, and set the VMA_ERROR flag if necessary, at least until we 
have the error-safe / gpu wedge stuff. VMA_ERROR is racy, though.

>   		/* Allocate enough page directories to used PTE */
>   		if (vma->vm->allocate_va_range) {
>   			err = i915_vm_alloc_pt_stash(vma->vm,
> @@ -1289,6 +1293,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   err_rpm:
>   	if (wakeref)
>   		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
> +	if (moving)
> +		dma_fence_put(moving);
>   	i915_vma_put_pages(vma);
>   	return err;
>   }
