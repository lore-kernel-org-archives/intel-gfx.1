Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73976C4363A
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 16:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027BE20776
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 16:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027BE20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E016E4F3;
	Mon, 12 Oct 2020 16:01:11 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7598A6E24D;
 Mon, 12 Oct 2020 10:25:21 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 Oct 2020 12:25:09 +0200
Message-Id: <20201012102509.10690-1-paul@crapouillou.net>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201012152452.432c4867@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Oct 2020 16:01:02 +0000
Subject: [Intel-gfx] [PATCH] drm/ingenic: Fix bad revert
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Paul Cercueil <paul@crapouillou.net>,
 linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fix a badly reverted commit. The revert commit was cherry-picked from
drm-misc-next to drm-misc-next-fixes, and in the process some unrelated
code was added.

Fixes: a3fb64c00d44 "Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached""
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 1be1235bd546..a3d1617d7c67 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -440,20 +440,6 @@ void ingenic_drm_plane_config(struct device *dev,
 	}
 }
 
-static void ingenic_drm_update_palette(struct ingenic_drm *priv,
-				       const struct drm_color_lut *lut)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
-		u16 color = drm_color_lut_extract(lut[i].red, 5) << 11
-			| drm_color_lut_extract(lut[i].green, 6) << 5
-			| drm_color_lut_extract(lut[i].blue, 5);
-
-		priv->dma_hwdescs->palette[i] = color;
-	}
-}
-
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
@@ -464,8 +450,6 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t addr;
 
 	if (state && state->fb) {
-		crtc_state = state->crtc->state;
-
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
 		width = state->src_w >> 16;
 		height = state->src_h >> 16;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
