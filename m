Return-Path: <SRS0=TENP=GH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F3C433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Jan 2021 10:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E67720715
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Jan 2021 10:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E67720715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEFB89E43;
	Mon,  4 Jan 2021 10:31:09 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C21889E43
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 Jan 2021 10:31:07 +0000 (UTC)
IronPort-SDR: bKTMagdGvhZ8d8VAjIMuQlo3tpHlH0sZJWtRYIb5Nctt3nybo25vC3LsrdIjt6FX3fOFuKaKZ6
 X+mei1SHEOsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="241019688"
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; d="scan'208";a="241019688"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 02:31:06 -0800
IronPort-SDR: a2OqiFp5Hu0b1HERWz6T+RTsb+2NqM/v4RYi7Vo8PcSzMkVrIlFu70VMnteqETtLiORysV63LO
 Qk4iBo2YwJlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; d="scan'208";a="349888062"
Received: from linux-tiger-lake-client-platform.iind.intel.com
 ([10.223.34.106])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2021 02:31:03 -0800
From: Saichandana S <saichandana.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  4 Jan 2021 16:00:36 +0530
Message-Id: <20210104103036.1443-1-saichandana.s@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [PATCH v2] drm/i915/debugfs : PM_REQ and PM_RES
 registers
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
Cc: saichandana.s@intel.com, jani.nikula@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Saichandana <saichandana.s@intel.com>

PM_REQ register provides the value of the last PM request from PCU to
Display Engine.PM_RES register provides the value of the last PM
response from Display Engine to PCU.This debugfs will be used by
DC9 IGT test to know about "DC9 Ready" status.

B.Spec : 49501, 49502

Signed-off-by: Saichandana <saichandana.s@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 30 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               |  8 +++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index cd7e5519ee7d..551fb1a90bb3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -559,6 +559,36 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static int i915_pm_req_res_info(struct seq_file *m, void *unused)
+{
+	struct drm_i915_private *dev_priv = node_to_i915(m->private);
+	struct intel_csr *csr = &dev_priv->csr;
+	const char *status;
+
+	if (!HAS_CSR(dev_priv))
+		return -ENODEV;
+	if (!csr->dmc_payload)
+		return 0;
+	seq_printf(m, "PM debug request 0 (0x45284): 0x%08x\n",
+		   intel_de_read(dev_priv, PM_REQ_DBG_0));
+	seq_printf(m, "PM debug request 1 (0x45288): 0x%08x\n",
+		   intel_de_read(dev_priv, PM_REQ_DBG_1));
+	seq_printf(m, "PM debug response 0 (0x4528C): 0x%08x\n",
+		   intel_de_read(dev_priv, PM_RSP_DBG_0));
+	seq_printf(m, "PM debug response 1 (0x45290): 0x%08x\n",
+		   intel_de_read(dev_priv, PM_RSP_DBG_1));
+	status = (intel_de_read(dev_priv, PM_RSP_DBG_1) & MASK_DC9_BIT) ? "yes" : "no";
+
+	seq_printf(m, "Time to Next Fill = 0x%0x\n",
+		   (intel_de_read(dev_priv, PM_RSP_DBG_0) & ~MASK_RSP_0));
+	seq_printf(m, "Time to Next VBI = 0x%0x\n",
+		   ((intel_de_read(dev_priv, PM_RSP_DBG_0) & MASK_RSP_0)) >> 16);
+	seq_printf(m, "Selective Exit Latency = 0x%0x\n",
+		   (intel_de_read(dev_priv, PM_RSP_DBG_1) & MASK_RSP_1));
+	seq_printf(m, "DC9 Ready = %s\n", status);
+	return 0;
+}
+
 static void intel_seq_print_mode(struct seq_file *m, int tabs,
 				 const struct drm_display_mode *mode)
 {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0023c023f472..3e9ed555f928 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -371,6 +371,14 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define VLV_G3DCTL		_MMIO(0x9024)
 #define VLV_GSCKGCTL		_MMIO(0x9028)
 
+#define PM_REQ_DBG_0		_MMIO(0x45284)
+#define PM_REQ_DBG_1		_MMIO(0x45288)
+#define PM_RSP_DBG_0		_MMIO(0x4528C)
+#define PM_RSP_DBG_1		_MMIO(0x45290)
+#define MASK_RSP_0		(0xFFFF << 16)
+#define MASK_RSP_1		(7 << 0)
+#define MASK_DC9_BIT		(1 << 17)
+
 #define GEN6_MBCTL		_MMIO(0x0907c)
 #define   GEN6_MBCTL_ENABLE_BOOT_FETCH	(1 << 4)
 #define   GEN6_MBCTL_CTX_FETCH_NEEDED	(1 << 3)
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
