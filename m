Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96D7C2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 06:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA5C2075F
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 06:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA5C2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231E6E51C;
	Wed, 30 Sep 2020 06:43:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6056E50C
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 06:42:53 +0000 (UTC)
IronPort-SDR: 9cgUUhneeSdQcGyHSV/G9ncL/nzLmlz7emhylWY3Odq9ZbQH4KbyQeHWLYtlLYIlL62vzzAfDb
 SXW6RGVYeGFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="142387774"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="142387774"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 23:42:53 -0700
IronPort-SDR: cyBkGixgo1ic8SY0oDjK+Pw3LOqyoUWRFhHeedgDfLtVdFAzgudcqEHb2nJgiszzOBn6MOwDUD
 Ts4lDzpWpZtg==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="312487757"
Received: from cdgarci1-mobl1.amr.corp.intel.com (HELO
 ldmartin-desk1.intel.com) ([10.213.164.152])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 23:42:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 23:42:29 -0700
Message-Id: <20200930064234.85769-20-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930064234.85769-1-lucas.demarchi@intel.com>
References: <20200930064234.85769-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 19/24] drm/i915/dg1: enable PORT C/D aka D/E
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

For DG1 we have a little of mix up wrt to DDI/port names and indexes.
Bspec refers to the ports as DDIA, DDIB, DDI USBC1 and DDI USBC2
(besides the DDIA, DDIB, DDIC, DDID), but the previous naming is the
most unambiguous one. This means that for any register on Display Engine
we should use the index of A, B, D and E. However in some places this is
not true:

- VBT: uses C and D and have to be mapped to D/E

- IO/Combo: uses C and D, but we already differentiate those when
  we created the phy vs port distinction.

Ths additional mapping for VBT and phy are already covered in previous
patches, so now we can initialize the DDI as D/E.

Cc: Clinton Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 43fe5867a8ae..6a63fb0136d4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7332,10 +7332,7 @@ bool intel_phy_is_combo(struct drm_i915_private *dev_priv, enum phy phy)
 {
 	if (phy == PHY_NONE)
 		return false;
-	else if (IS_DG1(dev_priv))
-		/* FIXME: Enable only two ports for now */
-		return phy <= PHY_B;
-	else if (IS_ROCKETLAKE(dev_priv))
+	else if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
 		return phy <= PHY_D;
 	else if (IS_ELKHARTLAKE(dev_priv))
 		return phy <= PHY_C;
@@ -7359,7 +7356,7 @@ bool intel_phy_is_tc(struct drm_i915_private *dev_priv, enum phy phy)
 
 enum phy intel_port_to_phy(struct drm_i915_private *i915, enum port port)
 {
-	if (IS_ROCKETLAKE(i915) && port >= PORT_D)
+	if ((IS_DG1(i915) || IS_ROCKETLAKE(i915)) && port >= PORT_D)
 		return (enum phy)port - 1;
 	else if (IS_ELKHARTLAKE(i915) && port == PORT_D)
 		return PHY_A;
@@ -17128,9 +17125,18 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		return;
 
 	if (IS_DG1(dev_priv)) {
-		/* FIXME: Enable only two ports for now */
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
+
+		/*
+		 * Bspec lists the ports as A, B, C (USBC1) and D (USBC2).
+		 * However from the Display Engine perspective all registers are
+		 * actually wired to handle C and D as offsets of D/E. Instead
+		 * of fighting all our macros for handling them specially for
+		 * DG1, just call them D/E
+		 */
+		intel_ddi_init(dev_priv, PORT_D);
+		intel_ddi_init(dev_priv, PORT_E);
 	} else if (IS_ROCKETLAKE(dev_priv)) {
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
