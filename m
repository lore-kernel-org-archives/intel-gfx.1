Return-Path: <SRS0=kkqM=KG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD0FC433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 16:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086A3613B6
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 16:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086A3613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621F36EA7B;
	Tue, 11 May 2021 16:21:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 421AF6EA77;
 Tue, 11 May 2021 16:21:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3B456A47DB;
 Tue, 11 May 2021 16:21:47 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 11 May 2021 16:21:47 -0000
Message-ID: <162075010724.32035.9273067904020726845@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Move_LMEM_=28VRAM=29_management_over_to_TTM?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Move LMEM (VRAM) management over to TTM
URL   : https://patchwork.freedesktop.org/series/90022/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7c8e78644333 drm/i915: Untangle the vma pages_mutex
e148e51b2187 drm/i915: Don't free shared locks while shared
08fe6c5181ab drm/i915/ttm, drm/ttm: Initialize the ttm device and memory managers.
-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/gpu/drm/i915/gem/i915_gem_lmem.c:13:
+static void lmem_put_pages(struct drm_i915_gem_object *obj,
+				  struct sg_table *pages)

-:484: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#484: 
deleted file mode 100644

-:1818: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1818: FILE: drivers/gpu/drm/i915/intel_region_ttm.c:145:
+
+

total: 0 errors, 1 warnings, 2 checks, 1636 lines checked
7dc5b6bf9897 drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
1cd13783b35c drm/i915/ttm, drm/ttm: Add a generic TTM memcpy move for page-based iomem
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

-:157: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ttm"
#157: FILE: drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c:110:
+	    (ttm == NULL || !ttm_tt_is_populated(ttm))) {

total: 0 errors, 1 warnings, 1 checks, 307 lines checked
1bdd626f1990 drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem object backend
-:266: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#266: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.c:261:
 
+}

-:417: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#417: 
new file mode 100644

-:672: CHECK:SPACING: No space is necessary after a cast
#672: FILE: drivers/gpu/drm/i915/gem/i915_gem_ttm.c:251:
+		 (unsigned long) ttm->num_pages << PAGE_SHIFT,

total: 0 errors, 1 warnings, 2 checks, 1016 lines checked
bd0a5cd14b4e drm/i915/lmem: Verify checks for lmem residency


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
