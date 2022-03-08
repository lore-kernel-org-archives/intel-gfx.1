Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C987C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Mar 2022 17:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285110E3B6;
	Tue,  8 Mar 2022 17:41:36 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5070D10E2DC
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Mar 2022 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646761295; x=1678297295;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vBlkP15UKSVCcLoiFM3+KGCbEYeYPhBYh5lrbfgLR/4=;
 b=POJ9Z2lgI0a2xQllMSpmQ9np2Htb5LqmgYiUCCkj4uoaUFcZCCHfQhb2
 kLumJoaGA8u3SexWCRjWQSMdbQFch6LhOJ1WfQ8ATZQO2CvJAzQX8LG5q
 w9YSG1dzs5QYLr9UouJ28oM+9tcVZvx4kKLYXeICuZJLpSzwvs2ceSUr7
 MVj9ODejxFUL63HW2en9xrA6VfU8rJct4VtDJ/euk8s5fEzJZX/hkCFEA
 CAA7YzMMe+yqo+xLrsaLwz28byK+qxHr76iL8Xt0Mqjk2EwMXhEObH//C
 vyaN5LL889vX27RJ3efGeMSmipVnnI5vCeAasYu7+PM0pHjR8ORy8Vzhj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="315476573"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="315476573"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:32:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="547341656"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 08 Mar 2022 09:32:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Mar 2022 19:32:41 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  8 Mar 2022 19:32:28 +0200
Message-Id: <20220308173230.4182-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308173230.4182-1-ville.syrjala@linux.intel.com>
References: <20220308173230.4182-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/6] drm/i915: Probe whether SAGV works on
 pre-icl
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Instead of leaving the SAGV enable/disable to the first commit
let's try to disable it first thing to see if we can do it or
not (disabling SAGV is a safe thing to at any time). This avoids
running the code in this funny intermediate state where we don't
know if SAGV is available or not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 906501d6b298..36f5bccabf64 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -57,6 +57,8 @@
 #include "vlv_sideband.h"
 #include "../../../platform/x86/intel_ips.h"
 
+static int intel_disable_sagv(struct drm_i915_private *dev_priv);
+
 struct drm_i915_clock_gating_funcs {
 	void (*init_clock_gating)(struct drm_i915_private *i915);
 };
@@ -3697,6 +3699,18 @@ intel_sagv_block_time(struct drm_i915_private *dev_priv)
 
 static void intel_sagv_init(struct drm_i915_private *i915)
 {
+	if (!intel_has_sagv(i915))
+		i915->sagv_status = I915_SAGV_NOT_CONTROLLED;
+
+	/*
+	 * Probe to see if we have working SAGV control.
+	 * For icl+ this was already determined by intel_bw_init_hw().
+	 */
+	if (DISPLAY_VER(i915) < 11)
+		intel_disable_sagv(i915);
+
+	drm_WARN_ON(&i915->drm, i915->sagv_status == I915_SAGV_UNKNOWN);
+
 	i915->sagv_block_time_us = intel_sagv_block_time(i915);
 
 	drm_dbg_kms(&i915->drm, "SAGV supported: %s, original SAGV block time: %u us\n",
-- 
2.34.1

