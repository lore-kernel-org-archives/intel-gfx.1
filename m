Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EADFD3760
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Feb 2026 13:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5F10E773;
	Wed, 25 Feb 2026 13:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="XUKI1iCm";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EA310E355
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772025576;
 bh=XWR3PTD9PvlVyf4ItzdXRNZmhDejNV+hqUEQoIthRQU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XUKI1iCm9qYNpbYzQ7yPWW2Vtr4UM/rPR4ihDlTX6iBku6J/v2Ik8xdEDCJVCEkp3
 pMLw6ch33yfjUFYg5EVHV39iD9VhKz1zsbVELg0OzKJudIFGPbkGqVzcxWLsOrwN9i
 iBrTnqZ3wYpXNFElxxD1xPscYwkQo4LgwaEy9g6r98sEeaJf6C66p+O2zPakyYFQZA
 17kBSb3hUZIl7BitqFAnief/0vcjckZ361uFMNWKIRRNnBDxlu3YscPTH859oeGYl8
 aWZLFPjgItJXTwzx8cvp6t80Wqph/Zb+s3ni3fwbbM8HAV12G5GMYwdc5Zth+twdN/
 GoC4a+LHtoScQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Subject: [i915-ci-only NO-REVIEW 03/25] drm/intel/display: Make
 intel_crtc_arm_vblank_event static
Date: Wed, 25 Feb 2026 14:19:07 +0100
Message-ID: <20260225131931.60724-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225131931.60724-1-dev@lankhorst.se>
References: <20260225131931.60724-1-dev@lankhorst.se>
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

Only used inside intel_crtc.c now, so no need to export it any more.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 2 +-
 drivers/gpu/drm/i915/display/intel_crtc.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index b8189cd5d864a..296f7a7b962fa 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -638,7 +638,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end)
 static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
 #endif
 
-void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state)
+static void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 12507b51ee77e..f65cbafe2b42a 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -33,7 +33,6 @@ int intel_usecs_to_scanlines(const struct drm_display_mode *adjusted_mode,
 			     int usecs);
 int intel_scanlines_to_usecs(const struct drm_display_mode *adjusted_mode,
 			     int scanlines);
-void intel_crtc_arm_vblank_event(struct intel_crtc_state *crtc_state);
 void intel_crtc_prepare_vblank_event(struct intel_crtc_state *crtc_state,
 				     struct drm_pending_vblank_event **event);
 u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state);
-- 
2.51.0

