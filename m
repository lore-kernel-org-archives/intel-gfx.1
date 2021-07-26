Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1295CC4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 12:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03AA600D1
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D03AA600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610486E830;
	Mon, 26 Jul 2021 12:04:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6723E6E830;
 Mon, 26 Jul 2021 12:04:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212211230"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="212211230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 05:04:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="504873166"
Received: from conorkel-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.199.29])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 05:04:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jul 2021 13:03:04 +0100
Message-Id: <20210726120310.1115522-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/7] lib/i915/gem_mman: add FIXED mmap mode
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We need this for discrete.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/i915/gem_mman.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/i915/gem_mman.h |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 4b4f2114..e2514f0c 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -497,6 +497,43 @@ void *gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
 	return ptr;
 }
 
+#define LOCAL_I915_MMAP_OFFSET_FIXED 4
+
+void *__gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			       uint64_t size, unsigned prot)
+{
+	return __gem_mmap_offset(fd, handle, offset, size, prot,
+				 LOCAL_I915_MMAP_OFFSET_FIXED);
+}
+
+/**
+ * gem_mmap_offset__fixed: Used to mmap objects on discrete platforms
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset in the gem buffer of the mmap arena
+ * @size: size of the mmap arena
+ * @prot: memory protection bits as used by mmap()
+ *
+ * Like __gem_mmap_offset__fixed() except we assert on failure.
+ *
+ * For discrete the caching attributes for the pages are fixed at allocation
+ * time, and can't be changed. The FIXED mode will simply use the same caching *
+ * mode of the allocated pages. This mode will always be coherent with GPU
+ * access.
+ *
+ * On non-discrete platforms this mode is not supported.
+ *
+ * Returns: A pointer to the created memory mapping
+ */
+void *gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			   uint64_t size, unsigned prot)
+{
+	void *ptr = __gem_mmap_offset__fixed(fd, handle, offset, size, prot);
+
+	igt_assert(ptr);
+	return ptr;
+}
+
 /**
  * __gem_mmap__cpu_coherent:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 5695d2ad..290c997d 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -37,6 +37,8 @@ bool gem_mmap_offset__has_wc(int fd);
 void *gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
 void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			  uint64_t size, unsigned prot);
+void *gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			     uint64_t size, unsigned prot);
 void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot);
 void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
@@ -54,6 +56,8 @@ void *__gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
 void *__gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
 void *__gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			    uint64_t size, unsigned prot);
+void *__gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			       uint64_t size, unsigned prot);
 void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				  uint64_t size, unsigned prot);
 void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
