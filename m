Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84328C2D0A4
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242B52080A
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242B52080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202996EC81;
	Thu, 15 Oct 2020 11:26:37 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091366EC69
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:33 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:25:26 +0200
Message-Id: <20201015112627.1142745-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 02/63] drm/i915: Add missing -EDEADLK
 handling to execbuf pinning
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

i915_vma_pin may fail with -EDEADLK when we start locking page tables,
so ensure we handle this correctly.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 63e2f16204da..2fbe6fbe043a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -419,13 +419,14 @@ static u64 eb_pin_flags(const struct drm_i915_gem_exec_object2 *entry,
 	return pin_flags;
 }
 
-static inline bool
+static inline int
 eb_pin_vma(struct i915_execbuffer *eb,
 	   const struct drm_i915_gem_exec_object2 *entry,
 	   struct eb_vma *ev)
 {
 	struct i915_vma *vma = ev->vma;
 	u64 pin_flags;
+	int err;
 
 	if (vma->node.size)
 		pin_flags = vma->node.start;
@@ -438,16 +439,24 @@ eb_pin_vma(struct i915_execbuffer *eb,
 
 	/* Attempt to reuse the current location if available */
 	/* TODO: Add -EDEADLK handling here */
-	if (unlikely(i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags))) {
+	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
+	if (err == -EDEADLK)
+		return err;
+
+	if (unlikely(err)) {
 		if (entry->flags & EXEC_OBJECT_PINNED)
 			return false;
 
 		/* Failing that pick any _free_ space if suitable */
-		if (unlikely(i915_vma_pin_ww(vma, &eb->ww,
+		err = i915_vma_pin_ww(vma, &eb->ww,
 					     entry->pad_to_size,
 					     entry->alignment,
 					     eb_pin_flags(entry, ev->flags) |
-					     PIN_USER | PIN_NOEVICT)))
+					     PIN_USER | PIN_NOEVICT);
+		if (err == -EDEADLK)
+			return err;
+
+		if (unlikely(err))
 			return false;
 	}
 
@@ -896,7 +905,11 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 		if (err)
 			return err;
 
-		if (eb_pin_vma(eb, entry, ev)) {
+		err = eb_pin_vma(eb, entry, ev);
+		if (err < 0)
+			return err;
+
+		if (err > 0) {
 			if (entry->offset != vma->node.start) {
 				entry->offset = vma->node.start | UPDATE;
 				eb->args->flags |= __EXEC_HAS_RELOC;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
