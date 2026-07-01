Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED5CC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 23:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073110F105;
	Wed,  1 Jul 2026 23:30:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550A10E3F4;
 Wed,  1 Jul 2026 23:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_convert_more_vm=5Fflags?=
 =?utf-8?q?=5Ft_users_to_vma=5Fflags=5Ft?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 23:30:44 -0000
Message-ID: <178294864427.140838.2153415744306457038@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1782760670.git.ljs@kernel.org>
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
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

Series: convert more vm_flags_t users to vma_flags_t
URL   : https://patchwork.freedesktop.org/series/169610/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/169610/revisions/1/mbox/ not applied
Applying: mm: introduce vma_flags_can_grow() and vma_can_grow()
Applying: mm/vma: update do_mmap() to use vma_flags_t
Applying: mm: convert __get_unmapped_area() to use vma_flags_t
Applying: mm: update generic_get_unmapped_area[_topdown]() to use vma_flags_t
Applying: mm: prefer mm->def_vma_flags in mm logic
error: sha1 information is lacking or useless (mm/debug.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0005 mm: prefer mm->def_vma_flags in mm logic
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


