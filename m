Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6455EC04A94
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Aug 2023 12:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C840110E1E6;
	Mon, 14 Aug 2023 12:48:03 +0000 (UTC)
X-Greylist: delayed 1236 seconds by postgrey-1.36 at gabe;
 Thu, 10 Aug 2023 14:17:40 UTC
Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3276E10E1A4;
 Thu, 10 Aug 2023 14:17:40 +0000 (UTC)
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
 by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4RM7jW43R3z9y0cV;
 Thu, 10 Aug 2023 21:55:27 +0800 (CST)
Received: from fedora (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 10 Aug
 2023 21:56:40 +0800
Date: Thu, 10 Aug 2023 21:56:39 +0800
From: Wang Jinchao <wangjinchao@xfusion.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Message-ID: <ZNTsl/mlElF/spog@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.82.147.3]
X-ClientProxiedBy: wuxshcsitd00602.xfusion.com (10.32.132.250) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
X-Mailman-Approved-At: Mon, 14 Aug 2023 12:48:01 +0000
Subject: [Intel-gfx] [PATCH] drm/i915/gmch: fix build error var set but not
 used
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
Cc: stone.xulei@xfusion.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

When CONFIG_PNP is not defined, i915 will fail to compile with error bellow:
	drivers/gpu/drm/i915/soc/intel_gmch.c:43:13: error: variable ‘mchbar_addr’ set but not used
Fix it by surrounding variable declaration and assignment with ifdef

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 drivers/gpu/drm/i915/soc/intel_gmch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index 6d0204942f7a..d2c442b0b4eb 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -38,16 +38,17 @@ intel_alloc_mchbar_resource(struct drm_i915_private *i915)
 {
 	int reg = GRAPHICS_VER(i915) >= 4 ? MCHBAR_I965 : MCHBAR_I915;
 	u32 temp_lo, temp_hi = 0;
-	u64 mchbar_addr;
 	int ret;
-
+#ifdef CONFIG_PNP
+	u64 mchbar_addr;
+#endif
 	if (GRAPHICS_VER(i915) >= 4)
 		pci_read_config_dword(i915->gmch.pdev, reg + 4, &temp_hi);
 	pci_read_config_dword(i915->gmch.pdev, reg, &temp_lo);
-	mchbar_addr = ((u64)temp_hi << 32) | temp_lo;
 
 	/* If ACPI doesn't have it, assume we need to allocate it ourselves */
 #ifdef CONFIG_PNP
+	mchbar_addr = ((u64)temp_hi << 32) | temp_lo;
 	if (mchbar_addr &&
 	    pnp_range_reserved(mchbar_addr, mchbar_addr + MCHBAR_SIZE))
 		return 0;
-- 
2.40.0

