Return-Path: <SRS0=v7GQ=KX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB869C4708C
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6141F613DA
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6141F613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E056E4B7;
	Fri, 28 May 2021 04:33:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FE66E4B7;
 Fri, 28 May 2021 04:33:40 +0000 (UTC)
IronPort-SDR: Sf+f06nsNoqSNjLV6YGpEazLPkZs1aaoPJwjfg4a3Kd7Z1F09EO7DbYk7the0QeDn97IJiHuDB
 YFIibGFHpyTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199853026"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="199853026"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 21:33:39 -0700
IronPort-SDR: rnRvkt/+ip+iHS2t0rIuXI0fVKNt9cs6O1X+FqSnDMpl/zQCgPzLmR5HN5AXCe0Vke/Ep0zdVp
 VSyFO7TlJmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="443853800"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga008.jf.intel.com with ESMTP; 27 May 2021 21:33:37 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 28 May 2021 09:54:43 +0530
Message-Id: <1622175883-12405-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_flip.c: Fix subtests
 flip-vs-suspend
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
Cc: markyacoub@chromium.org, charlton.lin@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Some Intel Gen11 systems are not able to do a RTC wake.
Instead change the default SUSPEND_TEST_NONE to
SUSPEND_TEST_PLATFORM.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_flip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8f736652be90..8afac88c9b15 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -835,7 +835,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 
 	if (o->flags & TEST_SUSPEND)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-					      SUSPEND_TEST_NONE);
+					      is_i915_device(drm_fd)?
+					      SUSPEND_TEST_PLATFORM:SUSPEND_TEST_NONE);
 
 	if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
 		igt_assert(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply)
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
