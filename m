Return-Path: <SRS0=+CuI=FT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45E0C4361B
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 21:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4E022BE9
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 21:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4E022BE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1958980C;
	Tue, 15 Dec 2020 21:53:28 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38A38980C;
 Tue, 15 Dec 2020 21:53:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23337889-1500050 
 for multiple; Tue, 15 Dec 2020 21:53:19 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Dec 2020 21:53:20 +0000
Message-Id: <20201215215320.1189123-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215210658.1188718-2-chris@chris-wilson.co.uk>
References: <20201215210658.1188718-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v2] i915/gem_softpin: Check full placement
 control under full-ppgtt
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

With full-ppgtt, userspace has complete control over their GTT. Verify
that we can place an object at the very beginning and the very end of
our GTT.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_softpin.c | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index fcaf8ef30..a3e6dcac3 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -97,6 +97,65 @@ static void test_invalid(int fd)
 	}
 }
 
+static uint32_t batch_create(int i915, uint64_t *sz)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_create create = {
+		.size = sizeof(bbe),
+	};
+
+	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE, &create)) {
+		igt_assert_eq(errno, 0);
+		return 0;
+	}
+
+	gem_write(i915, create.handle, 0, &bbe, sizeof(bbe));
+
+	*sz = create.size;
+	return create.handle;
+}
+
+static void test_zero(int i915)
+{
+	uint64_t sz, gtt = gem_aperture_size(i915);
+	struct drm_i915_gem_exec_object2 object = {
+		.handle = batch_create(i915, &sz),
+		.flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&object),
+		.buffer_count = 1,
+	};
+
+	/* Under full-ppgtt, we have complete control of the GTT */
+	igt_info("Object size:%"PRIx64", GTT size:%"PRIx64"\n", sz, gtt);
+
+	object.offset = 0;
+	igt_assert_f(__gem_execbuf(i915, &execbuf) == 0,
+		     "execbuff failed with object.offset=%llx\n",
+		     object.offset);
+
+	if (gtt >> 32) {
+		object.offset = (1ull << 32) - sz;
+		igt_assert_f(__gem_execbuf(i915, &execbuf) == 0,
+			     "execbuff failed with object.offset=%llx\n",
+			     object.offset);
+
+		object.offset = 1ull << 32;
+		igt_assert_f(__gem_execbuf(i915, &execbuf) == 0,
+			     "execbuff failed with object.offset=%llx\n",
+			     object.offset);
+	}
+
+	object.offset = gtt - sz;
+	object.offset = gen8_canonical_addr(object.offset);
+	igt_assert_f(__gem_execbuf(i915, &execbuf) == 0,
+		     "execbuff failed with object.offset=%llx\n",
+		     object.offset);
+
+	gem_close(i915, object.handle);
+}
+
 static void test_softpin(int fd)
 {
 	const uint32_t size = 1024 * 1024;
@@ -559,6 +618,10 @@ igt_main
 
 	igt_subtest("invalid")
 		test_invalid(fd);
+	igt_subtest("zero") {
+		igt_require(gem_uses_full_ppgtt(fd));
+		test_zero(fd);
+	}
 	igt_subtest("softpin")
 		test_softpin(fd);
 	igt_subtest("overlap")
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
