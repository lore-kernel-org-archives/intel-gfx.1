Return-Path: <SRS0=tBxe=E6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D232C56202
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 18:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984FC206D8
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 18:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984FC206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9792889149;
	Tue, 24 Nov 2020 18:35:44 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4C089149
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 18:35:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23095651-1500050 
 for multiple; Tue, 24 Nov 2020 18:35:22 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 24 Nov 2020 18:35:21 +0000
Message-Id: <20201124183521.28623-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Limit frequency drop to RPe on
 parking
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
Cc: stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We treat idling the GT (intel_rps_park) as a downclock event, and reduce
the frequency we intend to restart the GT with. Since the two workloads
are likely related (e.g. a compositor rendering every 16ms), we want to
carry the frequency and load information from across the idling.
However, we do also need to update the frequencies so that workloads
that run for less than 1ms are autotuned by RPS (otherwise we leave
compositors running at max clocks, draining excess power). Conversely,
if we try to run too slowly, the next workload has to run longer. Since
there is a hysteresis in the power graph, below a certain frequency
running a short workload for longer consumes more energy than running it
slightly higher for less time. The exact balance point is unknown
beforehand, but measurements with 30fps media playback indicate that RPe
is a better choice.

Reported-by: Edward Baker <edward.baker@intel.com>
Fixes: 043cd2d14ede ("drm/i915/gt: Leave rps->cur_freq on unpark")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Edward Baker <edward.baker@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index b13e7845d483..f74d5e09e176 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -907,6 +907,10 @@ void intel_rps_park(struct intel_rps *rps)
 		adj = -2;
 	rps->last_adj = adj;
 	rps->cur_freq = max_t(int, rps->cur_freq + adj, rps->min_freq);
+	if (rps->cur_freq < rps->efficient_freq) {
+		rps->cur_freq = rps->efficient_freq;
+		rps->last_adj = 0;
+	}
 
 	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
