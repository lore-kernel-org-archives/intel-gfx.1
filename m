Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B39C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6271D6101A
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6271D6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82646E865;
	Fri,  3 Sep 2021 09:25:16 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEEE6E865
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Sep 2021 09:25:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="241659010"
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="241659010"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="521620382"
Received: from ayazahma-nuc8i7beh.iind.intel.com ([10.145.162.59])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2021 02:25:13 -0700
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Fri,  3 Sep 2021 14:51:53 +0530
Message-Id: <20210903092153.535736-6-ayaz.siddiqui@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210903092153.535736-1-ayaz.siddiqui@intel.com>
References: <20210903092153.535736-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH V5 5/5] drm/i915/gt: Initialize L3CC table in
 mocs init
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

From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>

Initialize the L3CC table as part of mocs initialization to program
LNCFCMOCSx registers so that the mocs settings are available for
selection for subsequent memory transactions in the driver load path.

We need to keep L3CC initialization in intel_mocs_init_engine() also
so that in execlists submission, these registers can be rewritten
during engine reset.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_mocs.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 552bfd1c113b1..e96afd7beb499 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -481,10 +481,9 @@ static u32 l3cc_combine(u16 low, u16 high)
 	     0; \
 	     i++)
 
-static void init_l3cc_table(struct intel_engine_cs *engine,
+static void init_l3cc_table(struct intel_uncore *uncore,
 			    const struct drm_i915_mocs_table *table)
 {
-	struct intel_uncore *uncore = engine->uncore;
 	unsigned int i;
 	u32 l3cc;
 
@@ -509,7 +508,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
 		init_mocs_table(engine, &table);
 
 	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
-		init_l3cc_table(engine, &table);
+		init_l3cc_table(engine->uncore, &table);
 }
 
 static u32 global_mocs_offset(void)
@@ -536,6 +535,14 @@ void intel_mocs_init(struct intel_gt *gt)
 	flags = get_mocs_settings(gt->i915, &table);
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
+
+	/*
+	 * Initialize the L3CC table as part of mocs initalization to make
+	 * sure the LNCFCMOCSx registers are programmed for the subsequent
+	 * memory transactions including guc transactions
+	 */
+	if (flags & HAS_RENDER_L3CC)
+		init_l3cc_table(gt->uncore, &table);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-- 
2.26.2

