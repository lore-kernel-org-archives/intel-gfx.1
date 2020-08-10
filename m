Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25997C433E8
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 10:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06217206E9
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06217206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4856E3F7;
	Mon, 10 Aug 2020 10:33:37 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C446E3E5
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 10:33:28 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 10 Aug 2020 12:30:51 +0200
Message-Id: <20200810103103.303818-13-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
References: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 12/24] drm/i915: Nuke arguments to eb_pin_engine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Those arguments are already set as eb.file and eb.args, so kill off
the extra arguments. This will allow us to move eb_pin_engine() to
after we reserved all BO's.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 12397fbc0971..c9280ff491dd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2616,11 +2616,10 @@ static void eb_unpin_engine(struct i915_execbuffer *eb)
 }
 
 static unsigned int
-eb_select_legacy_ring(struct i915_execbuffer *eb,
-		      struct drm_file *file,
-		      struct drm_i915_gem_execbuffer2 *args)
+eb_select_legacy_ring(struct i915_execbuffer *eb)
 {
 	struct drm_i915_private *i915 = eb->i915;
+	struct drm_i915_gem_execbuffer2 *args = eb->args;
 	unsigned int user_ring_id = args->flags & I915_EXEC_RING_MASK;
 
 	if (user_ring_id != I915_EXEC_BSD &&
@@ -2635,7 +2634,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
 		unsigned int bsd_idx = args->flags & I915_EXEC_BSD_MASK;
 
 		if (bsd_idx == I915_EXEC_BSD_DEFAULT) {
-			bsd_idx = gen8_dispatch_bsd_engine(i915, file);
+			bsd_idx = gen8_dispatch_bsd_engine(i915, eb->file);
 		} else if (bsd_idx >= I915_EXEC_BSD_RING1 &&
 			   bsd_idx <= I915_EXEC_BSD_RING2) {
 			bsd_idx >>= I915_EXEC_BSD_SHIFT;
@@ -2660,18 +2659,16 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
 }
 
 static int
-eb_pin_engine(struct i915_execbuffer *eb,
-	      struct drm_file *file,
-	      struct drm_i915_gem_execbuffer2 *args)
+eb_pin_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce;
 	unsigned int idx;
 	int err;
 
 	if (i915_gem_context_user_engines(eb->gem_context))
-		idx = args->flags & I915_EXEC_RING_MASK;
+		idx = eb->args->flags & I915_EXEC_RING_MASK;
 	else
-		idx = eb_select_legacy_ring(eb, file, args);
+		idx = eb_select_legacy_ring(eb);
 
 	ce = i915_gem_context_get_engine(eb->gem_context, idx);
 	if (IS_ERR(ce))
@@ -3131,7 +3128,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (unlikely(err))
 		goto err_destroy;
 
-	err = eb_pin_engine(&eb, file, args);
+	err = eb_pin_engine(&eb);
 	if (unlikely(err))
 		goto err_context;
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
