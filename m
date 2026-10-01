Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FA8CA5FCE
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 22:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969BA10E010;
	Thu,  1 Oct 2026 22:37:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4E10E010;
 Thu,  1 Oct 2026 22:37:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/mst=3A_Fix_sporadic_second_display_not_detected_after_w?=
 =?utf-8?q?arm_boot/G3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "FNU VISHWANATHA" <fnu.vishwanatha@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 01 Oct 2026 22:37:40 -0000
Message-ID: <179089426095.231058.2398233082017038105@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001215705.3891147-1-fnu.vishwanatha@intel.com>
In-Reply-To: <20261001215705.3891147-1-fnu.vishwanatha@intel.com>
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

Series: series starting with [1/2] drm/mst: Fix sporadic second display not detected after warm boot/G3
URL   : https://patchwork.freedesktop.org/series/175383/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/175383/revisions/1/mbox/ not applied
Applying: drm/mst: Fix sporadic second display not detected after warm boot/G3
error: patch failed: drivers/gpu/drm/display/drm_dp_mst_topology.c:2377
error: drivers/gpu/drm/display/drm_dp_mst_topology.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/display/drm_dp_mst_topology.c
Patch failed at 0001 drm/mst: Fix sporadic second display not detected after warm boot/G3
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


