Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F95C2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 22:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7234920678
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 22:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7234920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E156E139;
	Tue, 17 Nov 2020 22:23:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD956E139
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 22:23:10 +0000 (UTC)
IronPort-SDR: MvcO36ZzlwCqmguxPv1CoDPBOQlQo9FTihjtRW0MvWjWrUmC2VSuQDJKP7NMbTsxRjbYmDcNYO
 uy1ZfERxJpXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171193595"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="171193595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 14:23:09 -0800
IronPort-SDR: 7UTrZVbteuOh1syZHf4RpD5KF92bJ94jC/KbLV/Vv++EuAoNPz8Nc5yQQQqLcrIltJ7zRStQtW
 KRalLwVmVlWw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="359076510"
Received: from gfox.jf.intel.com ([10.165.21.193])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 14:23:08 -0800
From: Steve Hampson <steven.t.hampson@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2020 14:23:08 -0800
Message-Id: <20201117222308.31551-1-steven.t.hampson@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] i915/gem_flink_race: Fix error in buffer usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

A buffer in function test_flink_name was both too small and never
checked for overflow.  Both errors are fixed.

Signed-off-by: Steve Hampson <steven.t.hampson@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_flink_race.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
index c1f5d5d51..cf07aedf1 100644
--- a/tests/i915/gem_flink_race.c
+++ b/tests/i915/gem_flink_race.c
@@ -83,7 +83,7 @@ static void test_flink_name(int timeout)
 	struct flink_name *threads;
 	int r, i, num_threads;
 	unsigned long count;
-	char buf[256];
+	char buf[512];
 	void *status;
 	int len;
 
@@ -118,9 +118,13 @@ static void test_flink_name(int timeout)
 	for (i = 0;  i < num_threads; i++) {
 		pthread_join(threads[i].thread, &status);
 		igt_assert(status == 0);
-		len += snprintf(buf + len, sizeof(buf) - len, "%lu, ", threads[i].count);
+		/* Below, constant 11 is 8 digit number, comma, space and null byte */
+		if ((len + 11 + 1) < sizeof(buf))
+			len += snprintf(buf + len, sizeof(buf) - len, "%8lu, ", threads[i].count);
 	}
-	snprintf(buf + len - 2, sizeof(buf) - len + 2, "] races");
+	/* Below, constant 9 is 7 bytes for terminating string plus \n and null byte */
+	if (len + 9 < sizeof(buf))
+		snprintf(buf + len - 2, sizeof(buf) - len + 2, "] races");
 	igt_info("%s\n", buf);
 
 	close(fd);
-- 
2.21.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
