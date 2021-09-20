Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF29CC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 10:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38F960F50
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 10:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A38F960F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B7D6E49F;
	Mon, 20 Sep 2021 10:49:53 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0586E49F;
 Mon, 20 Sep 2021 10:49:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="284116966"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="284116966"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:49:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473553734"
Received: from yohlee-mobl1.gar.corp.intel.com (HELO [10.214.151.93])
 ([10.214.151.93])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:49:48 -0700
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <01a1827d-ab6f-bd88-7291-dd68676c0eae@intel.com>
Date: Mon, 20 Sep 2021 11:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v3 3/6] drm/i915 Implement LMEM backup and
 restore for suspend / resume
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

On 14/09/2021 20:31, Thomas Hellström wrote:
> Just evict unpinned objects to system. For pinned LMEM objects,
> make a backup system object and blit the contents to that.
> 
> Backup is performed in three steps,
> 1: Opportunistically evict evictable objects using the gpu blitter.
> 2: After gt idle, evict evictable objects using the gpu blitter. This will
> be modified in an upcoming patch to backup pinned objects that are not used
> by the blitter itself.
> 3: Backup remaining pinned objects using memcpy.
> 
> Also move uC suspend to after 2) to make sure we have a functional GuC
> during 2) if using GuC submission.
> 
> v2:
> - Major refactor to make sure gem_exec_suspend@hang-SX subtests work, and
>    suspend / resume works with a slightly modified GuC submission enabling
>    patch series.
> 
> v3:
> - Fix a potential use-after-free (Matthew Auld)
> - Use i915_gem_object_create_shmem() instead of
>    i915_gem_object_create_region (Matthew Auld)
> - Minor simplifications (Matthew Auld)
> - Fix up kerneldoc for i195_ttm_restore_region().
> - Final lmem_suspend() call moved to i915_gem_backup_suspend from
>    i915_gem_suspend_late, since the latter gets called at driver unload
>    and we don't unnecessarily want to run it at that time.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

<snip>

> +
> +static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
> +			    struct drm_i915_gem_object *obj)
> +{
> +	struct i915_gem_ttm_pm_apply *pm_apply =
> +		container_of(apply, typeof(*pm_apply), base);
> +	struct drm_i915_gem_object *backup = obj->ttm.backup;
> +	struct ttm_buffer_object *backup_bo = i915_gem_to_ttm(backup);
> +	struct ttm_operation_ctx ctx = {};
> +	int err;
> +
> +	if (!backup)
> +		return 0;
> +
> +	if (!pm_apply->allow_gpu && (obj->flags & I915_BO_ALLOC_USER))
> +		return 0;

Hmm, do we ever hit this? I would presume anything that userspace 
directly allocated in lmem can be kicked out with ttm_bo_validate(sys) 
i.e backup == NULL?

> +
> +	err = i915_gem_object_lock(backup, apply->ww);
> +	if (err)
> +		return err;
> +
> +	/* Content may have been swapped. */
> +	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	if (!err) {
> +		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
> +					    false);
> +		GEM_WARN_ON(err);
> +
> +		obj->ttm.backup = NULL;
> +		err = 0;
> +	}
> +
> +	i915_gem_ww_unlock_single(backup);
> +
> +	if (!err)
> +		i915_gem_object_put(backup);
> +
> +	return err;
> +}
> +
