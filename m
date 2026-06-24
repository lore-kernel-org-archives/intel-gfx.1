Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42313CDE035
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 18:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064710F05E;
	Wed, 24 Jun 2026 18:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="eNrXJFft";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CDA10F05D;
 Wed, 24 Jun 2026 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1782324293;
 bh=veyMqeP/HHsUinNhNIPK3SHl0Euc6gBrTNuDuscCi+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eNrXJFftoT9QyFwtk00O1lgxEI0MZNaNlTXVB/tvZGDvQ/bkaTV4hQy3RUn6W+mPW
 P5tvJKcfyZq7go6FciC80s5TwJ9RihBsA+q8D4J/4mQ5bVAfVA9R7hE2FpKhTLC0GO
 Olx21J/+ZnmZoP/3RhUZ1yrIfKn2oOAoE5c2DvCvaFHHFJPpoDIz9C5lTLYF0WBhAk
 h87gS/Xu2Vs3sA5/GCIS9XrJWwfS5hkRbmaky17iYAUkGiXO6ycnLzeYvAitiBnvl/
 Krlu7biXSsRKe9M5TyPrUCd+YT1v2AL1EhtazHHzW0jWKdUj6+xfUqZ2NtJLYlQCMZ
 hdJghjuXwngnw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v10 28/30] drm/xe/display: Do not allocate into stolen for new
 framebuffers.
Date: Wed, 24 Jun 2026 20:04:55 +0200
Message-ID: <20260624180459.1024068-29-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180459.1024068-1-dev@lankhorst.se>
References: <20260624180459.1024068-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Prefer to use system memory for global framebuffers, and reserve
the space for FBC use only.

Now that multiple CRTC's can use FBC's, the simple heuristic
of using less than half of stolen is no longer sufficient.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c | 33 ++++------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index a5080f6540d46..1bde12b509fcb 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -153,33 +153,12 @@ static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm,
 	struct xe_device *xe = to_xe_device(drm);
 	struct xe_bo *obj;
 
-	obj = ERR_PTR(-ENODEV);
-
-	if (xe_display_bo_fbdev_prefer_stolen(xe, size)) {
-		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
-						size,
-						ttm_bo_type_kernel,
-						XE_BO_FLAG_FORCE_WC |
-						XE_BO_FLAG_STOLEN |
-						XE_BO_FLAG_GGTT,
-						false);
-		if (!IS_ERR(obj))
-			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
-		else
-			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
-	} else {
-		drm_info(&xe->drm, "Allocating fbdev: Stolen memory not preferred.\n");
-	}
-
-	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
-						ttm_bo_type_kernel,
-						XE_BO_FLAG_FORCE_WC |
-						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-						XE_BO_FLAG_GGTT,
-						false);
-	}
-
+	obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
+					ttm_bo_type_kernel,
+					XE_BO_FLAG_FORCE_WC |
+					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+					XE_BO_FLAG_GGTT,
+					false);
 	if (IS_ERR(obj)) {
 		drm_err(&xe->drm, "failed to allocate framebuffer (%pe)\n", obj);
 		return ERR_PTR(-ENOMEM);
-- 
2.53.0

