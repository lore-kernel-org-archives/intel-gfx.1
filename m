Return-Path: <SRS0=Us6R=MC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAD4C07E99
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 01:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F87B613D0
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 01:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F87B613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270A16EAB0;
	Sat, 10 Jul 2021 01:22:52 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915566EAB0;
 Sat, 10 Jul 2021 01:22:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="295443461"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="295443461"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439772"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:22:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Fri,  9 Jul 2021 18:20:13 -0700
Message-Id: <20210710012026.19705-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 03/16] drm/i915/guc/slpc: Gate Host RPS when
 slpc is enabled
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

Disable RPS when slpc is enabled. Also ensure uc_init is called
before we initialize RPS so that we can check for slpc support.
We do not need to enable up/down interrupts when slpc is enabled.
However, we still need the ARAT interrupt, which will be enabled
separately.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ceeb517ba259..f94d2e1ec3fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -41,8 +41,8 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 	intel_gt_init_timelines(gt);
 	intel_gt_pm_init_early(gt);
 
-	intel_rps_init_early(&gt->rps);
 	intel_uc_init_early(&gt->uc);
+	intel_rps_init_early(&gt->rps);
 }
 
 int intel_gt_probe_lmem(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 0c8e7f2b06f0..e858eeb2c59d 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
 	return rps_to_gt(rps)->uncore;
 }
 
+static bool rps_uses_slpc(struct intel_rps *rps)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+
+	return intel_uc_uses_guc_slpc(&gt->uc);
+}
+
 static u32 rps_pm_sanitize_mask(struct intel_rps *rps, u32 mask)
 {
 	return mask & ~rps->pm_intrmsk_mbz;
@@ -167,6 +174,8 @@ static void rps_enable_interrupts(struct intel_rps *rps)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 
+	GEM_BUG_ON(rps_uses_slpc(rps));
+
 	GT_TRACE(gt, "interrupts:on rps->pm_events: %x, rps_pm_mask:%x\n",
 		 rps->pm_events, rps_pm_mask(rps, rps->last_freq));
 
@@ -771,6 +780,8 @@ static int gen6_rps_set(struct intel_rps *rps, u8 val)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 swreq;
 
+	GEM_BUG_ON(rps_uses_slpc(rps));
+
 	if (GRAPHICS_VER(i915) >= 9)
 		swreq = GEN9_FREQUENCY(val);
 	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
@@ -861,6 +872,9 @@ void intel_rps_park(struct intel_rps *rps)
 {
 	int adj;
 
+	if (!intel_rps_is_enabled(rps))
+		return;
+
 	GEM_BUG_ON(atomic_read(&rps->num_waiters));
 
 	if (!intel_rps_clear_active(rps))
@@ -1829,6 +1843,9 @@ void intel_rps_init(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 
+	if (rps_uses_slpc(rps))
+		return;
+
 	if (IS_CHERRYVIEW(i915))
 		chv_rps_init(rps);
 	else if (IS_VALLEYVIEW(i915))
@@ -1885,6 +1902,9 @@ void intel_rps_init(struct intel_rps *rps)
 
 void intel_rps_sanitize(struct intel_rps *rps)
 {
+	if (rps_uses_slpc(rps))
+		return;
+
 	if (GRAPHICS_VER(rps_to_i915(rps)) >= 6)
 		rps_disable_interrupts(rps);
 }
-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
