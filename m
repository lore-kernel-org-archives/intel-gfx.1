Return-Path: <SRS0=vKGW=C2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF94C43461
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2020 16:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9279720838
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2020 16:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9279720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACF76EC5D;
	Thu, 17 Sep 2020 16:50:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAF36EC5B
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2020 16:50:56 +0000 (UTC)
IronPort-SDR: eWY9EvXmD5hxV0dt8kIovu27JGAk0JdXFuxMgrWIu9T63vcDwqHz/LLIk9KwPjOBIITvg+HPUf
 XNuQO5ZOUlKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159791461"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="159791461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:50:54 -0700
IronPort-SDR: FwwoLzc07HA1WumQCHTWm+k5EkGnLEbeVvHBUf3qZljEb7t4T40V0rj1yp6fjbUijBHo7UyU3d
 XbGVK0B/Dkqw==
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="452382705"
Received: from wgitix-mobl.ger.corp.intel.com (HELO localhost) ([10.251.83.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:50:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Sep 2020 19:50:56 +0300
Message-Id: <20200917165056.29766-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/uc: tune down GuC communication
 enabled/disabled messages
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
Cc: jani.nikula@intel.com, Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The GuC communication enabled/disabled messages are too noisy in info
level. Convert them from info to debug level, and switch to device based
logging while at it.

Reported-by: Karol Herbst <kherbst@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index d6f55f70889d..4e6070e95fe9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -231,13 +231,15 @@ static int guc_enable_communication(struct intel_guc *guc)
 	intel_guc_ct_event_handler(&guc->ct);
 	spin_unlock_irq(&i915->irq_lock);
 
-	DRM_INFO("GuC communication enabled\n");
+	drm_dbg(&i915->drm, "GuC communication enabled\n");
 
 	return 0;
 }
 
 static void guc_disable_communication(struct intel_guc *guc)
 {
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+
 	/*
 	 * Events generated during or after CT disable are logged by guc in
 	 * via mmio. Make sure the register is clear before disabling CT since
@@ -257,7 +259,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_get_mmio_msg(guc);
 
-	DRM_INFO("GuC communication disabled\n");
+	drm_dbg(&i915->drm, "GuC communication disabled\n");
 }
 
 static void __uc_fetch_firmwares(struct intel_uc *uc)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
