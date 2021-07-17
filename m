Return-Path: <SRS0=UgYw=MJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACD5C636CB
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 05:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339346115B
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 05:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 339346115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836A6EA1A;
	Sat, 17 Jul 2021 05:14:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7B76EA14
 for <intel-gfx@lists.freedesktop.org>; Sat, 17 Jul 2021 05:14:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="191188868"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="191188868"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 22:14:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="563335061"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 22:14:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Jul 2021 22:14:21 -0700
Message-Id: <20210717051426.4120328-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210717051426.4120328-1-matthew.d.roper@intel.com>
References: <20210717051426.4120328-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/7] drm/i915/icl: Drop a couple unnecessary
 workarounds
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

While doing a quick sanity check of the ICL workarounds in the driver I
noticed a few things that should be updated:

 * There's no mention in the bspec that WaPipelineFlushCoherentLines
   is needed on gen11 (both the current WA database and the old,
   deprecated page 20196 were checked); it appears this might have just
   been copied from the gen9 list?  Even if this were needed, it doesn't
   seem like this was the correct implementation anyway since the gen9
   workaround is supposed to be implemented in the indirect context bb
   (as we do in gen8_emit_flush_coherentl3_wa() on gen8/gen9).

 * WaForwardProgressSoftReset does not appear in the current workaround
   database.  The old deprecated workaround list has a note indicating
   the workaround was dropped in 2017, so we should be safe to drop it
   from the code too.

While we're at it, add the formal workaround ID number to
WaDisableBankHangMode (our hardware team made a transition from
text-based workaround names to ID numbers partway through the
development of ICL, which is why some workarounds only have names, some
only have numbers, and some have both).

Bspec: 33450
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 76a3b5d5e9dc..36d972492883 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -517,7 +517,7 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
 static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 				     struct i915_wa_list *wal)
 {
-	/* WaDisableBankHangMode:icl */
+	/* Wa_1406697149 (WaDisableBankHangMode:icl) */
 	wa_write(wal,
 		 GEN8_L3CNTLREG,
 		 intel_uncore_read(engine->uncore, GEN8_L3CNTLREG) |
@@ -1587,11 +1587,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     _3D_CHICKEN3,
 			     _3D_CHICKEN3_AA_LINE_QUALITY_FIX_ENABLE);
 
-		/* WaPipelineFlushCoherentLines:icl */
-		wa_write_or(wal,
-			    GEN8_L3SQCREG4,
-			    GEN8_LQSC_FLUSH_COHERENT_LINES);
-
 		/*
 		 * Wa_1405543622:icl
 		 * Formerly known as WaGAPZPriorityScheme
@@ -1621,13 +1616,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			    GEN8_L3SQCREG4,
 			    GEN11_LQSC_CLEAN_EVICT_DISABLE);
 
-		/* WaForwardProgressSoftReset:icl */
-		wa_write_or(wal,
-			    GEN10_SCRATCH_LNCF2,
-			    PMFLUSHDONE_LNICRSDROP |
-			    PMFLUSH_GAPL3UNBLOCK |
-			    PMFLUSHDONE_LNEBLK);
-
 		/* Wa_1606682166:icl */
 		wa_write_or(wal,
 			    GEN7_SARCHKMD,
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
