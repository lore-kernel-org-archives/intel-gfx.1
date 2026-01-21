Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE6D262B7
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jan 2026 03:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21C610E68F;
	Wed, 21 Jan 2026 03:05:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1010E68F;
 Wed, 21 Jan 2026 03:05:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/display=3A_Disab?=
 =?utf-8?q?le_DMG_Clock_Gating_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jan 2026 03:05:09 -0000
Message-ID: <176896470942.174471.12196805480449660694@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120050033.635681-1-suraj.kandpal@intel.com>
In-Reply-To: <20260120050033.635681-1-suraj.kandpal@intel.com>
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

Series: drm/i915/display: Disable DMG Clock Gating (rev2)
URL   : https://patchwork.freedesktop.org/series/160330/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/160330/revisions/2/mbox/ not applied
Applying: drm/i915/display: Disable DMG Clock Gating
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/display: Disable DMG Clock Gating
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


