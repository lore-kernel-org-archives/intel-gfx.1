Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3143C433C1
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 21:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E6661A2B
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 21:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E6661A2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1066F49A;
	Fri, 26 Mar 2021 21:56:35 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83B6F49A
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 21:56:33 +0000 (UTC)
IronPort-SDR: +sa3TfxaPA7PiX5LExr6nnffCdvOQ28G36YJDrUBIt+/gY5RV13whMKeY6xzDRS0d2Aark01Hl
 Bt9Vx6T/7WNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="252576912"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="252576912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:56:32 -0700
IronPort-SDR: HSZMcShNEjUtjL5SctTRXP832w+mv8yNSAXUfrxbU3Qn4FpVvyzuTNx2eafiRs3CxVO9JlWF+G
 /pfTwsdccdhA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416705936"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:56:31 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 26 Mar 2021 23:56:29 +0200
Message-Id: <20210326215629.2423461-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Avoid the size check WARN in GEM
 create/userptr IOCTLs
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Since
commit ae2fb480f32f ("drm/i915/gem: consolidate 2big error checking for object sizes")
the
	i915_gem_userptr_ioctl()
	i915_gem_create_ioctl()
	i915_gem_dumb_create()
IOCTLs will throw a WARN if the size passed in by userspace is too big.

This keeps now all the SKLs in CI in a tainted state, so avoid the WARN
in these functions to get the machines back online.

Testcase: igt/gem_create/create-massive
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c  |  3 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h  | 14 ++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 45d60e3d98e3b..a8ce8aa1d50fb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -27,6 +27,9 @@ i915_gem_create(struct drm_file *file,
 	/* For most of the ABI (e.g. mmap) we think in system pages */
 	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
 
+	if (i915_gem_object_size_2big_nowarn(size))
+		return -E2BIG;
+
 	/* Allocate the new object */
 	obj = i915_gem_object_create_region(mr, size, 0);
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2ebd79537aea9..b06d1eef7a727 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -27,9 +27,9 @@
  * - get_user_pages*() mixed ints with longs
  */
 #define GEM_CHECK_SIZE_OVERFLOW(sz) \
-	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
+	((sz) >> PAGE_SHIFT > INT_MAX)
 
-static inline bool i915_gem_object_size_2big(u64 size)
+static inline bool __i915_gem_object_size_2big(u64 size)
 {
 	struct drm_i915_gem_object *obj;
 
@@ -42,6 +42,16 @@ static inline bool i915_gem_object_size_2big(u64 size)
 	return false;
 }
 
+static inline bool i915_gem_object_size_2big(u64 size)
+{
+	return GEM_WARN_ON(__i915_gem_object_size_2big(size));
+}
+
+static inline bool i915_gem_object_size_2big_nowarn(u64 size)
+{
+	return __i915_gem_object_size_2big(size);
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915);
 
 struct drm_i915_gem_object *i915_gem_object_alloc(void);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index a657b99ec7606..947efcca85ad2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -508,7 +508,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 			    I915_USERPTR_UNSYNCHRONIZED))
 		return -EINVAL;
 
-	if (i915_gem_object_size_2big(args->user_size))
+	if (i915_gem_object_size_2big_nowarn(args->user_size))
 		return -E2BIG;
 
 	if (!args->user_size)
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
