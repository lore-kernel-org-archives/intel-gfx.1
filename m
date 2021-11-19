Return-Path: <SRS0=Vy2F=QG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E7C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 06:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F189D61154
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 06:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F189D61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561A66EA26;
	Fri, 19 Nov 2021 06:33:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518086EA13
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Nov 2021 06:33:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="297783321"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="297783321"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 22:31:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="473442821"
Received: from syerakon-mobl1.amr.corp.intel.com (HELO
 mtolakan-mobl1.intel.com) ([10.209.29.12])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 22:31:58 -0800
From: Madhumitha Tolakanahalli Pradeep
 <madhumitha.tolakanahalli.pradeep@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 18 Nov 2021 22:31:28 -0800
Message-Id: <20211119063128.67366-2-madhumitha.tolakanahalli.pradeep@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119063128.67366-1-madhumitha.tolakanahalli.pradeep@intel.com>
References: <20211119063128.67366-1-madhumitha.tolakanahalli.pradeep@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/1] drm/i915/dmc: Update DMC to v2.14 on ADL-P
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The release notes mention that DMC v2.14 provides -
 1. Fix for Flip queue roll over cases with DC6v
 2. Enhancement for residency
 3. Workaround for 3Dlut restore issue

Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 2dc9d632969d..8617cd1ec9b2 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -45,8 +45,8 @@
 
 #define GEN12_DMC_MAX_FW_SIZE		ICL_DMC_MAX_FW_SIZE
 
-#define ADLP_DMC_PATH			DMC_PATH(adlp, 2, 12)
-#define ADLP_DMC_VERSION_REQUIRED	DMC_VERSION(2, 12)
+#define ADLP_DMC_PATH			DMC_PATH(adlp, 2, 14)
+#define ADLP_DMC_VERSION_REQUIRED	DMC_VERSION(2, 14)
 MODULE_FIRMWARE(ADLP_DMC_PATH);
 
 #define ADLS_DMC_PATH			DMC_PATH(adls, 2, 01)
-- 
2.33.1

