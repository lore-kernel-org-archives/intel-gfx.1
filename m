Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E7EC9830D
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 00:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC0410F25E;
	Thu, 24 Sep 2026 00:56:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048B10F25E;
 Thu, 24 Sep 2026 00:56:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/fbc=3A_Dirty_rec?=
 =?utf-8?q?tangle_bounds_enforcement_and_CFB_nuke_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Austin Hu" <austin.hu@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2026 00:56:19 -0000
Message-ID: <179021137971.200817.9978508961536555294@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812215350.3753102-1-austin.hu@intel.com>
In-Reply-To: <20260812215350.3753102-1-austin.hu@intel.com>
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

Series: drm/i915/fbc: Dirty rectangle bounds enforcement and CFB nuke handling
URL   : https://patchwork.freedesktop.org/series/172104/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/172104/revisions/1/mbox/ not applied
Applying: drm/i915/fbc: fbc_dirty_rect restrictions and logging
Applying: drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
Applying: drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/display/intel_fbc.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0003 drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


