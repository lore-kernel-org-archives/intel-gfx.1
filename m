Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27641C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4F661107
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC4F661107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D4D6ED0D;
	Thu, 23 Sep 2021 07:35:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C486ECFE
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Sep 2021 07:35:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="223816423"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223816423"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="558167604"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2021 00:35:00 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 23 Sep 2021 00:35:29 -0700
Message-Id: <20210923073529.1058204-18-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923073529.1058204-1-alan.previn.teres.alexis@intel.com>
References: <20210923073529.1058204-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v12 17/17] drm/i915/pxp: enable PXP for
 integrated Gen12
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

Note that discrete cards can support PXP as well, but we haven't tested
on those yet so keeping it disabled for now.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d4a6a9dcf182..169837de395d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -865,6 +865,7 @@ static const struct intel_device_info jsl_info = {
 	}, \
 	TGL_CURSOR_OFFSETS, \
 	.has_global_mocs = 1, \
+	.has_pxp = 1, \
 	.display.has_dsb = 1
 
 static const struct intel_device_info tgl_info = {
@@ -891,6 +892,7 @@ static const struct intel_device_info rkl_info = {
 #define DGFX_FEATURES \
 	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
 	.has_llc = 0, \
+	.has_pxp = 0, \
 	.has_snoop = 1, \
 	.is_dgfx = 1
 
-- 
2.25.1

