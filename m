Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE9FC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 12:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DF464E0F
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 12:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DF464E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C766E513;
	Wed, 17 Feb 2021 12:16:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB46E506
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 12:16:21 +0000 (UTC)
IronPort-SDR: tdvnbOeINMTRDm+8Y1CAtOJrENqMbRnkT2CgjcVL1bfqA7LiCrXCY0q4xrUQ3c5JU1zUDSs4i3
 1ffxedy6PC8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202396586"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202396586"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 04:16:21 -0800
IronPort-SDR: UXk+MlR0KaCqecGzWFdMjrEi06B6es8GDUiiLt3DsyYHmnUFOX3914D7+aTgAJw+TDLgja14ZU
 Jqp8DR8S8BiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="419077729"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2021 04:16:19 -0800
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Feb 2021 17:36:01 +0530
Message-Id: <20210217120601.12037-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210217120601.12037-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210217120601.12037-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH libdrm 2/2] intel: add INTEL_ADLS_IDS to the
 pciids list
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

This enables drm_intel_bufmgr on ADLS

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 intel/intel_chipset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/intel/intel_chipset.c b/intel/intel_chipset.c
index 439db3e5..8ec36f82 100644
--- a/intel/intel_chipset.c
+++ b/intel/intel_chipset.c
@@ -35,6 +35,7 @@ static const struct pci_device {
 	uint16_t gen;
 } pciids[] = {
 	/* Keep ids sorted by gen; latest gen first */
+	INTEL_ADLS_IDS(12),
 	INTEL_RKL_IDS(12),
 	INTEL_DG1_IDS(12),
 	INTEL_TGL_12_IDS(12),
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
