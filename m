Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA4D72379
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jan 2026 11:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE2410EAC8;
	Fri, 23 Jan 2026 11:44:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CB210EAD3;
 Fri, 23 Jan 2026 11:44:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_rename_GEN6=5FPCODE=5FDAT?=
 =?utf-8?q?A_to_match_spec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Jan 2026 11:44:30 -0000
Message-ID: <176916867007.186800.6373706043808224645@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123105525.572035-1-michal.grzelak@intel.com>
In-Reply-To: <20260123105525.572035-1-michal.grzelak@intel.com>
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

Series: rename GEN6_PCODE_DATA to match spec
URL   : https://patchwork.freedesktop.org/series/160550/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/160550/revisions/1/mbox/ not applied
Applying: drm/{i915, xe}/pcode: rename GEN6_PCODE_DATA to match spec
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_parent.c
M	drivers/gpu/drm/i915/display/intel_parent.h
M	drivers/gpu/drm/i915/intel_pcode.c
M	drivers/gpu/drm/i915/intel_pcode.h
A	drivers/gpu/drm/xe/display/xe_display_pcode.c
M	drivers/gpu/drm/xe/xe_pcode.c
M	drivers/gpu/drm/xe/xe_pcode.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/xe/xe_pcode.h
Auto-merging drivers/gpu/drm/xe/xe_pcode.c
CONFLICT (modify/delete): drivers/gpu/drm/xe/display/xe_display_pcode.c deleted in HEAD and modified in drm/{i915, xe}/pcode: rename GEN6_PCODE_DATA to match spec. Version drm/{i915, xe}/pcode: rename GEN6_PCODE_DATA to match spec of drivers/gpu/drm/xe/display/xe_display_pcode.c left in tree.
Auto-merging drivers/gpu/drm/i915/intel_pcode.h
Auto-merging drivers/gpu/drm/i915/intel_pcode.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pcode.c
Auto-merging drivers/gpu/drm/i915/display/intel_parent.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_parent.h
Auto-merging drivers/gpu/drm/i915/display/intel_parent.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_parent.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/{i915, xe}/pcode: rename GEN6_PCODE_DATA to match spec
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


