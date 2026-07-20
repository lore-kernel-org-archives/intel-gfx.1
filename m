Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA6CC44520
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Jul 2026 19:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AF010E14B;
	Mon, 20 Jul 2026 19:21:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DA310E133;
 Mon, 20 Jul 2026 19:21:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_deco?=
 =?utf-8?q?upled_dirty_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 20 Jul 2026 19:21:11 -0000
Message-ID: <178457527155.208864.16835819916303366663@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720121041.339981-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260720121041.339981-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v6,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled dirty tracker
URL   : https://patchwork.freedesktop.org/series/170744/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/170744/revisions/1/mbox/ not applied
Applying: gpu/buddy: replace dual-tree/force_merge with decoupled dirty tracker
Using index info to reconstruct a base tree...
M	drivers/gpu/buddy.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/buddy.c
CONFLICT (content): Merge conflict in drivers/gpu/buddy.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 gpu/buddy: replace dual-tree/force_merge with decoupled dirty tracker
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


