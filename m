Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014B4C433EF
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B715760041
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B715760041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797AE895B2;
	Mon,  6 Sep 2021 21:01:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECDC88F9F;
 Mon,  6 Sep 2021 21:01:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747500"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362247"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:25 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Date: Tue,  7 Sep 2021 03:08:54 +0530
Message-Id: <20210906213904.27918-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC v2 12/22] drm/i915/xelpd: Load plane color luts
 from atomic flip
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

Load plane color luts as part of atomic plane updates.
This will be done only if the plane color luts are changed.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 +++
 drivers/gpu/drm/i915/display/intel_atomic_plane.h | 1 +
 drivers/gpu/drm/i915/display/intel_color.c        | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 47234d898549..8796fc86b2e5 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -513,6 +513,9 @@ void skl_update_planes_on_crtc(struct intel_atomic_state *state,
 		struct intel_plane_state *new_plane_state =
 			intel_atomic_get_new_plane_state(state, plane);
 
+		if (new_plane_state->uapi.color_mgmt_changed)
+			intel_color_load_plane_luts(&new_plane_state->uapi);
+
 		if (new_plane_state->uapi.visible ||
 		    new_plane_state->planar_slave) {
 			intel_update_plane(plane, new_crtc_state, new_plane_state);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index 854f37b49681..3001f4d69b4d 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -65,5 +65,6 @@ void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
 			       struct intel_plane_state *plane_state);
 void intel_plane_helper_add(struct intel_plane *plane);
 int intel_plane_color_init(struct drm_plane *plane);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 62df5122309a..f5a9af858d1b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include "intel_atomic_plane.h"
 #include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
@@ -2310,6 +2311,14 @@ static void d13_plane_load_luts(const struct drm_plane_state *plane_state)
 	}
 }
 
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state)
+{
+	struct drm_device *dev = plane_state->plane->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+
+	dev_priv->display.load_plane_luts(plane_state);
+}
+
 int intel_plane_color_init(struct drm_plane *plane)
 {
 	struct drm_i915_private *dev_priv = to_i915(plane->dev);
-- 
2.26.2

