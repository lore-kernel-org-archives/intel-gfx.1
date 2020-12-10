Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1601C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 13:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9305B2310C
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9305B2310C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F123E6E52A;
	Thu, 10 Dec 2020 13:29:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E086E52A
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 13:29:26 +0000 (UTC)
IronPort-SDR: Y1ZgzJfFMvenrOVz5XoLnbYyyRPbNFy8v+j44fr2zKkueZJGbcz8UYG/VVQI+4PXcWqD5XkuU/
 fFkNteV8oZVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174397323"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="174397323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:29:25 -0800
IronPort-SDR: v+9zdDEiTXJQBZF1FqEz/L1twj9RZQ9hjSQyOsPWfHmghDcZwAhZlmJtYG5RjdYHgFIVn7+kah
 2+NTDC0K/sMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="408527566"
Received: from linux-tiger-lake-client-platform.iind.intel.com
 ([10.223.34.106])
 by orsmga001.jf.intel.com with ESMTP; 10 Dec 2020 05:29:22 -0800
From: Saichandana S <saichandana.s@intel.com>
To: intel-gfx@lists.freedesktop.org, --cc=saichandana.s@intel.com,
 --cc=uma.shankar@intel.com, --cc=Anshuman.Gupta@intel.com
Date: Thu, 10 Dec 2020 18:58:53 +0530
Message-Id: <20201210132853.1521-1-saichandana.s@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [PATCH] drm/i915/debugfs : PM_REQ and PM_RES register
 debugfs
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
Cc: Saichandana <saichandana.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Saichandana <saichandana.s@intel.com>

PM_REQ register provides the value of the last PM request from PCU to
Display Engine.PM_RES register provides the value of the last PM response from
Display Engine to PCU.
This debugfs will be used by DC9 IGT test to know about "DC9 Ready"
status.
B.Spec : 49501, 49502

Signed-off-by: Saichandana <saichandana.s@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 24 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               |  5 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index cd7e5519ee7d..09e734e54032 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -559,6 +559,29 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static int i915_pm_req_res_info(struct seq_file *m, void *unused)
+{
+        struct drm_i915_private *dev_priv = node_to_i915(m->private);
+        struct intel_csr *csr = &dev_priv->csr;
+
+        if (!HAS_CSR(dev_priv))
+                return -ENODEV;
+
+        if (!csr->dmc_payload)
+                return 0;
+
+        seq_printf(m, "PM debug request 0 (0x45284) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_REQ_DBG_0));
+        seq_printf(m, "PM debug request 1 (0x45288) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_REQ_DBG_1));
+        seq_printf(m, "PM debug response 0 (0x4528C) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_RSP_DBG_0));
+        seq_printf(m, "PM debug response 1 (0x45290) : 0x%x\n",
+                        intel_de_read(dev_priv, PM_RSP_DBG_1));
+
+        return 0;
+}
+
 static void intel_seq_print_mode(struct seq_file *m, int tabs,
 				 const struct drm_display_mode *mode)
 {
@@ -2100,6 +2123,7 @@ static const struct drm_info_list intel_display_debugfs_list[] = {
 	{"i915_edp_psr_status", i915_edp_psr_status, 0},
 	{"i915_power_domain_info", i915_power_domain_info, 0},
 	{"i915_dmc_info", i915_dmc_info, 0},
+	{"i915_pm_req_res_info", i915_pm_req_res_info, 0},
 	{"i915_display_info", i915_display_info, 0},
 	{"i915_shared_dplls_info", i915_shared_dplls_info, 0},
 	{"i915_dp_mst_info", i915_dp_mst_info, 0},
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0023c023f472..b477a1f7b1bd 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -371,6 +371,11 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define VLV_G3DCTL		_MMIO(0x9024)
 #define VLV_GSCKGCTL		_MMIO(0x9028)
 
+#define PM_REQ_DBG_0		_MMIO(0x45284)
+#define PM_REQ_DBG_1 		_MMIO(0x45288)
+#define PM_RSP_DBG_0 		_MMIO(0x4528C)
+#define PM_RSP_DBG_1 		_MMIO(0x45290)
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
