Return-Path: <SRS0=K74T=CT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34480C433E2
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 18:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02C5214F1
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 18:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z0ig8BZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02C5214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3966E977;
	Thu, 10 Sep 2020 18:33:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C306E978
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2020 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5pz6pk0hQVCAmUCzXhhMl6SI7ek8eXmhvDqxhMsMWZA=; b=Z0ig8BZOOs874Iqk+s8Hjq2poV
 GfUU0UHAUN9Q10UU2Qc227BQGYSAuBuImaK2JLeoDFbGlpRzkAAOn6+/YaptLDl2FRANNaxYmEE3w
 mM4+ZjVmKwqOk3NY3DlezWO3uDRW1yESEcjvvUwqea0D+xOlNL846Qr76zhGuKKjx9HOj3KgtZscS
 jit7EaGeKPNdD6jg3LNu0n3gynAd6wlhzi9Hsj3R5Mi0n4mt1NX4STEfYrPFDWo1mhNjNsHg18nlj
 vZc8Lz/HCP7Iav4W1Li83NNG/RE38e7EQqq6JJ3V+y6qbzdR40ePerF8p7gTuN16/gueZ/fX6Ngp1
 qzZoxrDw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kGRNo-0005GA-TG; Thu, 10 Sep 2020 18:33:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Thu, 10 Sep 2020 19:33:13 +0100
Message-Id: <20200910183318.20139-4-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200910183318.20139-1-willy@infradead.org>
References: <20200910183318.20139-1-willy@infradead.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 3/8] mm: Optimise madvise WILLNEED
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
Cc: intel-gfx@lists.freedesktop.org, Huang Ying <ying.huang@intel.com>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 William Kucharski <william.kucharski@oracle.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Instead of calling find_get_entry() for every page index, use an XArray
iterator to skip over NULL entries, and avoid calling get_page(),
because we only want the swap entries.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/madvise.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index dd1d43cf026d..96189acd6969 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -224,25 +224,28 @@ static void force_shm_swapin_readahead(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end,
 		struct address_space *mapping)
 {
-	pgoff_t index;
+	XA_STATE(xas, &mapping->i_pages, linear_page_index(vma, start));
+	pgoff_t end_index = end / PAGE_SIZE;
 	struct page *page;
-	swp_entry_t swap;
 
-	for (; start < end; start += PAGE_SIZE) {
-		index = ((start - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
+	rcu_read_lock();
+	xas_for_each(&xas, page, end_index) {
+		swp_entry_t swap;
 
-		page = find_get_entry(mapping, index);
-		if (!xa_is_value(page)) {
-			if (page)
-				put_page(page);
+		if (!xa_is_value(page))
 			continue;
-		}
+		rcu_read_unlock();
+
 		swap = radix_to_swp_entry(page);
 		page = read_swap_cache_async(swap, GFP_HIGHUSER_MOVABLE,
 							NULL, 0, false);
 		if (page)
 			put_page(page);
+
+		rcu_read_lock();
+		xas_reset(&xas);
 	}
+	rcu_read_unlock();
 
 	lru_add_drain();	/* Push any new pages onto the LRU now */
 }
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
