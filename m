Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60683C63697
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 10:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0238F2087D
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0238F2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2396EA4F;
	Thu,  5 Nov 2020 10:11:50 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD2E6EA34
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2020 10:11:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22900134-1500050 
 for multiple; Thu, 05 Nov 2020 10:11:37 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  5 Nov 2020 10:11:13 +0000
Message-Id: <20201105101134.19716-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 01/22] drm/i915/gem: Allow backends to override
 pread implementation
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

From: Matthew Auld <matthew.auld@intel.com>

As there are more complicated interactions between the different backing
stores and userspace, push the control into the backends rather than
accumulate them all inside the ioctl handlers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 2 ++
 drivers/gpu/drm/i915/i915_gem.c                  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index fedfebf13344..e2d9b7e1e152 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -56,6 +56,8 @@ struct drm_i915_gem_object_ops {
 	void (*truncate)(struct drm_i915_gem_object *obj);
 	void (*writeback)(struct drm_i915_gem_object *obj);
 
+	int (*pread)(struct drm_i915_gem_object *obj,
+		     const struct drm_i915_gem_pread *arg);
 	int (*pwrite)(struct drm_i915_gem_object *obj,
 		      const struct drm_i915_gem_pwrite *arg);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index bb0c12975f38..d58fe1ddc3e1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -527,6 +527,12 @@ i915_gem_pread_ioctl(struct drm_device *dev, void *data,
 
 	trace_i915_gem_object_pread(obj, args->offset, args->size);
 
+	ret = -ENODEV;
+	if (obj->ops->pread)
+		ret = obj->ops->pread(obj, args);
+	if (ret != -ENODEV)
+		goto out;
+
 	ret = i915_gem_object_wait(obj,
 				   I915_WAIT_INTERRUPTIBLE,
 				   MAX_SCHEDULE_TIMEOUT);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
