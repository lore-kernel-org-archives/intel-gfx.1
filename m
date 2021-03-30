Return-Path: <SRS0=tdmG=I4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FBAC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 15:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3E961957
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 15:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3E961957
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FD16E911;
	Tue, 30 Mar 2021 15:06:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296DF6E911;
 Tue, 30 Mar 2021 15:06:47 +0000 (UTC)
IronPort-SDR: HIwQDfO4PgJxMogyN+XT6glkVMEqyMBIwg831PzqfXvieHPs4NZ0w1CU9TSRc/copjzI2KTVww
 Kc+9NXbKYEcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="178917951"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="178917951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 08:06:46 -0700
IronPort-SDR: Az5Jhl21qsF8JZHq2yTnBJuI3bdbKig11tfn2KuvtUl9RYz4S7wAxLqlQsy9dSxYBK2JxlHWzH
 I9pD78OHIhIQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="455058076"
Received: from beautiful-one.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 08:06:44 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Tue, 30 Mar 2021 16:06:37 +0100
Message-Id: <20210330150637.2547762-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/pmu: Do not report 100% RC6 if not
 supported
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We use GT parked status to estimate RC6 while not in use, however if RC6
is not supported to start with that does not work very well and produces a
false 100% RC6 readout.

Fix by not advancing the estimated RC6 counter when feature is not
supported.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 1fe699e30113 ("drm/i915/pmu: Fix sleep under atomic in RC6 readout")
Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 41651ac255fa..02fe0d22c470 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -191,7 +191,10 @@ static u64 get_rc6(struct intel_gt *gt)
 		 * on top of the last known real value, as the approximated RC6
 		 * counter value.
 		 */
-		val = ktime_since_raw(pmu->sleep_last);
+		if (gt->rc6.supported)
+			val = ktime_since_raw(pmu->sleep_last);
+		else
+			val = 0;
 		val += pmu->sample[__I915_SAMPLE_RC6].cur;
 	}
 
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
