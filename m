Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958A7C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 05:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D06C613A9
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 05:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D06C613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6AC6E1D8;
	Tue, 13 Apr 2021 05:10:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2196E1BD
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 05:10:48 +0000 (UTC)
IronPort-SDR: ugdKlhRQKHY1IFaixMLwgTt6Jfuov8xSpB0OAgKe1V4vuwOvB333cGwIlM4vFA0ejTb7Vj0/Zk
 vbpPqmsPDVew==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="194371993"
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="194371993"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 22:10:47 -0700
IronPort-SDR: YG6p5ebtQz653HNNtOtWzo/7vTwvwG6hO5SLivU3naZZuUvLc/jm6i/V12XL6g6v/oSgekScXl
 Cjr5RehcXzfw==
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="460450774"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 22:10:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Apr 2021 22:10:02 -0700
Message-Id: <20210413051002.92589-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413051002.92589-1-lucas.demarchi@intel.com>
References: <20210413051002.92589-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 12/12] drm/i915: split dgfx features from gen
 12
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

Make them independent so we can use DGFX_FEATURES more generically.
For future platforms that do not use the GEN nomenclature we will define
graphics, media and display separately, so we avoid setting graphics_ver
with the GEN() macro.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 1453c1436f31..44e7b94db63d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -907,8 +907,7 @@ static const struct intel_device_info rkl_info = {
 		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0),
 };
 
-#define GEN12_DGFX_FEATURES \
-	GEN12_FEATURES, \
+#define DGFX_FEATURES \
 	.memory_regions = REGION_SMEM | REGION_LMEM, \
 	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
@@ -916,7 +915,8 @@ static const struct intel_device_info rkl_info = {
 	.is_dgfx = 1
 
 static const struct intel_device_info dg1_info __maybe_unused = {
-	GEN12_DGFX_FEATURES,
+	GEN12_FEATURES,
+	DGFX_FEATURES,
 	PLATFORM(INTEL_DG1),
 	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
 	.require_force_probe = 1,
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
