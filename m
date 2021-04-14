Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED94C433B4
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D15611C9
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 15:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D15611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4BE6E955;
	Wed, 14 Apr 2021 15:52:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BDE6E955
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 15:52:19 +0000 (UTC)
IronPort-SDR: elWonJkwHrETsSL1xryB+d2xuDEuHcygQ2MKZX6Wb4x41WfYsH8Yi2sJsgMAxbypFzdE09LPlO
 nlJaucSRvlVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="181791623"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="181791623"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:52:15 -0700
IronPort-SDR: 3e3ond97RNkleeRqiIB2OEF+yvys4xll8Xy29A58L6dnNYhAL1HUhiP0CphbKU4MpENV3PQ/VQ
 w1kmlEVdhixw==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="399226516"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:52:13 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Apr 2021 18:51:59 +0300
Message-Id: <20210414155208.3161335-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414155208.3161335-1-imre.deak@intel.com>
References: <20210414155208.3161335-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 02/11] drm/i915/xelpd: add XE_LPD display
 characteristics
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

From: Matt Roper <matthew.d.roper@intel.com>

Let's start preparing for upcoming platforms that will use an XE_LPD
design.

v2:
 - Use the now-preferred "XE_LPD" term to refer to this design
 - Utilize DISPLAY_VER() rather than a feature flag
 - Drop unused mbus_size field (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 44e7b94db63dc..40b58a6dc3193 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -939,6 +939,16 @@ static const struct intel_device_info adl_s_info = {
 	.dma_mask_size = 46,
 };
 
+#define XE_LPD_FEATURES \
+	.display.ver = 13,						\
+	.display.has_psr_hw_tracking = 0,				\
+	.abox_mask = GENMASK(1, 0),					\
+	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D), \
+	.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |	\
+		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),			\
+	.ddb_size = 4096,						\
+	.num_supported_dbuf_slices = 4
+
 #undef GEN
 #undef PLATFORM
 
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
