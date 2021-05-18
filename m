Return-Path: <SRS0=F/h7=KN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE01BC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 08:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AADB61166
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 08:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AADB61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA636EAD5;
	Tue, 18 May 2021 08:44:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD7006EAD5;
 Tue, 18 May 2021 08:44:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B6CFEA7DFC;
 Tue, 18 May 2021 08:44:31 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 18 May 2021 08:44:31 -0000
Message-ID: <162132747174.23337.12378197024404096052@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Move_LMEM_=28VRAM=29_management_over_to_TTM_=28?=
 =?utf-8?q?rev2=29?=
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

Series: drm/i915: Move LMEM (VRAM) management over to TTM (rev2)
URL   : https://patchwork.freedesktop.org/series/90022/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
f95eea0001a4 drm/i915: Untangle the vma pages_mutex
425af44621a2 drm/i915: Don't free shared locks while shared
a1fb9cdc093f drm/i915: Fix i915_sg_page_sizes to record dma segments rather than physical pages
1b455d3307a9 drm/ttm: Export functions to initialize and finalize the ttm range manager standalone
01c0540773c7 drm/i915/ttm Initialize the ttm device and memory managers
-:479: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#479: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1478 lines checked
a3796d8feda9 drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
32e0235ecbbf drm/ttm: Export ttm_bo_tt_destroy()
3ed6aaedd277 drm/i915/ttm Add a generic TTM memcpy move for page-based iomem
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 308 lines checked
75550f88727b drm/ttm, drm/amdgpu: Allow the driver some control over swapping
36729bdb371d drm/i915/ttm: Introduce a TTM i915 gem object backend
-:408: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#408: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 962 lines checked
f897aee184bd drm/i915/lmem: Verify checks for lmem residency
d85d5bfe5022 drm/i915: Disable mmap ioctl for gen12+
7199fd0658f1 drm/ttm: Add BO and offset arguments for vm_access and vm_fault ttm handlers.
-:214: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#214: FILE: drivers/gpu/drm/ttm/ttm_bo_vm.c:494:
+			return bo->bdev->funcs->access_memory(

total: 0 errors, 0 warnings, 1 checks, 240 lines checked
bea92372457b drm/i915: Use ttm mmap handling for ttm bo's.
-:196: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#196: FILE: drivers/gpu/drm/i915/gem/i915_gem_ttm.c:528:
+vm_access_ttm(struct vm_area_struct *area, unsigned long addr,
+	  void *buf, int len, int write)

total: 0 errors, 0 warnings, 1 checks, 201 lines checked
17af87b6b030 drm/i915/ttm: Add io sgt caching to i915_ttm_io_mem_pfn


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
