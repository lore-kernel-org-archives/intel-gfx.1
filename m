Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF81DF55431
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Feb 2026 23:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E5410E33F;
	Tue, 24 Feb 2026 23:54:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5D10E33B;
 Tue, 24 Feb 2026 23:54:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_gpu=3A_nova-core=3A_Add_m?=
 =?utf-8?q?emory_management_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 24 Feb 2026 23:54:05 -0000
Message-ID: <177197724537.283980.4464586451116070416@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
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

Series: gpu: nova-core: Add memory management support
URL   : https://patchwork.freedesktop.org/series/162102/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/162102/revisions/1/mbox/ not applied
Applying: gpu: nova-core: Select GPU_BUDDY for VRAM allocation
Applying: gpu: nova-core: Kconfig: Sort select statements alphabetically
Applying: gpu: nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
Using index info to reconstruct a base tree...
M	drivers/gpu/nova-core/gpu.rs
M	drivers/gpu/nova-core/gsp/boot.rs
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/nova-core/gsp/boot.rs
Auto-merging drivers/gpu/nova-core/gpu.rs
Applying: gpu: nova-core: gsp: Extract usable FB region from GSP
Applying: gpu: nova-core: fb: Add usable_vram field to FbLayout
Applying: gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
Applying: docs: gpu: nova-core: Document the PRAMIN aperture mechanism
Applying: gpu: nova-core: mm: Add common memory management types
Applying: gpu: nova-core: mm: Add TLB flush support
Applying: gpu: nova-core: mm: Add GpuMm centralized memory manager
Applying: gpu: nova-core: mm: Use usable VRAM region for buddy allocator
error: sha1 information is lacking or useless (drivers/gpu/nova-core/gpu.rs).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0011 gpu: nova-core: mm: Use usable VRAM region for buddy allocator
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


