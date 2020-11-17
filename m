Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F00C64E90
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E81238E6
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 18:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E81238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2836E04E;
	Tue, 17 Nov 2020 18:51:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597B89FD4
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 18:50:53 +0000 (UTC)
IronPort-SDR: IM1I4/kFtg0peAKF1kcKd7b/s0qDGlVRDGwNjtfHVzKUqxT6wDEEKQtawUG9y6eGZUYuKArTYI
 PedZObUOvyiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168412301"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168412301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:53 -0800
IronPort-SDR: nvjZE+BIFRKLwh+XonuT7wt93vycJwfhSqsCTAYUpcM5oKdR5ewvhfFeqTUN7GUpQ71jALb+tG
 RZwGvMh9id5A==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="340996910"
Received: from ankithac-mobl1.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.101.215])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:50:53 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 10:50:26 -0800
Message-Id: <20201117185029.22078-19-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117185029.22078-1-aditya.swarup@intel.com>
References: <20201117185029.22078-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 18/21] drm/i915/adl_s: Re-use TGL GuC/HuC
 firmware
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

ADL-S, like RKL, uses the same internal device ID for the GuC and HuC as
TGL did, making them all firmware-compatible.  Let's re-use TGL's
firmware for ADL-S.

Bspec: 50668
Cc: John Harrison <John.C.Harrison@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Aditya Swarup <aditya.swarup@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 180c23e2e25e..2d123158df0d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -44,9 +44,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * List of required GuC and HuC binaries per-platform.
  * Must be ordered based on platform + revid, from newer to older.
  *
- * Note that RKL uses the same firmware as TGL.
+ * Note that RKL and ADL-S have the same GuC/HuC device ID's and use the same
+ * firmware as TGL.
  */
 #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
+	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(JASPERLAKE,  0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
