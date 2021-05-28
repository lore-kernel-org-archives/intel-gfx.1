Return-Path: <SRS0=v7GQ=KX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5615EC47087
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08B361178
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08B361178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248246E9E4;
	Fri, 28 May 2021 04:41:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F36E832;
 Fri, 28 May 2021 04:41:42 +0000 (UTC)
IronPort-SDR: dUpDsSoOk7qwOt5Vle6lUD7kqB6bvfZqBqb5gOv9L0C+c9aQxHhj1OaWBEnxUmjwdBQbZ1kvg9
 MfvFEHJmRqeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="288484011"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="288484011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 21:41:42 -0700
IronPort-SDR: NiV8tpe3P67kASS0E7G0b3pPRkQAYwCKEsyFaER8w8QJyMDWuh8ybwN8XCNdGAOSF9Mc0M6hn/
 6KqBs0AfbOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="445443595"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by fmsmga008.fm.intel.com with ESMTP; 27 May 2021 21:41:40 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 28 May 2021 10:02:47 +0530
Message-Id: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest
 invalid-buffer
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

Using (void *)-1 directly in read is aborting on chrome systems.
Following message is seen.

Starting subtest: invalid-buffer
*** buffer overflow detected ***: terminated
Received signal SIGABRT.
Stack trace:
Aborted (core dumped)

Patch just adds a pointer variable and uses it in read.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/drm_read.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index ccf9d822fd8d..2fdec5be4078 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -103,10 +103,11 @@ static void teardown(int fd)
 static void test_invalid_buffer(int in)
 {
 	int fd = setup(in, 0);
+	void *add = (void *)-1;
 
 	alarm(1);
 
-	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
+	igt_assert_eq(read(fd, add, 4096), -1);
 	igt_assert_eq(errno, EFAULT);
 
 	teardown(fd);
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
