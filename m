Return-Path: <SRS0=rL+1=FJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DB4C433FE
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 09:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526D822E00
	for <intel-gfx@archiver.kernel.org>; Sat,  5 Dec 2020 09:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526D822E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF6F6E419;
	Sat,  5 Dec 2020 09:25:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869856E418
 for <intel-gfx@lists.freedesktop.org>; Sat,  5 Dec 2020 09:25:48 +0000 (UTC)
IronPort-SDR: jGceQooEQ1/+HXgnuaYPivLpahQI+0AHy3jG5cRUM92rMXM2AU5MrHEMdsrItoLeTkahbWbrAR
 aW+p+dG8DhWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="169991256"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="169991256"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 01:25:48 -0800
IronPort-SDR: 1IN9YVmX+1FQWncoJfvM0+twQKpmTIY/rMe8cIdtQklJg1bU3hRuU17n9ndqr+03wWj2qw6SlH
 HkAd6QzN5qFA==
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="362441880"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 01:25:48 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sat,  5 Dec 2020 01:25:39 -0800
Message-Id: <20201205092542.2325477-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/4] drm/i915/dg1: Implement WA_16011163337
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>

Set GS Timer to 224 to prevent a HS/DS hang.

Bspec: 53508

v2: reword commit message and add comment explaining why read
verification is ignored (Chris)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 7c6b21ced56f..a81728c52bd5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -686,6 +686,16 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
 	/* Wa_22010493298 */
 	WA_SET_BIT_MASKED(HIZ_CHICKEN,
 			  DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
+
+	/*
+	 * Wa_16011163337
+	 *
+	 * Like in tgl_ctx_workarounds_init(), read verification is ignored due
+	 * to Wa_1608008084.
+	 */
+	wa_add(wal,
+	       FF_MODE2,
+	       FF_MODE2_GS_TIMER_MASK, FF_MODE2_GS_TIMER_224, 0);
 }
 
 static void
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
