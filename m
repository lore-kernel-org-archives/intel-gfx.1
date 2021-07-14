Return-Path: <SRS0=C5oC=MG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEADDC11F67
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 03:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7232613AA
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 03:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7232613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040876E174;
	Wed, 14 Jul 2021 03:16:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B766E174
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 03:15:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210256267"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210256267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:15:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="494031519"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:15:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Jul 2021 20:15:12 -0700
Message-Id: <20210714031540.3539704-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210714031540.3539704-1-matthew.d.roper@intel.com>
References: <20210714031540.3539704-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 22/50] drm/i915/xehpsdv: Read correct
 RP_STATE_CAP register
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

The RP_STATE_CAP register is no longer part of the MCHBAR on XEHPSDV; this
register is now a per-tile register at GTTMMADDR offset 0x250014.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 +++-
 drivers/gpu/drm/i915/i915_reg.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 490bc1513480..8e7b70248392 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1937,7 +1937,9 @@ u32 intel_rps_read_state_cap(struct intel_rps *rps)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
-	if (IS_GEN9_LP(i915))
+	if (IS_XEHPSDV(i915))
+		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
+	else if (IS_GEN9_LP(i915))
 		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
 	else
 		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index daef4e15a422..37c1b5c4c681 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4110,6 +4110,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
+#define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
 
 /*
  * Logical Context regs
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
