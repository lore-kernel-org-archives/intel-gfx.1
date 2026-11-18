Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F40606A320
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jao0ZVG2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEB310FC83;
	Wed, 18 Nov 2026 13:31:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530D10FC83
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:31:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4EE8C6220A;
 Wed, 18 Nov 2026 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54341F000C4;
 Wed, 18 Nov 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795008695;
 bh=nY15akjbLKyQDwo0q1enuwGudTC3iWHqJ3c2ZS5Ehlk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jao0ZVG2IU3LW0vm5cYWBaUZXs4u8BswSHqXoh4zw1+5/++o1saanGArTQnYxKBA5
 kUaca8gIDWoWON3s3rotP9rQCEgiTTfeA6TJDQtsuTKYFOpmA5HLM8suIPcioHfDi/
 24gCUFY2mxiWRlyetC+nOsMi9KpKYqoaQPeMCwpbTVsF8r6WGhofSRzWoCAxuw30yJ
 z9R4q45X36caw+dY+zynN77iIYjGqQuCbAjPpRae8vMr/W5QvMPX1+ToZ+0YVZVgfp
 09Of+7JUO7srjgyhI50Zu35I9ZimC/gjwBrcaUJIdN8bEQJiuqC/F5O4mM7s4ScdlE
 X63FllLUJJyDg==
Message-ID: <sashiko-outbox-221017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:31:34 +0000
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
- [Low] drm/i915/selftests: commit message omits
  __drm_mm_interval_first() check fix
--

commit 7de700f4e6f9ce33a0c4b581db34793a6145c70e
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

drm/i915/selftests: Fix unlocked mm.stolen in reset selftest

This commit acquires gt->i915->mm.stolen_lock around the stolen memory
walk in __igt_reset_stolen() and moves the interval tree lookup into a
stolen_page_unused() helper that compares the result against
&gt->i915->mm.stolen.head_node.

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index 3599c9f101e14..8d5f3ef84db55 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -14,6 +14,16 @@
>  #include "selftests/igt_atomic.h"
>  #include "selftests/igt_spinner.h"
> =20
> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
> +{
> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
> +
> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
> +					page << PAGE_SHIFT,
> +					((page + 1) << PAGE_SHIFT) - 1) =3D=3D
> +	       &gt->i915->mm.stolen.head_node;
> +}

[ ... ]

> @@ -95,9 +107,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
> =20
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		if (stolen_page_unused(gt, page))
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);

[Severity: Low]
Should the commit message also describe the __drm_mm_interval_first()
return-value fix in stolen_page_unused()?

__drm_mm_interval_first() returns &mm->head_node when no interval overlaps
the queried range, so the previous !__drm_mm_interval_first() checks were
always false and __igt_reset_stolen() never poisoned or verified unused
stolen pages.  This functional change is currently only mentioned in the
changelog notes below the "---" separator, which will be stripped when the
patch is applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/c47b0ea2093da73a92e=
9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com?part=3D1
