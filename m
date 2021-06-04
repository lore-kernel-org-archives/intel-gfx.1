Return-Path: <SRS0=TObv=K6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FE2C48BCF
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C95F6141B
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Jun 2021 18:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C95F6141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7DF6F8AE;
	Fri,  4 Jun 2021 18:59:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3A16F8AC
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Jun 2021 18:59:02 +0000 (UTC)
IronPort-SDR: hmZHYpLivAblgt3fKQbeLNipXL6UNPy0yoxUl/+YcCPLQZ0rx61QZ7qwJnrAuuif+gHp5XaTYq
 DRDAbN6AXxqg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="184032756"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="184032756"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:59:02 -0700
IronPort-SDR: CMLyJoG1T0XRp2eMDOGaHmJ+5I9gYdxY/4XjOqz9THMVq55TiVcmPv6Q5IMeb1sGOcop+dYqRv
 4CgtYtwtUDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="618356058"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga005.jf.intel.com with ESMTP; 04 Jun 2021 11:59:01 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  4 Jun 2021 11:59:01 -0700
Message-Id: <20210604185901.24069-5-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210604185901.24069-1-anusha.srivatsa@intel.com>
References: <20210604185901.24069-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 4/4] drm/i915/adl_p: Load DMC
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

Load DMC v2.06 on ADLP. The release notes mention that
this version enables few power savings features.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 09f65ad71f7e..52cedd5ea48e 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -45,6 +45,10 @@
 
 #define GEN12_DMC_MAX_FW_SIZE		ICL_DMC_MAX_FW_SIZE
 
+#define ADLP_DMC_PATH			"i915/adlp_dmc_ver2_10.bin"
+#define ADLP_DMC_VERSION_REQUIRED	DMC_VERSION(2, 10)
+MODULE_FIRMWARE(ADLP_DMC_PATH);
+
 #define ADLS_DMC_PATH			DMC_PATH(adls, 2, 01)
 #define ADLS_DMC_VERSION_REQUIRED	DMC_VERSION(2, 1)
 MODULE_FIRMWARE(ADLS_DMC_PATH);
@@ -727,7 +731,11 @@ void intel_dmc_ucode_init(struct drm_i915_private *dev_priv)
 	 */
 	intel_dmc_runtime_pm_get(dev_priv);
 
-	if (IS_ALDERLAKE_S(dev_priv)) {
+	if (IS_ALDERLAKE_P(dev_priv)) {
+		dmc->fw_path = ADLP_DMC_PATH;
+		dmc->required_version = ADLP_DMC_VERSION_REQUIRED;
+		dmc->max_fw_size = GEN12_DMC_MAX_FW_SIZE;
+	} else if (IS_ALDERLAKE_S(dev_priv)) {
 		dmc->fw_path = ADLS_DMC_PATH;
 		dmc->required_version = ADLS_DMC_VERSION_REQUIRED;
 		dmc->max_fw_size = GEN12_DMC_MAX_FW_SIZE;
-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
