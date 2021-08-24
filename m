Return-Path: <SRS0=Bjkn=NP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ED0C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 15:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E2761265
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Aug 2021 15:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87E2761265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8A889904;
	Tue, 24 Aug 2021 15:45:01 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC622896EC
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Aug 2021 15:44:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="302922210"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="302922210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:44:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="526671016"
Received: from rekhagax-mobl1.amr.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.255.33.223])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:44:58 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Tilak Tangudu <tilak.tangudu@intel.com>
Date: Tue, 24 Aug 2021 11:44:52 -0400
Message-Id: <20210824154452.2066678-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824154452.2066678-1-rodrigo.vivi@intel.com>
References: <20210824154452.2066678-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/runtime_pm: Let's avoid the
 undocumented D1 opregion notification.
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

At least for newer generations, let's try to do the right thing that is to
notify the opregion that we are going into D3hot.

But to avoid breaking the world let's keep the older undocumented
behavior in place.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Tilak Tangudu <tilak.tangudu@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 43cdc2f3ff9e..371bbc58db92 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -706,27 +706,19 @@ int intel_runtime_pm_suspend(struct intel_runtime_pm *rpm)
 
 	rpm->suspended = true;
 
-	/*
-	 * FIXME: We really should find a document that references the arguments
-	 * used below!
-	 */
-	if (IS_BROADWELL(i915)) {
-		/*
-		 * On Broadwell, if we use PCI_D1 the PCH DDI ports will stop
-		 * being detected, and the call we do at intel_runtime_resume()
-		 * won't be able to restore them. Since PCI_D3hot matches the
-		 * actual specification and appears to be working, use it.
-		 */
-		intel_opregion_notify_adapter(i915, PCI_D3hot);
-	} else {
+	if (GRAPHICS_VER(i915) < 8) {
 		/*
-		 * current versions of firmware which depend on this opregion
-		 * notification have repurposed the D1 definition to mean
+		 * Some older versions of firmware which depend on this opregion
+		 * notification had repurposed the D1 definition to mean
 		 * "runtime suspended" vs. what you would normally expect (D3)
 		 * to distinguish it from notifications that might be sent via
-		 * the suspend path.
+		 * the suspend path. Unfortunately there's no documentation
+		 * available right now to justify this flow. However let's
+		 * keep for historical reasons.
 		 */
 		intel_opregion_notify_adapter(i915, PCI_D1);
+	} else {
+		intel_opregion_notify_adapter(i915, PCI_D3hot);
 	}
 
 	assert_forcewakes_inactive(&i915->uncore);
-- 
2.31.1

