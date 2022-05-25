Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD2C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 25 May 2022 19:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC25810E28D;
	Wed, 25 May 2022 19:25:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEDE310E260;
 Wed, 25 May 2022 19:25:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C3835AADD4;
 Wed, 25 May 2022 19:25:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 25 May 2022 19:25:15 -0000
Message-ID: <165350671577.16573.15983015167456641368@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220525184337.491763-1-matthew.auld@intel.com>
In-Reply-To: <20220525184337.491763-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_small_BAR_uapi_bits?=
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

Series: small BAR uapi bits
URL   : https://patchwork.freedesktop.org/series/104369/
State : warning

== Summary ==

Error: dim checkpatch failed
66b32284c514 drm/doc: add rfc section for small BAR uapi
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:44: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#44: FILE: Documentation/gpu/rfc/i915_small_bar.h:1:
+/**

-:239: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#239: FILE: Documentation/gpu/rfc/i915_small_bar.rst:1:
+==========================

total: 0 errors, 3 warnings, 0 checks, 243 lines checked
d0b07a894a2d drm/i915/uapi: add probed_cpu_visible_size
8032649ad9b4 drm/i915/uapi: expose the avail tracking
-:64: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#64: FILE: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:378:
+void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
+			     u64 *avail, u64 *visible_avail)

total: 0 errors, 0 warnings, 1 checks, 123 lines checked
f35be1eecfeb drm/i915: remove intel_memory_region avail
067a5be47ce8 drm/i915/uapi: apply ALLOC_GPU_ONLY by default
d8b5695bf10d drm/i915/uapi: add NEEDS_CPU_ACCESS hint
-:11: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#11: 
(i.e I915_MEMORY_CLASS_SYSTEM) must be given as a potential placement for the

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
5db83995a280 drm/i915/error: skip non-mappable pages
11b92ed0b0fb drm/i915/uapi: disable capturing objects on recoverable contexts
405a2d9301e6 drm/i915: turn on small BAR support
6a930607cce6 HAX: force small BAR on dg2


