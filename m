Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46FEC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B450360F21
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B450360F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EA389DFD;
	Tue, 14 Sep 2021 09:11:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FEC89DFD
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 09:11:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221601321"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221601321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 02:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="650691908"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2021 02:11:25 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 14 Sep 2021 14:34:12 +0530
Message-Id: <20210914090412.1393498-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Remove warning from the rps worker
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

In commit 4e5c8a99e1cb ("drm/i915: Drop i915_request.lock requirement
for intel_rps_boost()"), we decoupled the rps worker from the pm so
that we could avoid the synchronization penalty which makes the
assertion liable to run too early. Which makes warning invalid hence
removed.

Fixes: 4e5c8a99e1cb ("drm/i915: Drop i915_request.lock requirement for intel_rps_boost()")

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index e1a198bbd135..172de6c9f949 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -882,8 +882,6 @@ void intel_rps_park(struct intel_rps *rps)
 	if (!intel_rps_is_enabled(rps))
 		return;
 
-	GEM_BUG_ON(atomic_read(&rps->num_waiters));
-
 	if (!intel_rps_clear_active(rps))
 		return;
 
-- 
2.31.1

