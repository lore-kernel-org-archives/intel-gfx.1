Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F1B606A32D
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mR5KKl4s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8731120A3;
	Thu, 12 Nov 2026 12:26:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93C1120C5
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 12:26:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0901F43BC4;
 Thu, 12 Nov 2026 12:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BE1F00A05;
 Thu, 12 Nov 2026 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794486408;
 bh=IYraidGPhAOX1DDi6taboD4IE4fJQ+V1D0hw6nLBoqE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mR5KKl4sDIzYS+2pbJwFDK/St6VEWO2NVRPrJlb+bNnpjYEXFrH0+PWJyR263ZLIj
 zbFvxdrDb9ZqehY6x9T3XTdJLcToU8+C57qexSwJtihRMCZtw7Jeb8Tyava49QFDDe
 mRqtc7QJEsxqc4OoKAhUb7VuzOR6b/hn9ozPf9pYQaLAEqzROXc5vTCrl0UKSY/rur
 bxWX1bSiMNJB+7zG4SjSBB0wN7ayXzWVdk9bw7Bjv/SKko9xt8uuc7cxNmTqhgnJu1
 K7zcN+anEEvViMgDl8JC7oX5BqyRM7qKh3m4+Dcrva+Dx3K2czsuh/ug1HqDHUabWU
 KYNGwxGlISoyA==
Message-ID: <sashiko-outbox-211085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/i915/selftests: take error_mutex in stolen
 reset test
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20261112115907.16263-3-sebastian.brzezinka@intel.com>
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
 <20261112115907.16263-3-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:26:48 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/i915/selftests: lock inversion holding error_mutex in
  __igt_reset_stolen()
- [Medium] drm/i915/selftests: lockdep inversion in __igt_reset_stolen()
  insert_page()
--

commit c33d0f8d797f0fad1f041bc0438964e9aab4e35c
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

drm/i915/selftests: take error_mutex in stolen reset test

This commit acquires ggtt->error_mutex around the stolen memory page
sampling and GPU reset in __igt_reset_stolen() to serialize access to the
ggtt->error_capture slot.

> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i=
915/gt/selftest_reset.c
> index a419dfe9a34fb..386741637e45d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -98,6 +98,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	}
> =20
>  	mutex_lock(&gt->i915->mm.stolen_lock);
> +	mutex_lock(&ggtt->error_mutex);
> =20
>  	for (page =3D 0; page < num_pages; page++) {
>  		dma_addr_t dma =3D (dma_addr_t)dsm->start + (page << PAGE_SHIFT);

[Severity: Medium]
Does calling ggtt->vm.insert_page() in the two sampling loops while
holding ggtt->error_mutex introduce a lockdep circular dependency on
Cherryview and Broxton with VT-d?

On platforms where intel_vm_no_concurrent_access_wa() is true,
gen8_gmch_probe() sets ggtt->vm.insert_page to
bxt_vtd_ggtt_insert_page__BKL(), which calls stop_machine() and acquires
cpu_hotplug_lock.  Because i915_vma_coredump_create() acquires
ggtt->error_mutex inside a dma_fence_begin_signalling() section (after
i915_vma_resource_hold()), lockdep already tracks cpu_hotplug_lock ->
dma_fence_map -> ggtt->error_mutex.  Calling ggtt->vm.insert_page() under
ggtt->error_mutex inverts that order.

Using ggtt->vm.raw_insert_page when non-NULL, the same way
i915_vma_coredump_create() does under ggtt->error_mutex, avoids
stop_machine().

> @@ -182,6 +183,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
> =20
> +	mutex_unlock(&ggtt->error_mutex);
>  	mutex_unlock(&gt->i915->mm.stolen_lock);
> =20
>  	if (count > 0) {

[Severity: Medium]
Can keeping ggtt->error_mutex held across intel_gt_reset() cause an ABBA
deadlock with GuC error capture?

CPU0                                  kworker (guc->ct.requests.worker)
----                                  ---------------------------------
__igt_reset_stolen()
  mutex_lock(&ggtt->error_mutex)
  intel_gt_reset()
    mutex_lock(&gt->reset.mutex)
    ...
    flush_work(&guc->ct.requests.worker)
                                      ct_incoming_request_worker_func()
                                        ...
                                        i915_vma_coredump_create()
                                          mutex_lock(&ggtt->error_mutex)

 *** DEADLOCK ***

Holding ggtt->error_mutex across intel_gt_reset() also inverts the lock
order against i_mmap_rwsem (acquired in gt_revoke() ->
unmap_mapping_range()) and dma_fence_map, since i915_vma_coredump_create()
takes ggtt->error_mutex inside a dma_fence_begin_signalling() section.

Since ggtt->error_capture is cleared before the reset and
gt->i915->mm.stolen_lock stays held across it, ggtt->error_mutex could be
unlocked before the reset and re-locked for the post-reset loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112115907.1626=
3-1-sebastian.brzezinka@intel.com?part=3D2
