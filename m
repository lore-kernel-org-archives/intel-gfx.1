Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15A606A31C
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsknD2hx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58611206C;
	Thu, 12 Nov 2026 12:22:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CDA11206C
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 12:22:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 06CC140127;
 Thu, 12 Nov 2026 12:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBD11F00A07;
 Thu, 12 Nov 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794486123;
 bh=plqgDGLlxAQzijnnjhDRp2hS5sgXaCMEZKigbwTgr7o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IsknD2hxUjHxsdCVZpHqUzUGoyPI4NmCCIMgoJ2PnKlG8vkL3PJZhcZAZ4QzO50Bl
 uXtY9K829DQFuTjJqbML72Wp4ZcO0iMjuEaebDH2KNbtz1aMr7syx/rxvI693B79Fb
 YUCXBNVwc0ln/3u2irHqS9T6Zb0ibYmE98aEVmrBv4VAlMuZWfgBSzssikLPqpQI0T
 w/DWo2dhjNjfoptiphav0px6SacHZ8SizxWdY5hWUslWuLX9bVCIUCC0ClJRzx+gIB
 v4f1wsrxxtc2QI8wbpEmBlyHvY9fFJyGzFd0AN0MQSatJAVAQY6KvWk/m0ElXEMay0
 +tM6LnASbm7UA==
Message-ID: <sashiko-outbox-211081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20261112115907.16263-2-sebastian.brzezinka@intel.com>
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
 <20261112115907.16263-2-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:22:03 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/selftests: redundant poisoned bitmap in
  __igt_reset_stolen()
--

commit cf1445c8fb09a3c8cb2c299dc6e5c96c660ff936
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

drm/i915/selftests: Fix unlocked mm.stolen in reset selftest

This commit fixes the stolen memory reset selftest to hold
i915->mm.stolen_lock across the poison and verify passes, check against
mm.stolen.head_node, cap the tested range to dsm.usable_size, and track
poisoned pages in a bitmap.

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index 3599c9f101e14..a419dfe9a34fb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
[ ... ]
> @@ -79,6 +97,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		i915_request_add(rq);
>  	}
> =20
> +	mutex_lock(&gt->i915->mm.stolen_lock);
> +
>  	for (page =3D 0; page < num_pages; page++) {
>  		dma_addr_t dma =3D (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
> @@ -95,10 +115,10 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
> =20
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		if (stolen_page_unused(gt, page)) {
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> +			__set_bit(page, poisoned);
> +		}
[ ... ]
> @@ -143,10 +163,13 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in =3D tmp;
>  		x =3D crc32_le(0, in, PAGE_SIZE);
> =20
> -		if (x !=3D crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		/*
> +		 * Only check pages we poisoned: pages in use before the
> +		 * reset (e.g. ring buffers) may legitimately be rewritten
> +		 * and released during the reset.
> +		 */
> +		if (x !=3D crc[page] && test_bit(page, poisoned) &&
> +		    stolen_page_unused(gt, page)) {
>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ =3D=3D 0)

[Severity: Low]
Is the poisoned bitmap needed when gt->i915->mm.stolen_lock is held
continuously across the poison pass, the reset, and the verify pass?

Every insertion and removal in gt->i915->mm.stolen (including
i915_gem_object_release_stolen() -> __i915_gem_stolen_remove_node()) takes
stolen_lock.  Because __igt_reset_stolen() never drops stolen_lock between
the two loops, no stolen node can be released during the reset, so
stolen_page_unused(gt, page) in the verify pass always returns the same
value as in the poison pass and matches test_bit(page, poisoned).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112115907.1626=
3-1-sebastian.brzezinka@intel.com?part=3D1
