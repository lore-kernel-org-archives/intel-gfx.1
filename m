Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852DBC2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 06:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FB92075F
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 06:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46FB92075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4056E51B;
	Wed, 30 Sep 2020 06:42:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67D86E509
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 06:42:50 +0000 (UTC)
IronPort-SDR: ZQxrasPKMEJIO1Sz1j+XjrhZvI9l7Uy3QjbHT5LdKEXidxUMghQvHmQIbT5bHFSS1/yDnr3Kww
 e1hZtzjDDgsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="142387767"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="142387767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 23:42:50 -0700
IronPort-SDR: Lsfm8h54CqWpSab5hnDBWcKey1nP1NxRVBz1u3z/f10nHFKKKe3yi7j8Sq3P3SJ5tQbr3CFeg5
 y7Bk+E61y89A==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="312487736"
Received: from cdgarci1-mobl1.amr.corp.intel.com (HELO
 ldmartin-desk1.intel.com) ([10.213.164.152])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 23:42:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 23:42:24 -0700
Message-Id: <20200930064234.85769-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930064234.85769-1-lucas.demarchi@intel.com>
References: <20200930064234.85769-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 14/24] drm/i915/dg1: Don't program PHY_MISC
 for PHY-C and PHY-D
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

The only bit we use in PHY_MISC is DE_IO_COMP_PWR_DOWN, and the bspec
details for that bit tell us that it need only be set for PHY-A and
PHY-B.  It also turns out that there isn't even an instance of the
PHY_MISC register for PHY-D on this platform.  Let's extend the EHL/RKL
logic that conditionally skips PHY_MISC usage to DG1 as well.

Bspec: 50107
Cc: Aditya Swarup <aditya.swarup@intel.com>
Cc: Clinton Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_combo_phy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 157d8c8c605a..07c9fa2fb835 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -189,7 +189,8 @@ static bool has_phy_misc(struct drm_i915_private *i915, enum phy phy)
 	 * other combo PHY's.
 	 */
 	if (IS_ELKHARTLAKE(i915) ||
-	    IS_ROCKETLAKE(i915))
+	    IS_ROCKETLAKE(i915) ||
+	    IS_DG1(i915))
 		return phy < PHY_C;
 
 	return true;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
