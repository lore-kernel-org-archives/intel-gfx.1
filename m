Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25975E77184
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Dec 2024 16:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FCA10E0DB;
	Thu, 19 Dec 2024 16:47:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135710E0DB;
 Thu, 19 Dec 2024 16:47:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Remove_get=5Ftask=5Fcomm?=
 =?utf-8?q?=28=29_and_print_task_comm_directly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yafang Shao" <laoar.shao@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 19 Dec 2024 16:47:22 -0000
Message-ID: <173462684278.467596.8438441364775991856@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219023452.69907-1-laoar.shao@gmail.com>
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
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

Series: Remove get_task_comm() and print task comm directly
URL   : https://patchwork.freedesktop.org/series/142837/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/142837/revisions/1/mbox/ not applied
Applying: kernel: Remove get_task_comm() and print task comm directly
Applying: arch: Remove get_task_comm() and print task comm directly
Applying: net: Remove get_task_comm() and print task comm directly
Applying: security: Remove get_task_comm() and print task comm directly
Applying: drivers: Remove get_task_comm() and print task comm directly
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_display_driver.c
M	drivers/gpu/drm/nouveau/nouveau_drm.c
M	drivers/tty/tty_io.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/tty/tty_io.c
Auto-merging drivers/gpu/drm/nouveau/nouveau_drm.c
Auto-merging drivers/gpu/drm/i915/display/intel_display_driver.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_display_driver.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0005 drivers: Remove get_task_comm() and print task comm directly
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


