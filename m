Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D62C64E90
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 16:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136AA2225E
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 16:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136AA2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9676E81D;
	Tue,  1 Dec 2020 16:13:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BB76E550
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 16:13:46 +0000 (UTC)
IronPort-SDR: Uod1cl23oX6o3imN4CUCSigoTeT94onDe4MCrJdHBN0YfT6QTCH5AQTNnY/PrNgXEU/1PiN7HY
 WNNDUNXfA8cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="160625337"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="160625337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:13:45 -0800
IronPort-SDR: Igro1hWEKSmMb+IT/CNTxTr1A/MAdJSltrS4KNvfdzTed3X19Hun93/rN2ePtR/sNG0O/tCBZl
 sH0Fg2bQEw+g==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="481158930"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:13:44 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 18:13:40 +0200
Message-Id: <20201201161340.2879202-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130212200.2811939-9-imre.deak@intel.com>
References: <20201130212200.2811939-9-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 8/9] drm/i915: Track power reference taken to
 disable power well functionality
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

Add wakeref tracking for the display power domain reference taken to
keep the display power well functionality disabled.

v2: Add missing wakeref zeroing to intel_power_domains_driver_remove()

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 13 +++++++++----
 drivers/gpu/drm/i915/display/intel_display_power.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 75e805d11dd9..1b3b2de9158f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -5663,8 +5663,11 @@ void intel_power_domains_init_hw(struct drm_i915_private *i915, bool resume)
 		intel_display_power_get(i915, POWER_DOMAIN_INIT);
 
 	/* Disable power support if the user asked so. */
-	if (!i915->params.disable_power_well)
-		intel_display_power_get(i915, POWER_DOMAIN_INIT);
+	if (!i915->params.disable_power_well) {
+		drm_WARN_ON(&i915->drm, power_domains->disable_wakeref);
+		i915->power_domains.disable_wakeref = intel_display_power_get(i915,
+									      POWER_DOMAIN_INIT);
+	}
 	intel_power_domains_sync_hw(i915);
 
 	power_domains->initializing = false;
@@ -5688,7 +5691,8 @@ void intel_power_domains_driver_remove(struct drm_i915_private *i915)
 
 	/* Remove the refcount we took to keep power well support disabled. */
 	if (!i915->params.disable_power_well)
-		intel_display_power_put_unchecked(i915, POWER_DOMAIN_INIT);
+		intel_display_power_put(i915, POWER_DOMAIN_INIT,
+					fetch_and_zero(&i915->power_domains.disable_wakeref));
 
 	intel_display_power_flush_work_sync(i915);
 
@@ -5777,7 +5781,8 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
 	 * power wells if power domains must be deinitialized for suspend.
 	 */
 	if (!i915->params.disable_power_well)
-		intel_display_power_put_unchecked(i915, POWER_DOMAIN_INIT);
+		intel_display_power_put(i915, POWER_DOMAIN_INIT,
+					fetch_and_zero(&i915->power_domains.disable_wakeref));
 
 	intel_display_power_flush_work(i915);
 	intel_power_domains_verify_state(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 34de5487d8fc..2ef95ce17f60 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -213,6 +213,7 @@ struct i915_power_domains {
 	int power_well_count;
 
 	intel_wakeref_t init_wakeref;
+	intel_wakeref_t disable_wakeref;
 
 	struct mutex lock;
 	int domain_use_count[POWER_DOMAIN_NUM];
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
