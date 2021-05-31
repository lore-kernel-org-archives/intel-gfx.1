Return-Path: <SRS0=VbzJ=K2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5880EC47082
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 15:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E406124C
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 15:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E406124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01A06E3D0;
	Mon, 31 May 2021 15:34:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE9E6E16D;
 Mon, 31 May 2021 15:34:57 +0000 (UTC)
IronPort-SDR: Mee8uMYd0SIsEzHGomiuwVi6QbDFyTNAp/6hUEI6KCWGNMrU+/Uy6wg4/b8c4UmS9RyuGiIEX5
 GnK67qi76AXw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203379700"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="203379700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 08:34:55 -0700
IronPort-SDR: 0SYI2k+9Gd/csZB/OeXScxq+fBz7ADrXvKV+UMHis8tWNq/NxV2o9t+ulf100QVIIDwx3jO860
 PehPEkAV8ang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473947874"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.12])
 by FMSMGA003.fm.intel.com with ESMTP; 31 May 2021 08:34:53 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Mon, 31 May 2021 23:39:22 +0800
Message-Id: <20210531153922.4683-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [PATCH i-g-t] tests/kms_dp_dsc: Avoid SIGSEGV when
 release DRM connector.
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

Got SIGSEGV fault while running kms_dp_dsc test but did not
connect DP DSC capable monitor on eDP/DP port. This test daemon
should "SKIP" test without any problem. We found kms_dp_dsc
can't get proper drmModeConnector and caused this SIGSEGV fault
when release it. Make sure drmModeConnector is available before
free it can avoid this issue.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_dp_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 2446fd82bba3..ea7c9f4f72ce 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -262,7 +262,7 @@ igt_main
 	data_t data = {};
 	igt_output_t *output;
 	drmModeRes *res;
-	drmModeConnector *connector;
+	drmModeConnector *connector = NULL;
 	int i, test_conn_cnt, test_cnt;
 	int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
 
@@ -311,7 +311,8 @@ igt_main
 	}
 
 	igt_fixture {
-		drmModeFreeConnector(connector);
+		if (connector)
+			drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
 		close(data.debugfs_fd);
 		close(data.drm_fd);
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
