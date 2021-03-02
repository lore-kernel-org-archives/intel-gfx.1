Return-Path: <SRS0=7YZZ=IA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FEEC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 11:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED7364F0B
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Mar 2021 11:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ED7364F0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFA689EF7;
	Tue,  2 Mar 2021 11:03:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D406E10E
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Mar 2021 11:03:33 +0000 (UTC)
IronPort-SDR: tpXjxfEJJUOG1OVecYfvEFWRO+5xhofVp57lGbbw031EKHYX5cQdKNo116tNNF4EL6hDjipm/V
 5V+1EGBeUhkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186835722"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186835722"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 03:03:31 -0800
IronPort-SDR: eGkU2yVcxPhsSNb8N5OwhVwk5JCTq3E0h94e/hYvOZlB2VVOuZF5akh+norJIbnZDWUxQetljV
 QJsVharR0/vA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506289723"
Received: from rwathan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.106])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 03:03:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  2 Mar 2021 13:03:01 +0200
Message-Id: <2862284eb033bb0ffc96134b7d5b11bf29e4587f.1614682842.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1614682842.git.jani.nikula@intel.com>
References: <cover.1614682842.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 3/4] drm/i915/edp: modify fixed and downclock
 modes for MSO
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
Cc: jani.nikula@intel.com, Nischal Varide <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

In the case of MSO (Multi-SST Operation), the EDID contains the timings
for a single panel segment. We'll want to hide the fact from userspace,
and expose modes that span the entire display.

Don't modify the EDID, as the userspace should not use that for
modesetting, only modify the actual modes.

v3: Use pixel overlap if available.

v2: Rename intel_dp_mso_mode_fixup -> intel_edp_mso_mode_fixup

Cc: Nischal Varide <nischal.varide@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2ec82a5c9f24..2d0001e7c26a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3516,6 +3516,31 @@ static void intel_dp_get_dsc_sink_cap(struct intel_dp *intel_dp)
 	}
 }
 
+static void intel_edp_mso_mode_fixup(struct intel_connector *connector,
+				     struct drm_display_mode *mode)
+{
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	int n = intel_dp->mso_link_count;
+	int overlap = intel_dp->mso_pixel_overlap;
+
+	if (!mode || !n)
+		return;
+
+	mode->hdisplay = (mode->hdisplay - overlap) * n;
+	mode->hsync_start = (mode->hsync_start - overlap) * n;
+	mode->hsync_end = (mode->hsync_end - overlap) * n;
+	mode->htotal = (mode->htotal - overlap) * n;
+	mode->clock *= n;
+
+	drm_mode_set_name(mode);
+
+	drm_dbg_kms(&i915->drm,
+		    "[CONNECTOR:%d:%s] using generated MSO mode: ",
+		    connector->base.base.id, connector->base.name);
+	drm_mode_debug_printmodeline(mode);
+}
+
 static void intel_edp_mso_init(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -6493,6 +6518,10 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	if (fixed_mode)
 		downclock_mode = intel_dp_drrs_init(intel_connector, fixed_mode);
 
+	/* multiply the mode clock and horizontal timings for MSO */
+	intel_edp_mso_mode_fixup(intel_connector, fixed_mode);
+	intel_edp_mso_mode_fixup(intel_connector, downclock_mode);
+
 	/* fallback to VBT if available for eDP */
 	if (!fixed_mode)
 		fixed_mode = intel_panel_vbt_fixed_mode(intel_connector);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
