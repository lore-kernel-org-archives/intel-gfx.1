Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD8CC433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 08:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025D761166
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 08:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 025D761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B06F62D;
	Wed,  6 Oct 2021 08:03:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CACF6E50B;
 Wed,  6 Oct 2021 08:03:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="249212033"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="249212033"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:03:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="714700159"
Received: from jpferrer-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:03:48 -0700
Message-ID: <2fbc640b-74dd-e1dc-1068-860683e88636@linux.intel.com>
Date: Wed, 6 Oct 2021 10:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211005182405.915100-1-matthew.auld@intel.com>
 <20211005182405.915100-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211005182405.915100-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915: add some kernel-doc for
 shrink_pin and friends
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


On 10/5/21 20:24, Matthew Auld wrote:
> Attempt to document shrink_pin and the other relevant interfaces that
> interact with it, before we start messing with it.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 24 +++++++++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 31 +++++++++++++++++++
>   2 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 7dd5f804aab3..f4233c4e8d2e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -461,6 +461,28 @@ struct drm_i915_gem_object {
>   		 * instead go through the pin/unpin interfaces.
>   		 */
>   		atomic_t pages_pin_count;
> +
> +		/**
> +		 * @shrink_pin: Prevents the pages from being made visible to
> +		 * the shrinker, while the shrink_pin is non-zero. Most users
> +		 * should pretty much never have to care about this, outside of
> +		 * some special use cases.
> +		 *
> +		 * By default most objects will start out as visible to the
> +		 * shrinker(if I915_GEM_OBJECT_IS_SHRINKABLE) as soon as the
> +		 * backing pages are attached to the object, like in
> +		 * __i915_gem_object_set_pages(). They will then be removed the
> +		 * shrinker list once the pages are released.
> +		 *
> +		 * The @shrink_pin is incremented by calling
> +		 * i915_gem_object_make_unshrinkable(), which will also remove
> +		 * the object from the shrinker list, if the pin count was zero.
> +		 *
> +		 * Callers will then typically call
> +		 * i915_gem_object_make_shrinkable() or
> +		 * i915_gem_object_make_purgeable() to decrement the pin count,
> +		 * and make the pages visible again.
> +		 */
>   		atomic_t shrink_pin;
>   
>   		/**
> @@ -522,7 +544,7 @@ struct drm_i915_gem_object {
>   		struct i915_gem_object_page_iter get_dma_page;
>   
>   		/**
> -		 * Element within i915->mm.unbound_list or i915->mm.bound_list,
> +		 * Element within i915->mm.shrink_list or i915->mm.purge_list,
>   		 * locked by i915->mm.obj_lock.
>   		 */
>   		struct list_head link;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index ae2a8d54b7a4..66121fedc655 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -463,6 +463,16 @@ void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
>   
>   #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
>   
> +/**
> + * i915_gem_object_make_unshrinkable - Hide the object from the shrinker. By
> + * default all object types that support shrinking(see IS_SHRINKABLE), will also
> + * make the object visible to the shrinker after allocating the system memory
> + * pages.
> + * @obj: The GEM object.
> + *
> + * This is typically used for special kernel internal objects that can't be
> + * easily processed by the shrinker, like if they are perma-pinned.
> + */
>   void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
>   {
>   	struct drm_i915_private *i915 = obj_to_i915(obj);
> @@ -513,12 +523,33 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
>   	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
>   }
>   
> +/**
> + * i915_gem_object_make_shrinkable - Move the object to the tail of the
> + * shrinkable list. Objects on this list might be swapped out. Used with
> + * WILLNEED objects.
> + * @obj: The GEM object.
> + *
> + * MUST only be called on objects which have backing pages.
> + *
> + * MUST be balanced with previous call to i915_gem_object_make_unshrinkable().
> + */
>   void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
>   {
>   	__i915_gem_object_make_shrinkable(obj,
>   					  &obj_to_i915(obj)->mm.shrink_list);
>   }
>   
> +/**
> + * i915_gem_object_make_purgeable - Move the object to the tail of the purgeable
> + * list. Used with DONTNEED objects. Unlike with shrinkable objects, the
> + * shrinker will attempt to discard the backing pages, instead of trying to swap
> + * them out.
> + * @obj: The GEM object.
> + *
> + * MUST only be called on objects which have backing pages.
> + *
> + * MUST be balanced with previous call to i915_gem_object_make_unshrinkable().
> + */
>   void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
>   {
>   	__i915_gem_object_make_shrinkable(obj,
