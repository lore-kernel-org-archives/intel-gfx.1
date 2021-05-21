Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A03C433ED
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 04:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CCE6135A
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 04:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CCE6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DF46F5B6;
	Fri, 21 May 2021 04:27:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3406F5B3;
 Fri, 21 May 2021 04:27:30 +0000 (UTC)
IronPort-SDR: nRrpRDt1O57pRC51y9NAk0bkmmuhFydiZQ3RtlvTPM2hN3ntECLh2nYY9fovZ9924HSNULOd3S
 pnx9BZzr46KQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188799335"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="188799335"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 21:27:28 -0700
IronPort-SDR: AQoLjDWJpgm/xvCt7WvT5Do/3WsrfQkJe+WBGsdLV9SpctwUIbQtCCQMS79asqDwnspgvCSBpO
 i7vX9U/r+vJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395173514"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga003.jf.intel.com with ESMTP; 20 May 2021 21:27:26 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
Date: Fri, 21 May 2021 09:48:44 +0530
Message-Id: <1621570724-24132-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Intel-gfx] [PATCH i-g-t] tests/drm_read: drm_read fails for
 subtest invalid-buffer on chrome
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
Cc: markyacoub@chromium.org, Charlton.Lin@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Chrome platforms is unable to handle reading from -1.
It terminates the test after reporting buffer overflow.
Hence, changed the address for invalid buffer to NULL instead of -1.
With this change, errno becomes EINTR when reading from NULL
location. To accomodate, also changing the check of errno to EINTR
instead of EFAULT

Change-Id: I5f844af087c9826fcbcfbe301f0df5f727cb013b
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/drm_read.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index ccf9d822fd8d..a8816bc1e587 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -106,8 +106,8 @@ static void test_invalid_buffer(int in)
 
 	alarm(1);
 
-	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
-	igt_assert_eq(errno, EFAULT);
+	igt_assert_eq(read(fd, (void *)NULL, 4096), -1);
+	igt_assert_eq(errno, EINTR);
 
 	teardown(fd);
 }
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
