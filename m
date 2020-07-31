Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADBBC433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 12:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7548322CAF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 12:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7548322CAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A9B6EA73;
	Fri, 31 Jul 2020 12:04:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D098B6EA6F
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 12:04:32 +0000 (UTC)
IronPort-SDR: IUmQ9NaWXY6mXmAb8Yza9bnx8ugVlXfSXBFf7b42E4yqbqHCpa/jpw5x2+UES9kjhaTfvhkqbq
 M5/eZjA8qLBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="216218214"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="216218214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 05:04:32 -0700
IronPort-SDR: jn8Pa3alFGxC2wDixcfKX9ORV4MvSYhcbkEyOY8UujomLE/pKhcwDn2mNxqALumdRbG/haOSMy
 DcFzVDbVUDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="273188211"
Received: from anusha.jf.intel.com ([10.165.21.155])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2020 05:04:32 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 31 Jul 2020 04:50:15 -0700
Message-Id: <20200731115015.19706-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200731115015.19706-1-anusha.srivatsa@intel.com>
References: <20200731115015.19706-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/dmc: Load DMC firmware v2.02 for
 Rocket Lake
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

The latest firmware contains fix for PSR2 power saving.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/drm/i915/display/intel_csr.c
index eb74eb123148..b6d0ce627d07 100644
--- a/drivers/gpu/drm/i915/display/intel_csr.c
+++ b/drivers/gpu/drm/i915/display/intel_csr.c
@@ -40,8 +40,8 @@
 
 #define GEN12_CSR_MAX_FW_SIZE		ICL_CSR_MAX_FW_SIZE
 
-#define RKL_CSR_PATH			"i915/rkl_dmc_ver2_01.bin"
-#define RKL_CSR_VERSION_REQUIRED	CSR_VERSION(2, 1)
+#define RKL_CSR_PATH			"i915/rkl_dmc_ver2_02.bin"
+#define RKL_CSR_VERSION_REQUIRED	CSR_VERSION(2, 2)
 MODULE_FIRMWARE(RKL_CSR_PATH);
 
 #define TGL_CSR_PATH			"i915/tgl_dmc_ver2_07.bin"
-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
