Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95925C11F66
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 10:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565C761DC1
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 10:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565C761DC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90189E47;
	Tue, 29 Jun 2021 10:58:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269F89E47
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 10:58:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="269255793"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="269255793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 03:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="408126774"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2021 03:58:39 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Jun 2021 16:19:54 +0530
Message-Id: <20210629104954.927151-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
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

Removing force probe protection from EHL platform. Did
not observe warnings, errors, flickering or any visual
defects while doing ordinary tasks like browsing and
editing documents in a two monitor setup.

For more info drm-tip idle run results :
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip.html?

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f1f43192f9fb..7d472611a190 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -845,7 +845,6 @@ static const struct intel_device_info icl_info = {
 static const struct intel_device_info ehl_info = {
 	GEN11_FEATURES,
 	PLATFORM(INTEL_ELKHARTLAKE),
-	.require_force_probe = 1,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),
 	.ppgtt_size = 36,
 };
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
