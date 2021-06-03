Return-Path: <SRS0=IdPq=K5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFCEC47096
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 16:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700FD613F1
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 16:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700FD613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5916F4D6;
	Thu,  3 Jun 2021 16:55:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053AF6E85E;
 Thu,  3 Jun 2021 16:55:04 +0000 (UTC)
IronPort-SDR: DkWxaDOs7pbFu+SR6FZf7YbvEhLoIBPGwSfHl5c9OqFPxIJvXItq/4t47jf4jjxjoUiDzNW0NK
 G3cMPQdhY4Yw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184464193"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184464193"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
IronPort-SDR: /T2WvcZVHXHgk78TnYj/fAhcCUU9UTVAHzzOsgSPglpjfgFKCPUOdsdVn6s57sGSflvokPRwGh
 RoeIXHGDgUvQ==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400643672"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  3 Jun 2021 09:54:23 -0700
Message-Id: <20210603165428.3625495-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603165428.3625495-1-lucas.demarchi@intel.com>
References: <20210603165428.3625495-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 2/7] drm/i915/gt: Add remaining conversions
 to GRAPHICS_VER
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For some reason coccinelle misses a few cases in gt with calls to
INTEL_GEN()/IS_GEN(). Do a manual conversion for those.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c      | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
index 0389bceebd06..4270b5a34a83 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
@@ -230,7 +230,7 @@ static int drpc_show(struct seq_file *m, void *unused)
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
 		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 			err = vlv_drpc(m);
-		else if (INTEL_GEN(i915) >= 6)
+		else if (GRAPHICS_VER(i915) >= 6)
 			err = gen6_drpc(m);
 		else
 			err = ilk_drpc(m);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9ef349cd5cea..e113f93b3274 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -606,10 +606,10 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 }
 
 #define instdone_has_slice(dev_priv___, sseu___, slice___) \
-	((IS_GEN(dev_priv___, 7) ? 1 : ((sseu___)->slice_mask)) & BIT(slice___))
+	((GRAPHICS_VER(dev_priv___) == 7 ? 1 : ((sseu___)->slice_mask)) & BIT(slice___))
 
 #define instdone_has_subslice(dev_priv__, sseu__, slice__, subslice__) \
-	(IS_GEN(dev_priv__, 7) ? (1 & BIT(subslice__)) : \
+	(GRAPHICS_VER(dev_priv__) == 7 ? (1 & BIT(subslice__)) : \
 	 intel_sseu_has_subslice(sseu__, 0, subslice__))
 
 #define for_each_instdone_slice_subslice(dev_priv_, sseu_, slice_, subslice_) \
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 51780282d872..714fe8495775 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -248,7 +248,7 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 	struct sseu_dev_info sseu;
 	intel_wakeref_t wakeref;
 
-	if (INTEL_GEN(i915) < 8)
+	if (GRAPHICS_VER(i915) < 8)
 		return -ENODEV;
 
 	seq_puts(m, "SSEU Device Info\n");
@@ -265,9 +265,9 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 			cherryview_sseu_device_status(gt, &sseu);
 		else if (IS_BROADWELL(i915))
 			bdw_sseu_device_status(gt, &sseu);
-		else if (IS_GEN(i915, 9))
+		else if (GRAPHICS_VER(i915) == 9)
 			gen9_sseu_device_status(gt, &sseu);
-		else if (INTEL_GEN(i915) >= 10)
+		else if (GRAPHICS_VER(i915) >= 10)
 			gen10_sseu_device_status(gt, &sseu);
 	}
 
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
