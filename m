Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A79C28E83
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 04:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB2E20748
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 04:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB2E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBEB6EA71;
	Fri,  4 Sep 2020 04:30:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D816EA70;
 Fri,  4 Sep 2020 04:30:13 +0000 (UTC)
IronPort-SDR: XuyV2YR88IR3FR2hbpUQhgmb0grmDbFBe7QWnJV7xFMRI/6iOu5lLiumf72fCRQr3O0p9SQ2BS
 idKouMRWQsdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157699520"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="157699520"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:30:13 -0700
IronPort-SDR: C+2oKi4s+LIQBHeJ/exMJsk5W3sNa2O/t94KyIEMqgXkvOWxYXedxqTT4rsglWMGqvQGwqEEcB
 buSZ6EkAIaWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="447154740"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga004.jf.intel.com with ESMTP; 03 Sep 2020 21:30:12 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Fri,  4 Sep 2020 09:55:02 +0530
Message-Id: <1599193504-2754-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200723003627.31198-1-khaled.almahallawy@intel.com>
References: <20200723003627.31198-1-khaled.almahallawy@intel.com>
Subject: [Intel-gfx] [PATCH 1/3] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern
 2 and 3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Khaled Almahallawy <khaled.almahallawy@intel.com>

Add the missing CP2520 pattern 2 and 3 phy compliance patterns

v2: cosemtic changes

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com> (v1)
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 include/drm/drm_dp_helper.h     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index a3c82e726057..d0fb78c6aca6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1583,7 +1583,7 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 			return err;
 
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
 		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
 				       &data->hbr2_reset,
 				       sizeof(data->hbr2_reset));
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e2d2df5e869e..73285b4c25a0 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -708,7 +708,9 @@
 # define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
 # define DP_PHY_TEST_PATTERN_PRBS7          0x3
 # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
-# define DP_PHY_TEST_PATTERN_CP2520         0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT1    0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT2    0x6
+# define DP_PHY_TEST_PATTERN_CP2520_PAT3    0x7
 
 #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
 #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
