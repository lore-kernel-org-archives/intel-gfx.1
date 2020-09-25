Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08695C4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 12:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC4821D7A
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 12:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC4821D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4D6ECB3;
	Fri, 25 Sep 2020 12:07:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F4FA6ECB0;
 Fri, 25 Sep 2020 12:07:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 17F50A41FB;
 Fri, 25 Sep 2020 12:07:58 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Date: Fri, 25 Sep 2020 12:07:58 -0000
Message-ID: <160103567807.10247.10549588760844646596@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200925115601.23955-1-tzimmermann@suse.de>
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_dma-buf=3A_Flag_vmap=27ed_memory_as_system_or_I/O_memory_?=
 =?utf-8?b?KHJldjMp?=
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

Series: dma-buf: Flag vmap'ed memory as system or I/O memory (rev3)
URL   : https://patchwork.freedesktop.org/series/81647/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
c94eaf86e18e dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
-:47: WARNING:AVOID_BUG: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
#47: FILE: drivers/dma-buf/dma-buf.c:1212:
+		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));

-:53: WARNING:AVOID_BUG: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
#53: FILE: drivers/dma-buf/dma-buf.c:1217:
+	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));

-:71: WARNING:AVOID_BUG: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
#71: FILE: drivers/dma-buf/dma-buf.c:1244:
+	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));

-:74: WARNING:AVOID_BUG: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
#74: FILE: drivers/dma-buf/dma-buf.c:1246:
+	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));

-:86: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#86: 
new file mode 100644

total: 0 errors, 5 warnings, 0 checks, 138 lines checked
55973e093508 dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
c929afc2d68f dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
-:48: WARNING:AVOID_BUG: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
#48: FILE: drivers/dma-buf/dma-buf.c:1250:
+	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));

total: 0 errors, 1 warnings, 0 checks, 287 lines checked
993652ae5805 dma-buf: Document struct dma_buf_map


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
