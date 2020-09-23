Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07813C2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 10:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B869620C56
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 10:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B869620C56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5376B6E92D;
	Wed, 23 Sep 2020 10:34:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52D4B6E915;
 Wed, 23 Sep 2020 10:34:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43165A41FB;
 Wed, 23 Sep 2020 10:34:46 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Date: Wed, 23 Sep 2020 10:34:46 -0000
Message-ID: <160085728625.4496.5548781687290064940@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200923102159.24084-1-tzimmermann@suse.de>
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Convert_all_remaining_drivers_to_GEM_object_functions_=28re?=
 =?utf-8?b?djMp?=
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

Series: Convert all remaining drivers to GEM object functions (rev3)
URL   : https://patchwork.freedesktop.org/series/80593/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
e68833e29f33 drm/amdgpu: Introduce GEM object functions
c2ca03d5a2f6 drm/armada: Introduce GEM object functions
f4bf6cb00591 drm/etnaviv: Introduce GEM object functions
51aa6b22d3cd drm/exynos: Introduce GEM object functions
83aa7ecb3b26 drm/gma500: Introduce GEM object functions
403f5cb7b9c5 drm/i915: Introduce GEM object functions
186114199dd4 drm/imx/dcss: Initialize DRM driver instance with CMA helper macro
d2560e174c6b drm/mediatek: Introduce GEM object functions
397302d4830c drm/msm: Introduce GEM object funcs
5197f3332932 drm/nouveau: Introduce GEM object functions
130b2aad73de drm/omapdrm: Introduce GEM object functions
b0df04425f42 drm/pl111: Introduce GEM object functions
cb12d2a37716 drm/radeon: Introduce GEM object functions
-:97: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#97: FILE: drivers/gpu/drm/radeon/radeon_gem.c:41:
+int radeon_gem_prime_pin(struct drm_gem_object *obj);

-:98: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#98: FILE: drivers/gpu/drm/radeon/radeon_gem.c:42:
+void radeon_gem_prime_unpin(struct drm_gem_object *obj);

-:100: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#100: FILE: drivers/gpu/drm/radeon/radeon_gem.c:44:
+void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);

total: 0 errors, 3 warnings, 0 checks, 118 lines checked
fcc349b8c7fe drm/rockchip: Convert to drm_gem_object_funcs
0a9fb555f5bb drm/tegra: Introduce GEM object functions
180a1cc2a27b drm/vc4: Introduce GEM object functions
f590e1e0e873 drm/vgem: Introduce GEM object functions
eb3ee8cd3768 drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
ebd599450be2 drm/vkms: Introduce GEM object functions
faaa00075c90 drm/xen: Introduce GEM object functions
9c03b50d30f0 drm/xlnx: Initialize DRM driver instance with CMA helper macro
9968e704252c drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
-:298: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#298: FILE: drivers/gpu/drm/drm_prime.c:624:
+		return ERR_PTR(-ENOSYS);

total: 0 errors, 1 warnings, 0 checks, 376 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
