Return-Path: <SRS0=4rgl=NX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF74C432BE
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 15:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D851961056
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 15:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D851961056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21126E1EC;
	Wed,  1 Sep 2021 15:15:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944E6E1EC
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Sep 2021 15:15:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="304352215"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="304352215"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 08:15:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="498930524"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.24.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 08:15:00 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed,  1 Sep 2021 17:14:15 +0200
Message-Id: <20210901151415.177556-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Mark GPU wedging on driver unregister
 unrecoverable
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

GPU wedged flag now set on driver unregister to prevent from further
using the GPU can be then cleared unintentionally when calling
__intel_gt_unset_wedged() still before the flag is finally marked
unrecoverable.  We need to have it marked unrecoverable earlier.
Implement that by replacing a call to intel_gt_set_wedged() in
intel_gt_driver_unregister() with intel_gt_set_wedged_on_fini().

With the above in place, intel_gt_set_wedged_on_fini() is now called
twice on driver remove, second time from __intel_gt_disable().  This
seems harmless, while dropping intel_gt_set_wedged_on_fini() from
__intel_gt_disable() proved to break some driver probe error unwind
paths as well as mock selftest exit path.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 62d40c986642..173b53cb2b47 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -750,7 +750,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	 * all in-flight requests so that we can quickly unbind the active
 	 * resources.
 	 */
-	intel_gt_set_wedged(gt);
+	intel_gt_set_wedged_on_fini(gt);
 
 	/* Scrub all HW state upon release */
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-- 
2.25.1

