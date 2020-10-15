Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EE5C3279D
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2A42080A
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2A42080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185546EC7E;
	Thu, 15 Oct 2020 11:26:48 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640A76EC93
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:26:12 +0200
Message-Id: <20201015112627.1142745-49-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 48/63] drm/i915/selftests: Prepare object
 blit tests for obj->mm.lock removal.
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

Use some unlocked versions where we're not holding the ww lock.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
index 23b6e11bbc3e..ee9496f3d11d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
@@ -262,7 +262,7 @@ static int igt_fill_blt_thread(void *arg)
 			goto err_flush;
 		}
 
-		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+		vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
 		if (IS_ERR(vaddr)) {
 			err = PTR_ERR(vaddr);
 			goto err_put;
@@ -380,7 +380,7 @@ static int igt_copy_blt_thread(void *arg)
 			goto err_flush;
 		}
 
-		vaddr = i915_gem_object_pin_map(src, I915_MAP_WB);
+		vaddr = i915_gem_object_pin_map_unlocked(src, I915_MAP_WB);
 		if (IS_ERR(vaddr)) {
 			err = PTR_ERR(vaddr);
 			goto err_put_src;
@@ -400,7 +400,7 @@ static int igt_copy_blt_thread(void *arg)
 			goto err_put_src;
 		}
 
-		vaddr = i915_gem_object_pin_map(dst, I915_MAP_WB);
+		vaddr = i915_gem_object_pin_map_unlocked(dst, I915_MAP_WB);
 		if (IS_ERR(vaddr)) {
 			err = PTR_ERR(vaddr);
 			goto err_put_dst;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
