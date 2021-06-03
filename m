Return-Path: <SRS0=IdPq=K5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72309C47096
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 04:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17375613D7
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 04:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17375613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F396F3A3;
	Thu,  3 Jun 2021 04:58:46 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E026F3A3;
 Thu,  3 Jun 2021 04:58:43 +0000 (UTC)
IronPort-SDR: qjNy3YRb/APp6ytWw2FDfWkL9CSG9hY274n8nte3MjWJPiOhF8hpKsUEEdilcTnFg9ONwQIK00
 xAodLJfCMiPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203956513"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203956513"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:41 -0700
IronPort-SDR: EIvT7zt1rJCe7/6Jzq8uwDFWFgxjrVoR7q5RkNzwuCNJB3uApBZzAdqBD0x1G+fr/q2VNT+2Ei
 kWJxM+vcEdeQ==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480020019"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Wed,  2 Jun 2021 22:16:25 -0700
Message-Id: <20210603051630.2635-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603051630.2635-1-matthew.brost@intel.com>
References: <20210603051630.2635-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 15/20] drm/i915/guc: Ensure H2G buffer updates
 visible before tail update
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
Cc: daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Ensure H2G buffer updates are visible before descriptor tail updates by
inserting a barrier between the H2G buffer update and the tail. The
barrier is simple wmb() for SMEM and is register write for LMEM. This is
needed if more than 1 H2G can be inflight at once.

If this barrier is not inserted it is possible the descriptor tail
update is scene by the GuC before H2G buffer update which results in the
GuC reading a corrupt H2G value. This can bring down the H2G channel
among other bad things.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 80976fe40fbf..31f83956bfc3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -328,6 +328,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 	return ++ct->requests.last_fence;
 }
 
+static void write_barrier(struct intel_guc_ct *ct)
+{
+	struct intel_guc *guc = ct_to_guc(ct);
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
+		GEM_BUG_ON(guc->send_regs.fw_domains);
+		/*
+		 * This register is used by the i915 and GuC for MMIO based
+		 * communication. Once we are in this code CTBs are the only
+		 * method the i915 uses to communicate with the GuC so it is
+		 * safe to write to this register (a value of 0 is NOP for MMIO
+		 * communication). If we ever start mixing CTBs and MMIOs a new
+		 * register will have to be chosen.
+		 */
+		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
+	} else {
+		/* wmb() sufficient for a barrier if in smem */
+		wmb();
+	}
+}
+
 /**
  * DOC: CTB Host to GuC request
  *
@@ -411,6 +433,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
+	/*
+	 * make sure H2G buffer update and LRC tail update (if this triggering a
+	 * submission) are visible before updating the descriptor tail
+	 */
+	write_barrier(ct);
+
 	/* now update desc tail (back in bytes) */
 	desc->tail = tail * 4;
 	return 0;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
