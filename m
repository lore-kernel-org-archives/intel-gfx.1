Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72BDC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646F36143B
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646F36143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03036E222;
	Thu, 29 Apr 2021 13:45:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56B86E222
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 13:45:15 +0000 (UTC)
IronPort-SDR: 6VQTpbSvUzQUJ0ONWodcYjjhgttelG6tRVHTyXjaa/X71ZHMR52lQ7uSRT32HKK8d1DJTdu/B6
 vcRXiCHHy5mQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="196565400"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="196565400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 06:45:14 -0700
IronPort-SDR: nBgOAnP9u4YWBkthr6j2G56VxKAkoc8b8qlX+laqfo007c6OgKVMjnLwwZF0TPPQEgShNImVj5
 rwXTWK/s1hIg==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="430853745"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.23.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 06:45:12 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Apr 2021 15:44:50 +0200
Message-Id: <20210429134450.302912-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Fix wrong name announced on FB driver
 switching
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

Commit 7a0f9ef9703d ("drm/i915: Use drm_fb_helper_fill_info")
effectively changed our FB driver name from "inteldrmfb" to
"i915drmfb".  However, we are still using the old name when kicking out
a firmware fbdev driver potentially bound to our device.  Use the new
name to avoid confusion.

Note: since the new name is assigned by a DRM fbdev helper called at
the DRM driver registration time, that name is not available when we
kick the other driver out early, hence a hardcoded name must be used
unless the DRM layer exposes a macro for converting a DRM driver name
to its associated fbdev driver name.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 785dcf20c77b..46082490dc9a 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -554,7 +554,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_perf;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "inteldrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "i915drmfb");
 	if (ret)
 		goto err_ggtt;
 
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
