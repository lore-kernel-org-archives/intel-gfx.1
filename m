Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB3DC433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E507B6105A
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E507B6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760D897D0;
	Mon,  6 Sep 2021 21:01:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6589789;
 Mon,  6 Sep 2021 21:01:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747514"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747514"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362274"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:31 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Date: Tue,  7 Sep 2021 03:08:56 +0530
Message-Id: <20210906213904.27918-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC v2 14/22] drm: Add helper to attach Plane ctm
 property
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

Add a DRM helper to attach ctm property.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 10 ++++++++++
 include/drm/drm_plane.h          |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 83832adf3adf..5c3138497b9c 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -654,6 +654,16 @@ void drm_plane_attach_degamma_properties(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_degamma_properties);
 
+void drm_plane_attach_ctm_property(struct drm_plane *plane)
+{
+	if (!plane->ctm_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->ctm_property, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_ctm_property);
+
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index c4ed1799ecaf..3d329f71d287 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -889,6 +889,7 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
 					   int num_values);
 void drm_plane_attach_degamma_properties(struct drm_plane *plane);
+void drm_plane_attach_ctm_property(struct drm_plane *plane);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.26.2

