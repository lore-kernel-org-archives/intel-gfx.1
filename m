Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DEDC5DF86
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 19:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2512E10E618;
	Thu, 20 Aug 2026 19:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvKV2eHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2110E618
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787254658; x=1818790658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tuFf1iCwAVwGSzolZxLY67u4gJXuK0heN5aApFxwF5g=;
 b=NvKV2eHWnWsoDBlvBAqi3Smez5rMKk5TDpw1stLhNijE4TWVsKDOkSFx
 00tE8T+gaY4AFYzUfVNMz7ODWyK3j1ldim3S6KqqVr9EFDlPk6NuqIlk0
 lPE0+wtljch4wHAUcgy6B6fxawzomWxjEIDWh9Ytyd5l56NibRzGfc/UT
 OkIPjiju0DJE3yrlWiZRmK10Z+I+oX+w3bzCgN8y8jquZ/LrEySpCuO4f
 uLhWIrrfUohXQEVJeJgGE+XeqgMndR8C9gXho5YrzQbJ5/Q/kxoi+kGCF
 17NmIfr9HvMOHCov9Fnm0zCB3a5sfO9J3y/r/ygdevt71XKOoAJdFZwR2 w==;
X-CSE-ConnectionGUID: yU/1XlhwQXuWNNDtXxyCyQ==
X-CSE-MsgGUID: z9Nr4hpoQkO99Au2jL0Wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87818125"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87818125"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 12:37:38 -0700
X-CSE-ConnectionGUID: 4ohyxsljRLiHzcPhd4woqw==
X-CSE-MsgGUID: ZvBQJMFfSuWP9dh1+N9Cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264368341"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 12:37:38 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/i915/guc: Test GuC v70.74.0 for MTL, DG2
Date: Thu, 20 Aug 2026 12:37:14 -0700
Message-ID: <20260820193724.3048409-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

UAPI compatibility version 1.38.4

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned '*_guc_70.bin' files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 7fac97fe30a6..4901cb9cb4ca 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -88,8 +88,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
-	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
+	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 74, 0)) \
+	fw_def(DG2,          0, guc_mmp(dg2,  70, 74, 0)) \
 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-- 
2.51.0

