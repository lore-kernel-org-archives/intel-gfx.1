Return-Path: <SRS0=4n+h=QE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67604C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 13:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276F561B2B
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 13:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 276F561B2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8B6E197;
	Wed, 17 Nov 2021 13:43:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644316E197
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Nov 2021 13:43:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="320162199"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="320162199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 05:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="454655190"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.167])
 by orsmga003.jf.intel.com with ESMTP; 17 Nov 2021 05:43:56 -0800
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Nov 2021 15:43:41 +0200
Message-Id: <20211117134341.9889-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/dg2: Implement WM0 cursor WA for DG2
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

Bug in the register unit which results in WM1 register
used when only WM0 is enabled on cursor.
Software workaround is when only WM0 enabled on cursor,
copy contents of CUR_WM_0[30:0] (exclude the enable bit)
into CUR_WM_1[30:0].

HSDES: 14012656716

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 89dc7f69baf3..4bc90196d0fb 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5095,6 +5095,18 @@ skl_check_nv12_wm_level(struct skl_wm_level *wm, struct skl_wm_level *uv_wm,
 	}
 }
 
+static bool icl_need_wm1_wa(struct drm_i915_private *dev_priv,
+			    enum plane_id plane_id)
+{
+	/*
+	 * Wa_1408961008:icl, ehl
+	 * Wa_14012656716:tgl, adl
+	 * Underruns with WM1+ disabled
+	 */
+	return (DISPLAY_VER(dev_priv) == 11) ||
+	       (IS_DISPLAY_VER(dev_priv, 12, 13) && (plane_id == PLANE_CURSOR));
+}
+
 static int
 skl_allocate_plane_ddb(struct intel_atomic_state *state,
 		       struct intel_crtc *crtc)
@@ -5265,11 +5277,7 @@ skl_allocate_plane_ddb(struct intel_atomic_state *state,
 			skl_check_nv12_wm_level(&wm->wm[level], &wm->uv_wm[level],
 						total[plane_id], uv_total[plane_id]);
 
-			/*
-			 * Wa_1408961008:icl, ehl
-			 * Underruns with WM1+ disabled
-			 */
-			if (DISPLAY_VER(dev_priv) == 11 &&
+			if (icl_need_wm1_wa(dev_priv, plane_id) &&
 			    level == 1 && wm->wm[0].enable) {
 				wm->wm[level].blocks = wm->wm[0].blocks;
 				wm->wm[level].lines = wm->wm[0].lines;
-- 
2.24.1.485.gad05a3d8e5

