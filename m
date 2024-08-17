Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D075C531DC
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Aug 2024 22:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0910E08B;
	Sat, 17 Aug 2024 22:35:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0210E08B;
 Sat, 17 Aug 2024 22:35:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_CCS_static_load_bala?=
 =?utf-8?q?nce_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 17 Aug 2024 22:35:14 -0000
Message-ID: <172393411467.676255.5158888327996784708@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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

Series: CCS static load balance (rev2)
URL   : https://patchwork.freedesktop.org/series/136381/
State : warning

== Summary ==

Error: dim checkpatch failed
84e876cb3a32 drm/i915/gt: Move the CCS mode variable to a global position
-:113: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#113: FILE: drivers/gpu/drm/i915/gt/intel_gt_types.h:226:
+		struct mutex mutex;

total: 0 errors, 0 warnings, 1 checks, 95 lines checked
3b0bf8998852 drm/i915/gt: Allow the creation of multi-mode CCS masks
0076ce951e97 drm/i915/gt: Refactor uabi engine class/instance list creation
-:54: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#54: FILE: drivers/gpu/drm/i915/gt/intel_engine_user.c:233:
+		GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));

-:70: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#70: FILE: drivers/gpu/drm/i915/gt/intel_engine_user.c:247:
+		GEM_BUG_ON(uabi_class >=

total: 0 errors, 2 warnings, 0 checks, 56 lines checked
96ff57617c4a drm/i915/gt: Manage CCS engine creation within UABI exposure
4743af1f0f34 drm/i915/gt: Remove cslices mask value from the CCS structure
12d784cbbf89 drm/i915/gt: Expose the number of total CCS slices
09c8acafca2a drm/i915/gt: Store engine-related sysfs kobjects
e2ea1fbf7f3b drm/i915/gt: Store active CCS mask
9d3afeca2efa drm/i915/gt: Isolate single sysfs engine file creation
-:100: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#100: FILE: drivers/gpu/drm/i915/gt/sysfs_engines.c:539:
+	gt_err(engine->gt, "Failed to add sysfs engine '%s'\n",
+		engine->name);

total: 0 errors, 0 warnings, 1 checks, 115 lines checked
54a64c3795dd drm/i915/gt: Implement creation and removal routines for CCS engines
be957e86b979 drm/i915/gt: Allow the user to change the CCS mode through sysfs
-:71: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around '!val'
#71: FILE: drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:239:
+	if ((!val) || (val > num_cslices) || (num_cslices % val))

-:71: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'val > num_cslices'
#71: FILE: drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:239:
+	if ((!val) || (val > num_cslices) || (num_cslices % val))

total: 0 errors, 0 warnings, 2 checks, 90 lines checked


