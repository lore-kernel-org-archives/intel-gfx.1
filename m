Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E030C64E7B
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 16:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E932222C
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 16:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E932222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CA89D44;
	Tue,  1 Dec 2020 16:14:34 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8089B62
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 16:14:32 +0000 (UTC)
IronPort-SDR: WqryuMq7/ti2TEdHKWFIzsg26M0m4m3YIhtsI1PnM8/OzP4fRwm2ASaTQjWJKIzlgHkcwy9CSf
 mZbD/TLlo9tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234459533"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="234459533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:14:12 -0800
IronPort-SDR: oTypTK1eIg2oAOq0s7Spmhwp9ar8TcBT6m47UkyQNm0GqFesaV8fbDeA41DsTBFAJ/s6d4v70U
 L/wEcH1e++oQ==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="364813629"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:14:11 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 22:17:48 +0530
Message-Id: <20201201164749.32702-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201164749.32702-1-uma.shankar@intel.com>
References: <20201201164749.32702-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v5 1/2] drm/i915/display/tgl: Disable FBC with PSR2
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

There are some corner cases wrt underrun when we enable
FBC with PSR2 on TGL. Recommendation from hardware is to
keep this combination disabled.

Bspec: 50422 HSD: 14010260002

v2: Added psr2 enabled check from crtc_state (Anshuman)
Added Bspec link and HSD referneces (Jose)

v3: Moved the logic to disable fbc to intel_fbc_update_state_cache
and removed the crtc->config usages, as per Ville's recommendation.

v4: Introduced a variable in fbc state_cache instead of the earlier
plane.visible WA, as suggested by Jose.

v5: Dropped an extra check for fbc in intel_fbc_enable and addressed
review comments by Jose.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++++++++
 drivers/gpu/drm/i915/i915_drv.h          |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a5b072816a7b..611cadc5c70a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -742,6 +742,8 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 		cache->fence_id = plane_state->vma->fence->id;
 	else
 		cache->fence_id = -1;
+
+	cache->psr2_active = crtc_state->has_psr2;
 }
 
 static bool intel_fbc_cfb_size_changed(struct drm_i915_private *dev_priv)
@@ -799,6 +801,16 @@ static bool intel_fbc_can_activate(struct intel_crtc *crtc)
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_fbc_state_cache *cache = &fbc->state_cache;
 
+	/*
+	 * Tigerlake is not supporting FBC with PSR2.
+	 * Recommendation is to keep this combination disabled
+	 * Bspec: 50422 HSD: 14010260002
+	 */
+	if (fbc->state_cache.psr2_active && IS_TIGERLAKE(dev_priv)) {
+		fbc->no_fbc_reason = "not supported with PSR2";
+		return false;
+	}
+
 	if (!intel_fbc_can_enable(dev_priv))
 		return false;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 15be8debae54..f4e08c1a5867 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -416,6 +416,7 @@ struct intel_fbc {
 		u16 gen9_wa_cfb_stride;
 		u16 interval;
 		s8 fence_id;
+		bool psr2_active;
 	} state_cache;
 
 	/*
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
