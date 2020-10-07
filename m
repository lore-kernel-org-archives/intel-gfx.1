Return-Path: <SRS0=Us3n=DO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7108EC3279D
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2020 00:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3999A20739
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2020 00:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3999A20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249C26E843;
	Wed,  7 Oct 2020 00:22:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3D16E83A
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 00:22:31 +0000 (UTC)
IronPort-SDR: CcE8njapi/L8ZMPONqtHnyI6Tubgo/YsINXjc2i4XIp5g6jcqOMoUWKXm4CqHYUXSGrOYfhMoI
 BsGgJvx9qWXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="162142911"
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="162142911"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 17:22:29 -0700
IronPort-SDR: K+CeAtMX8Jcf8E0SWLTN9wL/vrLeXWRojD8qvvwMBG1ZEguW0SHa6PxoMWSVznLHmaWUNxXDEY
 VJT8yEQdIVwQ==
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="527687772"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 17:22:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 17:22:10 -0700
Message-Id: <20201007002210.3678024-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007002210.3678024-1-lucas.demarchi@intel.com>
References: <20201007002210.3678024-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 8/8] drm/i915/dg1: provide port/phy mapping for vbt
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

As with RKL, DG1's VBT outputs are indexed according to PHY rather than
DDI.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 23bf21ee58ea..5804eb9faf24 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1675,7 +1675,7 @@ static enum port dvo_port_to_port(struct drm_i915_private *dev_priv,
 		[PORT_E] = { DVO_PORT_HDMID, DVO_PORT_DPD, -1 },
 	};
 
-	if (IS_ROCKETLAKE(dev_priv))
+	if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
 		return __dvo_port_to_port(ARRAY_SIZE(rkl_port_mapping),
 					  ARRAY_SIZE(rkl_port_mapping[0]),
 					  rkl_port_mapping,
@@ -2640,10 +2640,12 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *dev_priv,
 		aux_ch = AUX_CH_B;
 		break;
 	case DP_AUX_C:
-		aux_ch = IS_ROCKETLAKE(dev_priv) ? AUX_CH_D : AUX_CH_C;
+		aux_ch = (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv)) ?
+			AUX_CH_D : AUX_CH_C;
 		break;
 	case DP_AUX_D:
-		aux_ch = IS_ROCKETLAKE(dev_priv) ? AUX_CH_E : AUX_CH_D;
+		aux_ch = (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv)) ?
+			AUX_CH_E : AUX_CH_D;
 		break;
 	case DP_AUX_E:
 		aux_ch = AUX_CH_E;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
