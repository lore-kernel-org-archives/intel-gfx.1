Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53887C30627
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Aug 2023 14:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095C410E4D5;
	Thu, 17 Aug 2023 14:31:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7810E4B6;
 Thu, 17 Aug 2023 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692282650; x=1723818650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVNTspcN9wuQwQwUK2siBOwHm+SQXuRcRimJ4QH2ChA=;
 b=HDU1yk6eaG4TR7IogmXg1nOg+qafOAqe6DURefSjNcenUCoH7EDpUJqe
 PFgZ7aiXIjwp/KjqUWGweU8hCP0BAh1zKxc81ymuzRS+ZJ+OVzClkn9RJ
 jJp1MLl1djJmJMn/7lXxL8kdGCReQ3n9jmOUIteb26itvv7WSGy4NGAT5
 8Guzr2xkOVZoWuk+pNykLzlSAGM2SRFyOPP/2kXwkGsQzCcVRbC/kU2sO
 56AVJesm+yPxeowHPU/R5m3xL2Xudidq/XfF5CZy5vJbadZoq6m590jKz
 OkKZEB4Hn+YPjwrd4J8BUdZ7sXxr847KPWWKoc8ICACpkKEY4FXt3xSFw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376581780"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="376581780"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858244171"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858244171"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:29:00 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Thu, 17 Aug 2023 19:54:59 +0530
Message-Id: <20230817142459.89764-19-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
References: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 18/18] drm/i915/dp: Check if
 force_dsc_output_format is possible
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

Currently for testing an output format with DSC, we just force the
output format, without checking if it can be supported.
This also creates an issue where there is a PCON which might need to
convert from forced output format to the format to sink format.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 764663cd73ea..5b48bfe09d0e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -935,16 +935,42 @@ dfp_can_convert_from_ycbcr444(struct intel_dp *intel_dp,
 	return false;
 }
 
+static bool
+dfp_can_convert(struct intel_dp *intel_dp,
+		enum intel_output_format output_format,
+		enum intel_output_format sink_format)
+{
+	switch (output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return dfp_can_convert_from_rgb(intel_dp, sink_format);
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return dfp_can_convert_from_ycbcr444(intel_dp, sink_format);
+	default:
+		MISSING_CASE(output_format);
+		return false;
+	}
+
+	return false;
+}
+
 static enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
 		       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	enum intel_output_format force_dsc_output_format =
+		intel_dp->force_dsc_output_format;
 	enum intel_output_format output_format;
+	if (force_dsc_output_format) {
+		if (source_can_output(intel_dp, force_dsc_output_format) &&
+		    (!drm_dp_is_branch(intel_dp->dpcd) ||
+		     sink_format != force_dsc_output_format ||
+		     dfp_can_convert(intel_dp, force_dsc_output_format, sink_format)))
+			return force_dsc_output_format;
 
-	if (intel_dp->force_dsc_output_format)
-		return intel_dp->force_dsc_output_format;
+		drm_dbg_kms(&i915->drm, "Cannot force DSC output format\n");
+	}
 
 	if (sink_format == INTEL_OUTPUT_FORMAT_RGB ||
 	    dfp_can_convert_from_rgb(intel_dp, sink_format))
-- 
2.40.1

