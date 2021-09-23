Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCDBC4332F
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498CB60EC0
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 498CB60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484D86ED02;
	Thu, 23 Sep 2021 07:35:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238496ECF7
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Sep 2021 07:34:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203282511"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="203282511"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="558167440"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2021 00:34:57 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Huang@freedesktop.org, Sean Z <sean.z.huang@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 23 Sep 2021 00:35:18 -0700
Message-Id: <20210923073529.1058204-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923073529.1058204-1-alan.previn.teres.alexis@intel.com>
References: <20210923073529.1058204-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v12 06/17] drm/i915/pxp: set KCR reg init
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

The setting is required by hardware to allow us doing further protection
operation such as sending commands to GPU or TEE. The register needs to
be re-programmed on resume, so for simplicitly we bundle the programming
with the component binding, which is automatically called on resume.

Further HW set-up operations will be added in the same location in
follow-up patches, so get ready for them by using a couple of
init/fini_hw wrappers instead of calling the KCR funcs directly.

v3: move programming to component binding function, rework commit msg

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c     | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h     |  3 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c |  5 +++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 5e74b2af2647..ebbc6923c7ad 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -12,6 +12,23 @@ struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
 	return container_of(pxp, struct intel_gt, pxp);
 }
 
+/* KCR register definitions */
+#define KCR_INIT _MMIO(0x320f0)
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+
+static void kcr_pxp_enable(struct intel_gt *gt)
+{
+	intel_uncore_write(gt->uncore, KCR_INIT,
+			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+}
+
+static void kcr_pxp_disable(struct intel_gt *gt)
+{
+	intel_uncore_write(gt->uncore, KCR_INIT,
+			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+}
+
 static int create_vcs_context(struct intel_pxp *pxp)
 {
 	static struct lock_class_key pxp_lock;
@@ -78,5 +95,14 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 	intel_pxp_tee_component_fini(pxp);
 
 	destroy_vcs_context(pxp);
+}
+
+void intel_pxp_init_hw(struct intel_pxp *pxp)
+{
+	kcr_pxp_enable(pxp_to_gt(pxp));
+}
 
+void intel_pxp_fini_hw(struct intel_pxp *pxp)
+{
+	kcr_pxp_disable(pxp_to_gt(pxp));
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 73acd879f2fb..cd6560b2605c 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -17,6 +17,9 @@ static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
 struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp);
 void intel_pxp_init(struct intel_pxp *pxp);
 void intel_pxp_fini(struct intel_pxp *pxp);
+
+void intel_pxp_init_hw(struct intel_pxp *pxp);
+void intel_pxp_fini_hw(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
 {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index f1d8de832653..0c0c7946e6a0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -33,6 +33,9 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
 
+	/* the component is required to fully start the PXP HW */
+	intel_pxp_init_hw(pxp);
+
 	return 0;
 }
 
@@ -41,6 +44,8 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 {
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
 
+	intel_pxp_fini_hw(pxp);
+
 	pxp->pxp_component = NULL;
 }
 
-- 
2.25.1

