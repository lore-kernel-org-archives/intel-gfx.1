Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49116C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 12:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114AB60524
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 12:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 114AB60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3767B6E9F9;
	Tue,  9 Nov 2021 12:20:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E466E9F8;
 Tue,  9 Nov 2021 12:20:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219634277"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="219634277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 04:20:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="533664796"
Received: from fmpluck-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.200.63])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 04:20:42 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Tue,  9 Nov 2021 12:20:37 +0000
Message-Id: <20211109122037.171128-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Skip error capture when wedged on init
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Trying to capture uninitialised engines when we wedged on init ends in
tears. Skip that together with uC capture, since failure to initialise the
latter can actually be one of the reasons for wedging on init.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a2d7643b551..aa2b3aad9643 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1866,10 +1866,14 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 		}
 
 		gt_record_info(error->gt);
-		gt_record_engines(error->gt, engine_mask, compress);
 
-		if (INTEL_INFO(i915)->has_gt_uc)
-			error->gt->uc = gt_record_uc(error->gt, compress);
+		if (!intel_gt_has_unrecoverable_error(gt)) {
+			gt_record_engines(error->gt, engine_mask, compress);
+
+			if (INTEL_INFO(i915)->has_gt_uc)
+				error->gt->uc = gt_record_uc(error->gt,
+							     compress);
+		}
 
 		i915_vma_capture_finish(error->gt, compress);
 
-- 
2.30.2

