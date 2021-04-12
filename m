Return-Path: <SRS0=cAZQ=JJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57744C43460
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 108EA61248
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 108EA61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65F1899F3;
	Mon, 12 Apr 2021 08:09:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4CD899F3
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Apr 2021 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=qAg7ftC4OvKycFZYdaaiu+3hyvWOHeF5S6ch3cOk3oo=; b=mJW73nMnogALLCn/T+nyvoRxqW
 YpAoQeHEIvO4hKk/p6e4x3vj5bJ7h8FG3QuAoRXDxwEJDrvWuPVXSHmNBXTJh17grSYZgpiuXFFfP
 4NnPM3aFN5h9HNpDVlnB8BbyNlRWQ5w8kfwfFDS3LpeEV70KIjrgxh+sJpWP+oMBXmCZOWQkavDZW
 scLU/P95X0P1Ax+URV2p26ndNJPDYf1TNcfibumLpgPPOZNwKmM+Id5no3phHBlcZzOzpW2vjaYzM
 g+qpMTspD2/vHPMqPHIx+Y3LTBb7qugrwl0xGqW5g3E4RsbYPaVhBq7TTbi+8nCiErSW7Wi7No7tN
 giIPPjBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrcl-0063yK-HH; Mon, 12 Apr 2021 08:08:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4B133002C1;
 Mon, 12 Apr 2021 10:08:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 4236E25F2152F; Mon, 12 Apr 2021 10:08:44 +0200 (CEST)
Message-ID: <20210412080611.835675015@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Apr 2021 10:00:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: akpm@linux-foundation.org
References: <20210412080012.357146277@infradead.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 5/7] xen/privcmd: Use verify_page_range()
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
Cc: jgross@suse.com, sstabellini@kernel.org, keescook@chromium.org,
 peterz@infradead.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 boris.ostrovsky@oracle.com, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Avoid using apply_to_page_range() from modules, use the safer
verify_page_range() instead.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/xen/privcmd.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -946,9 +946,9 @@ static int privcmd_mmap(struct file *fil
  * on a per pfn/pte basis. Mapping calls that fail with ENOENT
  * can be then retried until success.
  */
-static int is_mapped_fn(pte_t *pte, unsigned long addr, void *data)
+static int is_mapped_fn(pte_t pte, unsigned long addr, void *data)
 {
-	return pte_none(*pte) ? 0 : -EBUSY;
+	return pte_none(pte) ? 0 : -EBUSY;
 }
 
 static int privcmd_vma_range_is_mapped(
@@ -956,8 +956,8 @@ static int privcmd_vma_range_is_mapped(
 	           unsigned long addr,
 	           unsigned long nr_pages)
 {
-	return apply_to_page_range(vma->vm_mm, addr, nr_pages << PAGE_SHIFT,
-				   is_mapped_fn, NULL) != 0;
+	return verify_page_range(vma->vm_mm, addr, nr_pages << PAGE_SHIFT,
+				 is_mapped_fn, NULL) != 0;
 }
 
 const struct file_operations xen_privcmd_fops = {


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
