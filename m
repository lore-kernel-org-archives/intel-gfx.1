Return-Path: <SRS0=YrHI=L7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A55C07E9E
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 05:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEBA60FDA
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 05:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEBA60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FED56E81C;
	Wed,  7 Jul 2021 05:06:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60F56E81C
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Jul 2021 05:06:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196406278"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="196406278"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 22:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="457348298"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2021 22:06:47 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Jul 2021 22:06:39 -0700
Message-Id: <20210707050645.31043-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707050645.31043-1-anusha.srivatsa@intel.com>
References: <20210707050645.31043-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/8] drm/i915/dmc: Use RUNTIME_INFO->step for DMC
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

Instead of adding new table for every new platform, lets ues
the stepping info from RUNTIME_INFO(dev_priv)->step
This patch uses RUNTIME_INFO->step only for recent
platforms.

Patches that follow this will address this change for
remaining platforms + missing platforms.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 61 +++++++++++++++++++++---
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index f8789d4543bf..a38720f25910 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -266,10 +266,12 @@ static const struct stepping_info icl_stepping_info[] = {
 };
 
 static const struct stepping_info no_stepping_info = { '*', '*' };
+struct stepping_info *display_step;
 
 static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *dev_priv)
 {
+	struct intel_step_info step = RUNTIME_INFO(dev_priv)->step;
 	const struct stepping_info *si;
 	unsigned int size;
 
@@ -282,15 +284,60 @@ intel_get_stepping_info(struct drm_i915_private *dev_priv)
 	} else if (IS_BROXTON(dev_priv)) {
 		size = ARRAY_SIZE(bxt_stepping_info);
 		si = bxt_stepping_info;
-	} else {
-		size = 0;
-		si = NULL;
 	}
 
-	if (INTEL_REVID(dev_priv) < size)
-		return si + INTEL_REVID(dev_priv);
-
-	return &no_stepping_info;
+	if (IS_ICELAKE(dev_priv) || IS_SKYLAKE(dev_priv) || IS_BROXTON(dev_priv))
+		return INTEL_REVID(dev_priv) < size ? si + INTEL_REVID(dev_priv) : &no_stepping_info;
+
+	else {
+		switch (step.display_step) {
+		case STEP_A0:
+			display_step->stepping = 'A';
+			display_step->substepping = '0';
+			break;
+		case STEP_A2:
+			display_step->stepping = 'A';
+			display_step->substepping = '2';
+			break;
+		case STEP_B0:
+			display_step->stepping = 'B';
+			display_step->substepping = '0';
+			break;
+		case STEP_B1:
+			display_step->stepping = 'B';
+			display_step->substepping = '1';
+			break;
+		case STEP_C0:
+			display_step->stepping = 'C';
+			display_step->substepping = '0';
+			break;
+		case STEP_D0:
+			display_step->stepping = 'D';
+			display_step->substepping = '0';
+			break;
+		case STEP_D1:
+			display_step->stepping = 'D';
+			display_step->substepping = '1';
+			break;
+		case STEP_E0:
+			display_step->stepping = 'E';
+			display_step->substepping = '0';
+			break;
+		case STEP_F0:
+			display_step->stepping = 'F';
+			display_step->substepping = '0';
+			break;
+		case STEP_G0:
+			display_step->stepping = 'G';
+			display_step->substepping = '0';
+			break;
+		default:
+			display_step->stepping = '*';
+			display_step->substepping = '*';
+			break;
+		}
+	}
+	return display_step;
 }
 
 static void gen9_set_dc_state_debugmask(struct drm_i915_private *dev_priv)
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
