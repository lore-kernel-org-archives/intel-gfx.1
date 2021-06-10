Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9B7C47094
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 09:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72C461403
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 09:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72C461403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC0C88089;
	Thu, 10 Jun 2021 09:56:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B888089
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Jun 2021 09:56:30 +0000 (UTC)
IronPort-SDR: a/RLD/mPdCPKeJijl0IytcPsTwnDlSwqkyhIukO2a0blWtXPyGNq0D6s6zVvJwGjvn0RaFin9h
 ZBYWDZrYdP/g==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192379522"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="192379522"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 02:56:11 -0700
IronPort-SDR: 2i31jCAy4jSPOq0lYxkmwzOpMGDXh00D0tE6HANo/Q7than8KkVDeixQI/SuUJWihzV0iPpX+m
 J2J/IIZX1jlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="470207975"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2021 02:56:06 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Jun 2021 15:16:58 +0530
Message-Id: <20210610094658.480636-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] Revert "drm/i915: Apply Wa_1406680159:icl,
 ehl as an engine workaround"
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

This reverts commit fb899dd8ea9c4ac5928b86946e6536790981adae.

w/a on mentioned platforms not working as expected and causing
more harm on the RC6 flow.

Fixes: fb899dd8ea9c ("drm/i915: Apply Wa_1406680159:icl,ehl as an engine workaround")
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index b62d1e31a645..fea7fde30d4a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1774,11 +1774,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
 			    PSDUNIT_CLKGATE_DIS);
 
-		/* Wa_1406680159:icl,ehl */
-		wa_write_or(wal,
-			    SUBSLICE_UNIT_LEVEL_CLKGATE,
-			    GWUNIT_CLKGATE_DIS);
-
 		/*
 		 * Wa_1408767742:icl[a2..forever],ehl[all]
 		 * Wa_1605460711:icl[a0..c0]
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
