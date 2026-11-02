Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD7606A326
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aaHcZcWP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6B410F263;
	Mon,  2 Nov 2026 22:15:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CFE10F263
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793657739; x=1825193739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=taU5pIYXv2Kjp984TaWfkxZARPBCTIbbULOCs08kOsk=;
 b=aaHcZcWPgl4/42ODL2e0GiciBVsiT6bEv/iPNk4O9Y1M8AiNR0LYFct9
 wDHR0LwFbI7Wq8mztUdvK4hbq+wH0rnKoqib/iRIipHrnp5UlWUhhGNMH
 vF+Q425z1I1Zn+g2XhBXyaUuuBSR9+GPwVlP/D0uNWgZDFMIYrzjk5ZAt
 lkNM0NXE+iTWr/HfLfn+aq01b+ucytbvhW5EsnwZ30mWWdpsz96HKlvZZ
 8HGeNlN3tq1QDoVl9MfQvLUEAUiM0plzv5on6+wEKkyfqoSpCUetLqQbQ
 +boPnJTGZoCPLfIZyP7pEXKN5tUY8x3zNEgWWLo71C/tP986zj6D3eWXh A==;
X-CSE-ConnectionGUID: SLKdxn+OQ2m+2AqpHMu1Gg==
X-CSE-MsgGUID: z/YPE8fXQSWle00ILVI7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2384838"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2384838"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 14:15:39 -0800
X-CSE-ConnectionGUID: teTeO+g5RgSqe0DeqtbKoQ==
X-CSE-MsgGUID: mtgzyf7CRQysnrFsxEbTZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6147520"
Received: from bfilipch-desk.jf.intel.com ([10.24.81.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 14:15:39 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/i915/guc: Test GuC v70.83.0 for DG2, MTL
Date: Mon,  2 Nov 2026 14:15:00 -0800
Message-ID: <20261102221518.546010-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UAPI compatibility version 1.46.0

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned '*_guc_70.bin' files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d7c731fe972b..c89a1b97108c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -89,8 +89,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
-	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
+	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 83, 0)) \
+	fw_def(DG2,          0, guc_mmp(dg2,  70, 83, 0)) \
 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-- 
2.51.0

