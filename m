Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18193CA5FDD
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 19:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A021710E6A1;
	Fri,  2 Oct 2026 19:55:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7789210E693;
 Fri,  2 Oct 2026 19:55:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_support_for_a_DRM_bac?=
 =?utf-8?q?klight_capability_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 02 Oct 2026 19:55:00 -0000
Message-ID: <179097090048.234617.2614692112893630395@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261002190030.211356-1-mario.limonciello@amd.com>
In-Reply-To: <20261002190030.211356-1-mario.limonciello@amd.com>
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

Series: Add support for a DRM backlight capability (rev4)
URL   : https://patchwork.freedesktop.org/series/169109/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/169109/revisions/4/mbox/ not applied
Applying: drm: add connector LUMINANCE property
Applying: drm/amd/display: Pass up errors reading actual brightness
Applying: drm/amd: add luminance property support
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
M	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
M	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
Applying: drm/amdgpu: Check bios_scratch_reg_offset in backlight level helper
Applying: drm/amd/display: update KUnit luminance fixtures
Applying: drm/i915/display: add luminance property support
Applying: drm: add panel and bridge connector luminance forwarding
Using index info to reconstruct a base tree...
A	drivers/gpu/drm/bridge/panel.c
M	drivers/gpu/drm/display/drm_bridge_connector.c
M	drivers/gpu/drm/drm_panel.c
M	include/drm/drm_bridge.h
M	include/drm/drm_panel.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm/drm_panel.h
Auto-merging include/drm/drm_bridge.h
CONFLICT (content): Merge conflict in include/drm/drm_bridge.h
Auto-merging drivers/gpu/drm/drm_panel.c
Auto-merging drivers/gpu/drm/display/drm_bridge_connector.c
CONFLICT (modify/delete): drivers/gpu/drm/bridge/panel.c deleted in HEAD and modified in drm: add panel and bridge connector luminance forwarding. Version drm: add panel and bridge connector luminance forwarding of drivers/gpu/drm/bridge/panel.c left in tree.
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0007 drm: add panel and bridge connector luminance forwarding
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


