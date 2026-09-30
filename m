Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD914CA5FAC
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 11:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763410F325;
	Wed, 30 Sep 2026 11:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWPU6hP3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAF110F325
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 11:46:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E24E74327A;
 Wed, 30 Sep 2026 11:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA761F00893;
 Wed, 30 Sep 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790768764;
 bh=e7CZiazI1LU8i8CbVTSudy+/ovdeQpv7cDdJzUHC7r4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XWPU6hP3Dx2kIM0M+E8BVi4Z31IL5SdSfv1R5RY1Iw5tWxwYTsyoTvWkTe7Qiuz5N
 Hq7xzGX34goVusM09Q0MOtwQM96NoiRSOinclv8O1THqxHD2FSGNmr2aXO1tiiZbrj
 e03r3KVKQ8tZciyJBTgqpcJoWqD6pWNCJE25/TYvj8edOXJNIC7v4Qlp4HQjG+LKAX
 0dunWnuHh2BDTZfomXf5ZUHxZMt9UToOzNNeaLkggx/gRfNuo9hAFK6K3ZzJpd7wEe
 Hq6Q4zA7KFrBBoITDqRBMOvoUPLaOFp1NZW5eTIRx2kiV6MMzeMNpQ45ioGKhVjNUc
 wd06YNFy6PdgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260930113513.15169-1-sebastian.brzezinka@intel.com>
References: <20260930113513.15169-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:46:04 +0000
Message-Id: <20260930114604.9BA761F00893@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] selftests: TOCTOU race in unused stolen memory verification
--

commit c306e84112aa79cbd3009b777df94536525c83b4
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

drm/i915/selftests: Fix unlocked mm.stolen in reset selftest

This commit fixes an unlocked mm.stolen read by introducing the
stolen_page_unused() helper and wrapping accesses with stolen_lock. It also
caps num_pages to avoid the hardware-reserved region.

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index 2cfc23c58e909..811ddf991cb27 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c

[ ... ]

> @@ -95,10 +106,10 @@ __igt_reset_stolen(struct intel_gt *gt,
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
> =20
>  		in =3D (void __force *)s;
>  		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
>  			in =3D tmp;
>  		crc[page] =3D crc32_le(0, in, PAGE_SIZE);

[Severity: Medium]
Since stolen_lock is dropped before computing the CRC, does this introduce a
race window where a concurrent thread can allocate the page and modify it
before the initial CRC is calculated?

[ ... ]

> @@ -143,16 +154,15 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in =3D tmp;
>  		x =3D crc32_le(0, in, PAGE_SIZE);
> =20
> -		if (x !=3D crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		if (x !=3D crc[page] && stolen_page_unused(gt, page)) {

[Severity: Medium]
Similarly, can a concurrent thread legitimately allocate, modify, and free =
the
page while the lock is dropped here?

If this happens, when stolen_lock is re-acquired, stolen_page_unused() will
return true, but the CRC will mismatch. Could this lead the test to falsely
report that the GPU reset clobbered unused stolen memory?

>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ =3D=3D 0)
>  				igt_hexdump(in, PAGE_SIZE);
>  			max =3D page;
>  		}
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> =20
>  		io_mapping_unmap(s);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930113513.1516=
9-1-sebastian.brzezinka@intel.com?part=3D1
