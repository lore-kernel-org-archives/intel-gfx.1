Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E673FD88D5
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Mar 2026 00:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9B10E7B7;
	Wed, 11 Mar 2026 00:58:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72010E7B0;
 Wed, 11 Mar 2026 00:58:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_gpu=3A_nova-core=3A_Add_m?=
 =?utf-8?q?emory_management_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 11 Mar 2026 00:58:41 -0000
Message-ID: <177319072187.341754.7736958379840095893@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311004008.2208806-1-joelagnelf@nvidia.com>
In-Reply-To: <20260311004008.2208806-1-joelagnelf@nvidia.com>
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

Series: gpu: nova-core: Add memory management support (rev2)
URL   : https://patchwork.freedesktop.org/series/162102/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/162102/revisions/2/mbox/ not applied
Applying: gpu: nova-core: Select GPU_BUDDY for VRAM allocation
Using index info to reconstruct a base tree...
M	drivers/gpu/nova-core/Kconfig
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/nova-core/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/Kconfig
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 gpu: nova-core: Select GPU_BUDDY for VRAM allocation
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


