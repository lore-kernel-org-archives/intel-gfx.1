Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3DAC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 12:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4DE6100C
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 12:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB4DE6100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE906EE4F;
	Thu, 29 Apr 2021 12:01:44 +0000 (UTC)
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Thu, 29 Apr 2021 02:51:19 UTC
Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com
 [115.236.121.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B136EC64
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 02:51:18 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121142.qiye.163.com (Hmail) with ESMTPA id B1253801C3;
 Thu, 29 Apr 2021 10:42:13 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Apr 2021 19:42:11 -0700
Message-Id: <20210429024211.58245-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUhISFZLSk5LGBpKSxpPSEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Okk6DAw6OT8QEkkyEktMCRA5
 N00aFB1VSlVKTUpCTU1PSkhPSkxPVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJT0hINwY+
X-HM-Tid: 0a791b815ee5b037kuuub1253801c3
X-Mailman-Approved-At: Thu, 29 Apr 2021 12:01:43 +0000
Subject: [Intel-gfx] [PATCH] drm/i915: Use might_alloc()
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This maybe used lockdep through the fs_reclaim annotations.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 2744558f3050..cc1b49cabb6c 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -341,7 +341,7 @@ static int __i915_sw_fence_await_sw_fence(struct i915_sw_fence *fence,
 	unsigned long flags;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (i915_sw_fence_done(signaler)) {
 		i915_sw_fence_set_error_once(fence, signaler->error);
@@ -477,7 +477,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	int ret;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (dma_fence_is_signaled(dma)) {
 		i915_sw_fence_set_error_once(fence, dma->error);
@@ -576,7 +576,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (write) {
 		struct dma_fence **shared;
-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
