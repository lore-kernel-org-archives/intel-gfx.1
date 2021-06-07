Return-Path: <SRS0=wI8T=LB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A2BC47094
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 14:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C7960FEA
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0C7960FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F566E8E1;
	Mon,  7 Jun 2021 14:21:33 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E806E8E1
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Jun 2021 14:21:31 +0000 (UTC)
IronPort-SDR: F+6I6TlnSXk7fQLx57CPM6vxRIgre+NfbPKqu0ivTTTN2o3afXBpE9NaGLWNGFBbCG7NOPmImw
 Aw04RZ3UePJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184999914"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="184999914"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 07:21:29 -0700
IronPort-SDR: NmYoNkimBiei+r4083534GEFvKXdRoyDZ7s6x5DfwLVgIjmmdhFPgjH9T9pkKNt4wwBc4ETBtG
 OHdXbH5RMP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="476223411"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2021 07:21:27 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org,
	mahesh.meena@intel.com
Date: Mon,  7 Jun 2021 19:42:16 +0530
Message-Id: <20210607141216.391305-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH V2] x86/gpu: add JasperLake to gen11 early quirks
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

Let's reserve JSL stolen memory for graphics.

JasperLake is a gen11 platform which is compatible with
ICL/EHL changes.

V1:
    - Added Cc: x86@kernel.org

Cc: x86@kernel.org
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 arch/x86/kernel/early-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirks.c
index b553ffe9b985..38837dad46e6 100644
--- a/arch/x86/kernel/early-quirks.c
+++ b/arch/x86/kernel/early-quirks.c
@@ -549,6 +549,7 @@ static const struct pci_device_id intel_early_ids[] __initconst = {
 	INTEL_CNL_IDS(&gen9_early_ops),
 	INTEL_ICL_11_IDS(&gen11_early_ops),
 	INTEL_EHL_IDS(&gen11_early_ops),
+	INTEL_JSL_IDS(&gen11_early_ops),
 	INTEL_TGL_12_IDS(&gen11_early_ops),
 	INTEL_RKL_IDS(&gen11_early_ops),
 	INTEL_ADLS_IDS(&gen11_early_ops),
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
