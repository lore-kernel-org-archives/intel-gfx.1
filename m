Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E5BC4332B
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C32C64F26
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C32C64F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E983E6EEB2;
	Thu, 11 Mar 2021 22:36:56 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5616EE86
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 22:36:47 +0000 (UTC)
IronPort-SDR: EEPIblhfzmlWleEaZVYMwbb+nE4Hk7HP6dRcFSO7IWgQcVMLz086M/SsZF8J8K6OrPHkJpNkxl
 SMK9qbIXz3pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="250116438"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="250116438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:45 -0800
IronPort-SDR: X9f5ZN3jXUlY3Tx9OAtrVHIb9A6YO0obKWN8ctVAl9+L6RZVb7B34YyPIwnx3RYgPB28/KqyHR
 vLdVcLl5d67g==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="438852718"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:36:00 -0800
Message-Id: <20210311223632.3191939-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210311223632.3191939-1-matthew.d.roper@intel.com>
References: <20210311223632.3191939-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 24/56] drm/i915/adl_p: Add PCI Devices IDs
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

From: Clinton Taylor <Clinton.A.Taylor@intel.com>

Add 12 known PCI device IDs

Bspec: 55376
Cc: Caz Yokoyama <caz.yokoyama@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Clinton Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm/i915_pciids.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index ebd0dd1c35b3..6607b65e7ae2 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -645,4 +645,24 @@
 	INTEL_VGA_DEVICE(0x4692, info), \
 	INTEL_VGA_DEVICE(0x4693, info)
 
+/* ADL-P */
+#define INTEL_ADLP_IDS(info) \
+	INTEL_VGA_DEVICE(0x46A0, info), \
+	INTEL_VGA_DEVICE(0x46A1, info), \
+	INTEL_VGA_DEVICE(0x46A2, info), \
+	INTEL_VGA_DEVICE(0x46A3, info), \
+	INTEL_VGA_DEVICE(0x46A6, info), \
+	INTEL_VGA_DEVICE(0x46A8, info), \
+	INTEL_VGA_DEVICE(0x46AA, info), \
+	INTEL_VGA_DEVICE(0x462A, info), \
+	INTEL_VGA_DEVICE(0x4626, info), \
+	INTEL_VGA_DEVICE(0x4628, info), \
+	INTEL_VGA_DEVICE(0x46B0, info), \
+	INTEL_VGA_DEVICE(0x46B1, info), \
+	INTEL_VGA_DEVICE(0x46B2, info), \
+	INTEL_VGA_DEVICE(0x46B3, info), \
+	INTEL_VGA_DEVICE(0x46C0, info), \
+	INTEL_VGA_DEVICE(0x46C1, info), \
+	INTEL_VGA_DEVICE(0x46C2, info), \
+	INTEL_VGA_DEVICE(0x46C3, info)
 #endif /* _I915_PCIIDS_H */
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
