Return-Path: <SRS0=LhB1=DL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E2DC4363C
	for <intel-gfx@archiver.kernel.org>; Sun,  4 Oct 2020 15:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C417206C1
	for <intel-gfx@archiver.kernel.org>; Sun,  4 Oct 2020 15:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ8hgBuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C417206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58E989CDF;
	Sun,  4 Oct 2020 15:43:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B589CDF;
 Sun,  4 Oct 2020 15:43:50 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAEC020759;
 Sun,  4 Oct 2020 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601826230;
 bh=FgRdIP4AGV94fdzUhyA3YXoVe8TraD2dOsq6sGTJh2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQ8hgBuh1xxUHMOD11A4e2hakbRV0tE72jn2cHRi3icqLat5Ys3HlOrPjmixcoOEq
 mq5Ob6H4lWnI5lxDC0bM67rCmxNWMSPu/a7DZuccowuanBuZxD8v7UFLoOR2/Iknob
 aYPslalVAjRUhO6tfBWeNvS19MZMYHK7m+Dlp6C0=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Date: Sun,  4 Oct 2020 18:43:38 +0300
Message-Id: <20201004154340.1080481-3-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004154340.1080481-1-leon@kernel.org>
References: <20201004154340.1080481-1-leon@kernel.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH rdma-next v5 2/4] tools/testing/scatterlist:
 Rejuvenate bit-rotten test
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Maor Gottlieb <maorg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A couple small tweaks are needed to make the test build and run
on current kernels.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 tools/testing/scatterlist/Makefile   |  3 ++-
 tools/testing/scatterlist/linux/mm.h | 35 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/scatterlist/Makefile b/tools/testing/scatterlist/Makefile
index cbb003d9305e..c65233876622 100644
--- a/tools/testing/scatterlist/Makefile
+++ b/tools/testing/scatterlist/Makefile
@@ -14,7 +14,7 @@ targets: include $(TARGETS)
 main: $(OFILES)

 clean:
-	$(RM) $(TARGETS) $(OFILES) scatterlist.c linux/scatterlist.h linux/highmem.h linux/kmemleak.h asm/io.h
+	$(RM) $(TARGETS) $(OFILES) scatterlist.c linux/scatterlist.h linux/highmem.h linux/kmemleak.h linux/slab.h asm/io.h
 	@rmdir asm

 scatterlist.c: ../../../lib/scatterlist.c
@@ -28,4 +28,5 @@ include: ../../../include/linux/scatterlist.h
 	@touch asm/io.h
 	@touch linux/highmem.h
 	@touch linux/kmemleak.h
+	@touch linux/slab.h
 	@cp $< linux/scatterlist.h
diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
index 6f9ac14aa800..6ae907f375d2 100644
--- a/tools/testing/scatterlist/linux/mm.h
+++ b/tools/testing/scatterlist/linux/mm.h
@@ -114,6 +114,12 @@ static inline void *kmalloc(unsigned int size, unsigned int flags)
 	return malloc(size);
 }

+static inline void *
+kmalloc_array(unsigned int n, unsigned int size, unsigned int flags)
+{
+	return malloc(n * size);
+}
+
 #define kfree(x) free(x)

 #define kmemleak_alloc(a, b, c, d)
@@ -122,4 +128,33 @@ static inline void *kmalloc(unsigned int size, unsigned int flags)
 #define PageSlab(p) (0)
 #define flush_kernel_dcache_page(p)

+#define MAX_ERRNO	4095
+
+#define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
+
+static inline void * __must_check ERR_PTR(long error)
+{
+	return (void *) error;
+}
+
+static inline long __must_check PTR_ERR(__force const void *ptr)
+{
+	return (long) ptr;
+}
+
+static inline bool __must_check IS_ERR(__force const void *ptr)
+{
+	return IS_ERR_VALUE((unsigned long)ptr);
+}
+
+static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
+{
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+	else
+		return 0;
+}
+
+#define IS_ENABLED(x) (0)
+
 #endif
--
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
