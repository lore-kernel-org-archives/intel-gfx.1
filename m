Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C75DC5B572
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 18:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DF210E430;
	Mon, 17 Aug 2026 18:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3JvjpJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A110310E430
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786992393; x=1818528393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WgqZDyCi7Lb+Fg9obgZBm0C2YTEKTqatU6S1xoaK9Rw=;
 b=I3JvjpJhwCJCBLjDp4AYnxPUwwx/vsBC+eCn7meV6JIbScNrDIdIAIUI
 /QoG6RTULg7d6O2gi9nzOTGnSN5m9KcEAslRcJOV3P0VUfm9eWLHWaMFh
 U5vTADU7gx6E62pzlNgzawdAIKOAaMgIel/nHzEbslwp81sgFbb/BCovm
 6nOoqEowLjxXVggaB0Yhft5xQBpTieq3ZEcxbQQdUhZX+p/wZ3vgQkpaR
 sRzTgDkK71iLl9tQbPuKGjFJJD9bxWw9Rg2hd5MpipDj4kyblRcOIUEry
 lbLQEtrnPS+L7cHP4lYVZ5Tch9xIAm1jein0M/TGzkU24MhwaQEFoLV9R g==;
X-CSE-ConnectionGUID: t/HBrEs8QReKu/5p80qebw==
X-CSE-MsgGUID: 4wJVk3JZT9WP0nRRQZyI7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98990841"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="98990841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 11:46:33 -0700
X-CSE-ConnectionGUID: 2f0cE7v1QCqpd9glMOgbsA==
X-CSE-MsgGUID: 06mJpgJeSVKfvbHzhWe3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="288478754"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 11:46:05 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC
Date: Mon, 17 Aug 2026 11:45:43 -0700
Message-ID: <20260817184548.2905639-2-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.24.12

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned '*_guc_70.bin' files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 7fac97fe30a6..7e5567410235 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -90,15 +90,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
 	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
 	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
-	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
-	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
-	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 12, 1)) \
-	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
-	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
-	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 1)) \
-	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
-	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
+	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 49, 5)) \
+	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 49, 5)) \
+	fw_def(DG1,          0, guc_mmp(dg1,  70, 49, 5)) \
+	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 49, 5)) \
+	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 49, 5)) \
 	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
 	fw_def(ELKHARTLAKE,  0, guc_mmp(ehl,  70, 1, 1)) \
 	fw_def(ICELAKE,      0, guc_mmp(icl,  70, 1, 1)) \
-- 
2.51.0

