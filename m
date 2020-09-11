Return-Path: <SRS0=QVu9=CU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC63BC43461
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 10:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756402076C
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 10:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756402076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220BA6EA08;
	Fri, 11 Sep 2020 10:31:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E116E9FF;
 Fri, 11 Sep 2020 10:31:30 +0000 (UTC)
IronPort-SDR: 3wAWom5BfEzSNWpS6xzK+Z6SsGhER7TMeV89skM+bCgL76XhFru+zsPzKOIjXNAhkItPt3XYGn
 KROnLMcOekvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="156185709"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="156185709"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 03:31:30 -0700
IronPort-SDR: SsbWFIOFTEoZ09Sjjjxg4/QFwPVc16pjf3IBD8CncTy9ZIge93tmOyME4tR5o30rdnSJGYuZO4
 K4dJxkgRy7zA==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="334474845"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 03:31:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2020 12:30:32 +0200
Message-Id: <20200911103039.4574-18-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v6 17/24] tests/core_hotunplug: Also check
 health of render device node
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

Failures of subsequent tests accessing the render device node have been
observed on CI after late close of a hot rebound device.  Extend our
health check over the render node to detect that condition and start
our recovery phase with unbinding the driver from the device found
faulty.  Also, check health of both device nodes before running any
subtests.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 6cf56d047..5e9eba8e7 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -55,13 +55,15 @@ struct hotunplug {
  * use drm_open_driver() since in case of an i915 device it opens it
  * twice and keeps a second file descriptor open for exit handler use.
  */
-static int local_drm_open_driver(const char *when, const char *why)
+static int local_drm_open_driver(bool render, const char *when, const char *why)
 {
 	int fd_drm;
 
-	igt_debug("%sopening device%s\n", when, why);
+	igt_debug("%sopening %s device%s\n", when, render ? "render" : "DRM",
+		  why);
 
-	fd_drm = __drm_open_driver(DRIVER_ANY);
+	fd_drm = render ? __drm_open_driver_render(DRIVER_ANY) :
+			  __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(fd_drm);
 
 	return fd_drm;
@@ -200,17 +202,15 @@ static void cleanup(struct hotunplug *priv)
 	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
 }
 
-static void healthcheck(struct hotunplug *priv)
+static void node_healthcheck(struct hotunplug *priv, bool render)
 {
 	/* preserve potentially dirty device status stored in priv->fd.drm */
 	bool closed = priv->fd.drm == -1;
 	int fd_drm;
 
-	/* device name may have changed, rebuild IGT device list */
-	igt_devices_scan(true);
-
-	priv->failure = "Device reopen failure!";
-	fd_drm = local_drm_open_driver("re", " for health check");
+	priv->failure = render ? "Render device reopen failure!" :
+				 "DRM device reopen failure!";
+	fd_drm = local_drm_open_driver(render, "re", " for health check");
 	if (closed)	/* store fd for cleanup if not dirty */
 		priv->fd.drm = fd_drm;
 
@@ -226,6 +226,16 @@ static void healthcheck(struct hotunplug *priv)
 	fd_drm = close_device(fd_drm, "", "health checked ");
 	if (closed || fd_drm < -1)	/* update status for post_healthcheck */
 		priv->fd.drm = fd_drm;
+}
+
+static void healthcheck(struct hotunplug *priv)
+{
+	/* device name may have changed, rebuild IGT device list */
+	igt_devices_scan(true);
+
+	node_healthcheck(priv, false);
+	if (!priv->failure)
+		node_healthcheck(priv, true);
 
 	/* not only request igt_abort on failure, also fail the health check */
 	igt_fail_on_f(priv->failure, "%s\n", priv->failure);
@@ -235,6 +245,11 @@ static void recover(struct hotunplug *priv)
 {
 	cleanup(priv);
 
+	/* unbind the driver from a possibly hot rebound unhealthy device */
+	if (!faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0) &&
+	    priv->fd.drm == -1 && priv->failure)
+		driver_unbind(priv, "post ", 60);
+
 	if (faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0))
 		bus_rescan(priv, 60);
 
@@ -295,7 +310,7 @@ static void unplug_rescan(struct hotunplug *priv)
 static void hotunbind_lateclose(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
-	priv->fd.drm = local_drm_open_driver("", " for hot unbind");
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
 	driver_unbind(priv, "hot ", 0);
 
@@ -310,7 +325,7 @@ static void hotunbind_lateclose(struct hotunplug *priv)
 static void hotunplug_lateclose(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
-	priv->fd.drm = local_drm_open_driver("", " for hot unplug");
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
 	device_unplug(priv, "hot ", 0);
 
@@ -348,6 +363,11 @@ igt_main
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
 		prepare(&priv);
+
+		node_healthcheck(&priv, false);
+		if (!priv.failure)
+			node_healthcheck(&priv, true);
+		igt_skip_on_f(priv.failure, "%s\n", priv.failure);
 	}
 
 	igt_subtest_group {
-- 
2.21.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
