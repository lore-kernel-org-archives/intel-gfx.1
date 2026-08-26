Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC53C61DBD
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 17:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C4210E2DE;
	Wed, 26 Aug 2026 17:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gyWKNkeW";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424D10E2DE
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 17:31:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AF358439C2;
 Wed, 26 Aug 2026 17:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0108C1F000E9;
 Wed, 26 Aug 2026 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787765511;
 bh=R2QETYhPvOkKMoNnjxG/pbHN+lDuCwiTNOHlDphWmdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gyWKNkeWgxc0wmb+3f0YGy4d/OC9W2abR2lEu3C2yXoMb+Q2uvElSwaV1BOi15UIT
 h6XYlUqp/XTuaTbnXEiEgC/zTPF8/CTz89sq3n/RUAD1Zlw/1LJFwSd+XEyBcs0IeK
 tbUT0qb+VQH7Ws/pIwM6LDLR5Rr/Y+tcCjwuqbGq7oyD69LoTxPocruEkDt83NDesa
 c+ulnq6RoP0no6xsoZ4dnuZu5HN0OSGpTTuh4VxSE7Fgzl20I5VRioqD9jfQiJ+1Wa
 XZciEWJ1ElNMLjaod/TN+3NjJTihi2YbnWGYGZoKExXAFe6xuyZYiH/tDCNSNJ2Oae
 4qkbl/AtgliAA==
Date: Wed, 26 Aug 2026 19:31:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com, 
 krzysztof.karas@intel.com, krzysztof.niemiec@intel.com,
 chris.p.wilson@intel.com
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Message-ID: <ao8a-Y4re7PRKjIr@zenone.zhora.eu>
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
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

Hi Sebastian,

Have you checked sashiko's reviews? They look valid to me.

...

> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
>  
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (unused)

this is always false.

>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);

And this needs to be inside the lock.

>  
>  		in = (void __force *)s;
> @@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in = tmp;
>  		x = crc32_le(0, in, PAGE_SIZE);
>  
> -		if (x != crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (x != crc[page] && unused) {

this is also always false and besides it needs to be included
inside the locks.

Thanks,
Andi

>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ == 0)
> -- 
> 2.55.0
> 
