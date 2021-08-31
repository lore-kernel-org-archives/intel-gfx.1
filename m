Return-Path: <SRS0=BQmx=NW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F32C432BE
	for <intel-gfx@archiver.kernel.org>; Tue, 31 Aug 2021 14:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D0E60E98
	for <intel-gfx@archiver.kernel.org>; Tue, 31 Aug 2021 14:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15D0E60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8660D6E081;
	Tue, 31 Aug 2021 14:18:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD996E090;
 Tue, 31 Aug 2021 14:18:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="218527553"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218527553"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="498309342"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:18:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Date: Tue, 31 Aug 2021 17:17:35 +0300
Message-Id: <87d8d80ba205eb2ecb50f613219e0a821a842616.1630419362.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630419362.git.jani.nikula@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 6/6] drm/i915/edp: use MSO pixel overlap from
 DisplayID data
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

Now that we have MSO pixel overlap in display info, use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index df402f63b741..baf21f9aa40e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2420,6 +2420,8 @@ static void intel_edp_mso_mode_fixup(struct intel_connector *connector,
 static void intel_edp_mso_init(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	struct drm_display_info *info = &connector->base.display_info;
 	u8 mso;
 
 	if (intel_dp->edp_dpcd[0] < DP_EDP_14)
@@ -2438,8 +2440,9 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 	}
 
 	if (mso) {
-		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration\n",
-			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso);
+		drm_dbg_kms(&i915->drm, "Sink MSO %ux%u configuration, pixel overlap %u\n",
+			    mso, drm_dp_max_lane_count(intel_dp->dpcd) / mso,
+			    info->mso_pixel_overlap);
 		if (!HAS_MSO(i915)) {
 			drm_err(&i915->drm, "No source MSO support, disabling\n");
 			mso = 0;
@@ -2447,7 +2450,7 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 	}
 
 	intel_dp->mso_link_count = mso;
-	intel_dp->mso_pixel_overlap = 0; /* FIXME: read from DisplayID v2.0 */
+	intel_dp->mso_pixel_overlap = mso ? info->mso_pixel_overlap : 0;
 }
 
 static bool
-- 
2.30.2

