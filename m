Return-Path: <SRS0=l9+3=OG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFB1C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 17:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0ABE61029
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 17:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0ABE61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008B66EBAC;
	Thu, 16 Sep 2021 17:07:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1116EBA6;
 Thu, 16 Sep 2021 17:07:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202771699"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="202771699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 10:07:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="610718577"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO [10.249.254.218])
 ([10.249.254.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 10:07:53 -0700
Message-ID: <54f6ab70d568dc33214c07c9ad9fc7d5952132e8.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com
Date: Thu, 16 Sep 2021 19:07:50 +0200
In-Reply-To: <20210916162819.27848-6-matthew.brost@intel.com>
References: <20210916162819.27848-1-matthew.brost@intel.com>
 <20210916162819.27848-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915: Take pinning into account in
 __i915_gem_object_is_lmem
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

On Thu, 2021-09-16 at 09:28 -0700, Matthew Brost wrote:
> Don't blow up on a GEM_WARN_ON in __i915_gem_object_is_lmem if the
> object is pinned (not evictable).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index 034226c5d4d0..d659239fcbcc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -56,8 +56,8 @@ bool i915_gem_object_is_lmem(struct
> drm_i915_gem_object *obj)
>   * @obj: The object to check.
>   *
>   * This function is intended to be called from within the fence
> signaling
> - * path where the fence keeps the object from being migrated. For
> example
> - * during gpu reset or similar.
> + * path where the fence, or a pin, keeps the object from being
> migrated. For
> + * example during gpu reset or similar.
>   *
>   * Return: Whether the object is resident in lmem.
>   */
> @@ -66,7 +66,8 @@ bool __i915_gem_object_is_lmem(struct
> drm_i915_gem_object *obj)
>         struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
>  
>  #ifdef CONFIG_LOCKDEP
> -       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true));
> +       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true) &&
> +                   !i915_gem_object_evictable(obj));
>  #endif
>         return mr && (mr->type == INTEL_MEMORY_LOCAL ||
>                       mr->type == INTEL_MEMORY_STOLEN_LOCAL);


