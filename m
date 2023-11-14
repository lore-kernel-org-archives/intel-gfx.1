Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2461C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Nov 2023 15:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE210E454;
	Tue, 14 Nov 2023 15:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9959310E454
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Nov 2023 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699977334; x=1731513334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EcjewYwcE7+zg/110+2oee7nx3f8UVCS/l0lkQcYYNA=;
 b=XUzmh/YESbM2vVXJu9GzbPDDofxT0maFnZ3oe2NZP51c1ucFXuX7diTN
 7LUTVm2mfWsEydxZIzE5h73p1lTURzCL5AbtpF67wzv6xw94WLbLw2lAA
 B/QRMcoCyCtvPhr5ndoIvIOAmj0t9IlvindntF1mEZssTvTNrBG0Hcp6G
 rfq2oFrcBaGxpi+/MB6c8OBvobiL1fVn3W01xtm1PZRnIrrvqaPHTTiP/
 NTcTlXDek07gL1aA0fklC9g+TU+gJvk2JglPK345GBQTvhLX416IAUC7A
 lGnv1aGVQQyTqSzwpkz78T/CGqDmXYGBkI9BFzeIW51tBqLGN3NCQMDrq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3786953"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3786953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="5831455"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:55:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 14 Nov 2023 17:55:28 +0200
Message-Id: <20231114155528.96935-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/display: keep struct intel_display
 members sorted
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
Cc: jani.nikula@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Like the comment says,

	/* Grouping using anonymous structs. Keep sorted. */

Stick to it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_core.h  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index aa8be02c9e54..7e82b87e9cde 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -348,15 +348,6 @@ struct intel_display {
 		struct intel_global_obj obj;
 	} dbuf;
 
-	struct {
-		wait_queue_head_t waitqueue;
-
-		/* mutex to protect pmdemand programming sequence */
-		struct mutex lock;
-
-		struct intel_global_obj obj;
-	} pmdemand;
-
 	struct {
 		/*
 		 * dkl.phy_lock protects against concurrent access of the
@@ -444,6 +435,15 @@ struct intel_display {
 		bool false_color;
 	} ips;
 
+	struct {
+		wait_queue_head_t waitqueue;
+
+		/* mutex to protect pmdemand programming sequence */
+		struct mutex lock;
+
+		struct intel_global_obj obj;
+	} pmdemand;
+
 	struct {
 		struct i915_power_domains domains;
 
-- 
2.39.2

