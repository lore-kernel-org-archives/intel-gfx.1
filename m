Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FFAC432BE
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61E3610FB
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D61E3610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B876E32F;
	Wed, 25 Aug 2021 15:22:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40B96E334
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 15:22:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217263650"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="217263650"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:22:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="527366030"
Received: from vcheppax-mobl1.gar.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.255.37.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:22:40 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Weinehall <david.weinehall@linux.intel.com>,
 Tilak Tangudu <tilak.tangudu@intel.com>
Date: Wed, 25 Aug 2021 11:22:33 -0400
Message-Id: <20210825152233.2151037-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825152233.2151037-1-rodrigo.vivi@intel.com>
References: <20210825152233.2151037-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/4] drm/i915/runtime_pm: Reduce autosuspend
 delay to 1s.
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

Let's try to be more aggressive on the power savings, but
not as much as 0.1s that caused us some regression in the
past.

Also let's have this in a separated patch so that can be
bisected and increased back (or reverted) as needed.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Weinehall <david.weinehall@linux.intel.com>
Cc: Tilak Tangudu <tilak.tangudu@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 8f052bd4f58c..3244ac85d13c 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -585,7 +585,7 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 	 */
 	dev_pm_set_driver_flags(kdev, DPM_FLAG_NO_DIRECT_COMPLETE);
 
-	pm_runtime_set_autosuspend_delay(kdev, 10000); /* 10s */
+	pm_runtime_set_autosuspend_delay(kdev, 1000); /* 1s */
 	pm_runtime_mark_last_busy(kdev);
 
 	/*
-- 
2.31.1

