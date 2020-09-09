Return-Path: <SRS0=DO2q=CS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246BCC43461
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 19:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F7621D43
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 19:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F7621D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222AE6ECAE;
	Wed,  9 Sep 2020 19:26:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620AB6ECAE
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2020 19:25:59 +0000 (UTC)
IronPort-SDR: b744hQim1IdcsyfwTV5CDkmEH2a/4AD0TpFC0cLZt4mmdhWudeHx9ObWG6Fi77gDcyXSYj6pLj
 wyEK5InLcBEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="137925064"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="137925064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 12:25:58 -0700
IronPort-SDR: xzxWj5PBbHERtw6bqc3+bSwSUMDzGa2SFz8fGjG7OXre7rb8GyYEpiW7sShcDJvCVFy5MDlGZE
 rvSGTtqyfyHQ==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="304607214"
Received: from sdhanava-desk2.jf.intel.com ([10.165.21.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 12:25:58 -0700
From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  9 Sep 2020 12:14:10 -0700
Message-Id: <20200909191410.21051-1-swathi.dhanavanthri@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/tgl: Make Wa_1606700617/22010271021
 permanent
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

This workaround now applies to all TGL steppings.

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 39817c5a7058..f2225f065799 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1729,10 +1729,11 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     GEN6_RC_SLEEP_PSMI_CONTROL,
 			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
 			     GEN8_RC_SEMA_IDLE_MSG_DISABLE);
-	}
 
-	if (IS_TGL_U(i915) || IS_TGL_Y(i915)) {
-		/* Wa_1606700617:tgl */
+		/*
+		 * Wa_1606700617:tgl
+		 * Wa_22010271021:tgl
+		 */
 		wa_masked_en(wal,
 			     GEN9_CS_DEBUG_MODE1,
 			     FF_DOP_CLOCK_GATE_DISABLE);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
