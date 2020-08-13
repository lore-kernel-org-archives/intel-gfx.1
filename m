Return-Path: <SRS0=YOLQ=BX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF85C433E1
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2020 09:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5446920781
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2020 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5446920781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076896E98D;
	Thu, 13 Aug 2020 09:30:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 912306E989;
 Thu, 13 Aug 2020 09:30:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81289A47E8;
 Thu, 13 Aug 2020 09:30:18 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Date: Thu, 13 Aug 2020 09:30:18 -0000
Message-ID: <159731101852.14258.15665527315044539446@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200813083644.31711-1-tzimmermann@suse.de>
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Convert_all_remaining_drivers_to_GEM_object_functions?=
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

Series: Convert all remaining drivers to GEM object functions
URL   : https://patchwork.freedesktop.org/series/80593/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3432354b0aba drm/amdgpu: Introduce GEM object functions
a6636204e871 drm/armada: Introduce GEM object functions
419237bb45ec drm/etnaviv: Introduce GEM object functions
5ac6227c35a6 drm/exynos: Introduce GEM object functions
bece754b7d5e drm/gma500: Introduce GEM object functions
975a7cc97edf drm/i915: Introduce GEM object functions
8f9c261ff43a drm/mediatek: Introduce GEM object functions
8901932a7d0b drm/msm: Introduce GEM object funcs
8e0a96b9b934 drm/nouveau: Introduce GEM object functions
6db00555b27f drm/omapdrm: Introduce GEM object functions
9f951cff95de drm/pl111: Introduce GEM object functions
d35bbda1b7a0 drm/radeon: Introduce GEM object functions
-:85: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#85: FILE: drivers/gpu/drm/radeon/radeon_object.c:48:
+void radeon_gem_object_free(struct drm_gem_object *obj);

-:86: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#86: FILE: drivers/gpu/drm/radeon/radeon_object.c:49:
+int radeon_gem_object_open(struct drm_gem_object *obj,

-:87: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#87: FILE: drivers/gpu/drm/radeon/radeon_object.c:50:
+int radeon_gem_object_open(struct drm_gem_object *obj,
+				struct drm_file *file_priv);

-:88: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#88: FILE: drivers/gpu/drm/radeon/radeon_object.c:51:
+void radeon_gem_object_close(struct drm_gem_object *obj,

-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/radeon/radeon_object.c:52:
+void radeon_gem_object_close(struct drm_gem_object *obj,
+				struct drm_file *file_priv);

-:93: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#93: FILE: drivers/gpu/drm/radeon/radeon_object.c:56:
+int radeon_gem_prime_pin(struct drm_gem_object *obj);

-:94: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#94: FILE: drivers/gpu/drm/radeon/radeon_object.c:57:
+void radeon_gem_prime_unpin(struct drm_gem_object *obj);

-:96: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#96: FILE: drivers/gpu/drm/radeon/radeon_object.c:59:
+void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);

total: 0 errors, 6 warnings, 2 checks, 101 lines checked
67f82bee99a9 drm/rockchip: Convert to drm_gem_object_funcs
dabc081c2725 drm/tegra: Introduce GEM object functions
082439f00666 drm/vc4: Introduce GEM object functions
fff50ea99db8 drm/vgem: Introduce GEM object functions
700a27560ff8 drm/vkms: Introduce GEM object functions
e7063ad8ca7d drm/xen: Introduce GEM object functions
57a3d52d4eaf drm/xlnx: Initialize DRM driver instance with CMA helper macro
f887ba13ff85 drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
