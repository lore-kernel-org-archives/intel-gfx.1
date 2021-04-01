Return-Path: <SRS0=2Jy7=I6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F143C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 14:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0399E6120F
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 14:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0399E6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D872F6E0E4;
	Thu,  1 Apr 2021 14:37:24 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEAB6E0D9;
 Thu,  1 Apr 2021 14:37:24 +0000 (UTC)
IronPort-SDR: zykdiMebxdBme3yW0MLKKlYqcjCaI7jDeJXW79t/pEMrWzvei31EWuK0zR4wNHdKd4Dqog1FDa
 GcrCGH2rf4Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="188996592"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="188996592"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 07:37:23 -0700
IronPort-SDR: c/g/QERzQ12qjulx+pzE/7jSomTcHvMKEczvDujbVZDkYuemYMim8vyTPkFWWOrjA3d6zc1udv
 SZ6ZhIdDZ17A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="419225262"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.28.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 07:37:21 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Apr 2021 16:36:38 +0200
Message-Id: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH i-g-t 1/6] tests/core_hotunplug: Add 'GEM
 context' variants
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Verify if an additional context associated with an open device file
descriptor is cleaned up correctly on device hotunbind / hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 79 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 56a88fefd..4f6c4f625 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -31,6 +31,7 @@
 #include <unistd.h>
 
 #include "i915/gem.h"
+#include "i915/gem_context.h"
 #include "igt.h"
 #include "igt_device_scan.h"
 #include "igt_kmod.h"
@@ -545,6 +546,60 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void ctx_hotunbind_lateclose(struct hotunplug *priv)
+{
+	uint32_t ctx;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	gem_require_contexts(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	local_debug("%s\n", "creating additional GEM user context");
+	ctx = gem_context_create(priv->fd.drm);
+
+	driver_unbind(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late destroy the context");
+	igt_assert_eq(__gem_context_destroy(priv->fd.drm, ctx), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
+static void ctx_hotunplug_lateclose(struct hotunplug *priv)
+{
+	uint32_t ctx;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	gem_require_contexts(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	local_debug("%s\n", "creating additional GEM user context");
+	ctx = gem_context_create(priv->fd.drm);
+
+	device_unplug(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late destroy the context");
+	igt_assert_eq(__gem_context_destroy(priv->fd.drm, ctx), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
 /* Main */
 
 igt_main
@@ -682,6 +737,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound for a still open device with extra GEM context, then released");
+		igt_subtest("ctx-hotunbind-lateclose")
+			ctx_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a still open device with extra GEM context can be cleanly unplugged, then released");
+		igt_subtest("ctx-hotunplug-lateclose")
+			ctx_hotunplug_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
 	igt_fixture {
 		post_healthcheck(&priv);
 
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
