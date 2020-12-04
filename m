Return-Path: <SRS0=5A7x=FI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF96C433FE
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 19:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD9122582
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 19:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD9122582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7AF6E207;
	Fri,  4 Dec 2020 19:50:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036EC6E207;
 Fri,  4 Dec 2020 19:50:18 +0000 (UTC)
IronPort-SDR: mJZjdYcQH5RGD3h8i3NiXv9ueAmziRwVTQqRhQNzGoSKlc5I+oJf19wEEsa6+FgKHQiJIA/Kk9
 5RV0G073MK1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="161201963"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="161201963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 11:50:17 -0800
IronPort-SDR: 6CjMakKLV7oDNQ+HNsssFcnyfaCacwgZcyczvrH0kQkCC/B5c8dWhBExtHxGiyvVlMleAFELLl
 EEIFkT57n2Ug==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="482505982"
Received: from jkrzyszt-desk.ger.corp.intel.com (HELO
 jkrzyszt-desk.igk.intel.com) ([172.22.244.18])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 11:50:15 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Dec 2020 20:50:07 +0100
Message-Id: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v2] runner: Don't kill a test on taint if
 watching timeouts
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We may still be interested in results of a test even if it has tainted
the kernel.  On the other hand, we need to kill the test on taint if no
other means of killing it on a jam is active.

If abort on both kernel taint or a timeout is requested, decrease all
potential timeouts significantly while the taint is detected instead of
aborting immediately.  However, report the taint as the reason of the
abort if a timeout decreased by the taint expires.

v2: Fix missing show_kernel_task_state() lost on rebase conflict
    resolution (Chris - thanks!)

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 runner/executor.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 1688ae41d..faf272d85 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -726,6 +726,8 @@ static const char *need_to_timeout(struct settings *settings,
 				   double time_since_kill,
 				   size_t disk_usage)
 {
+	int decrease = 1;
+
 	if (killed) {
 		/*
 		 * Timeout after being killed is a hardcoded amount
@@ -753,20 +755,32 @@ static const char *need_to_timeout(struct settings *settings,
 	}
 
 	/*
-	 * If we're configured to care about taints, kill the
-	 * test if there's a taint.
+	 * If we're configured to care about taints,
+	 * decrease timeouts in use if there's a taint,
+	 * or kill the test if no timeouts have been requested.
 	 */
 	if (settings->abort_mask & ABORT_TAINT &&
-	    is_tainted(taints))
-		return "Killing the test because the kernel is tainted.\n";
+	    is_tainted(taints)) {
+		/* list of timeouts that may postpone immediate kill on taint */
+		if (settings->per_test_timeout || settings->inactivity_timeout)
+			decrease = 10;
+		else
+			return "Killing the test because the kernel is tainted.\n";
+	}
 
 	if (settings->per_test_timeout != 0 &&
-	    time_since_subtest > settings->per_test_timeout)
+	    time_since_subtest > settings->per_test_timeout / decrease) {
+		if (decrease > 1)
+			return "Killing the test because the kernel is tainted.\n";
 		return show_kernel_task_state("Per-test timeout exceeded. Killing the current test with SIGQUIT.\n");
+	}
 
 	if (settings->inactivity_timeout != 0 &&
-	    time_since_activity > settings->inactivity_timeout)
+	    time_since_activity > settings->inactivity_timeout / decrease ) {
+		if (decrease > 1)
+			return "Killing the test because the kernel is tainted.\n";
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
+	}
 
 	if (disk_usage_limit_exceeded(settings, disk_usage))
 		return "Disk usage limit exceeded.\n";
-- 
2.21.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
