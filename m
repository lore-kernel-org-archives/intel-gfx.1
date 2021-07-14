Return-Path: <SRS0=C5oC=MG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2E5C11F66
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 03:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA326613AA
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jul 2021 03:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA326613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0975D6E165;
	Wed, 14 Jul 2021 03:15:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B126E158
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 03:15:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210256250"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210256250"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:15:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="494031462"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:15:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Jul 2021 20:14:58 -0700
Message-Id: <20210714031540.3539704-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210714031540.3539704-1-matthew.d.roper@intel.com>
References: <20210714031540.3539704-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 08/50] drm/i915/xehp: Extra media engines -
 Part 3 (reset)
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

From: John Harrison <John.C.Harrison@Intel.com>

Xe_HP can have a lot of extra media engines. This patch adds the reset
support for them.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 6 ++++++
 drivers/gpu/drm/i915/i915_reg.h       | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 72251638d4ea..9586613ee399 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -515,8 +515,14 @@ static int gen11_reset_engines(struct intel_gt *gt,
 		[VCS1]  = GEN11_GRDOM_MEDIA2,
 		[VCS2]  = GEN11_GRDOM_MEDIA3,
 		[VCS3]  = GEN11_GRDOM_MEDIA4,
+		[VCS4]  = GEN11_GRDOM_MEDIA5,
+		[VCS5]  = GEN11_GRDOM_MEDIA6,
+		[VCS6]  = GEN11_GRDOM_MEDIA7,
+		[VCS7]  = GEN11_GRDOM_MEDIA8,
 		[VECS0] = GEN11_GRDOM_VECS,
 		[VECS1] = GEN11_GRDOM_VECS2,
+		[VECS2] = GEN11_GRDOM_VECS3,
+		[VECS3] = GEN11_GRDOM_VECS4,
 	};
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index af8f14fe4026..1eca88ac7057 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -395,10 +395,18 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define  GEN11_GRDOM_MEDIA2		(1 << 6)
 #define  GEN11_GRDOM_MEDIA3		(1 << 7)
 #define  GEN11_GRDOM_MEDIA4		(1 << 8)
+#define  GEN11_GRDOM_MEDIA5		(1 << 9)
+#define  GEN11_GRDOM_MEDIA6		(1 << 10)
+#define  GEN11_GRDOM_MEDIA7		(1 << 11)
+#define  GEN11_GRDOM_MEDIA8		(1 << 12)
 #define  GEN11_GRDOM_VECS		(1 << 13)
 #define  GEN11_GRDOM_VECS2		(1 << 14)
+#define  GEN11_GRDOM_VECS3		(1 << 15)
+#define  GEN11_GRDOM_VECS4		(1 << 16)
 #define  GEN11_GRDOM_SFC0		(1 << 17)
 #define  GEN11_GRDOM_SFC1		(1 << 18)
+#define  GEN11_GRDOM_SFC2		(1 << 19)
+#define  GEN11_GRDOM_SFC3		(1 << 20)
 
 #define  GEN11_VCS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << ((instance) >> 1))
 #define  GEN11_VECS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << (instance))
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
