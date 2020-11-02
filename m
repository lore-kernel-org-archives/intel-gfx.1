Return-Path: <SRS0=yb3L=EI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2218C00A89
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 21:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A75520665
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 21:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A75520665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814016E3CE;
	Mon,  2 Nov 2020 21:17:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631E6E3CE
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2020 21:17:09 +0000 (UTC)
IronPort-SDR: 3Sw6/2mH2jpUQvg2W64eXwpEFbBw3FypUTP20enr6953byo0yLR7HLNsGdJSjYDnfs2kjBtani
 ZpE0U5D3QxdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="156733398"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="156733398"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 13:17:08 -0800
IronPort-SDR: yAZk8i+QmxZdLul+kkQxk67o5B2Nj+9efQweWtp2Ll85esEgBr/b9SGBT/FxddzojktAQo0wyQ
 iyAOknYLYgPg==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="528153821"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Nov 2020 13:17:08 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  2 Nov 2020 13:19:02 -0800
Message-Id: <20201102211906.4893-2-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201102211906.4893-1-manasi.d.navare@intel.com>
References: <20201102211906.4893-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v5 2/6] drm/i915: Move encoder->get_config to a
 new function
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

No functional changes, create a separate intel_encoder_get_config()
function that calls encoder->get_config hook.
This is needed so that later we can add beigjoienr related
readout here.

Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cddbda5303ff..e9fbcfe1649e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8222,6 +8222,12 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 		       pfit_w * pfit_h);
 }
 
+static void intel_encoder_get_config(struct intel_encoder *encoder,
+				     struct intel_crtc_state *crtc_state)
+{
+	encoder->get_config(encoder, crtc_state);
+}
+
 static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
@@ -12475,7 +12481,7 @@ intel_encoder_current_mode(struct intel_encoder *encoder)
 		return NULL;
 	}
 
-	encoder->get_config(encoder, crtc_state);
+	intel_encoder_get_config(encoder, crtc_state);
 
 	intel_mode_from_pipe_config(mode, crtc_state);
 
@@ -14520,7 +14526,7 @@ verify_crtc_state(struct intel_crtc *crtc,
 				pipe_name(pipe));
 
 		if (active)
-			encoder->get_config(encoder, pipe_config);
+			intel_encoder_get_config(encoder, pipe_config);
 	}
 
 	intel_crtc_compute_pixel_rate(pipe_config);
@@ -18835,7 +18841,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 			crtc_state = to_intel_crtc_state(crtc->base.state);
 
 			encoder->base.crtc = &crtc->base;
-			encoder->get_config(encoder, crtc_state);
+			intel_encoder_get_config(encoder, crtc_state);
 			if (encoder->sync_state)
 				encoder->sync_state(encoder, crtc_state);
 		} else {
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
