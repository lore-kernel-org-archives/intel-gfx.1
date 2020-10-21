Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB019C56202
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 19:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4903D2415B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 19:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4903D2415B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE256F4B0;
	Wed, 21 Oct 2020 19:14:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C85D6EE41
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 19:13:58 +0000 (UTC)
IronPort-SDR: BB8wahyG19sOAehEsM4PUhbrStxb3COoa0/odFBy7w5EZdgp3EJoRdPZ4l6WREIp++E75oAEvq
 Z0a93cERv5mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="155206505"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="155206505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 12:13:57 -0700
IronPort-SDR: 54k/jwYwEwiP8YFEH2xTaBxroCNSG2LOeI02FIfFytnL1liwFfjO5BHmNhvzN1sg0wBMs3PMCF
 T+AgKYsKKvkw==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="533651653"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 12:13:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2020 12:14:54 -0700
Message-Id: <20201021191454.13418-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/guc: skip disabling CTBs before
 sanitizing the GuC
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

If we're about to sanitize the GuC, something might have gone wrong
beforehand, so we should avoid trying to talk to it. Even if GuC is
still running fine, the sanitize will reset its internal state and clear
the CTB registration, so there is still no need to explicitly do so.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/2469
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4e6070e95fe9..309eef9313e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -486,7 +486,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 
 	ret = intel_guc_sample_forcewake(guc);
 	if (ret)
-		goto err_communication;
+		goto err_log_capture;
 
 	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_enable(guc);
@@ -511,8 +511,6 @@ static int __uc_init_hw(struct intel_uc *uc)
 	/*
 	 * We've failed to load the firmware :(
 	 */
-err_communication:
-	guc_disable_communication(guc);
 err_log_capture:
 	__uc_capture_load_err_log(uc);
 err_out:
@@ -540,9 +538,6 @@ static void __uc_fini_hw(struct intel_uc *uc)
 	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_disable(guc);
 
-	if (guc_communication_enabled(guc))
-		guc_disable_communication(guc);
-
 	__uc_sanitize(uc);
 }
 
@@ -559,7 +554,6 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
 	if (!intel_guc_is_ready(guc))
 		return;
 
-	guc_disable_communication(guc);
 	__uc_sanitize(uc);
 }
 
-- 
2.24.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
