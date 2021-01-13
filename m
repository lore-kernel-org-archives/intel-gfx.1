Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2EAC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9A323382
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9A323382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C416E9F6;
	Wed, 13 Jan 2021 14:13:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A91E6EA1A
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 14:13:26 +0000 (UTC)
IronPort-SDR: ulSyb/n7XtOEM4uDfDz2bjJARHyDnbIKrpgTDXCuUFGN1jGaWgNrr5j8FMMIwbOj5z0urZdI89
 7ZHP5WNcHx+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165881425"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="165881425"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:13:25 -0800
IronPort-SDR: +KshcCxnMZgQL+DfSisFj9xyTU5xRYqiVb4PI5lDkVcf2wRN9R/rvGKHCRPldr68/hiLiRPa6g
 pnxCKK6de72A==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="381864773"
Received: from iklein-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:13:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 13 Jan 2021 16:13:17 +0200
Message-Id: <20210113141317.30765-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: fix the uint*_t types that
 have crept in
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Always prefer the kernel types over stdint types in i915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_mocs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index ca72894918ba..cf373c72359e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -99,7 +99,7 @@ static void live_mocs_fini(struct live_mocs *arg)
 
 static int read_regs(struct i915_request *rq,
 		     u32 addr, unsigned int count,
-		     uint32_t *offset)
+		     u32 *offset)
 {
 	unsigned int i;
 	u32 *cs;
@@ -127,7 +127,7 @@ static int read_regs(struct i915_request *rq,
 
 static int read_mocs_table(struct i915_request *rq,
 			   const struct drm_i915_mocs_table *table,
-			   uint32_t *offset)
+			   u32 *offset)
 {
 	u32 addr;
 
@@ -141,7 +141,7 @@ static int read_mocs_table(struct i915_request *rq,
 
 static int read_l3cc_table(struct i915_request *rq,
 			   const struct drm_i915_mocs_table *table,
-			   uint32_t *offset)
+			   u32 *offset)
 {
 	u32 addr = i915_mmio_reg_offset(GEN9_LNCFCMOCS(0));
 
@@ -150,7 +150,7 @@ static int read_l3cc_table(struct i915_request *rq,
 
 static int check_mocs_table(struct intel_engine_cs *engine,
 			    const struct drm_i915_mocs_table *table,
-			    uint32_t **vaddr)
+			    u32 **vaddr)
 {
 	unsigned int i;
 	u32 expect;
@@ -179,7 +179,7 @@ static bool mcr_range(struct drm_i915_private *i915, u32 offset)
 
 static int check_l3cc_table(struct intel_engine_cs *engine,
 			    const struct drm_i915_mocs_table *table,
-			    uint32_t **vaddr)
+			    u32 **vaddr)
 {
 	/* Can we read the MCR range 0xb00 directly? See intel_workarounds! */
 	u32 reg = i915_mmio_reg_offset(GEN9_LNCFCMOCS(0));
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
