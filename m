Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7A3C433E6
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 06:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DC364F47
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 06:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DC364F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860E6EC84;
	Thu,  4 Feb 2021 06:58:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994886EC83;
 Thu,  4 Feb 2021 06:58:38 +0000 (UTC)
IronPort-SDR: WJdadNrG1/8HSirXxCIFM44w9D2D5WoslG2B6SYrbERG/XAoysXuMoL0GPjsmddtw/XlhkVb2I
 ocHpm6e8Fafg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160942387"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="160942387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 22:58:38 -0800
IronPort-SDR: lHA3rsA2V8gxbK7PcUNXgGM8MhSmXvQLl5YQrsVcdEVI4CqVy7/j8gDyHCNsRYXPgGfhH36M6b
 DnvSZrXB8jIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="483086897"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 22:58:36 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Feb 2021 12:18:40 +0530
Message-Id: <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/3] i915/display/intel_dp: Read PCON DSC ENC
 caps only for DPCD rev >= 1.4
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

DP-HDMI2.1 PCON has DSC encoder caps defined in registers 0x92-0x9E.
Do not read the registers if DPCD rev < 1.4.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/2868
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8c12d5375607..2b83f0f433a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2489,9 +2489,11 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
 	/* Clear the cached register set to avoid using stale values */
-
 	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
 
+	if (intel_dp->dpcd[DP_DPCD_REV] < 0x14)
+		return;
+
 	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
 			     intel_dp->pcon_dsc_dpcd,
 			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
