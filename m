Return-Path: <SRS0=c+lk=PH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383E3C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 15:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0942660FDA
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 15:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0942660FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4E6EAC1;
	Tue, 19 Oct 2021 15:14:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9476EB21
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Oct 2021 15:14:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215709336"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="215709336"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:14:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="494143607"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:14:17 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, matthew.d.roper@intel.com,
 ville.syrjala@linux.intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Date: Tue, 19 Oct 2021 20:44:35 +0530
Message-Id: <20211019151435.20477-5-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019151435.20477-1-vandita.kulkarni@intel.com>
References: <20211019151435.20477-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [V2 4/4] drm/i915/dsi: Ungate clock before enabling the
 phy
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

For the PHY enable/disable signalling to propagate
between Dispaly and PHY, DDI clocks need to be running when
enabling the PHY.

Bspec: 49188 says gate the clocks after enabling the
       DDI Buffer.
       We also have a commit 991d9557b0c4 ("drm/i915/tgl/dsi: Gate the ddi
       clocks after pll mapping") which gates the clocks much before,
       as per the older spec. This commit nullifies its effect and makes
       sure that the clocks are not gated while we enable the DDI
       buffer.
v2: Bspec ref, add a comment wrt earlier clock gating sequence (Jani)

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 63dd75c6448a..e5ef5c4a32d7 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1135,8 +1135,6 @@ static void
 gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-
 	/* step 4a: power up all lanes of the DDI used by DSI */
 	gen11_dsi_power_up_lanes(encoder);
 
@@ -1146,6 +1144,8 @@ gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
 	/* step 4c: configure voltage swing and skew */
 	gen11_dsi_voltage_swing_program_seq(encoder);
 
+	gen11_dsi_ungate_clocks(encoder);
+
 	/* enable DDI buffer */
 	gen11_dsi_enable_ddi_buffer(encoder);
 
@@ -1161,9 +1161,7 @@ gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
 	/* Step (4h, 4i, 4j, 4k): Configure transcoder */
 	gen11_dsi_configure_transcoder(encoder, crtc_state);
 
-	/* Step 4l: Gate DDI clocks */
-	if (DISPLAY_VER(dev_priv) == 11)
-		gen11_dsi_gate_clocks(encoder);
+	gen11_dsi_gate_clocks(encoder);
 }
 
 static void gen11_dsi_powerup_panel(struct intel_encoder *encoder)
-- 
2.32.0

