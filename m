Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5105EFC5937
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Feb 2026 12:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E0A10E908;
	Thu, 26 Feb 2026 12:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tDJTsIUb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37EA10E908;
 Thu, 26 Feb 2026 12:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 365F2600AA;
 Thu, 26 Feb 2026 12:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353AAC116C6;
 Thu, 26 Feb 2026 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107985;
 bh=eFmfOcHWXMuTl8TELzzkPhzDzmtdBPEzClbGjc32AXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDJTsIUbeF1J20yAJn2ZY5wmx65JtUZ4gLEg4lTfZEDzj9epn2SIXNKinSftZFUeM
 WuMM1zRyxTDjcV/C1u2lhaHDRf3YldgjeRePcL2iXB/GqxU5EklRb0hgXLI05rTzE0
 /Zx65MlqHuHZ3dSI9fzz730PNhNDJ/4udTDQYdx3C0TQSler9rU6nsnsfxc2jHBg3F
 UhQg7nBJBNUgylKnaoWEpJdSFgwTG/Lhkhy3D6IwutzKe1Z4Q3zAnCwNrIH9FkOr6p
 IxjNquKym9NQLXBCJVgI9PPec955Fs00fm7XV77P7/S9ckaTWAKEnqQd7cq7DZ8ibu
 w4nWVBu1ppsXg==
Date: Thu, 26 Feb 2026 13:13:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [RFC v3] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <aaA2tG7bU-gQ_96A@zenone.zhora.eu>
References: <dnqbdeooikcsklr2xk2uzh6shqddneuah27oobtyohahhfzp4q@23vsrz5343ny>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dnqbdeooikcsklr2xk2uzh6shqddneuah27oobtyohahhfzp4q@23vsrz5343ny>
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

Hi Krzysztof,

...

> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 9d454d0b46f2..ccb00cd5e750 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -38,6 +38,8 @@ struct tile {
>  	unsigned int swizzle;
>  };
>  
> +bool skip_vma = true;
> +

I don't see any need for a global variable here, please refactor
to avoid it.

>  static u64 swizzle_bit(unsigned int bit, u64 offset)
>  {
>  	return (offset & BIT_ULL(bit)) >> (bit - 6);

...

>  int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
>  {
>  	int ret;
> -	bool unuse_mm = false;
>  	static const struct i915_subtest tests[] = {
>  		SUBTEST(igt_partial_tiling),
>  		SUBTEST(igt_smoke_tiling),
> @@ -1860,14 +1867,41 @@ int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
>  	};
>  
>  	if (!current->mm) {

so that if current->mm is true we skip valid tests?

> -		kthread_use_mm(current->active_mm);
> -		unuse_mm = true;
> +		int timeout = 10;

10?

> +		/**
> +		 * We want to use current->active_mm, which corresponds to the
> +		 * address space of a userspace process that was last handled by
> +		 * scheduler. It is possible that this memory is in the middle
> +		 * of cleanup indicated by mm_users == 0, in which case kernel
> +		 * waits until the process is finished to release its mm_struct.
> +		 * Borrowing that memory at that point is unsafe, because it may
> +		 * be freed at any point and taking additional references to it
> +		 * will not change the cleanup behavior.
> +		 * Wait for a bit in hopes that another process is taken by
> +		 * scheduler and has reliable memory for us to map into.
> +		 */
> +		while (timeout--) {
> +			if (mmget_not_zero(current->active_mm)) {
> +				kthread_use_mm(current->active_mm);
> +				skip_vma = false;
> +				break;
> +			}
> +
> +			msleep(1000);

1000?

> +		}
>  	}
>  
>  	ret = i915_live_subtests(tests, i915);
>  
> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (!skip_vma) {
> +		/**
> +		 * The scheduler was working while the test executed,
> +		 * so current->active_mm might have changed. Use the old
> +		 * reference to the address space stored in current->mm.
> +		 */
> +		mmput_async(current->mm);
> +		kthread_unuse_mm(current->mm);
> +	}
>  
>  	return ret;

Overall I preferred the previous version. What's wrong to just
politically get the mm and move forward with the test?

Andi
