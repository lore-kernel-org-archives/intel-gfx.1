Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F73D3EE67
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jan 2026 14:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1E310E9C2;
	Thu, 22 Jan 2026 14:19:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CEA10E9C0;
 Thu, 22 Jan 2026 14:19:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/buddy=3A_Improve_offset-aligned_allocation_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Jan 2026 14:19:18 -0000
Message-ID: <176909155860.184013.13630394615265389207@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122141805.6678-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260122141805.6678-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [1/2] drm/buddy: Improve offset-aligned allocation handling
URL   : https://patchwork.freedesktop.org/series/160501/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/160501/revisions/1/mbox/ not applied
Applying: drm/buddy: Improve offset-aligned allocation handling
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/drm_buddy.c
M	include/drm/drm_buddy.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm/drm_buddy.h
Auto-merging drivers/gpu/drm/drm_buddy.c
Applying: drm/buddy: Add KUnit test for offset-aligned allocations
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/tests/drm_buddy_test.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/tests/drm_buddy_test.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tests/drm_buddy_test.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0002 drm/buddy: Add KUnit test for offset-aligned allocations
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


