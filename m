Return-Path: <SRS0=6TpN=DB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B48DC4363D
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2020 18:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A722344C
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2020 18:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A722344C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D166E487;
	Thu, 24 Sep 2020 18:45:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6A6E332
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2020 18:45:38 +0000 (UTC)
IronPort-SDR: +TYoyI6ueST0268xCiBBEBl7chQwlFxmv5tRwuRfy2xJ4tUpys5q7LOWrB01hcMqu8mXmvL0gj
 M/9AE4dGYoHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="161378266"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="161378266"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 11:45:37 -0700
IronPort-SDR: rmkr8NwbvRoX/m7XXVu9zUG+ALx+jVKF6afb6NWqJIfnP9ESWyd0StyypiPZYL9uDCL4nk5FLQ
 56ynb5XShHPA==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="347935781"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 24 Sep 2020 11:45:36 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2020 11:46:14 -0700
Message-Id: <20200924184624.20522-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v9 01/11] HAX to make DSC work on the icelake
 test system
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

DSC is available on the display emulator, but not set in DPCD.
Override the entries to allow bigjoiner testing.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 ++--
 include/drm/drm_dp_helper.h     | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 478dd51f738d..7f355c1c49c0 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1987,7 +1987,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
 			return 4;
 		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
+			return 4;
 		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
 			return 1;
 	} else {
@@ -2011,7 +2011,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
 			return 4;
 		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
+			return 4;
 		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
 			return 1;
 	}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index c9f2851904d0..42b91764bbad 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1449,6 +1449,7 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SI
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
+	return dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT];
 	return dsc_dpcd[DP_DSC_SUPPORT - DP_DSC_SUPPORT] &
 		DP_DSC_DECOMPRESSION_IS_SUPPORTED;
 }
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
