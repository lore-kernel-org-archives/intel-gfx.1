Return-Path: <SRS0=KPZb=HM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD26C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 11:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9E964E0B
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 11:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9E964E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D06B6EC6C;
	Wed, 10 Feb 2021 11:53:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CAF6EC6C;
 Wed, 10 Feb 2021 11:53:22 +0000 (UTC)
IronPort-SDR: BtoO9heJE18WfzptWVx1evsI0femV835eBlRtv8jVahRYA5X0VHbvkXnG0V2fNogwGZ8fiARaF
 q1D5aK6eLgog==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161809538"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="161809538"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 03:53:22 -0800
IronPort-SDR: Y9aj8tTgjFlF0gwunqvNJUtWWvhLeDfd+TAXhZeBjlqPmmrHSq4K169/qhl1+wB37P+lWAB0Mb
 rv6pjBeV9CHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="413696568"
Received: from anand-nuc8i7beh.iind.intel.com ([10.145.162.17])
 by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2021 03:53:20 -0800
From: Anand Moon <anandx.ram.moon@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed, 10 Feb 2021 17:24:41 +0530
Message-Id: <20210210115441.6703-1-anandx.ram.moon@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/adl_s: Add gmbus pin mapping
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
Cc: Anand Moon <anandx.ram.moon@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Add table to map the GMBUS pin pairs to GPIO registers and port to DDC
mapping for ADL_S as per below Bspec.

Bspec:20124, 53597.

Cc: Aditya Swarup <aditya.swarup@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 0c952e1d720e..58b8e42d4f90 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -52,6 +52,14 @@ static const struct gmbus_pin gmbus_pins[] = {
 	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
 };
 
+static const struct gmbus_pin gmbus_pins_adls[] = {
+	[GMBUS_PIN_1_BXT] = { "edp", GPIOA },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOD },
+	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOE },
+	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOF },
+	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOG },
+};
+
 static const struct gmbus_pin gmbus_pins_bdw[] = {
 	[GMBUS_PIN_VGADDC] = { "vga", GPIOA },
 	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
@@ -101,7 +109,9 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {
 static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
 					     unsigned int pin)
 {
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
+	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)
+		return &gmbus_pins_adls[pin];
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		return &gmbus_pins_dg1[pin];
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		return &gmbus_pins_icp[pin];
@@ -122,7 +132,9 @@ bool intel_gmbus_is_valid_pin(struct drm_i915_private *dev_priv,
 {
 	unsigned int size;
 
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
+	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)
+		size = ARRAY_SIZE(gmbus_pins_adls);
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		size = ARRAY_SIZE(gmbus_pins_dg1);
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		size = ARRAY_SIZE(gmbus_pins_icp);
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
