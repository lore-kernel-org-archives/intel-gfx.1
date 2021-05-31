Return-Path: <SRS0=VbzJ=K2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D8DC47080
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 18:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D8061090
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 18:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D8061090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BE26E155;
	Mon, 31 May 2021 18:36:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1ACB26E155;
 Mon, 31 May 2021 18:36:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11FCEAADCF;
 Mon, 31 May 2021 18:36:51 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 31 May 2021 18:36:51 -0000
Message-ID: <162248621104.27952.5338526555310695834@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Move_LMEM_=28VRAM=29_management_over_to_TTM_=28rev4=29?=
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

Series: Move LMEM (VRAM) management over to TTM (rev4)
URL   : https://patchwork.freedesktop.org/series/90681/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
6de8c27efb29 drm/i915: Untangle the vma pages_mutex
8736b0670431 drm/i915: Don't free shared locks while shared
5c70526b5b0a drm/i915: Fix i915_sg_page_sizes to record dma segments rather than physical pages
3241ba8c38d7 drm/i915/ttm Initialize the ttm device and memory managers
-:480: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#480: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1531 lines checked
f32e448037d9 drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
72d7aa2b6e3d drm/ttm: Add a generic TTM memcpy move for page-based iomem
-:385: CHECK:ARCH_DEFINES: architecture specific defines should be avoided
#385: FILE: drivers/gpu/drm/ttm/ttm_module.c:56:
+#if defined(__i386__) || defined(__x86_64__)

-:728: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#728: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 840 lines checked
c6a460918b4c drm: Add a prefetching memcpy_from_wc
9e816089e010 drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
9e663526255d drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
c6772d8d4e09 drm/ttm, drm/amdgpu: Allow the driver some control over swapping
352563b73985 drm/i915/ttm: Introduce a TTM i915 gem object backend
-:449: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#449: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1042 lines checked
78d583a5e067 drm/i915/lmem: Verify checks for lmem residency
9252e2a7b44c drm/i915: Disable mmap ioctl for gen12+
b67ba63965f5 drm/vma: Add a driver_private member to vma_node.
c510fe8b6eed drm/i915: Use ttm mmap handling for ttm bo's.


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
