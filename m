Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDABD715D5
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Jan 2026 06:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9110E096;
	Sat, 24 Jan 2026 06:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn1agTkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F91D10E096
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Jan 2026 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769236332; x=1800772332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n42sgGHkn6lkX+P9lThsCSa8UUUw7lAtHClsnhmhzIU=;
 b=Qn1agTkjJBkNhMqpOAY3pPpolovYSUiYsefKSEdBfNiHGJq3Yzxje8XB
 Yo7OMWMtRfM/dAFoMQ1gbvFx4Z/yic/4Me5/mKorwUoR55VC/fDbteKxb
 Y5Ov9DKx+cShhqhfZ2iZuFSkmc4oJOlDI2t33rvZQcj3FX7W1ZrxZKb5Q
 5p6YZZgfzmiYiNxcM6UL0FpdO1gJAGttf2IIi82IGzisPUzNDWmkXe95D
 /sX2ZzkURwKjSKnBf7H6uoaMFNrf+XyWAxC5lKPclbxiIDN/KKI8NctvR
 Gsel9UkfemETMSlHmeHKhweOzDRfVienGqumrAYE3rAOolWSg/3woEHlz w==;
X-CSE-ConnectionGUID: LYsNn3K8REmz4WDjppipJg==
X-CSE-MsgGUID: TrBGoxhIR/GXrC7kvYHwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="80788487"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; d="scan'208";a="80788487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 22:32:11 -0800
X-CSE-ConnectionGUID: l3eFUrPCSIqphnzjOJ2I8A==
X-CSE-MsgGUID: t6A8ARZzTP+lP9C5GLts+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; d="scan'208";a="230170357"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 22:32:08 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, janusz.krzysztofik@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] drm/i915: Register vGPU after DRM dev register and fix fail
 path
Date: Sat, 24 Jan 2026 11:59:14 +0530
Message-Id: <20260124062914.1244888-1-kaushlendra.kumar@intel.com>
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

Move vGPU registration after successful drm_dev_register().
Avoid drm_dev_unregister() on failed registration attempt.

Fixes: 223038731489 ("drm/i915: Fix harmful driver register/unregister asymmetry")
Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c97b76771917..725c60399d80 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -630,19 +630,17 @@ static int i915_driver_register(struct drm_i915_private *dev_priv)
 	i915_gem_driver_register(dev_priv);
 	i915_pmu_register(dev_priv);
 
-	intel_vgpu_register(dev_priv);
-
 	/* Reveal our presence to userspace */
 	ret = drm_dev_register(&dev_priv->drm, 0);
 	if (ret) {
 		i915_probe_error(dev_priv,
 				 "Failed to register driver for userspace access!\n");
-		drm_dev_unregister(&dev_priv->drm);
 		i915_pmu_unregister(dev_priv);
 		i915_gem_driver_unregister(dev_priv);
 		return ret;
 	}
 
+	intel_vgpu_register(dev_priv);
 	i915_debugfs_register(dev_priv);
 	i915_setup_sysfs(dev_priv);
 
-- 
2.34.1

