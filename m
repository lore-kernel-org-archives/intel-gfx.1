Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3452C5DF89
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 13:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1FC10E2AE;
	Fri, 21 Aug 2026 13:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EWAWP9Yu";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE27510E2AE
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 13:48:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D36B160008;
 Fri, 21 Aug 2026 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCA21F000E9;
 Fri, 21 Aug 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787320101;
 bh=TowqGP+peUPplIRAjSY91g5yP3zde/Ob8Aq5HElGYqA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EWAWP9YuO8W+5rK8k2Tay5EP+VpUAF/Og8izcsaayCHt7uVTba5fUT6FIGwi62rZd
 WLGXbws/3z/f05qi3zVjnWYI1YUw0ySRkrLYDWvjF/sNNleEVX0slZ9IYtDIFDcTEz
 V0EZOVBnrRTNSJ/ykyo1eFk47xbHERl+2a8pDhA9N+OMvtQcfmTZuMKOHPpmB1skj6
 QY6dH2ipRYIWMQTb7hxfPRviDvXzE0aVDp9Lmb4i856HBmqpDhFz/AlJTTmvN+txwR
 TME3A3hherwfr3EsJEEG6P4iq0Nj07o+YIlQfWlqgRVy+/cy5vidBY9JzBtESpkD08
 OhXtSqgkNSglg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:48:21 +0000
Message-Id: <20260821134821.6FCA21F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The logic to determine if a stolen page is unused evaluates to a=
lways false, neutralizing the selftest.
- [Medium] Missing lock protection when accessing the globally shared `ggtt=
->error_capture` memory, risking arbitrary memory corruption.
- [Medium] Time-of-Check to Time-of-Use (TOCTOU) race condition between che=
cking page availability and poisoning it.
--

--- Patch [1]: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset =
selftest ---
commit eab33f79c43e7ed3d420674fa2faede0152e1b0b
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

drm/i915/selftests: Fix unlocked mm.stolen in reset selftest

This commit fixes an unlocked access to i915->mm.stolen in the reset selfte=
st
by wrapping __drm_mm_interval_first() calls with i915->mm.stolen_lock. This
prevents a NULL pointer dereference observed during igt_reset_device_stolen=
().

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index 2cfc23c58e909..eb6b2261329da 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c

[ ... ]

> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		dma_addr_t dma =3D (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
>  		void *in;
> =20
>  		ggtt->vm.insert_page(&ggtt->vm, dma,
>  				     ggtt->error_capture.start,
>  				     i915_gem_get_pat_index(gt->i915,
>  							    I915_CACHE_NONE),
>  				     0);

[Severity: Medium]
This is a pre-existing issue, but does this code modify the globally shared
ggtt->error_capture memory without serialization?

If a real GPU error occurs or sysfs is accessed concurrently during test
execution, could the error capture PTE be overwritten, risking arbitrary
memory corruption?

>  		mb();
> =20
>  		s =3D io_mapping_map_wc(&ggtt->iomap,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
> =20
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);

[Severity: Medium]
This is a pre-existing issue, but does this logic to determine if a stolen
page is unused evaluate to always false?

Looking at __drm_mm_interval_first(), it returns &mm->head_node when no
interval is found, which is a non-NULL pointer. This means
!__drm_mm_interval_first(...) is always false.

Does this neutralize the selftest by preventing it from verifying or
poisoning unused stolen memory pages?

> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (unused)
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);

[Severity: Medium]
This is a pre-existing issue, but is there a time-of-check to time-of-use
(TOCTOU) race condition here?

The lock gt->i915->mm.stolen_lock is released immediately after checking
the page availability, and before memset_io() poisons it.

Could a concurrent thread allocate this page before memset_io() writes
STACK_MAGIC to it, leading to unintended memory corruption of legitimate
stolen memory allocations?

> =20
>  		in =3D (void __force *)s;

[ ... ]

> @@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in =3D tmp;
>  		x =3D crc32_le(0, in, PAGE_SIZE);
> =20
> -		if (x !=3D crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (x !=3D crc[page] && unused) {

[Severity: Medium]
This is a pre-existing issue, but this check for clobbered unused pages
appears to also be neutralized by the always-false condition described
above since unused will always be false.

>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ =3D=3D 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821134044.1590=
8-1-sebastian.brzezinka@intel.com?part=3D1
