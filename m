Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88DFC77B72
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Apr 2023 19:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3D010E0BF;
	Mon, 17 Apr 2023 19:54:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94F0110E0BF;
 Mon, 17 Apr 2023 19:54:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8CF32AADE0;
 Mon, 17 Apr 2023 19:54:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Mon, 17 Apr 2023 19:54:42 -0000
Message-ID: <168176128253.24900.766852468915693763@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_fdinfo_alternative_memory_stats_proposal?=
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

Series: fdinfo alternative memory stats proposal
URL   : https://patchwork.freedesktop.org/series/116581/
State : warning

== Summary ==

Error: dim checkpatch failed
92bb2d834df8 drm: Add common fdinfo helper
1e36b9258ec6 drm/i915: Use the fdinfo helper
368bec1f61d6 drm: Add fdinfo memory stats
-:59: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#59: FILE: drivers/gpu/drm/drm_file.c:878:
+	const char *units[] = {"", " KiB", " MiB"};

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
31ff5fcacf6d drm: Add simple fdinfo memory helpers
-:40: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#40: FILE: drivers/gpu/drm/drm_file.c:896:
+	static char *region[] = {

-:80: CHECK:LINE_SPACING: Please don't use multiple blank lines
#80: FILE: include/drm/drm_file.h:391:
+
+

total: 0 errors, 1 warnings, 1 checks, 63 lines checked
6db9de4ab15b drm/msm: Add basic memory stats
dd1f311a52b7 drm/i915: Implement fdinfo memory stats printing
-:69: ERROR:CODE_INDENT: code indent should use tabs where possible
#69: FILE: drivers/gpu/drm/i915/i915_drm_client.c:138:
+        struct intel_memory_region *mr;$

-:69: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#69: FILE: drivers/gpu/drm/i915/i915_drm_client.c:138:
+        struct intel_memory_region *mr;$

-:71: ERROR:CODE_INDENT: code indent should use tabs where possible
#71: FILE: drivers/gpu/drm/i915/i915_drm_client.c:140:
+        enum intel_region_id id;$

-:71: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#71: FILE: drivers/gpu/drm/i915/i915_drm_client.c:140:
+        enum intel_region_id id;$

-:102: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#102: FILE: drivers/gpu/drm/i915/i915_drm_client.c:171:
+	else if (i915_gem_object_is_shrinkable(obj) &&
+		obj->mm.madv == I915_MADV_DONTNEED)

total: 2 errors, 2 warnings, 1 checks, 152 lines checked


