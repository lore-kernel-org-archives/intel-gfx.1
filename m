Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA2FC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Dec 2021 09:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D65735B6;
	Fri,  3 Dec 2021 09:43:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858073597
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Dec 2021 09:43:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="323200991"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="323200991"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 01:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="501125199"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.167])
 by orsmga007.jf.intel.com with ESMTP; 03 Dec 2021 01:40:53 -0800
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  3 Dec 2021 11:40:41 +0200
Message-Id: <20211203094041.18399-4-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20211203094041.18399-1-stanislav.lisovskiy@intel.com>
References: <20211203094041.18399-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/4] drm/i915: Don't allocate extra ddb during
 async flip for DG2
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
Cc: jani.saarinen@intel.co
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

In terms of async flip optimization we don't to allocate
extra ddb space, so lets skip it.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 0b45d1d61d0f..e1594f43bb1b 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5245,9 +5245,15 @@ skl_allocate_plane_ddb(struct intel_atomic_state *state,
 			break;
 
 		rate = crtc_state->plane_data_rate[plane_id];
-		extra = min_t(u16, alloc_size,
-			      DIV64_U64_ROUND_UP(alloc_size * rate,
-						 total_data_rate));
+
+		if (IS_DG2(dev_priv) && crtc_state->uapi.async_flip) {
+			extra = 0;
+		} else {
+			extra = min_t(u16, alloc_size,
+				      DIV64_U64_ROUND_UP(alloc_size * rate,
+							 total_data_rate));
+		}
+
 		total[plane_id] = wm->wm[level].min_ddb_alloc + extra;
 		alloc_size -= extra;
 		total_data_rate -= rate;
@@ -5256,9 +5262,15 @@ skl_allocate_plane_ddb(struct intel_atomic_state *state,
 			break;
 
 		rate = crtc_state->uv_plane_data_rate[plane_id];
-		extra = min_t(u16, alloc_size,
-			      DIV64_U64_ROUND_UP(alloc_size * rate,
-						 total_data_rate));
+
+		if (IS_DG2(dev_priv) && crtc_state->uapi.async_flip) {
+			extra = 0;
+		} else {
+			extra = min_t(u16, alloc_size,
+				      DIV64_U64_ROUND_UP(alloc_size * rate,
+							 total_data_rate));
+		}
+
 		uv_total[plane_id] = wm->uv_wm[level].min_ddb_alloc + extra;
 		alloc_size -= extra;
 		total_data_rate -= rate;
-- 
2.24.1.485.gad05a3d8e5

