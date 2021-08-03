Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19518C4320A
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45443601FC
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45443601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96C6E969;
	Tue,  3 Aug 2021 22:12:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951796E195;
 Tue,  3 Aug 2021 22:11:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393482"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393482"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512735"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue,  3 Aug 2021 15:29:32 -0700
Message-Id: <20210803222943.27686-36-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 35/46] drm/i915: Store batch index in struct
 i915_execbuffer
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This will help with upcoming extensions where more than 1 batch can be
submitted in a single execbuf IOCTL.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 40311583f03d..1f1f477e46b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -252,6 +252,9 @@ struct i915_execbuffer {
 	struct eb_vma *batch; /** identity of the batch obj/vma */
 	struct i915_vma *trampoline; /** trampoline used for chaining */
 
+	/* batch_index in vma list */
+	unsigned int batch_index;
+
 	/** actual size of execobj[] as we may extend it for the cmdparser */
 	unsigned int buffer_count;
 
@@ -361,6 +364,11 @@ static int eb_create(struct i915_execbuffer *eb)
 		eb->lut_size = -eb->buffer_count;
 	}
 
+	if (eb->args->flags & I915_EXEC_BATCH_FIRST)
+		eb->batch_index = 0;
+	else
+		eb->batch_index = eb->args->buffer_count - 1;
+
 	return 0;
 }
 
@@ -735,14 +743,6 @@ static int eb_reserve(struct i915_execbuffer *eb)
 	} while (1);
 }
 
-static unsigned int eb_batch_index(const struct i915_execbuffer *eb)
-{
-	if (eb->args->flags & I915_EXEC_BATCH_FIRST)
-		return 0;
-	else
-		return eb->buffer_count - 1;
-}
-
 static int eb_select_context(struct i915_execbuffer *eb)
 {
 	struct i915_gem_context *ctx;
@@ -852,7 +852,6 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 static int eb_lookup_vmas(struct i915_execbuffer *eb)
 {
 	struct drm_i915_private *i915 = eb->i915;
-	unsigned int batch = eb_batch_index(eb);
 	unsigned int i;
 	int err = 0;
 
@@ -873,7 +872,7 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 			goto err;
 		}
 
-		eb_add_vma(eb, i, batch, vma);
+		eb_add_vma(eb, i, eb->batch_index, vma);
 
 		if (i915_gem_object_is_userptr(vma->obj)) {
 			err = i915_gem_object_userptr_submit_init(vma->obj);
-- 
2.28.0

