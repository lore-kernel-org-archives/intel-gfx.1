Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D96C4363A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 08:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C470022249
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 08:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C470022249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF1A6EA78;
	Wed, 21 Oct 2020 08:21:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23536EA78
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 08:21:49 +0000 (UTC)
IronPort-SDR: oeVRj5zgcdrfb5zat7Eb0ez7wZ0LtoPRWgkmM3umePERUHVcoSpHAZMn88vZMvtWy7AaHqOezI
 xovwSCIt0XKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167452507"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="167452507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 01:21:49 -0700
IronPort-SDR: Bu+fetbbJ5WaNBX145HI8B7qHz35F3Vqxg6alNt/bH3b62KXGQqqw/6Wjs5hCtZluskXexrowZ
 HpPtCDBTLYuw==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="316303286"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 01:21:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2020 01:20:33 -0700
Message-Id: <20201021082034.3170478-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021082034.3170478-1-lucas.demarchi@intel.com>
References: <20201021082034.3170478-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 5/6] drm/i915/dg1: make Wa_22010271021 permanent
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

Just like for rkl and tgl, this should be permanent as well for dg1
instead just for A0. The commit making it permanent for those platforms
ended up "racing" with the commit adding the DG1 WAs, so now fix that up.

Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index fed9503a7c4e..8d24ea769fe6 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1768,6 +1768,14 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 */
 		wa_write_or(wal, GEN7_FF_THREAD_MODE,
 			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
+
+		/*
+		 * Wa_1606700617
+		 * Wa_22010271021:tgl,rkl,dg1
+		 */
+		wa_masked_en(wal,
+			     GEN9_CS_DEBUG_MODE1,
+			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
 	if (IS_DG1_REVID(i915, DG1_REVID_A0, DG1_REVID_A0) ||
@@ -1796,14 +1804,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     GEN6_RC_SLEEP_PSMI_CONTROL,
 			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
 			     GEN8_RC_SEMA_IDLE_MSG_DISABLE);
-
-		/*
-		 * Wa_1606700617:tgl
-		 * Wa_22010271021:tgl,rkl
-		 */
-		wa_masked_en(wal,
-			     GEN9_CS_DEBUG_MODE1,
-			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
 	if (IS_GEN(i915, 12)) {
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
