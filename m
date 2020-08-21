Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A8C433E3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 08:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C6822BEA
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 08:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C6822BEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650DE6E1D8;
	Fri, 21 Aug 2020 08:50:47 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB666E1D8
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 08:50:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22195097-1500050 
 for multiple; Fri, 21 Aug 2020 09:50:14 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Date: Fri, 21 Aug 2020 09:50:08 +0100
Message-Id: <20200821085011.28878-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/4] mm: Export flush_vm_area() to sync the PTEs
 upon construction
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
Cc: Joerg Roedel <jroedel@suse.de>, stable@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 David Vrabel <david.vrabel@citrix.com>, Pavel Machek <pavel@ucw.cz>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The alloc_vm_area() is another method for drivers to
vmap/map_kernel_range that uses apply_to_page_range() rather than the
direct vmalloc walkers. This is missing the page table modification
tracking, and the ability to synchronize the PTE updates afterwards.
Provide flush_vm_area() for the users of alloc_vm_area() that assumes
the worst and ensures that the page directories are correctly flushed
upon construction.

The impact is most pronounced on x86_32 due to the delayed set_pmd().

Reported-by: Pavel Machek <pavel@ucw.cz>
References: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
References: 86cf69f1d893 ("x86/mm/32: implement arch_sync_kernel_mappings()")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: David Vrabel <david.vrabel@citrix.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 include/linux/vmalloc.h |  1 +
 mm/vmalloc.c            | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 0221f852a7e1..a253b27df0ac 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -204,6 +204,7 @@ static inline void set_vm_flush_reset_perms(void *addr)
 
 /* Allocate/destroy a 'vmalloc' VM area. */
 extern struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes);
+extern void flush_vm_area(struct vm_struct *area);
 extern void free_vm_area(struct vm_struct *area);
 
 /* for /dev/kmem */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b482d240f9a2..c41934486031 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3078,6 +3078,22 @@ struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
 }
 EXPORT_SYMBOL_GPL(alloc_vm_area);
 
+void flush_vm_area(struct vm_struct *area)
+{
+	unsigned long addr = (unsigned long)area->addr;
+
+	/* apply_to_page_range() doesn't track the damage, assume the worst */
+	if (ARCH_PAGE_TABLE_SYNC_MASK & (PGTBL_PTE_MODIFIED |
+					 PGTBL_PMD_MODIFIED |
+					 PGTBL_PUD_MODIFIED |
+					 PGTBL_P4D_MODIFIED |
+					 PGTBL_PGD_MODIFIED))
+		arch_sync_kernel_mappings(addr, addr + area->size);
+
+	flush_cache_vmap(addr, area->size);
+}
+EXPORT_SYMBOL_GPL(flush_vm_area);
+
 void free_vm_area(struct vm_struct *area)
 {
 	struct vm_struct *ret;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
