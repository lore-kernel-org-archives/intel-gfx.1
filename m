Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AFFEB7EAF
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2026 08:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD6610E976;
	Wed,  4 Mar 2026 08:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XXo0D9zE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B936410E976;
 Wed,  4 Mar 2026 08:37:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9020600AD;
 Wed,  4 Mar 2026 08:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23443C19423;
 Wed,  4 Mar 2026 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772613427;
 bh=Sg3BgMTB65BX8tpLBN5LpbAMwuMko6idF1+LAaLHKDg=;
 h=From:To:Cc:Subject:Date:From;
 b=XXo0D9zEbyO9XUyb4hD4V/2KxzagqjPox5FzPta1rlivciImRMeYXeuM6V+EfZber
 K9CdKbNUDlFd85PrQhgDdbhSVsQOOamQvssWcS0V8woMp3+dnulhadJndfUnbOUnJd
 2deO1SzgcCemEfZCmHLN74UjH2ZoCwq165muVQF0Yks4yj0Du3bEeNMdzQjZ4qtYwY
 5L8oYZs0IjB9krSHIp2V2gS2WM8JyRkqsestX3m6OdCg2bSViM5kS1GTZjrSEHJ+XS
 4nGmBPXjfYnBdwz0sy+If9FIvJ0pGfreQuk1Osg5gWmq657Xl/2XHeHgn+hY/mxZkx
 vWIjjd016C3TA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/fbdev: fix link failure without FBDEV emulation
Date: Wed,  4 Mar 2026 09:36:48 +0100
Message-Id: <20260304083701.724908-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

If CONFIG_DRM_FBDEV_EMULATION is disabled but CONFIG_FRAMEBUFFER_CONSOLE
is turned on, the i915 driver now fails to link:

ERROR: modpost: "intel_fbdev_fb_prefer_stolen" [drivers/gpu/drm/i915/i915.ko] undefined!

Fix the contition to include a check for the symbol that controls compilation
of intel_fbdev_fb.c.

Fixes: 94c7d2861292 ("drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 5594548f51d8..390a9248d631 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -115,7 +115,8 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * important and we should probably use that space with FBC or other
 	 * features.
 	 */
-	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
+	if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
+	    IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
 	    mem == i915->mm.stolen_region &&
 	    !intel_fbdev_fb_prefer_stolen(&i915->drm, size)) {
 		drm_dbg_kms(&i915->drm, "Initial FB size exceeds half of stolen, discarding\n");
-- 
2.39.5

