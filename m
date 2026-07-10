Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BF6C43458
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Jul 2026 19:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5D510E21C;
	Fri, 10 Jul 2026 19:40:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107C10E21C;
 Fri, 10 Jul 2026 19:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B0?=
 =?utf-8?q?1/12=5D_dma-buf=3A_Add_reference_counting_to_dma=5Fresv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 10 Jul 2026 19:40:24 -0000
Message-ID: <178371242499.175489.6290307426951498165@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710190752.2355-1-christian.koenig@amd.com>
In-Reply-To: <20260710190752.2355-1-christian.koenig@amd.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [01/12] dma-buf: Add reference counting to dma_resv
URL   : https://patchwork.freedesktop.org/series/170208/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/170208/revisions/1/mbox/ not applied
Applying: dma-buf: Add reference counting to dma_resv
Applying: dma-buf/tests: Convert st-dma-resv tests to use dma_resv_alloc
Applying: drm/gem: Add helper for drm_gem_object resv assignment
Applying: drm/ttm: Switch LRU cursor to track dma_resv instead of buffer objects
Applying: drm/ttm: switch to ttm_bo_lru_for_each_reserved_guarded for swapout
Applying: drm/ttm: move delete handling into ttm_bo_evict
Applying: drm/ttm: use ttm_bo_lru_for_each_reserved_guarded in evict_all
Applying: drm/ttm: use dma_resv reference in ttm_device_clear_lru_dma_mappings
Applying: drm/ttm: nuke buffer refcounting
Applying: drm/exec: add drm_exec_lock_resv function
Applying: drm/ttm: support using drm_exec during eviction v4
Applying: drm/amdgpu: use drm_exec during BO validation
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0012 drm/amdgpu: use drm_exec during BO validation
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


