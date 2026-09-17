Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CBDC88E72
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 11:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB73010E02F;
	Thu, 17 Sep 2026 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XYB8Xpbw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE310E02F
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2026 11:51:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 510094384E;
 Thu, 17 Sep 2026 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124B81F00893;
 Thu, 17 Sep 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789645865;
 bh=0bpqTlBeUQChRiNG3DCaTcP2mkDYZ0V9GRZ7yvHy1/c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XYB8XpbwsA5ySfAwFcHrhswuktMaDjfF1ybA484hTBk+EX1F1gU9FL59AuJRMGTIj
 6HLuiDuxjTvP9cNkr+kMAUbYVCo+IP52jcV04jqdO7C0xWTNSHJAl1BUX3IiFm4AQ4
 v4exAKNjgW0r9WsxqTSXcS+jpmOv8m5F7SDk1X8knpmqTD8BwhxTg05AD87R+jRxXS
 QbgZbyx1kox0BlxzOhfFPf/CWa+rs+4aNsySNopgegicJnzy6Gx/QSrKjIIs610GjY
 AGwH9NWWpbwJNDpCOh+En1i3XDsG9ybG6DvxECSbXocwEkd8FGUpSCzubZ0YFfga7v
 BugFr/Rrcf/NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260917113717.2852-1-sebastian.brzezinka@intel.com>
References: <20260917113717.2852-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:51:04 +0000
Message-Id: <20260917115105.124B81F00893@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/i915/selftests: Hardware-reserved stolen memory is poisoned, c=
ausing crash
- [Low] drm/i915/selftests: TOCTOU race in GPU reset stolen memory test
--

commit 855f7a70fdf31c1c3dd9401d2d9ed883c5184a38
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: drm/i915/selftests: Fix unlocked mm.stolen in reset selftest

This patch extends the stolen_lock coverage in the reset selftest to include
the poison and verify writes, not just the lookup. It also introduces a
stolen_page_unused() helper to perform the lookup.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index 2cfc23c58e909..77af788314ffd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
[ ... ]
> @@ -95,10 +105,10 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
> =20
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		if (stolen_page_unused(gt, page))
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);

[Severity: High]
Since __igt_reset_stolen() loops over the full resource_size(&gt->i915->dsm=
.stolen):

	num_pages =3D resource_size(dsm) >> PAGE_SHIFT;
	...
	for (page =3D 0; page < num_pages; page++) {

will this code overwrite hardware-reserved memory regions (like WOPCM or GuC
firmware) at the top of stolen memory?

The drm_mm allocator only covers the unreserved usable_size, so queries to =
the
reserved region using stolen_page_unused() will return true. Writing STACK_=
MAGIC
to these hardware-reserved pages could destroy hardware state before trigge=
ring
a GPU reset, potentially leading to a GPU hang or system crash.

This regression appears to have been unmasked by fixing the previously
always-false !__drm_mm_interval_first() check.

[Severity: Low]
Does dropping the lock here and re-acquiring it later for the verification =
pass
create a race condition?

If a concurrent thread allocates, writes to, and frees a page in stolen mem=
ory
between this baseline CRC pass and the later verification pass, could the t=
est
incorrectly attribute the modification to the GPU reset and fail spuriously?

> =20
>  		in =3D (void __force *)s;
>  		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
[ ... ]
> @@ -143,16 +153,15 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in =3D tmp;
>  		x =3D crc32_le(0, in, PAGE_SIZE);
> =20
> -		if (x !=3D crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		if (x !=3D crc[page] && stolen_page_unused(gt, page)) {

[Severity: Low]
Because the lock was dropped during the reset window, can this check guaran=
tee
that the page remained unused throughout the entire reset window?

It appears this only checks if the page is currently unused and modified at
this specific moment, missing any concurrent use while the lock was not hel=
d.

>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ =3D=3D 0)
>  				igt_hexdump(in, PAGE_SIZE);
>  			max =3D page;
>  		}
> +		mutex_unlock(&gt->i915->mm.stolen_lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917113717.2852=
-1-sebastian.brzezinka@intel.com?part=3D1
