Return-Path: <SRS0=bagb=PX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4148AC433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049BD611C4
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 049BD611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC138979F;
	Thu,  4 Nov 2021 14:45:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B025589491
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Nov 2021 14:45:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295162067"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="295162067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 07:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="497973483"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Nov 2021 07:45:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 16:45:53 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Nov 2021 16:45:14 +0200
Message-Id: <20211104144520.22605-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
References: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 11/17] drm/i915/fbc: Nuke BDW_FBC_COMP_SEG_MASK
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Just use a same mask for ivb/hsw as for bdw+. The extra bit
in the bdw mask is mbz on ivb/hsw anyway so this is just
pointless complexity.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 5 +----
 drivers/gpu/drm/i915/i915_reg.h          | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b13a776cb3dc..1193e86690e5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -533,10 +533,7 @@ static void ivb_fbc_activate(struct drm_i915_private *dev_priv)
 
 static bool ivb_fbc_is_compressing(struct drm_i915_private *i915)
 {
-	if (DISPLAY_VER(i915) >= 8)
-		return intel_de_read(i915, IVB_FBC_STATUS2) & BDW_FBC_COMP_SEG_MASK;
-	else
-		return intel_de_read(i915, IVB_FBC_STATUS2) & IVB_FBC_COMP_SEG_MASK;
+	return intel_de_read(i915, IVB_FBC_STATUS2) & IVB_FBC_COMP_SEG_MASK;
 }
 
 static void ivb_fbc_set_false_color(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index b456920555b7..1e99fe8dc253 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3382,8 +3382,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define ILK_DPFC_STATUS		_MMIO(0x43210)
 #define  ILK_DPFC_COMP_SEG_MASK	0x7ff
 #define IVB_FBC_STATUS2		_MMIO(0x43214)
-#define  IVB_FBC_COMP_SEG_MASK	0x7ff
-#define  BDW_FBC_COMP_SEG_MASK	0xfff
+#define  IVB_FBC_COMP_SEG_MASK	0xfff
 #define ILK_DPFC_FENCE_YOFF	_MMIO(0x43218)
 #define ILK_DPFC_CHICKEN	_MMIO(0x43224)
 #define   ILK_DPFC_DISABLE_DUMMY0 (1 << 8)
-- 
2.32.0

