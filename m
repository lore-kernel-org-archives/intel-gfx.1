Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE915C43458
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Jun 2026 17:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3443610E9D5;
	Mon, 29 Jun 2026 17:18:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD910E9D5;
 Mon, 29 Jun 2026 17:18:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drivers=3A_Improve_memory?=
 =?utf-8?q?_management_for_large_object_allocations_when_i915/shmem_is_used_?=
 =?utf-8?q?with_iommu_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 29 Jun 2026 17:18:48 -0000
Message-ID: <178275352889.129856.7799995479531708145@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625134342.1102921-1-krzysztof.karas@intel.com>
In-Reply-To: <20260625134342.1102921-1-krzysztof.karas@intel.com>
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

Series: drivers: Improve memory management for large object allocations when i915/shmem is used with iommu (rev2)
URL   : https://patchwork.freedesktop.org/series/169199/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/169199/revisions/2/mbox/ not applied
Applying: drivers/iommu: Unroll unsuccessful mapping
error: patch failed: drivers/iommu/dma-iommu.c:1515
error: drivers/iommu/dma-iommu.c: patch does not apply
error: patch failed: drivers/iommu/iommu.c:2900
error: drivers/iommu/iommu.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Using index info to reconstruct a base tree...
M	drivers/iommu/dma-iommu.c
M	drivers/iommu/iommu.c
Patch failed at 0001 drivers/iommu: Unroll unsuccessful mapping
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


