Return-Path: <SRS0=tUI/=I5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D20C433C1
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 10:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C6A61964
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 10:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C6A61964
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA56EA3F;
	Wed, 31 Mar 2021 10:19:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431D46EA3F;
 Wed, 31 Mar 2021 10:18:59 +0000 (UTC)
IronPort-SDR: DmR3bRjAvosPEQPQjGNkAg+jHRVzD0bvsqnqJxNVokqNgxgUiHAG1XtTdi976CQrLz4WFD2/sT
 tvtPfMqMnUzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179513098"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="179513098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:18:58 -0700
IronPort-SDR: nPc79oCqF14vZIrI0lHZKX9CilJjpjC4uRpu3LS8zVcSAvg9QQ3/s+JcRaHPQW61vIBkEyRk82
 rTcFY48cqEeg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418602187"
Received: from jlowe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:18:57 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed, 31 Mar 2021 11:18:50 +0100
Message-Id: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

RC6 support cannot be simply established by looking at the static device
HAS_RC6() flag. There are cases which disable RC6 at driver load time so
use the status of those check when deciding whether to enumerate the rc6
counter.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 41651ac255fa..a75cd1db320b 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -476,6 +476,8 @@ engine_event_status(struct intel_engine_cs *engine,
 static int
 config_status(struct drm_i915_private *i915, u64 config)
 {
+	struct intel_gt *gt = &i915->gt;
+
 	switch (config) {
 	case I915_PMU_ACTUAL_FREQUENCY:
 		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
@@ -489,7 +491,7 @@ config_status(struct drm_i915_private *i915, u64 config)
 	case I915_PMU_INTERRUPTS:
 		break;
 	case I915_PMU_RC6_RESIDENCY:
-		if (!HAS_RC6(i915))
+		if (!gt->rc6.supported)
 			return -ENODEV;
 		break;
 	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
