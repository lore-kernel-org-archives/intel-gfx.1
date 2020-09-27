Return-Path: <SRS0=bec7=DE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB90C4742B
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2020 06:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5ECB23A05
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2020 06:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVGrLlOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5ECB23A05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4A6E247;
	Sun, 27 Sep 2020 06:47:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC286E23F;
 Sun, 27 Sep 2020 06:47:07 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41E7F23A51;
 Sun, 27 Sep 2020 06:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601189227;
 bh=m2a9Oz2DB63lwgxQQj+FGgp6ecAxvfnEpmZRjOKwjzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nVGrLlOZntNclCIAhTNx9fGbNC5GNHwLw0vsJ3pyWAOXJ5yl6VMNyH/yknQgbJ3vM
 ju+3ChxnMHuEEqqHFg0Ec7IlyLPXiCkmMeknkQRe3eRITITMOQYKPH82iy/Qs41MR7
 dcMILQqHsJCYv5AagArelmJcAJph2HRuIfbF3jVk=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Date: Sun, 27 Sep 2020 09:46:46 +0300
Message-Id: <20200927064647.3106737-4-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200927064647.3106737-1-leon@kernel.org>
References: <20200927064647.3106737-1-leon@kernel.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH rdma-next v4 3/4] tools/testing/scatterlist:
 Show errors in human readable form
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

Instead of just asserting dump some more useful info about what the test
saw versus what it expected to see.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 tools/testing/scatterlist/main.c | 44 ++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index 4899359a31ac..b2c7e9f7b8d3 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -5,6 +5,15 @@

 #define MAX_PAGES (64)

+struct test {
+	int alloc_ret;
+	unsigned num_pages;
+	unsigned *pfn;
+	unsigned size;
+	unsigned int max_seg;
+	unsigned int expected_segments;
+};
+
 static void set_pages(struct page **pages, const unsigned *array, unsigned num)
 {
 	unsigned int i;
@@ -17,17 +26,32 @@ static void set_pages(struct page **pages, const unsigned *array, unsigned num)

 #define pfn(...) (unsigned []){ __VA_ARGS__ }

+static void fail(struct test *test, struct sg_table *st, const char *cond)
+{
+	unsigned int i;
+
+	fprintf(stderr, "Failed on '%s'!\n\n", cond);
+
+	printf("size = %u, max segment = %u, expected nents = %u\nst->nents = %u, st->orig_nents= %u\n",
+	       test->size, test->max_seg, test->expected_segments, st->nents,
+	       st->orig_nents);
+
+	printf("%u input PFNs:", test->num_pages);
+	for (i = 0; i < test->num_pages; i++)
+		printf(" %x", test->pfn[i]);
+	printf("\n");
+
+	exit(1);
+}
+
+#define VALIDATE(cond, st, test) \
+	if (!(cond)) \
+		fail((test), (st), #cond);
+
 int main(void)
 {
 	const unsigned int sgmax = SCATTERLIST_MAX_SEGMENT;
-	struct test {
-		int alloc_ret;
-		unsigned num_pages;
-		unsigned *pfn;
-		unsigned size;
-		unsigned int max_seg;
-		unsigned int expected_segments;
-	} *test, tests[] = {
+	struct test *test, tests[] = {
 		{ -EINVAL, 1, pfn(0), PAGE_SIZE, PAGE_SIZE + 1, 1 },
 		{ -EINVAL, 1, pfn(0), PAGE_SIZE, 0, 1 },
 		{ -EINVAL, 1, pfn(0), PAGE_SIZE, sgmax + 1, 1 },
@@ -66,8 +90,8 @@ int main(void)
 		if (test->alloc_ret)
 			continue;

-		assert(st.nents == test->expected_segments);
-		assert(st.orig_nents == test->expected_segments);
+		VALIDATE(st.nents == test->expected_segments, &st, test);
+		VALIDATE(st.orig_nents == test->expected_segments, &st, test);

 		sg_free_table(&st);
 	}
--
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
