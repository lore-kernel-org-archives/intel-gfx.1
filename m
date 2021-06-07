Return-Path: <SRS0=wI8T=LB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8EBC47082
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 11:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3519B61107
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 11:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3519B61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EA06E34B;
	Mon,  7 Jun 2021 11:11:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE696E34B
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Jun 2021 11:11:19 +0000 (UTC)
IronPort-SDR: CJRwa0Zuf8EHgYr0IVqZeR9m93skgXGPJsIAuHNKRHWw/tOVg76Q11IF3RfrK0nP0M2/J0PIxt
 A5SknJtyLetA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="184971564"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="184971564"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 04:11:18 -0700
IronPort-SDR: wg+tIge6aXFoF7AVGiNT1HphQvkc/KaeofNfD/YJmFm57aFAU2BQE5Vpn/evS44od06UI9E3BN
 fSiLqcrFBO3A==
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="401646642"
Received: from vandita-desktop.iind.intel.com ([10.223.74.52])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Jun 2021 04:11:16 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  7 Jun 2021 16:23:42 +0530
Message-Id: <20210607105342.13155-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a
MIME-Version: 1.0
Subject: [Intel-gfx] [v2] drm/i915/dsc: Fix bigjoiner check in dsc_disable
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This change takes care of resetting the dss_ctl registers
in case of dsc_disable, bigjoiner disable and also
uncompressed joiner disable.

v2: Fix formatting

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Fixes: d961eb20adb6 (drm/i915/bigjoiner: atomic commit changes for uncompressed joiner)
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3537
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 19cd9531c115..b9828852a68f 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -1161,12 +1161,12 @@ void intel_dsc_disable(const struct intel_crtc_state *old_crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
-	if (!(old_crtc_state->dsc.compression_enable &&
-	      old_crtc_state->bigjoiner))
-		return;
-
-	intel_de_write(dev_priv, dss_ctl1_reg(old_crtc_state), 0);
-	intel_de_write(dev_priv, dss_ctl2_reg(old_crtc_state), 0);
+	/* Disable only if either of them is enabled */
+	if (old_crtc_state->dsc.compression_enable ||
+	    old_crtc_state->dsc.compression_enable) {
+		intel_de_write(dev_priv, dss_ctl1_reg(old_crtc_state), 0);
+		intel_de_write(dev_priv, dss_ctl2_reg(old_crtc_state), 0);
+	}
 }
 
 void intel_uncompressed_joiner_get_config(struct intel_crtc_state *crtc_state)
-- 
2.21.0.5.gaeb582a

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
