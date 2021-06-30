Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C4DC11F66
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 23:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9041C61452
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 23:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9041C61452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124786EA92;
	Wed, 30 Jun 2021 23:06:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEC96EA92
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Jun 2021 23:06:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="195732055"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="195732055"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 16:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="408959120"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga003.jf.intel.com with ESMTP; 30 Jun 2021 16:06:24 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 30 Jun 2021 16:06:24 -0700
Message-Id: <20210630230624.25407-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/dmc: Use RUNTIME_INFO->stp for DMC
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On the dmc side,we maintain a lookup table with different display
stepping-substepping combinations.

Instead of adding new table for every new platform, lets ues
the stepping info from RUNTIME_INFO(dev_priv)->step
Adding the helper intel_get_display_step().

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 49 ++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index f8789d4543bf..c7ff7ff3f412 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -266,14 +266,55 @@ static const struct stepping_info icl_stepping_info[] = {
 };
 
 static const struct stepping_info no_stepping_info = { '*', '*' };
+struct stepping_info *display_step;
+
+static struct stepping_info *
+intel_get_display_stepping(struct intel_step_info step)
+{
+
+	switch (step.display_step) {
+	case STEP_A0:
+		display_step->stepping = 'A';
+		display_step->substepping = '0';
+		break;
+	case STEP_A2:
+		display_step->stepping = 'A';
+		display_step->substepping = '2';
+		break;
+	case STEP_B0:
+		display_step->stepping = 'B';
+		display_step->substepping = '0';
+		break;
+	case STEP_B1:
+		display_step->stepping = 'B';
+		display_step->substepping = '1';
+		break;
+	case STEP_C0:
+		display_step->stepping = 'C';
+		display_step->substepping = '0';
+		break;
+	case STEP_D0:
+		display_step->stepping = 'D';
+		display_step->substepping = '0';
+		break;
+	default:
+		display_step->stepping = '*';
+		display_step->substepping = '*';
+		break;
+	}
+	return display_step;
+}
 
 static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *dev_priv)
 {
 	const struct stepping_info *si;
+	struct intel_step_info step = RUNTIME_INFO(dev_priv)->step;
 	unsigned int size;
 
-	if (IS_ICELAKE(dev_priv)) {
+	if (DISPLAY_VER(dev_priv) >= 12) {
+		si = intel_get_display_stepping(step);
+	} else if (IS_ICELAKE(dev_priv)) {
 		size = ARRAY_SIZE(icl_stepping_info);
 		si = icl_stepping_info;
 	} else if (IS_SKYLAKE(dev_priv)) {
@@ -287,10 +328,10 @@ intel_get_stepping_info(struct drm_i915_private *dev_priv)
 		si = NULL;
 	}
 
-	if (INTEL_REVID(dev_priv) < size)
-		return si + INTEL_REVID(dev_priv);
+	if (DISPLAY_VER(dev_priv) < 12)
+		return INTEL_REVID(dev_priv) < size ? si + INTEL_REVID(dev_priv) : &no_stepping_info;
 
-	return &no_stepping_info;
+	return si;
 }
 
 static void gen9_set_dc_state_debugmask(struct drm_i915_private *dev_priv)
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
