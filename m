Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534E4C54734
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Aug 2024 14:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A9A10E0A9;
	Tue, 27 Aug 2024 14:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aY/ZI8ld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BBA10E0A9
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Aug 2024 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724767322; x=1756303322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VkuL4sfmgfOzWih3W3XiPMmHTjL0Y4RHAhtAjdDFxuA=;
 b=aY/ZI8ldVkPbqn7HJMmeCkWHD4k8/RMevDv8oe3BysSNIqMG7PEruPuO
 UscAU07ZRQGEtJE/KquJI+dTwtBJr06BLqxazIrpFf7AZr6UeixdNJLAV
 OlVKVfOjjS0p9FJVxNZRW49HKJyMu3srVZ1b8YzBdfi2YN8mFM5OVRrbr
 z6ehxEXCSAAQl23CtXjo5l8JDa/Vj5+2/gbrdRVpmv5s2Y6xxCl0CwJ5U
 xYerpZMMmiYoKDk9zUzHpgZR+QQyOfSh50OqATSa/i6Y4S9RSG8SoOLqa
 eUHJm+ts3/Q9MKNbr8B7w2HuoLobeiAv4QDUh+2AkQUnM/ufzEvUxjGYa A==;
X-CSE-ConnectionGUID: JZq+zf5sTDOvidaeP4i7Qg==
X-CSE-MsgGUID: EKG4VMgeQ++/wL0292vVsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33870524"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33870524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 07:02:01 -0700
X-CSE-ConnectionGUID: /aptNfI8SN6tHQibq8E+oA==
X-CSE-MsgGUID: ex6NA2yVTOi90XrXyIJ59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63586236"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 27 Aug 2024 07:02:00 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] drm/i915/dmc: Hardcode path to MTL DMC v2.23
Date: Tue, 27 Aug 2024 19:33:53 +0530
Message-Id: <20240827140353.3022432-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

NOT TO BE REVIEWED/MERGED
Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 7c756d5ba2a2..723743cbe8e2 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -119,7 +119,7 @@ MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 #define BMG_DMC_PATH			DMC_PATH(bmg)
 MODULE_FIRMWARE(BMG_DMC_PATH);
 
-#define MTL_DMC_PATH			DMC_PATH(mtl)
+#define MTL_DMC_PATH			"i915/mtl_dmc_ver2_23.bin"
 MODULE_FIRMWARE(MTL_DMC_PATH);
 
 #define DG2_DMC_PATH			DMC_LEGACY_PATH(dg2, 2, 08)
-- 
2.34.1

