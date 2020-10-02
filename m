Return-Path: <SRS0=5YwX=DJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7C0C4363D
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 12:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E52B205F4
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 12:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E52B205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2818C6E946;
	Fri,  2 Oct 2020 12:36:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64B876E940;
 Fri,  2 Oct 2020 12:36:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 52EFFA7DFC;
 Fri,  2 Oct 2020 12:36:47 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Hellwig" <hch@lst.de>
Date: Fri, 02 Oct 2020 12:36:47 -0000
Message-ID: <160164220733.3608.17224365044863338912@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201002122204.1534411-1-hch@lst.de>
In-Reply-To: <20201002122204.1534411-1-hch@lst.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B01/11=5D_mm=3A_update_the_documenta?=
 =?utf-8?q?tion_for_vfree?=
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

Series: series starting with [01/11] mm: update the documentation for vfree
URL   : https://patchwork.freedesktop.org/series/82335/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
403e54bb3db2 mm: update the documentation for vfree
c01ba7b7b91e mm: add a VM_MAP_PUT_PAGES flag for vmap
31a259dcbf9f mm: add a vmap_pfn function
-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: mm/vmalloc.c:2448:
+	area = get_vm_area_caller(count * PAGE_SIZE, VM_IOREMAP,
+			__builtin_return_address(0));

-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: mm/vmalloc.c:2452:
+	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
+			count * PAGE_SIZE, vmap_pfn_apply, &data)) {

total: 0 errors, 0 warnings, 2 checks, 67 lines checked
53cab076613e mm: allow a NULL fn callback in apply_to_page_range
d5f375c01071 zsmalloc: switch from alloc_vm_area to get_vm_area
-:8: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match 
#8: 
Co-developed-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
total: 0 errors, 1 warnings, 0 checks, 18 lines checked
96b3d73ace0b drm/i915: use vmap in shmem_pin_map
b692d6ffb709 drm/i915: stop using kmap in i915_gem_object_map
1f9fc4cfd84c drm/i915: use vmap in i915_gem_object_map
-:49: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#49: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:237:
+static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
+		enum i915_map_type type)

-:147: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#147: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:293:
+static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
+		enum i915_map_type type)

total: 0 errors, 0 warnings, 2 checks, 167 lines checked
31cb20191c3c xen/xenbus: use apply_to_page_range directly in xenbus_map_ring_pv
90dc709c8ef1 x86/xen: open code alloc_vm_area in arch_gnttab_valloc
-:53: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#53: FILE: arch/x86/xen/grant-table.c:111:
+	if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
+			PAGE_SIZE * nr_frames, gnttab_apply, area))

total: 0 errors, 0 warnings, 1 checks, 45 lines checked
573e3a0cb122 mm: remove alloc_vm_area


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
