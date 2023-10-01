Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17570E748F0
	for <intel-gfx@archiver.kernel.org>; Sun,  1 Oct 2023 01:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51C610E1A3;
	Sun,  1 Oct 2023 01:51:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E71F610E1A3;
 Sun,  1 Oct 2023 01:51:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C592AAADF3;
 Sun,  1 Oct 2023 01:51:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Sun, 01 Oct 2023 01:51:44 -0000
Message-ID: <169612510478.10311.7864291101753372797@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926083742.14740-1-nirmoy.das@intel.com>
In-Reply-To: <20230926083742.14740-1-nirmoy.das@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBV?=
 =?utf-8?q?pdate_GGTT_with_MI=5FUPDATE=5FGTT_on_MTL_=28rev12=29?=
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Update GGTT with MI_UPDATE_GTT on MTL (rev12)
URL   : https://patchwork.freedesktop.org/series/123329/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/123329/revisions/12/mbox/ not applied
Applying: drm/i915: Lift runtime-pm acquire callbacks out of intel_wakeref.mutex
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/intel_wakeref.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: drm/i915: Create a kernel context for GGTT updates
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_engine.h
M	drivers/gpu/drm/i915/gt/intel_engine_cs.c
M	drivers/gpu/drm/i915/gt/intel_engine_types.h
M	drivers/gpu/drm/i915/gt/intel_gt.c
M	drivers/gpu/drm/i915/gt/intel_gt.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/gt/intel_gt.c
Auto-merging drivers/gpu/drm/i915/gt/intel_engine_cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_engine_cs.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0002 drm/i915: Create a kernel context for GGTT updates
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


