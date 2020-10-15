Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB2EC433E7
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 19:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA21206DD
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 19:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA21206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73A76E0EC;
	Thu, 15 Oct 2020 19:50:44 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0496E0EC
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 19:50:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22728731-1500050 
 for multiple; Thu, 15 Oct 2020 20:50:24 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 20:50:23 +0100
Message-Id: <20201015195023.32346-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Delay execlist processing for tgl
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

When running gem_exec_nop, it floods the system with many requests (with
the goal of userspace submitting faster than the HW can process a single
empty batch). This causes the driver to continually resubmit new
requests onto the end of an active context, a flood of lite-restore
preemptions. If we time this just right, Tigerlake hangs.

Inserting a small delay between the processing of CS events and
submitting the next context, prevents the hang. Naturally it does not
occur with debugging enabled. The suspicion then is that this is related
to the issues with the CS event buffer, and inserting an mmio read of
the CS pointer status appears to be very successful in preventing the
hang. Other registers, or uncached reads, or plain mb, do not prevent
the hang, suggesting that register is key -- but that the hang can be
prevented by a simple udelay, suggests it is just a timing issue like
that encountered by commit 233c1ae3c83f ("drm/i915/gt: Wait for CSB
entries on Tigerlake"). Also note that the hang is not prevented by
applying CTX_DESC_FORCE_RESTORE, or by inserting a delay on the GPU
between requests.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 6170f6874f52..d15d561152ba 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -2711,6 +2711,9 @@ static void process_csb(struct intel_engine_cs *engine)
 			smp_wmb(); /* complete the seqlock */
 			WRITE_ONCE(execlists->active, execlists->inflight);
 
+			/* Magic delay for tgl */
+			ENGINE_POSTING_READ(engine, RING_CONTEXT_STATUS_PTR);
+
 			WRITE_ONCE(execlists->pending[0], NULL);
 		} else {
 			if (GEM_WARN_ON(!*execlists->active)) {
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
