Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634C8C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 14:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DB9861AA8
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DB9861AA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF846E3EE;
	Tue, 27 Jul 2021 14:09:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F28D6E3EE;
 Tue, 27 Jul 2021 14:09:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 88FCAAA3D8;
 Tue, 27 Jul 2021 14:09:51 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Vetter" <daniel.vetter@ffwll.ch>
Date: Tue, 27 Jul 2021 14:09:51 -0000
Message-ID: <162739499155.18664.9488625155946702171@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C01/11=5D_drm/i915=3A_Check_for?=
 =?utf-8?q?_nomodeset_in_i915=5Finit=28=29_first?=
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

Series: series starting with [v2,01/11] drm/i915: Check for nomodeset in i915_init() first
URL   : https://patchwork.freedesktop.org/series/93066/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
526b1246de6a drm/i915: Check for nomodeset in i915_init() first
-:32: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
2f47345a0149 drm/i915: move i915_active slab to direct module init/exit
-:177: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 126 lines checked
d56d75be6b62 drm/i915: move i915_buddy slab to direct module init/exit
-:135: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 92 lines checked
68a6ff81e0d6 drm/i915: move intel_context slab to direct module init/exit
-:150: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 102 lines checked
591b60d8aad3 drm/i915: move gem_context slab to direct module init/exit
-:84: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 0)
#84: FILE: drivers/gpu/drm/i915/gem/i915_gem_context.h:224:
 	for (i915_gem_engines_iter_init(&(it), (engines)); \
[...]
+void i915_gem_context_module_exit(void);

-:144: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 2 warnings, 0 checks, 98 lines checked
d8736bba255c drm/i915: move gem_objects slab to direct module init/exit
-:135: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 89 lines checked
9547d213ca53 drm/i915: move request slabs to direct module init/exit
-:192: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#192: FILE: drivers/gpu/drm/i915/i915_request.c:2103:
+	slab_execute_cbs = KMEM_CACHE(execute_cb,
 					     SLAB_HWCACHE_ALIGN |

-:218: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 1 checks, 167 lines checked
1eefc0331fde drm/i915: move scheduler slabs to direct module init/exit
-:10: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#10: 
noise with removing the static global.slab_dependencies|priorities to just a

-:150: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#150: FILE: drivers/gpu/drm/i915/i915_scheduler.c:483:
+	slab_dependencies = KMEM_CACHE(i915_dependency,
 					      SLAB_HWCACHE_ALIGN |

-:181: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 2 warnings, 1 checks, 132 lines checked
2567a687274b drm/i915: move vma slab to direct module init/exit
-:145: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 96 lines checked
0d4a676a47a4 drm/i915: Remove i915_globals
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
deleted file mode 100644

-:144: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 2 warnings, 0 checks, 28 lines checked
e3aa4c53ca1e drm/i915: Extract i915_module.c
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:39: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#39: FILE: drivers/gpu/drm/i915/i915_module.c:1:
+/*

-:40: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#40: FILE: drivers/gpu/drm/i915/i915_module.c:2:
+ * SPDX-License-Identifier: MIT

-:64: WARNING:TYPO_SPELLING: 'overriden' may be misspelled - perhaps 'overridden'?
#64: FILE: drivers/gpu/drm/i915/i915_module.c:26:
+	 * Enable KMS by default, unless explicitly overriden by
 	                                            ^^^^^^^^^

-:85: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#85: FILE: drivers/gpu/drm/i915/i915_module.c:47:
+   int (*init)(void);$

-:86: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#86: FILE: drivers/gpu/drm/i915/i915_module.c:48:
+   void (*exit)(void);$

-:102: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#102: FILE: drivers/gpu/drm/i915/i915_module.c:64:
+};
+static int init_progress;

-:310: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#310: FILE: drivers/gpu/drm/i915/i915_pci.h:1:
+/*

-:311: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#311: FILE: drivers/gpu/drm/i915/i915_pci.h:2:
+ * SPDX-License-Identifier: MIT

-:317: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 9 warnings, 1 checks, 198 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
