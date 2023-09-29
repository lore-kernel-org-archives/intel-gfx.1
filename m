Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6EE71D58
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Sep 2023 21:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DBC10E13D;
	Fri, 29 Sep 2023 21:32:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE76A10E144;
 Fri, 29 Sep 2023 21:32:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C6F3CAADF3;
 Fri, 29 Sep 2023 21:32:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Fri, 29 Sep 2023 21:32:22 -0000
Message-ID: <169602314278.19496.6638317000573347261@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929201837.849299-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230929201837.849299-1-jonathan.cavitt@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/4=5D_drm/i915=3A_Define_and_?=
 =?utf-8?q?use_GuC_and_CTB_TLB_invalidation_routines?=
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

Series: series starting with [v2,1/4] drm/i915: Define and use GuC and CTB TLB invalidation routines
URL   : https://patchwork.freedesktop.org/series/124472/
State : warning

== Summary ==

Error: dim checkpatch failed
11e3929526f1 drm/i915: Define and use GuC and CTB TLB invalidation routines
-:246: WARNING:LINE_SPACING: Missing a blank line after declarations
#246: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:1196:
+		int ret = intel_guc_tlb_invalidation_done(ct_to_guc(ct), hxg, request->size);
+		ct_free_msg(request);

-:336: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#336: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1995:
+		GEM_BUG_ON(wait->status);

-:465: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#465: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4762:
+			REG_FIELD_PREP(INTEL_GUC_TLB_INVAL_MODE_MASK, INTEL_GUC_TLB_INVAL_MODE_HEAVY) |

-:501: WARNING:BRACES: braces {} are not necessary for single statement blocks
#501: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4798:
+	if (err) {
+		goto out;
+	}

-:537: CHECK:LINE_SPACING: Please don't use multiple blank lines
#537: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4834:
+
+

total: 0 errors, 4 warnings, 1 checks, 460 lines checked
2af442b6cac6 drm/i915: No TLB invalidation on wedged or suspended GT
9f3951ca96dc drm/i915: add one header file for GT
152c85bedcbb drm/i915: Invalidate the TLBs on each GT


