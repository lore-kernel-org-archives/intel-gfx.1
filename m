Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B770C433E3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 09:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686AB21741
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686AB21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82726EAB7;
	Fri, 21 Aug 2020 09:14:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD00B6EAB5;
 Fri, 21 Aug 2020 09:14:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B6782A3ECB;
 Fri, 21 Aug 2020 09:14:07 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Fri, 21 Aug 2020 09:14:07 -0000
Message-ID: <159800124771.16200.5288075760755663094@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200821085011.28878-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200821085011.28878-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/4=5D_mm=3A_Export_flush=5Fvm=5Far?=
 =?utf-8?q?ea=28=29_to_sync_the_PTEs_upon_construction?=
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

Series: series starting with [1/4] mm: Export flush_vm_area() to sync the PTEs upon construction
URL   : https://patchwork.freedesktop.org/series/80892/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
dc5a3f725528 mm: Export flush_vm_area() to sync the PTEs upon construction
-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
References: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")

-:17: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")'
#17: 
References: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")

-:18: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 86cf69f1d893 ("x86/mm/32: implement arch_sync_kernel_mappings()")'
#18: 
References: 86cf69f1d893 ("x86/mm/32: implement arch_sync_kernel_mappings()")

-:38: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#38: FILE: include/linux/vmalloc.h:207:
+extern void flush_vm_area(struct vm_struct *area);

total: 2 errors, 1 warnings, 1 checks, 29 lines checked
2410d6d4185d drm/i915/gem: Sync the vmap PTEs upon construction
-:11: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#11: 
References: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")

-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")'
#11: 
References: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
6dc443ae9dba drm/i915/gem: Use set_pte_at() for assigning the vmapped PTE
9e1d77a3e2fa drm/i915/gem: Replace reloc chain with terminator on error unwind


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
