Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3DEEA84B
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 19:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689ED10E258;
	Thu, 12 Feb 2026 19:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3VTID+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1810E258
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770925300; x=1802461300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xyJSUM4W93DWhx8kUYq/lQweeN7JJpvjOnA2/+7OTQk=;
 b=f3VTID+Ks/pAEjjQD17hIJU+Skcc1Ztt9IZhkdMugMGtPS/RVcocVf1F
 i5FIYS/VCn4O4A9P4IEddZ41qSFTengUe9j6ptRPHaJ4P9cL1AhCbP4oZ
 4HitQtgb9m+Y6JWcfTLKh5Tl+6QRNwc1TV+4O8PbwEq2PNDKfimiQUjf3
 fBA0nhDwgahrbdpyd+PZc7GYzbICKR4NYaK/yqZXLgt/kXjRGOkIBj9FG
 e0ytZD+uxjRUEbQ+nZopfVVBQNAaQfjZReyC6cz8i4H1m6leiMCkk6NTH
 1DGW0x8iPNbC18R8hvW39hezBIF137MfAgPQia5wGRypdN+UTt61P9OsS Q==;
X-CSE-ConnectionGUID: SrxIs9PWR7GRcbsV8BaCZQ==
X-CSE-MsgGUID: 05p2o7ibSPa+vVk4+AbdPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74710347"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="74710347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:41:39 -0800
X-CSE-ConnectionGUID: WiYDMITQSAifaKbXsYxdIQ==
X-CSE-MsgGUID: XCjq7XtDSvu4DNzszNxe2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217665619"
Received: from dut4086lnl.fm.intel.com ([10.105.11.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:41:39 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/i915/gvt: Cast u64 array to u32 array
Date: Thu, 12 Feb 2026 19:41:32 +0000
Message-ID: <20260212194131.64708-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Static analysis issue:

The u64 array workload->shadow_mm->ppgtt_mm.shadow_pdps is cast to a
void pointer and passed as a u32 array to set_context_pdp_root_pointer
as a part of update_shadow_pdps.  This isn't wrong, per se, but we
should properly cast it to an appropriately-sized u32 array before
submission.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 15fdd514ca83..1a95c9f76faa 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -72,6 +72,7 @@ static void update_shadow_pdps(struct intel_vgpu_workload *workload)
 {
 	struct execlist_ring_context *shadow_ring_context;
 	struct intel_context *ctx = workload->req->context;
+	u32 pdp[8];
 
 	if (WARN_ON(!workload->shadow_mm))
 		return;
@@ -79,9 +80,10 @@ static void update_shadow_pdps(struct intel_vgpu_workload *workload)
 	if (WARN_ON(!atomic_read(&workload->shadow_mm->pincount)))
 		return;
 
+	memcpy(pdp, workload->shadow_mm->ppgtt_mm.shadow_pdps,
+	       sizeof(u64) * ARRAY_SIZE(workload->shadow_mm->ppgtt_mm.shadow_pdps));
 	shadow_ring_context = (struct execlist_ring_context *)ctx->lrc_reg_state;
-	set_context_pdp_root_pointer(shadow_ring_context,
-			(void *)workload->shadow_mm->ppgtt_mm.shadow_pdps);
+	set_context_pdp_root_pointer(shadow_ring_context, pdp);
 }
 
 /*
-- 
2.43.0

