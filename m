Return-Path: <SRS0=tUI/=I5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FC9C433E4
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 11:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 261F661990
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 11:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 261F661990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C9789F31;
	Wed, 31 Mar 2021 11:02:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3D789F31;
 Wed, 31 Mar 2021 11:02:13 +0000 (UTC)
IronPort-SDR: /sUrKCnc05JAoh2XRJOingRz5/7cCY3zayazxgUuyrg8fQkg4egHMjNH1OFhL71IVf253lgx0W
 D8iC5wL7yTxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="212218463"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="212218463"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 04:02:13 -0700
IronPort-SDR: DOfqCclr89tDFUeRhHeEjSigKN+BifMGPo/6iI2NrEwnSqw+nrYu85T6ZyNHTI8uTDWuedM053
 m5bynigYbMWQ==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418621635"
Received: from jlowe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 04:02:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 Mar 2021 12:02:06 +0100
Message-Id: <20210331110208.2582575-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/3] lib: Add helper for reading modparam
 values
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add __igt_params_get for simple reading of modparams.

v2:
 * Fix kerneldoc. (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/igt_params.c | 26 ++++++++++++++++++++++++++
 lib/igt_params.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index c06416988baa..3dad317a56b2 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -156,6 +156,32 @@ int igt_params_open(int device)
 	return params;
 }
 
+/**
+ * __igt_params_get:
+ * @device: fd of the device
+ * @parameter: the name of the parameter to get
+ *
+ * This reads the value of the modparam.
+ *
+ * Returns:
+ * A nul-terminated string, must be freed by caller after use, or NULL
+ * on failure.
+ */
+char *__igt_params_get(int device, const char *parameter)
+{
+	char *str;
+	int dir;
+
+	dir = igt_params_open(device);
+	if (dir < 0)
+		return NULL;
+
+	str = igt_sysfs_get(dir, parameter);
+	close(dir);
+
+	return str;
+}
+
 __attribute__((format(printf, 3, 0)))
 static bool __igt_params_set(int device, const char *parameter,
 			     const char *fmt, va_list ap, bool save)
diff --git a/lib/igt_params.h b/lib/igt_params.h
index bbd6f3ee6582..6494786f0696 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -28,6 +28,8 @@
 
 int igt_params_open(int device);
 
+char *__igt_params_get(int device, const char *parameter);
+
 __attribute__((format(printf, 3, 4)))
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
 
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
