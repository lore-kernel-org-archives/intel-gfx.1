Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691C0C47093
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371F061396
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371F061396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5339D6E9FC;
	Tue,  1 Jun 2021 10:16:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10146E9F8;
 Tue,  1 Jun 2021 10:16:25 +0000 (UTC)
IronPort-SDR: JBlVQffW70CdvObLPA+L6PnHWyukd3rkg/jLROSzlU5IQkhqrJbQXgIbomzrfbFLdfn2VzlLL5
 xWKRGOKPcVxg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550011"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550011"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:25 -0700
IronPort-SDR: Im/zkkUO31HB/fw+7t83aeoCfB+SKlGwp7yhsjWEz1DuvRHI1ls1ExVIlNAbs2SqSwe/QN9dJe
 179dsaReEZZA==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431338"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:23 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  1 Jun 2021 16:22:09 +0530
Message-Id: <20210601105218.29185-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 12/21] drm: Add Plane CTM property
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

Add a blob property for plane CSC usage.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 11 +++++++++++
 include/drm/drm_plane.h                   | 15 +++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 6e358067cb7a..fafb8af1c9cb 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -314,6 +314,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 
 	if (state->degamma_lut)
 		drm_property_blob_get(state->degamma_lut);
+	if (state->ctm)
+		drm_property_blob_get(state->ctm);
 
 	state->color_mgmt_changed = false;
 }
@@ -363,6 +365,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 
 	drm_property_blob_put(state->fb_damage_clips);
 	drm_property_blob_put(state->degamma_lut);
+	drm_property_blob_put(state->ctm);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ce3cb65d415e..6af2afe362ff 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -604,6 +604,14 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == plane->ctm_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->ctm,
+					val,
+					sizeof(struct drm_color_ctm), -1,
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -675,6 +683,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	} else if (property == plane->degamma_lut_property) {
 		*val = (state->degamma_lut) ?
 			state->degamma_lut->base.id : 0;
+	} else if (property == plane->ctm_property) {
+		*val = (state->ctm) ? state->ctm->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 29d0fc1e52b5..83832adf3adf 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -602,6 +602,10 @@ EXPORT_SYMBOL(drm_plane_create_color_properties);
  *	engine, thereby making the content as linear for further color
  *	processing.
  *
+ * ctm_property:
+ *	Blob property which allows a userspace to provide CTM coefficients
+ *	to do color space conversion or any other enhancement by doing a
+ *	matrix multiplication using the h/w CTM processing engine
  */
 int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
@@ -623,6 +627,13 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 
 	plane->degamma_lut_property = prop;
 
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+				   "PLANE_CTM", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->ctm_property = prop;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index bbd0033ed1d2..83d11918333b 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -252,6 +252,14 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *degamma_lut;
 
+	/**
+	 * @ctm:
+	 *
+	 * Color transformation matrix. See drm_plane_enable_color_mgmt(). The
+	 * blob (if not NULL) is a &struct drm_color_ctm.
+	 */
+	struct drm_property_blob *ctm;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -776,6 +784,13 @@ struct drm_plane {
 	 * used to convert the framebuffer's colors to linear gamma.
 	 */
 	struct drm_property *degamma_lut_property;
+
+	/**
+	 * @plane_ctm_property: Optional Plane property to set the
+	 * matrix used to convert colors after the lookup in the
+	 * degamma LUT.
+	 */
+	struct drm_property *ctm_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
