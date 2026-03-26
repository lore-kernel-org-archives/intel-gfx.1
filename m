Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BF310A3D81
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Mar 2026 12:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE87D10E8EB;
	Thu, 26 Mar 2026 12:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ek3W4K+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4110E8EB
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774528345; x=1806064345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+WCxmqhhA00sYpe0k24gmuLzvBAIQ+NIGctA09CXneE=;
 b=ek3W4K+Jx2J40C4LhMPVe1raZewYV//7EWmj6ypVUFq73IxCIc6y1m+g
 WCcQ47AlovXEaIQqZtA2B04pAhmMh6IGTQp33Mx0W6aX1szXlzNcR5vqS
 p3uGuwFngjtH6jmqDYPZepo1qJKz+c26F88NoU09MEhP0T0gA2apvomai
 shrF8ATJaIchQIxa3i/ctghrH6lqLxUsDJrUL1+vd7+CdrR41gHAo3VJM
 ff0SdSKrnh1LIOHcveli0xgTDF8pqVce5PMxXBigPCU1r4kj3jTa3hax2
 uhrPpxFqLlKJDJZK2RSeUDYBkNFK1FBmV7ku5y7dpxhRMkpNGvme7iR0R g==;
X-CSE-ConnectionGUID: vgYLqEJ1T7ukXy/t9JLqig==
X-CSE-MsgGUID: s+zxuYPrQ9utFK7amByV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79489487"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="79489487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:32:07 -0700
X-CSE-ConnectionGUID: vyyVrOmAQdauQWFdfiNDqw==
X-CSE-MsgGUID: wxRAjZvYTLO9hpkN2nszlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="255489486"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:32:05 -0700
Date: Thu, 26 Mar 2026 14:32:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Yassine Mounir <sosohero200@gmail.com>, g@freedesktop.org
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 security@kernel.org
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
Message-ID: <acUnQkniqECI0QVY@intel.com>
References: <20260324151741.29338-1-sosohero200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324151741.29338-1-sosohero200@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Mar 24, 2026 at 11:17:41AM -0400, Yassine Mounir wrote:
> Fix a race condition in Linux 7.0-rc2 where a GEM object could be freed
> during relocation if userspace closes the handle concurrently.
> 
> The fix involves pinning the object lifetime using i915_gem_object_get()
> before the relocation loop and releasing it via i915_gem_object_put()
> in the common exit path (out label), ensuring symmetry in both success
> and error paths.
> 
> This v2 rebases the change to the new 'gem/' directory structure in
> the current mainline tree and addresses potential memory leaks in
> early error returns.
> 
> Signed-off-by: Yassine Mounir <sosohero200@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index e7918f896..0468c0551 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1528,6 +1528,7 @@ static int eb_relocate_vma(struct i915_execbuffer *eb, struct eb_vma *ev)
>  	if (unlikely(!access_ok(urelocs, remain * sizeof(*urelocs))))
>  		return -EFAULT;
>  
> +	i915_gem_object_get(ev->vma->obj);
>  	do {
>  		struct drm_i915_gem_relocation_entry *r = stack;
>  		unsigned int count =
> @@ -1588,6 +1589,7 @@ static int eb_relocate_vma(struct i915_execbuffer *eb, struct eb_vma *ev)
>  		urelocs += ARRAY_SIZE(stack);
>  	} while (remain);
>  out:
> +	i915_gem_object_put(ev->vma->obj);
>  	reloc_cache_reset(&eb->reloc_cache, eb);
>  	return remain;


Ignoring the AI slop aspect, I did have a quick look at the code a bit
and noticed this:

eb_lookup_vma() {
	...
	rcu_read_lock();
	vma = radix_tree_lookup(...);
	if (likely(vma && vma->vm == vm))
		vma = i915_vma_tryget(vma);
	rcu_read_unlock();
	if (likely(vma))
		return vma;
	...
}

So if we somehow get a vma with the wrong vm there then we
return the vma without grabbing a reference to it.


Should we not do something like this?

if (likely(vma && vma->vm == vm))
	vma = i915_vma_tryget(vma);
+ else
+	vma = NULL;

-- 
Ville Syrjälä
Intel
