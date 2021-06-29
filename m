Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB4CC11F67
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B4061D5D
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B4061D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4186E8BB;
	Tue, 29 Jun 2021 23:21:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A546E8BB
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 23:20:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="206435601"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="206435601"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="476111784"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2021 16:20:57 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Jun 2021 16:20:49 -0700
Message-Id: <20210629232049.7584-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629232049.7584-1-anusha.srivatsa@intel.com>
References: <20210629232049.7584-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 2/2] drm/i915/dmc: Modify stepping/substepping
 table
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

Grab the stepping info from RUNTIME_INFO(dev_priv)->step
on the dmc side to grab the right blob.
Adding the helper intel_get_soc_info() that has SOC stepping
lookup table.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 113 ++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index f8789d4543bf..1b2e01adac48 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -266,14 +266,119 @@ static const struct stepping_info icl_stepping_info[] = {
 };
 
 static const struct stepping_info no_stepping_info = { '*', '*' };
+struct stepping_info *soc;
+
+static struct stepping_info *
+intel_get_soc_stepping(struct intel_step_info step)
+{
+
+	switch (step.soc_step) {
+		case STEP_A0:
+			soc->stepping = 'A';
+			soc->substepping = '0';
+			break;
+		case STEP_A2:
+			soc->stepping = 'A';
+			soc->substepping = '2';
+			break;
+		case STEP_B0:
+			soc->stepping = 'B';
+			soc->substepping = '0';
+			break;
+		case STEP_B1:
+			soc->stepping = 'B';
+			soc->substepping = '1';
+			break;
+		case STEP_B2:
+			soc->stepping = 'B';
+			soc->substepping = '2';
+			break;
+		case STEP_B10:
+			soc->stepping = 'B';
+			soc->substepping = 'A';
+			break;
+		case STEP_C0:
+			soc->stepping = 'C';
+			soc->substepping = '0';
+			break;
+		case STEP_D0:
+			soc->stepping = 'D';
+			soc->substepping = '0';
+			break;
+		case STEP_D1:
+			soc->stepping = 'D';
+			soc->substepping = '1';
+			break;
+		case STEP_E0:
+			soc->stepping = 'E';
+			soc->substepping = '0';
+			break;
+		case STEP_F0:
+			soc->stepping = 'F';
+			soc->substepping = '0';
+			break;
+		case STEP_G0:
+			soc->stepping = 'G';
+			soc->substepping = '0';
+			break;
+		case STEP_H0:
+			soc->stepping = 'H';
+			soc->substepping = '0';
+			break;
+		case STEP_H5:
+			soc->stepping = 'H';
+			soc->substepping = '5';
+			break;
+		case STEP_J0:
+			soc->stepping = 'J';
+			soc->substepping = '0';
+			break;
+		case STEP_J1:
+			soc->stepping = 'J';
+			soc->substepping = '1';
+			break;
+		case STEP_K0:
+			soc->stepping = 'K';
+			soc->substepping = '0';
+			break;
+		case STEP_P0:
+			soc->stepping = 'L';
+			soc->substepping = '0';
+			break;
+		case STEP_L0:
+			soc->stepping = 'P';
+			soc->substepping = '0';
+			break;
+		case STEP_Q0:
+			soc->stepping = 'Q';
+			soc->substepping = '0';
+			break;
+		case STEP_R0:
+			soc->stepping = 'R';
+			soc->substepping = '0';
+			break;
+		case STEP_Y0:
+			soc->stepping = 'Y';
+			soc->substepping = '0';
+			break;
+		default:
+			soc->stepping = '*';
+			soc->substepping = '*';
+			break;
+	}
+	return soc;
+}
 
 static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *dev_priv)
 {
 	const struct stepping_info *si;
+	struct intel_step_info step = RUNTIME_INFO(dev_priv)->step;
 	unsigned int size;
 
-	if (IS_ICELAKE(dev_priv)) {
+	if (DISPLAY_VER(dev_priv) >= 12) {
+		si = intel_get_soc_stepping(step);
+	} else if (IS_ICELAKE(dev_priv)) {
 		size = ARRAY_SIZE(icl_stepping_info);
 		si = icl_stepping_info;
 	} else if (IS_SKYLAKE(dev_priv)) {
@@ -287,10 +392,10 @@ intel_get_stepping_info(struct drm_i915_private *dev_priv)
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
