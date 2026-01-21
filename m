Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87875C44506
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jan 2026 21:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C2D10E062;
	Wed, 21 Jan 2026 21:29:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9028510E062;
 Wed, 21 Jan 2026 21:29:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Enable_seamless_boot_=28f?=
 =?utf-8?q?astboot=29_for_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juasheem Sultan" <jdsultan@google.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jan 2026 21:29:30 -0000
Message-ID: <176903097058.180247.4170916663608866934@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121204705.432290-1-jdsultan@google.com>
In-Reply-To: <20260121204705.432290-1-jdsultan@google.com>
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

Series: Enable seamless boot (fastboot) for PTL
URL   : https://patchwork.freedesktop.org/series/160446/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/160446/revisions/1/mbox/ not applied
Applying: drm/xe/display: Fix reading the framebuffer from stolen memory
Using index info to reconstruct a base tree...
A	drivers/gpu/drm/xe/display/xe_plane_initial.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): drivers/gpu/drm/xe/display/xe_plane_initial.c deleted in HEAD and modified in drm/xe/display: Fix reading the framebuffer from stolen memory. Version drm/xe/display: Fix reading the framebuffer from stolen memory of drivers/gpu/drm/xe/display/xe_plane_initial.c left in tree.
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/xe/display: Fix reading the framebuffer from stolen memory
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


