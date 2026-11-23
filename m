Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD4606A321
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGsS7htO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4554010EC85;
	Mon, 23 Nov 2026 21:10:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1264C10EC85;
 Mon, 23 Nov 2026 21:10:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7307B40B75;
 Mon, 23 Nov 2026 21:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0D31F000C0;
 Mon, 23 Nov 2026 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795468232;
 bh=DnjqbWLm66jnmBGFt0jSNZ5s4/5gaZ6EsNmWFq9f530=;
 h=From:To:Cc:Subject:Date;
 b=AGsS7htO9eJuPa1Y5huoRpjkfSYSM2ixu6GrMZ/0i1Iu6j/MrZ2kFExn4D49PVYs/
 sSlt6JbntVEuorsnaz5YcSJ1YEKIW6dXD1JmuDsRWzexSPyBij/hXP9GhQsPlwrLxn
 xKhd535sCW9uDiVgDvgs893qBWk6H7RWhzg+5j6AYhz5ZUKSc3cQbnbirZmEPI/hB5
 EkbwSjvPCFS0oXUg/1aEr4wJqBr6+fbUcx3EbOZPJ53IfCtO1nXzW1B/4MHe70Msoy
 1VyoUoysfhhXVnI30K+6txOUgeQ5jrHBYj+7urXZyV3fYzkt42sS/XaqVEYF5mtfDS
 4L+85OddWG4zg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lorenzo Stoakes <ljs@kernel.org>
Subject: [PATCH i-g-t] tests/gem_mmap_offset: Accept partial read in oob-read
Date: Mon, 23 Nov 2026 22:10:18 +0100
Message-ID: <20261123211018.12339-1-david@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The oob-read test reads 8 bytes through /proc/self/mem, assuming that
the kernel would reject the entire read with EIO.

However, we have 4 remaining bytes in the 4 KiB mapping we can read, so
it's valid for the kernel to only do a partial read that covers these 4
bytes. Allow that as well.

Otherwise, the test will fail on a kernel with upcoming vm_ops->access
fixes, whereby vm_ops->access is limited to the current VMA, so the
read would continue with the next mapping (if any).

So we have to make sure that nothing is mapped after the GEM mapping.
Let's reserve an 8 KiB memory region, map the GEM object into the first
4 KiB slot, and create a hole by unmapping the second 4 KiB slot.

With the kernel changes in place:

  $ build/tests/gem_mmap_offset --run-subtest oob-read
  [...]
  Using IGT_SRANDOM=1795467759 for randomisation
  Opened device: /dev/dri/card1
  Starting subtest: oob-read
  Subtest oob-read: SUCCESS (0,000s)

Link: https://lore.kernel.org/r/20261122-access_shite-v2-0-808d8d2aa700@kernel.org
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tests/intel/gem_mmap_offset.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index d3c56ab40..e4c0cfbd9 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -482,13 +482,29 @@ test_oob_read(int i915)
 	handle = gem_create(i915, 4096);
 
 	for_each_mmap_offset_type(i915, t) {
-		uint32_t *ptr;
+		struct drm_i915_gem_mmap_offset arg = {
+			.handle = handle,
+			.flags = t->type,
+		};
+		void *ptr;
 
-		ptr = __mmap_offset(i915, handle, 0, 4096,
-				    PROT_READ | PROT_WRITE,
-				    t->type);
-		if (!ptr)
+		if (mmap_offset_ioctl(i915, &arg))
+			continue;
+
+		/* Reserve a region for mapping + hole to stop read(). */
+		ptr = mmap(NULL, 8192, PROT_NONE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		igt_assert(ptr != MAP_FAILED);
+
+		/* Place our mapping into the first slot. */
+		if (mmap(ptr, 4096, PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_FIXED, i915, arg.offset) == MAP_FAILED) {
+			munmap(ptr, 8192);
 			continue;
+		}
+
+		/* And our hole into the second slot. */
+		munmap(ptr + 4096, 4096);
 
 		memfd = open("/proc/self/mem", O_RDWR);
 		igt_require_f(memfd != -1, "/proc/self/mem\n");
@@ -497,9 +513,14 @@ test_oob_read(int i915)
 		ret = lseek(memfd, addr, SEEK_SET);
 		igt_assert_f(ret != -1, "lseek failed\n");
 
-		/* Triggering the buf (out of bound read) */
+		/*
+		 * Read across the end of the mapping. The read is either
+		 * rejected entirely, or completes partially for the remaining
+		 * 4 bytes in the mapping.
+		 */
 		ret = read(memfd, read_buf, 8);
-		igt_assert(ret == -1 && errno ==  EIO);
+		igt_assert_f((ret == -1 && errno == EIO) || ret == 4,
+			     "ret=%d errno=%d\n", ret, errno);
 
 		munmap(ptr, 4096);
 		close(memfd);
-- 
2.56.1

