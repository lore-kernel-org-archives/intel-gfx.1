Return-Path: <SRS0=qdHQ=OA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3366C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 17:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988D3611BD
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 17:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 988D3611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5D6EA59;
	Fri, 10 Sep 2021 17:44:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD3E6EA57
 for <intel-gfx@lists.freedesktop.org>; Fri, 10 Sep 2021 17:44:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="306698135"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="306698135"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 10:44:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="540740374"
Received: from bwparris-mobl.amr.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.255.36.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 10:44:52 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tilak Tangudu <tilak.tangudu@intel.com>, Imre Deak <imre.deak@intel.com>
Date: Fri, 10 Sep 2021 13:44:46 -0400
Message-Id: <20210910174447.289750-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910174447.289750-1-rodrigo.vivi@intel.com>
References: <20210910174447.289750-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/3] drm/i915: Disallow D3Cold.
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

During runtime or s2idle suspend and resume cases on discrete cards,
if D3Cold is really achieved, we will blow everything up and
freeze the machine because we are not yet handling the pci states
properly.

On Integrated it simply doesn't matter because D3hot is the maximum
that we will get anyway, unless the system is on S3/S4 and our power
is cut.

Let's put this hammer for now everywhere. So we can work to enable
the auto-suspend by default without blowing up the world.

Then, this should be removed when we finally fix the D3Cold flow.

Cc: Tilak Tangudu <tilak.tangudu@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index a40b5d806321..086a9a475ce8 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -301,6 +301,7 @@ static void sanitize_gpu(struct drm_i915_private *i915)
  */
 static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	int ret = 0;
 
 	if (i915_inject_probe_failure(dev_priv))
@@ -331,6 +332,13 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * FIXME: Temporary hammer to avoid freezing the machine on our DGFX
+	 * This should be totally removed when we handle the pci states properly
+	 * on runtime PM and on s2idle cases.
+	 */
+	pci_d3cold_disable(pdev);
+
 	ret = vlv_suspend_init(dev_priv);
 	if (ret < 0)
 		goto err_workqueues;
-- 
2.31.1

