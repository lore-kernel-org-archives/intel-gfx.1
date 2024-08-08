Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECEFC3DA4A
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Aug 2024 07:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282010E05E;
	Thu,  8 Aug 2024 07:28:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7EA10E04C;
 Thu,  8 Aug 2024 07:28:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/xe/display=3A_Change_?=
 =?utf-8?q?HPD_to_polling_on_runtime_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 08 Aug 2024 07:28:14 -0000
Message-ID: <172310209497.549129.14945356451807004467@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808070037.3187006-1-arun.r.murthy@intel.com>
In-Reply-To: <20240808070037.3187006-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: Change HPD to polling on runtime suspend
URL   : https://patchwork.freedesktop.org/series/137026/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/137026/revisions/1/mbox/ not applied
Applying: drm/xe/display: Change HPD to polling on runtime suspend
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/xe/display/xe_display.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/xe/display/xe_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/xe/display: Change HPD to polling on runtime suspend
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


