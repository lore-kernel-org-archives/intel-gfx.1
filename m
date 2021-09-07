Return-Path: <SRS0=ObOY=N5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03C9C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 08:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D44360F70
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 08:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D44360F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2889DD2;
	Tue,  7 Sep 2021 08:54:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999148982A;
 Tue,  7 Sep 2021 08:54:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207365379"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="207365379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 01:54:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="523713077"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.28.225])
 ([10.252.28.225])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 01:54:37 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <41c1b026-0a4f-b5e2-bd25-bc0f3d5d547f@intel.com>
Date: Tue, 7 Sep 2021 09:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210906165515.450541-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v2 1/6] drm/i915/ttm: Implement a function
 to copy the contents of two TTM-base objects
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

On 06/09/2021 17:55, Thomas Hellström wrote:
> When backing up or restoring contents of pinned objects at suspend /
> resume time we need to allocate a new object as the backup. Add a function
> to facilitate copies between the two. Some data needs to be copied before
> the migration context is ready for operation, so make sure we can
> disable accelerated copies.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---

<snip>

> +
> +/**
> + * i915_gem_obj_copy_ttm - Copy the contents of one ttm-based gem object to
> + * another
> + * @dst: The destination object
> + * @src: The source object
> + * @allow_accel: Allow using the blitter. Otherwise TTM memcpy is used.
> + * @intr: Whether to perform waits interruptible:
> + *
> + * Note: The caller is responsible for assuring that the underlying
> + * TTM objects are populated if needed and locked.
> + *
> + * Return: Zero on success. Negative error code on error. If @intr == true,
> + * then it may return -ERESTARTSYS or -EINTR.
> + */
> +int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
> +			  struct drm_i915_gem_object *src,
> +			  bool allow_accel, bool intr)
> +{
> +	struct ttm_buffer_object *dst_bo = i915_gem_to_ttm(dst);
> +	struct ttm_buffer_object *src_bo = i915_gem_to_ttm(src);
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = intr,
> +	};
> +	struct sg_table *dst_st;
> +	int ret;
> +
> +	assert_object_held(dst);
> +	assert_object_held(src);
> +
> +	/*
> +	 * Sync for now. This will change with async moves.
> +	 */
> +	ret = ttm_bo_wait_ctx(dst_bo, &ctx);
> +	if (!ret)
> +		ttm_bo_wait_ctx(src_bo, &ctx);

ret = ?

> +	if (ret)
> +		return ret;
> +
> +	dst_st = gpu_binds_iomem(dst_bo->resource) ?
> +		dst->ttm.cached_io_st : i915_ttm_tt_get_st(dst_bo->ttm);
> +
> +	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
> +			dst_st, allow_accel);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> index 40927f67b6d9..34ac78d47b0d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -46,4 +46,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   			       resource_size_t size,
>   			       resource_size_t page_size,
>   			       unsigned int flags);
> +
> +int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
> +			  struct drm_i915_gem_object *src,
> +			  bool allow_accel, bool intr);
>   #endif
> 
