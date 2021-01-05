Return-Path: <SRS0=Zd9y=GI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9032FC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 05:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4043322257
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 05:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4043322257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D28689E33;
	Tue,  5 Jan 2021 05:29:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE889E33
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Jan 2021 05:29:27 +0000 (UTC)
IronPort-SDR: 9fI4G/WUmuZ0vVIDIdYlmly/bOc2xU56whmhfqBTC2HXJl8ZFks6AhGMVJlz6boKu0IAju5r+t
 NoUPDq2JqxjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="164756389"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="164756389"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 21:29:26 -0800
IronPort-SDR: pLbg5yftgVh1amxmUAW/DbAxJ+3PclxN54eAsy7mQal4j53fCdgOAwLq25LDjTP7jKrTcsR+Sj
 xoEKpQWD/Syg==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="421642571"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 21:29:24 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  5 Jan 2021 10:43:53 +0530
Message-Id: <20210105051353.5714-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC] drm/i915/pps: Add PPS power domain
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

It abstracts getting the AUX power domain in pps_lock under
PPS power domain. This makes sure that the platforms which really
requires AUX power in order to access PPS registers will get the
reference to necessary power wells.

PPS power domain requires only to track the AUX_A associated
power wells as the platforms need AUX power in order to access PPS
registers supports eDP only on PORT_A.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 3 +--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index d52374f01316..1dc4ca9e5d1a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -107,6 +107,8 @@ intel_display_power_domain_str(enum intel_display_power_domain domain)
 		return "VGA";
 	case POWER_DOMAIN_AUDIO:
 		return "AUDIO";
+	case POWER_DOMAIN_PPS:
+		return "PPS";
 	case POWER_DOMAIN_AUX_A:
 		return "AUX_A";
 	case POWER_DOMAIN_AUX_B:
@@ -2651,11 +2653,13 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 	BIT_ULL(POWER_DOMAIN_GT_IRQ) |			\
 	BIT_ULL(POWER_DOMAIN_MODESET) |			\
 	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
+	BIT_ULL(POWER_DOMAIN_PPS) |			\
 	BIT_ULL(POWER_DOMAIN_GMBUS) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 #define BXT_DPIO_CMN_A_POWER_DOMAINS (			\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_A_LANES) |		\
 	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
+	BIT_ULL(POWER_DOMAIN_PPS) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 #define BXT_DPIO_CMN_BC_POWER_DOMAINS (			\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_B_LANES) |		\
@@ -2688,6 +2692,7 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 #define GLK_DPIO_CMN_A_POWER_DOMAINS (			\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_A_LANES) |		\
 	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
+	BIT_ULL(POWER_DOMAIN_PPS) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 #define GLK_DPIO_CMN_B_POWER_DOMAINS (			\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_B_LANES) |		\
@@ -2700,6 +2705,7 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 #define GLK_DISPLAY_AUX_A_POWER_DOMAINS (		\
 	BIT_ULL(POWER_DOMAIN_AUX_A) |		\
 	BIT_ULL(POWER_DOMAIN_AUX_IO_A) |		\
+	BIT_ULL(POWER_DOMAIN_PPS) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 #define GLK_DISPLAY_AUX_B_POWER_DOMAINS (		\
 	BIT_ULL(POWER_DOMAIN_AUX_B) |		\
@@ -2712,6 +2718,7 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 	BIT_ULL(POWER_DOMAIN_GT_IRQ) |			\
 	BIT_ULL(POWER_DOMAIN_MODESET) |			\
 	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
+	BIT_ULL(POWER_DOMAIN_PPS) |			\
 	BIT_ULL(POWER_DOMAIN_GMBUS) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index bc30c479be53..7642be3c8e2e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -55,6 +55,7 @@ enum intel_display_power_domain {
 	POWER_DOMAIN_PORT_OTHER,
 	POWER_DOMAIN_VGA,
 	POWER_DOMAIN_AUDIO,
+	POWER_DOMAIN_PPS,
 	POWER_DOMAIN_AUX_A,
 	POWER_DOMAIN_AUX_B,
 	POWER_DOMAIN_AUX_C,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8a00e609085f..0e6e5e2d873e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -895,8 +895,7 @@ pps_lock(struct intel_dp *intel_dp)
 	 * See intel_power_sequencer_reset() why we need
 	 * a power domain reference here.
 	 */
-	wakeref = intel_display_power_get(dev_priv,
-					  intel_aux_power_domain(dp_to_dig_port(intel_dp)));
+	wakeref = intel_display_power_get(dev_priv, POWER_DOMAIN_PPS);
 
 	mutex_lock(&dev_priv->pps_mutex);
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
