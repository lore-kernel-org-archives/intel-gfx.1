Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C143C2BC11
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C1E20E65
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C1E20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4996E595;
	Mon, 14 Sep 2020 20:25:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922686E58B
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 20:25:18 +0000 (UTC)
IronPort-SDR: xjrSaxQZUvMgs6D+uBjZ4RdxA2MJT++e6wGwA1Bzvi5c4AJqe9L3dEUI6aZOLDLnJMrRISqP1N
 HAMYQOImqi5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223340817"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="223340817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:18 -0700
IronPort-SDR: SEvPHkjdK7fpeSuackBju9q+QktRJuCzbGpXXYo/vu6Z8FjyhKQOmAlJ78kicynt2vi9RsYdZ/
 hWGyq9jtNs6g==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="306307206"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:14 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2020 02:30:46 +0530
Message-Id: <20200914210047.11972-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914210047.11972-1-uma.shankar@intel.com>
References: <20200914210047.11972-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v6 10/11] drm/i915/lspcon: Do not send DRM infoframes
 to non-HDMI sinks
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

Non-HDMI sinks shouldn't be sent Dynamic Range and Mastering infoframes.
Check for that when using LSPCON.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 8ce9bad4df91..81b3f4bdbe15 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3844,6 +3844,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum port port = encoder->port;
 
 	if (port == PORT_A && INTEL_GEN(dev_priv) < 9)
@@ -3851,7 +3852,14 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 
 	intel_edp_backlight_on(crtc_state, conn_state);
 	intel_psr_enable(intel_dp, crtc_state, conn_state);
-	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
+
+	if (dig_port->lspcon.active) {
+		if (dig_port->dp.has_hdmi_sink)
+			intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
+	} else {
+		intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
+	}
+
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
 	if (crtc_state->has_audio)
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
