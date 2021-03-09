Return-Path: <SRS0=Dys0=IH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C249C433E9
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 04:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C43601FA
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 04:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3C43601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3296E8A9;
	Tue,  9 Mar 2021 04:48:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329026E8A9;
 Tue,  9 Mar 2021 04:48:47 +0000 (UTC)
IronPort-SDR: EmDziyfGOIEOpjTkZlimOaj1407IEhpZy9Vl7R//BFlXSeNdbVeCt200s1OVH6Nqs/UYd6yT59
 WRCARLy5mTIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184796088"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="184796088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:48:47 -0800
IronPort-SDR: lOVjO46bmJnEC/pa/Wc8t8OhA6pGseMUm/pQZQoAixNFvm2zQrGR5q6jzJry2yj00+eBefp04X
 fdHqcIGQoqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="376369265"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 20:48:45 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Mar 2021 10:09:15 +0530
Message-Id: <20210309043915.1921-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
References: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 3/3] drm/i915/display: Configure HDMI2.1 Pcon
 for FRL only if Src-Ctl mode is available
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Currently we see only the MAX FRL BW from PCON before going for FRL.
Also add the check if source control mode is supported by the
PCON, before starting configuring PCON for FRL training.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2e90359ce21f..8e401d3fd29d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2638,7 +2638,8 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
 	/* Always go for FRL training if supported */
-	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
+	if (!(intel_dp->dpcd[2] & DP_PCON_SOURCE_CTL_MODE) ||
+	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
 	    intel_dp->frl.is_trained)
 		return;
 
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
