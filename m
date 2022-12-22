Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0ACC4332F
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Dec 2022 22:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194110E59B;
	Thu, 22 Dec 2022 22:41:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3F1010E59B;
 Thu, 22 Dec 2022 22:41:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB68AAA01E;
 Thu, 22 Dec 2022 22:41:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 22 Dec 2022 22:41:43 -0000
Message-ID: <167174890386.14837.11079143344154760521@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221222222127.34560-1-matthew.brost@intel.com>
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJ?=
 =?utf-8?q?nitial_Xe_driver_submission?=
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

Series: Initial Xe driver submission
URL   : https://patchwork.freedesktop.org/series/112189/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/112189/revisions/1/mbox/ not applied
Applying: drm/suballoc: Introduce a generic suballocation manager
Applying: drm/amd: Convert amdgpu to use suballocation helper.
Applying: drm/radeon: Use the drm suballocation manager implementation.
Applying: drm/sched: Convert drm scheduler to use a work queue rather than kthread
Applying: drm/sched: Add generic scheduler message interface
Applying: drm/sched: Start run wq before TDR in drm_sched_start
Applying: drm/sched: Submit job before starting TDR
Applying: drm/sched: Add helper to set TDR timeout
Applying: drm: Add a gpu page-table walker helper
Applying: drm/ttm: Don't print error message if eviction was interrupted
Applying: drm/i915: Remove gem and overlay frontbuffer tracking
Applying: drm/i915/display: Neuter frontbuffer tracking harder
Applying: drm/i915/display: Add more macros to remove all direct calls to uncore
Applying: drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
Applying: drm/i915: Rename find_section to find_bdb_section
Applying: drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
Applying: drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails
Applying: drm/i915/display: Remaining changes to make xe compile
Applying: sound/hda: Allow XE as i915 replacement for sound
Using index info to reconstruct a base tree...
M	sound/hda/hdac_i915.c
M	sound/pci/hda/hda_intel.c
Falling back to patching base and 3-way merge...
Auto-merging sound/pci/hda/hda_intel.c
CONFLICT (content): Merge conflict in sound/pci/hda/hda_intel.c
Auto-merging sound/hda/hdac_i915.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0019 sound/hda: Allow XE as i915 replacement for sound
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


