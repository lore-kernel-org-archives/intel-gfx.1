Return-Path: <SRS0=tBxe=E6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ECFC63777
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 19:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B1B20857
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 19:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B1B20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD086E520;
	Tue, 24 Nov 2020 19:13:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC46E51C
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 19:13:33 +0000 (UTC)
IronPort-SDR: 5Ut1k94RllhwddrSEs7k/UvxAzQGoo43SIfYXYXvLiYcCadzJPdgZp7WWtjGLJBdbm8Y0utwlB
 ircgiz7C3ZbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="256710244"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="256710244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 11:13:32 -0800
IronPort-SDR: CJxvBPKNNLcCeg0MDELUGhZ6ILG1ct9MiW0NTbtXiB35Kuyqsy08qEG5x4rDmwWBeNknqbgDNK
 lBuxnJESW02A==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="312676218"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 11:13:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 24 Nov 2020 11:13:14 -0800
Message-Id: <20201124191316.1660749-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124191316.1660749-1-lucas.demarchi@intel.com>
References: <20201124191316.1660749-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/3] drm/i915: stop registering if
 drm_dev_register() fails
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

If drm_dev_register() fails there is no reason to continue registering
the driver and initializing.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 320856b665a1..c3fad01ce26f 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -669,17 +669,19 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	intel_vgpu_register(dev_priv);
 
 	/* Reveal our presence to userspace */
-	if (drm_dev_register(dev, 0) == 0) {
-		i915_debugfs_register(dev_priv);
-		if (HAS_DISPLAY(dev_priv))
-			intel_display_debugfs_register(dev_priv);
-		i915_setup_sysfs(dev_priv);
-
-		/* Depends on sysfs having been initialized */
-		i915_perf_register(dev_priv);
-	} else
+	if (drm_dev_register(dev, 0) != 0) {
 		drm_err(&dev_priv->drm,
 			"Failed to register driver for userspace access!\n");
+		return;
+	}
+
+	i915_debugfs_register(dev_priv);
+	if (HAS_DISPLAY(dev_priv))
+		intel_display_debugfs_register(dev_priv);
+	i915_setup_sysfs(dev_priv);
+
+	/* Depends on sysfs having been initialized */
+	i915_perf_register(dev_priv);
 
 	if (HAS_DISPLAY(dev_priv)) {
 		/* Must be done after probing outputs */
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
