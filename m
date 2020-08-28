Return-Path: <SRS0=+bTq=CG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D10C433E2
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C07F12078A
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C07F12078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DECF6EB6F;
	Fri, 28 Aug 2020 07:59:51 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A301B6EB7F;
 Fri, 28 Aug 2020 07:59:48 +0000 (UTC)
IronPort-SDR: lTMyZXxvpI9VHQ8vtVs7a+wH2T3z4iv32Ll9IIuHxmQZTpuRJcbw1nBSFPZOsHixNBEjBgvJUn
 wqEJRpXe7I6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="136690199"
X-IronPort-AV: E=Sophos;i="5.76,362,1592895600"; d="scan'208";a="136690199"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 00:59:48 -0700
IronPort-SDR: HddNPNvwzLPbKS8Ump/2VW1YTLX2Bu5T4BFx7iCKFt8r5Rm2FwfOBbQlMEt+0dHHuL9u3WkKSy
 eGPQx3K0crPg==
X-IronPort-AV: E=Sophos;i="5.76,362,1592895600"; d="scan'208";a="444755817"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 00:59:46 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Aug 2020 09:59:09 +0200
Message-Id: <20200828075927.17061-4-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
References: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v5 03/21] tests/core_hotunplug: Clean up
 device open error handling
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We don't use drm_driver_open() since in case of an i915 device it keeps
an extra file descriptor of the exercised device open for exit handler
use, while we would like to be able to close the device completely
before running certain test operations.  Instead, we call
__drm_driver_open() and handle its result ourselves.  Unlike
drm_driver_open() which skips on device open errors, we always fail or
abort the test in such case.  Moreover, we don't ensure that the i915
driver is idle before starting subtests like drm_open_driver() does.

Skip instead of failing on initial device open error.  Also, call
gem_quiescent_gpu() if an i915 device is detected.  For subsequent
device opens, define a local helper that fails on error and use it.  If
we think we need to abort the test execution on device open error, set
our failure marker first to trigger the abort from a follow up
igt_fixture section.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index a4071f51e..e576a6c6c 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -49,6 +49,21 @@ struct hotunplug {
 
 /* Helpers */
 
+/**
+ * Subtests must be able to close examined devices completely.  Don't
+ * use drm_open_driver() since in case of an i915 device it opens it
+ * twice and keeps a second file descriptor open for exit handler use.
+ */
+static int local_drm_open_driver(void)
+{
+	int fd_drm;
+
+	fd_drm = __drm_open_driver(DRIVER_ANY);
+	igt_assert_fd(fd_drm);
+
+	return fd_drm;
+}
+
 static void prepare_for_unbind(struct hotunplug *priv, char *buf, int buflen)
 {
 	int len;
@@ -71,8 +86,7 @@ static void prepare_for_unbind(struct hotunplug *priv, char *buf, int buflen)
 static void prepare(struct hotunplug *priv, char *buf, int buflen)
 {
 	igt_debug("opening device\n");
-	priv->fd.drm = __drm_open_driver(DRIVER_ANY);
-	igt_assert_fd(priv->fd.drm);
+	priv->fd.drm = local_drm_open_driver();
 
 	priv->fd.sysfs_dev = igt_sysfs_open(priv->fd.drm);
 	igt_assert_fd(priv->fd.sysfs_dev);
@@ -145,8 +159,9 @@ static void healthcheck(void)
 	igt_devices_scan(true);
 
 	igt_debug("reopening the device\n");
-	fd_drm = __drm_open_driver(DRIVER_ANY);
-	igt_abort_on_f(fd_drm < 0, "Device reopen failure");
+	failure = "Device reopen failure!";
+	fd_drm = local_drm_open_driver();
+	failure = NULL;
 
 	if (is_i915_device(fd_drm)) {
 		failure = "GEM failure";
@@ -255,16 +270,13 @@ igt_main
 	igt_fixture {
 		int fd_drm;
 
-		/**
-		 * As subtests must be able to close examined devices
-		 * completely, don't use drm_open_driver() as it keeps
-		 * a device file descriptor open for exit handler use.
-		 */
 		fd_drm = __drm_open_driver(DRIVER_ANY);
-		igt_assert_fd(fd_drm);
+		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
-		if (is_i915_device(fd_drm))
+		if (is_i915_device(fd_drm)) {
+			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
+		}
 
 		/* Make sure subtests always reopen the same device */
 		set_filter_from_device(fd_drm);
-- 
2.21.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
