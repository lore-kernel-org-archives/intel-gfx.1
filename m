Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E141CC4332E
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B489664F26
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 22:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B489664F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F9D6EEA1;
	Thu, 11 Mar 2021 22:36:54 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390AB6EE9C
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 22:36:50 +0000 (UTC)
IronPort-SDR: +62vyUEx6nfZex/t552Bg5kcOTU7c0rNmCn2knhjzwQSLvisuz3LR7zJ42gkvWlQ8PkfEJi0jm
 TkqEQ48qPnwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="250116454"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="250116454"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:47 -0800
IronPort-SDR: t5GknzKOfLxXsYm2A9YdJGLQi3wslo8GWNAaTLAf5GvuqT3FuEGQZSB31Ifhr/F/3/MzpkPV4l
 1CtnCHaG18lQ==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="438852778"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:36:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 14:36:19 -0800
Message-Id: <20210311223632.3191939-44-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210311223632.3191939-1-matthew.d.roper@intel.com>
References: <20210311223632.3191939-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 43/56] drm/i915/adlp: Define GuC/HuC for
 Alderlake_P
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

From: Clint Taylor <clinton.a.taylor@intel.com>

Initial GuC/HuC definitions for ADL_P

Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 984fa79e0fa7..95cdac785412 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -48,6 +48,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
+	fw_def(ALDERLAKE_P, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
 	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
