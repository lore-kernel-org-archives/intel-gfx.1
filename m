Return-Path: <SRS0=yXj8=IO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1C0C432C3
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Mar 2021 16:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1247A65092
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Mar 2021 16:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1247A65092
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ACF6E405;
	Tue, 16 Mar 2021 16:19:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3D36E405;
 Tue, 16 Mar 2021 16:19:16 +0000 (UTC)
IronPort-SDR: 6oowVjn/SmIlzyjR3VevXGuouOaoYM2HEFDCbkWJUrGwZxx8VAuQNhRmqK0FkL8gVSja7YzIHJ
 eRd7LdPac3ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="176885372"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="176885372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 09:18:56 -0700
IronPort-SDR: /3DqOGwpEnZpP1FuwIT83MkOqikhUkaTK5VQj7HiMbti48+NvPhQGUtUAtS/HFKHRx9fCTzYGV
 YA58lX7QCVYg==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="412272400"
Received: from lmirensk-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.195.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 09:18:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 Mar 2021 16:18:39 +0000
Message-Id: <20210316161840.1993818-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316161840.1993818-1-tvrtko.ursulin@linux.intel.com>
References: <20210316161840.1993818-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/2] lib: Add helper for reading modparam
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_params.c | 26 ++++++++++++++++++++++++++
 lib/igt_params.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index c06416988baa..1dc6de77b2e0 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -156,6 +156,32 @@ int igt_params_open(int device)
 	return params;
 }
 
+/**
+ * __igt_params_get:
+ * @device: fd of the device
+ * @parameter: the name of the parameter to set
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
