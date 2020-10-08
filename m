Return-Path: <SRS0=1MTx=DP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B8EC433E7
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 23:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEC822248
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 23:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AEC822248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816B6EB72;
	Thu,  8 Oct 2020 23:03:19 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBF46E027;
 Thu,  8 Oct 2020 23:03:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22662658-1500050 
 for multiple; Fri, 09 Oct 2020 00:03:04 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  9 Oct 2020 00:03:03 +0100
Message-Id: <20201008230303.1560301-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
References: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v3] prime_vgem: Check that we wrap the
 vgem mmap with userptr
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
Cc: igt-dev@lists.freedesktop.org, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Kondapally,
 Kalyan" <kalyan.kondapally@intel.com>, "Graunke,
 Kenneth W" <kenneth.w.graunke@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This came up in a discussion about importing virtio dma-buf, which are
themselves plain shmemfs objects and so not only backed by struct pages,
but wrappable by userptr. vgem share the same properties and so should
serve as a useful proxy for testing.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
Cc: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
Cc: "Kondapally, Kalyan" <kalyan.kondapally@intel.com>
---
 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/prime_vgem.c                    | 31 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index aa2eb3295..982d25834 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -143,6 +143,7 @@ igt@prime_vgem@basic-fence-read
 igt@prime_vgem@basic-gtt
 igt@prime_vgem@basic-read
 igt@prime_vgem@basic-write
+igt@prime_vgem@basic-userptr
 igt@vgem_basic@setversion
 igt@vgem_basic@create
 igt@vgem_basic@debugfs
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 38e2026aa..bc74d6844 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -287,6 +287,34 @@ static void test_write(int vgem, int i915)
 	munmap(ptr, scratch.size);
 }
 
+static void test_userptr(int vgem, int i915)
+{
+	struct vgem_bo scratch;
+	struct drm_i915_gem_exec_object2 obj = {};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+	};
+	uint32_t *ptr;
+
+	scratch.width = 1024;
+	scratch.height = 1024;
+	scratch.bpp = 32;
+	vgem_create(vgem, &scratch);
+
+	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
+	gem_close(vgem, scratch.handle);
+	*ptr = MI_BATCH_BUFFER_END;
+
+	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
+	gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for exec */
+
+	gem_execbuf(i915, &execbuf);
+	gem_close(i915, obj.handle);
+
+	munmap(ptr, scratch.size);
+}
+
 static void test_gtt(int vgem, int i915)
 {
 	struct vgem_bo scratch;
@@ -1038,6 +1066,9 @@ igt_main
 	igt_subtest("basic-write")
 		test_write(vgem, i915);
 
+	igt_subtest("basic-userptr")
+		test_userptr(vgem, i915);
+
 	igt_subtest("basic-gtt") {
 		gem_require_mappable_ggtt(i915);
 		test_gtt(vgem, i915);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
