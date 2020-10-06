Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055AFC4363D
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 11:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16BF2080A
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 11:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16BF2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9A86E1A4;
	Tue,  6 Oct 2020 11:54:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68F6E1A4
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 11:54:07 +0000 (UTC)
IronPort-SDR: LhL6qpjwJL+kl2YgWxyMOVRkSUyux3EiJlQmkkMwwYL0o+FS4+RNW5zfqCKOCY3ARoNbOvDjZi
 3M98VVEKtyKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161067240"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161067240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 04:54:05 -0700
IronPort-SDR: +snQ5TAS/elkjANnwL3vxS7vGiUUmoWEmpSUKlsllW7q+VCXQaa2N85mhPfcdOY3hxd6wLQS5B
 WxKwugLzDTLw==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527320443"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 04:54:04 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 14:53:59 +0300
Message-Id: <20201006115401.1521958-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/3] drm/i915/cnl: Handle incorrect divider
 values during WRPLL HW readout
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

Add the MISSING_CASE() for the p0, p2 decoding during WRPLL HW readout
and move the corresponding check for p1 next to where it's read out.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 2cc0e84e41ea..27a8c281382c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -2662,6 +2662,8 @@ static int __cnl_ddi_wrpll_get_freq(struct drm_i915_private *dev_priv,
 	else
 		p1 = 1;
 
+	if (drm_WARN_ON(&dev_priv->drm, p1 == 0))
+		return 0;
 
 	switch (p0) {
 	case DPLL_CFGCR1_PDIV_2:
@@ -2676,6 +2678,9 @@ static int __cnl_ddi_wrpll_get_freq(struct drm_i915_private *dev_priv,
 	case DPLL_CFGCR1_PDIV_7:
 		p0 = 7;
 		break;
+	default:
+		MISSING_CASE(p0);
+		return 0;
 	}
 
 	switch (p2) {
@@ -2688,6 +2693,9 @@ static int __cnl_ddi_wrpll_get_freq(struct drm_i915_private *dev_priv,
 	case DPLL_CFGCR1_KDIV_3:
 		p2 = 3;
 		break;
+	default:
+		MISSING_CASE(p2);
+		return 0;
 	}
 
 	dco_freq = (pll_state->cfgcr0 & DPLL_CFGCR0_DCO_INTEGER_MASK) *
@@ -2701,9 +2709,6 @@ static int __cnl_ddi_wrpll_get_freq(struct drm_i915_private *dev_priv,
 
 	dco_freq += (dco_fraction * ref_clock) / 0x8000;
 
-	if (drm_WARN_ON(&dev_priv->drm, p0 == 0 || p1 == 0 || p2 == 0))
-		return 0;
-
 	return dco_freq / (p0 * p1 * p2 * 5);
 }
 
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
