Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952B3CD98C7
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Oct 2023 04:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E459B10E433;
	Wed, 11 Oct 2023 04:17:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63A0E10E433;
 Wed, 11 Oct 2023 04:17:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5DB70AA916;
 Wed, 11 Oct 2023 04:17:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Wed, 11 Oct 2023 04:17:01 -0000
Message-ID: <169699782137.26513.12018561784610220120@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011000248.2181018-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231011000248.2181018-1-jonathan.cavitt@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Define_and_use_GuC_and_CTB_TLB_invalidation_rou?=
 =?utf-8?q?tines?=
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

Series: drm/i915: Define and use GuC and CTB TLB invalidation routines
URL   : https://patchwork.freedesktop.org/series/124932/
State : warning

== Summary ==

Error: dim checkpatch failed
3f043e9037de drm/i915: Add GuC TLB Invalidation device info flags
dcdab6a3e4e0 drm/i915/guc: Add CT size delay helper
1248f130a3fd drm/i915: Define and use GuC and CTB TLB invalidation routines
-:429: WARNING:MEMORY_BARRIER: memory barrier without comment
#429: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4729:
+	smp_store_mb(wq_entry->flags, wq_entry->flags & ~WQ_FLAG_WOKEN);

total: 0 errors, 1 warnings, 0 checks, 426 lines checked
6e7fd44a6545 drm/i915: No TLB invalidation on suspended GT
b8fe58e9fa02 drm/i915: No TLB invalidation on wedged GT
d7d906e001d1 drm/i915/gt: Increase sleep in gt_tlb selftest sanitycheck
-:30: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#30: FILE: drivers/gpu/drm/i915/gt/selftest_tlb.c:146:
+		msleep(10);

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
5b7f6c362b58 drm/i915: Enable GuC TLB invalidations for MTL


