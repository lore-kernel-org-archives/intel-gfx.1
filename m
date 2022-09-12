Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB4ECAAD5
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Sep 2022 16:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8B010E175;
	Mon, 12 Sep 2022 16:56:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9498E10E448
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Sep 2022 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663001715; x=1694537715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7V/WVgLgdm27GWRqZDzaL6XaYbr2JkDw8uA3Fd6bug=;
 b=W98Q9AJtsmbiKDEKHk3Ex9ClJFus1RlZstinK8zjISz6qcEkjSkmqvXv
 +wto8RFcE2ewlgc4Td8gE9pkSsC16BhPFhQ2wmuUqvc635kwx8yemSiYc
 vLlOGMcy1+oZ64CsLNcbZHAg5zBUT4NJR8LrljTq9T1ret3sARYskpnHq
 wvw1VsxK0WWT33is6j68viaNWshtD+YOslgeP/r/BPKDWFpjYc1/rYw0y
 znX+SH78UBkRiVjPxFAOY4rkZXqjICi0sYdWmVz+L6NlDMwHQ8oNAU5Su
 UTfuUmALFHV66FIFAgzQzFnJZgEkJSchuPuqcXbgH6grlFT5bYiOXl5Ma w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="324152866"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="324152866"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:55:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="649326778"
Received: from abijaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:55:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Sep 2022 19:54:30 +0300
Message-Id: <15056bcd3507d7cf2195b231568b0ddc299910e7.1662999695.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662999695.git.jani.nikula@intel.com>
References: <cover.1662999695.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 08/15] drm/i915/display: reduce the includes in
 intel_dvo_dev.h
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

Only include what's needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dvo_dev.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
index d96c3cc46e50..f446a04a1052 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
@@ -23,12 +23,12 @@
 #ifndef __INTEL_DVO_DEV_H__
 #define __INTEL_DVO_DEV_H__
 
-#include <linux/i2c.h>
-
-#include <drm/drm_crtc.h>
-
 #include "i915_reg_defs.h"
 
+enum drm_connector_status;
+struct drm_display_mode;
+struct i2c_adapter;
+
 struct intel_dvo_device {
 	const char *name;
 	int type;
-- 
2.34.1

