Return-Path: <SRS0=0RYq=D5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B02C388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 21:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9A320874
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 21:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9A320874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147666E252;
	Thu, 22 Oct 2020 21:08:24 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B2B6E252
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 21:08:22 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22779077-1500050 
 for multiple; Thu, 22 Oct 2020 22:08:16 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Oct 2020 22:08:14 +0100
Message-Id: <20201022210814.23004-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: Skip RPS tests on Ironlake
 (only IPS)
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

Since Ironlake uses intel_ips.ko for its dynamic frequency adjustment,
we do not have direct control over the frequency management so such
tests are defunct. Similarly, we can't check the gen6+ RPS registers on
Ironlake.

Hopefully this catches all the invalid tests now that Ironlake has
rejoined the dynamic GPU frequency club.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/selftest_rps.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index 3540ba9bd459..aa5675ecb5cc 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -219,7 +219,7 @@ int live_rps_clock_interval(void *arg)
 	struct igt_spinner spin;
 	int err = 0;
 
-	if (!intel_rps_is_enabled(rps))
+	if (!intel_rps_is_enabled(rps) || INTEL_GEN(gt->i915) < 6)
 		return 0;
 
 	if (igt_spinner_init(&spin, gt))
@@ -1028,7 +1028,7 @@ int live_rps_interrupt(void *arg)
 	 * First, let's check whether or not we are receiving interrupts.
 	 */
 
-	if (!intel_rps_has_interrupts(rps))
+	if (!intel_rps_has_interrupts(rps) || INTEL_GEN(gt->i915) < 6)
 		return 0;
 
 	intel_gt_pm_get(gt);
@@ -1133,7 +1133,7 @@ int live_rps_power(void *arg)
 	 * that theory.
 	 */
 
-	if (!intel_rps_is_enabled(rps))
+	if (!intel_rps_is_enabled(rps) || INTEL_GEN(gt->i915) < 6)
 		return 0;
 
 	if (!librapl_energy_uJ())
@@ -1237,7 +1237,7 @@ int live_rps_dynamic(void *arg)
 	 * moving parts into dynamic reclocking based on load.
 	 */
 
-	if (!intel_rps_is_enabled(rps))
+	if (!intel_rps_is_enabled(rps) || INTEL_GEN(gt->i915) < 6)
 		return 0;
 
 	if (igt_spinner_init(&spin, gt))
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
