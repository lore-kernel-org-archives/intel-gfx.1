Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA58C4707F
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 05:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C0986140F
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 05:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C0986140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4996E96B;
	Tue, 25 May 2021 05:48:50 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0456E9A5;
 Tue, 25 May 2021 05:48:47 +0000 (UTC)
IronPort-SDR: iS5BaN5IJQS0Um5IZGg3sPcN10RUQWoKhxwyugkpK1D7BaHStpPp6E06hsZzd5+rhTXwHiUrbv
 3SzqcLEFz3Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005471"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005471"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:46 -0700
IronPort-SDR: WKSR6IRuT08c29fYRhxXVK9BqoyjsNAz+VxFC7yJytnIs01qeTtif5T4NvezGBcoszQsh+E+ZX
 u3ZfFNeCcRjg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231831"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 24 May 2021 22:48:03 -0700
Message-Id: <20210525054803.7387-18-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 17/17] drm/i915/pxp: enable PXP for
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Note that discrete cards can support PXP as well, but we haven't tested
on those yet so keeping it disabled for now.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 97c98f4fb265..23f249797ad8 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -884,6 +884,7 @@ static const struct intel_device_info jsl_info = {
 	}, \
 	TGL_CURSOR_OFFSETS, \
 	.has_global_mocs = 1, \
+	.has_pxp = 1, \
 	.display.has_dsb = 1
 
 static const struct intel_device_info tgl_info = {
@@ -911,6 +912,7 @@ static const struct intel_device_info rkl_info = {
 	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
 	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
+	.has_pxp = 0, \
 	.has_snoop = 1, \
 	.is_dgfx = 1
 
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
