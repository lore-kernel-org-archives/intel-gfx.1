Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA21C88E73
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2026 19:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC89610F0DF;
	Mon, 14 Sep 2026 19:52:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF18C10E225;
 Mon, 14 Sep 2026 19:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_pm=5Fpme_support_on_displ?=
 =?utf-8?q?ay_hotplug_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Sep 2026 19:52:08 -0000
Message-ID: <178941552890.159192.8797015747016291206@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
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

Series: pm_pme support on display hotplug (rev6)
URL   : https://patchwork.freedesktop.org/series/172306/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/172306/revisions/6/mbox/ not applied
Applying: drm/xe/pm: initialize the device's system wakeup capabilities
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/xe/xe_pci.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/xe/pm: initialize the device's system wakeup capabilities
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


