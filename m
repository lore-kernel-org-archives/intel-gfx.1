Return-Path: <SRS0=oyEe=LP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF34C48BE5
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 23:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC2360FE9
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 23:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC2360FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5946E44C;
	Mon, 21 Jun 2021 23:45:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053836E44C
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 23:45:17 +0000 (UTC)
IronPort-SDR: BkVcnfqf/JpOXwzDpV76iBoXY8E0pZXuioJm6HQBWaG0YF7VkwT2EOQe7wvnCOV9aAf2P5rMbv
 wL8JR5IL9RyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="186643976"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; d="scan'208";a="186643976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 16:45:17 -0700
IronPort-SDR: OkzhRLzjGeNhCfaeKXB3l0mN4BzJ1JD4PQBWFvt+L9KConBninRvRLlAC4Ph4cN7EN64N4FM/I
 M0bUdPHajBeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; d="scan'208";a="473582529"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2021 16:45:17 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 21 Jun 2021 16:45:15 -0700
Message-Id: <20210621234515.9433-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621234515.9433-1-anusha.srivatsa@intel.com>
References: <20210621234515.9433-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/firmware: Update to DMC v2.03 on
 RKL
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

Add support to load latest DMC version.
The Release Notes mentions that this version fixes
timeout issues.

Cc: Madhumitha Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 1d47f43ada51..45b7515e6a91 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -53,8 +53,8 @@ MODULE_FIRMWARE(ADLS_DMC_PATH);
 #define DG1_DMC_VERSION_REQUIRED	DMC_VERSION(2, 2)
 MODULE_FIRMWARE(DG1_DMC_PATH);
 
-#define RKL_DMC_PATH			DMC_PATH(rkl, 2, 02)
-#define RKL_DMC_VERSION_REQUIRED	DMC_VERSION(2, 2)
+#define RKL_DMC_PATH			DMC_PATH(rkl, 2, 03)
+#define RKL_DMC_VERSION_REQUIRED	DMC_VERSION(2, 3)
 MODULE_FIRMWARE(RKL_DMC_PATH);
 
 #define TGL_DMC_PATH			DMC_PATH(tgl, 2, 12)
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
