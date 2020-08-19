Return-Path: <SRS0=XCjr=B5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E301AC433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 11:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDDEC206FA
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 11:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDDEC206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469F089AEA;
	Wed, 19 Aug 2020 11:30:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E088996F
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2020 11:30:48 +0000 (UTC)
IronPort-SDR: mNTNsNN3PyRkFZs8NJWjfbQi52A5p2lrUMr/JJWyen4VPCjlt7gG/x4ww5wZ6VvX5XAMTOUGAd
 +79yogS99PMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135157581"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="135157581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 04:30:48 -0700
IronPort-SDR: xJYNCsyptUgmE8r1xb7rq9Lxyf0c/rPeQEaq7wBoIyBbWrWnDB65skvPM2CCMdX+MeipgI9yLA
 m2/e7OabxizQ==
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="472206429"
Received: from unknown (HELO john.iind.intel.com) ([10.223.74.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 19 Aug 2020 04:30:47 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org,
	nischal.varide@intel.com
Date: Wed, 19 Aug 2020 10:04:06 +0530
Message-Id: <20200819043409.26010-2-nischal.varide@intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200819043409.26010-1-nischal.varide@intel.com>
References: <20200819043409.26010-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/5]
 Critical-KlockWork-Fixes-intel_display.c-NullDeref
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

This Patch fixes the Critical KlockWork Error and here a possible NuLL
Pointer dereferencing is addressed. A check has been added before
dereferencing.

Signed-off-by: Nischal Varide <nischal.varide@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 22 +++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2ddabf92adde..cc59c5e94698 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2265,9 +2265,9 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	pinctl = 0;
 	if (HAS_GMCH(dev_priv))
 		pinctl |= PIN_MAPPABLE;
-
-	vma = i915_gem_object_pin_to_display_plane(obj,
-						   alignment, view, pinctl);
+	if (obj)
+		vma = i915_gem_object_pin_to_display_plane(obj,
+			alignment, view, pinctl);
 	if (IS_ERR(vma))
 		goto err;
 
@@ -11269,10 +11269,13 @@ static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
-	if (INTEL_INFO(dev_priv)->display.cursor_needs_physical)
-		base = sg_dma_address(obj->mm.pages->sgl);
-	else
-		base = intel_plane_ggtt_offset(plane_state);
+	if (obj) {
+
+		if (INTEL_INFO(dev_priv)->display.cursor_needs_physical)
+			base = sg_dma_address(obj->mm.pages->sgl);
+		else
+			base = intel_plane_ggtt_offset(plane_state);
+	}
 
 	return base + plane_state->color_plane[0].offset;
 }
@@ -17126,10 +17129,9 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					unsigned num_clips)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-
-	i915_gem_object_flush_if_display(obj);
+	if (obj)
+		i915_gem_object_flush_if_display(obj);
 	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
-
 	return 0;
 }
 
-- 
2.26.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
