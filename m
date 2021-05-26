Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_06_12,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E9AC47082
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 10:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A77B6128B
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 10:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A77B6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FFC6EC6A;
	Wed, 26 May 2021 10:28:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A9A6EC68
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 May 2021 10:28:32 +0000 (UTC)
IronPort-SDR: 7IkF25gJ2JizbEiALd8KOjH2XdhR7HsK5PFjmzDyDOcS8C2D5jbMFRexq3qYE/Oq9LRhCsoqln
 cbHaDdfy/8dw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223616133"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223616133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:28:32 -0700
IronPort-SDR: bti62iQ+ds5gixUQSsl9AFBkNY6BsQ4UZuwye1QolXqsQJEAcrAMatVS745iDbAU9aaq5Qqx7C
 hSUQCQUFSZ0g==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="476868112"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:28:29 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, nischal.varide@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Date: Wed, 26 May 2021 23:47:28 +0530
Message-Id: <20210526181728.14817-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526181728.14817-1-bhanuprakash.modem@intel.com>
References: <20210526181728.14817-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/display/debug: Expose Dither
 status via debugfs
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

It's useful to know the dithering state & pipe bpc for IGT testing.
This patch will expose the dithering state for the crtc via a debugfs
file "dither".

Example usage: cat /sys/kernel/debug/dri/0/crtc-0/dither

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Nischal Varide <nischal.varide@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 94e5cbd86e77..a6fefc7d5ab9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -2158,11 +2158,43 @@ static const struct {
 	{"i915_edp_psr_debug", &i915_edp_psr_debug_fops},
 };
 
+static int dither_state_show(struct seq_file *m, void *data)
+{
+	struct intel_crtc *crtc = to_intel_crtc(m->private);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct intel_crtc_state *crtc_state;
+	int ret;
+
+	if (!HAS_DISPLAY(dev_priv))
+		return -ENODEV;
+
+	ret = drm_modeset_lock_single_interruptible(&crtc->base.mutex);
+	if (ret)
+		return ret;
+
+	crtc_state = to_intel_crtc_state(crtc->base.state);
+	seq_printf(m, "bpc: %u\n", crtc_state->pipe_bpp / 3);
+	seq_printf(m, "Dither: %u\n", (crtc_state->dither) ? 1 : 0);
+	seq_printf(m, "Dither_CC1: %u\n",
+		(crtc_state->gamma_mode & GAMMA_MODE_DITHER_AFTER_CC1) ? 1 : 0);
+
+	drm_modeset_unlock(&crtc->base.mutex);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dither_state);
+
 void intel_display_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
+	struct drm_device *dev = &i915->drm;
+	struct drm_crtc *crtc;
 	int i;
 
+	drm_for_each_crtc(crtc, dev)
+		debugfs_create_file("dither", 0444, crtc->debugfs_entry, crtc,
+				    &dither_state_fops);
+
 	for (i = 0; i < ARRAY_SIZE(intel_display_debugfs_files); i++) {
 		debugfs_create_file(intel_display_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
