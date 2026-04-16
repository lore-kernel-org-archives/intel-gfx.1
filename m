Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A38F8DFCB
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Apr 2026 21:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F3F10E277;
	Thu, 16 Apr 2026 21:34:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FB110E277;
 Thu, 16 Apr 2026 21:34:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?11=2C01/20=5D_gpu=3A_nova-core=3A_gsp=3A_Return_GspStaticInfo_fro?=
 =?utf-8?q?m_boot=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 16 Apr 2026 21:34:40 -0000
Message-ID: <177637528039.470241.4765983384922356200@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
In-Reply-To: <20260415210548.3776595-1-joelagnelf@nvidia.com>
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

Series: series starting with [v11,01/20] gpu: nova-core: gsp: Return GspStaticInfo from boot() (rev2)
URL   : https://patchwork.freedesktop.org/series/164945/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/164945/revisions/2/mbox/ not applied
Applying: gpu: nova-core: gsp: Return GspStaticInfo from boot()
Applying: gpu: nova-core: gsp: Extract usable FB region from GSP
Applying: gpu: nova-core: gsp: Expose total physical VRAM end from FB region info
Applying: gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
Applying: docs: gpu: nova-core: Document the PRAMIN aperture mechanism
Applying: gpu: nova-core: mm: Add common memory management types
Applying: gpu: nova-core: mm: Add TLB flush support
Using index info to reconstruct a base tree...
A	drivers/gpu/nova-core/mm/tlb.rs
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): drivers/gpu/nova-core/mm/tlb.rs deleted in HEAD and modified in gpu: nova-core: mm: Add TLB flush support. Version gpu: nova-core: mm: Add TLB flush support of drivers/gpu/nova-core/mm/tlb.rs left in tree.
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0007 gpu: nova-core: mm: Add TLB flush support
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


