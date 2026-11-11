Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F66606A320
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXNVtBtL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E7E10E008;
	Wed, 11 Nov 2026 01:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3710E008;
 Wed, 11 Nov 2026 01:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794360754; x=1825896754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WnBf6SnN1x9XPCZsQ682VE0fA/BwYg4EwAIFgc5WuWU=;
 b=fXNVtBtLNY6wZBABiAzA+GcEImXE29YZTljxEX2DI1vnqJz9NyGwN0Iu
 QGibZW8bolqT3u7lB4YjxbRKHJenD4Kc68hHLVchB5HBblQ1wrsU6MKA7
 /Obuc6+DKuffQFUNiekdHbc7vUSXdifrivHXVKZQE4CrH5mOZSV5IaaLE
 Cj2t+xbhutyCpfCdN8T2tEYygCfY/KmZWp5aCA5g7C1m/+2DzFhI0tggA
 jC4nlt7H0R1frKDha/b7MIZMiphdoevloWc8+zuFJqddyX1+Ac/3vOAch
 R0CxpsEOsd5EmIdDZ8yKy/12prBYh2MhMImaCxL2tABblowuqKnbdS+jQ Q==;
X-CSE-ConnectionGUID: E1xnkEwcRhCFLd31cuJ1XQ==
X-CSE-MsgGUID: L+3ODCRhRNWXzjSzuTMaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3031574"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3031574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 17:32:33 -0800
X-CSE-ConnectionGUID: qswlwxgoRJ68z2NuNpGzTQ==
X-CSE-MsgGUID: yiWJL3iFQmqWgk95MHRU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8626379"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2026 17:32:34 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe_gt: Add function to toggle efficient freq
Date: Tue, 10 Nov 2026 17:32:17 -0800
Message-ID: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This writes to the use_rpe sysfs interface to toggle the use
of GT efficient frequency.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/xe/xe_gt.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 1f0b77986..62004d17b 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -345,6 +345,47 @@ int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 	return ret;
 }
 
+int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val)
+{
+	int ret = -EAGAIN;
+	char use_rpe_attr[NAME_MAX];
+	int gt_fd;
+
+	snprintf(use_rpe_attr, sizeof(use_rpe_attr), "freq0/use_rpe");
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert_lte(0, gt_fd);
+
+	while (ret == -EAGAIN)
+		ret = igt_sysfs_printf(gt_fd, use_rpe_attr, "%u", val);
+
+	close(gt_fd);
+
+	return ret;
+}
+
+int xe_gt_get_use_rpe(int fd, int gt_id)
+{
+	int err = -EAGAIN;
+	char use_rpe_attr[NAME_MAX];
+	int gt_fd;
+	uint32_t use_rpe;
+
+	snprintf(use_rpe_attr, sizeof(use_rpe_attr), "freq0/use_rpe");
+	igt_debug("Opening attr: %s", use_rpe_attr);
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert_lte(0, gt_fd);
+
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(gt_fd, use_rpe_attr, "%u", &use_rpe);
+
+	igt_assert_eq(err, 1);
+
+	igt_debug("gt%d: %s use_rpe %u\n", gt_id, use_rpe_attr, use_rpe);
+
+	close(gt_fd);
+
+	return use_rpe;
+}
 /**
  * xe_gt_get_freq:
  * @fd: pointer to xe drm fd
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 9ef15d7dd..ce09d6e6a 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -29,4 +29,6 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class);
 
 int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
 uint32_t xe_gt_get_freq(int fd, int gt_id, const char *freq_name);
+int xe_gt_get_use_rpe(int fd, int gt_id);
+int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val);
 #endif
-- 
2.53.0

