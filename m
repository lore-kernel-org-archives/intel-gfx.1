Return-Path: <SRS0=W/nN=E7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DEEC5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 07:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF1C20857
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 07:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF1C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF286E832;
	Wed, 25 Nov 2020 07:23:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9276E832
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 07:23:54 +0000 (UTC)
IronPort-SDR: U95o7s6K3H2ZKk1jB8FT18J9O4tmWUT9Cug4JAGZNBwOr6t0P7CGITDEzgRElA1ne8cx4MVW/O
 OQU/mv83XJYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172179804"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; d="scan'208";a="172179804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 23:23:54 -0800
IronPort-SDR: b9qBCibGN8GVe1JxYg+QZsKclRpOCeAt9G+GsRdQfuKqUWoouO7kPak2+6AfE/9W8pGevVS3nx
 nWj4PpL+3QRw==
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; d="scan'208";a="313542189"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 24 Nov 2020 23:23:53 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 24 Nov 2020 23:26:34 -0800
Message-Id: <20201125072634.27664-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/dp: No need to poll FEC Enable Live bit
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

The Bspec does not mention polling the FEC Enable
Live status bit. That is only there for debug purposes.
So remove the polling from driver.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 92940a0c5ef8..6b3edd7e4423 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3507,12 +3507,6 @@ static void intel_ddi_enable_fec(struct intel_encoder *encoder,
 	val = intel_de_read(dev_priv, dp_tp_ctl_reg(encoder, crtc_state));
 	val |= DP_TP_CTL_FEC_ENABLE;
 	intel_de_write(dev_priv, dp_tp_ctl_reg(encoder, crtc_state), val);
-
-	if (intel_de_wait_for_set(dev_priv,
-				  dp_tp_status_reg(encoder, crtc_state),
-				  DP_TP_STATUS_FEC_ENABLE_LIVE, 1))
-		drm_err(&dev_priv->drm,
-			"Timed out waiting for FEC Enable Status\n");
 }
 
 static void intel_ddi_disable_fec_state(struct intel_encoder *encoder,
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
