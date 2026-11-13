Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B28606A32A
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH7RGUzR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DCC10E6DA;
	Fri, 13 Nov 2026 02:13:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E610E4E4;
 Fri, 13 Nov 2026 02:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794535929; x=1826071929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YR2wpYW3LhN4OqxECPN3AqBlNvBqvs9QYuZ348Dt9EQ=;
 b=NH7RGUzRAViERFygMS3co6OQ6l3QDX903AqBKhZFYLlwekVZsj7FIFp1
 iHWHLFwiH3gAu/Ex/3GEftXYVzOS/oE21yXVEPdfXskpKd24usMCvnrCn
 XAOZTKMDhJSWjMtKceAg/8qzjmpPd17AB5VN7w2baDbuU+ON+J3F+U99Y
 mw5ktFSHI5oIBu6cfsnmpCMaClHqTG/t1A2bOZ1n3S2WHYUO7QaNjIw25
 EMGfbA0iJrCGQjfewfqY1EQsny6jGYjWTK8bACASlGw90wtx7wHr0M2pL
 fEnoMGH4O+TtutzPqk1BXk3J1e4h27E00rdqXlMDmv9YNp9CRMfT8DQ9/ A==;
X-CSE-ConnectionGUID: +TNddgjRTN+WU6e6lQFo4Q==
X-CSE-MsgGUID: 4LAw/j6xT9C7YaWyOqN2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3346357"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3346357"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 18:12:09 -0800
X-CSE-ConnectionGUID: wFUUYxxHTfmwu+whnlNQhQ==
X-CSE-MsgGUID: FzX+s4ntTvektWdk+mIY0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8803871"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 18:12:09 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 i-g-t 1/2] lib/xe_gt: Add function to toggle efficient freq
Date: Thu, 12 Nov 2026 18:11:50 -0800
Message-ID: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This writes to the use_rpe sysfs interface to toggle the use
of GT efficient frequency. The KMD patch that introduces this
sysfs is at: https://patchwork.freedesktop.org/series/178352/

v2: Address review comments (Anirban)

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/xe/xe_gt.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 1f0b77986..6f33df890 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -345,6 +345,65 @@ int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 	return ret;
 }
 
+/**
+ * xe_gt_set_use_rpe:
+ * @fd: pointer to xe drm fd
+ * @gt_id: GT id
+ * @val: Value to set use_rpe
+ *
+ * Set use_rpe. Function will assert if the sysfs node is
+ * not found.
+ *
+ * Return: success or failure
+ */
+int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val)
+{
+	int ret = -EAGAIN;
+	int gt_fd;
+
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert_lte(0, gt_fd);
+
+	while (ret == -EAGAIN)
+		ret = igt_sysfs_printf(gt_fd, "freq0/use_rpe", "%u", val);
+
+	close(gt_fd);
+
+	return ret;
+}
+
+/**
+ * xe_gt_get_use_rpe:
+ * @fd: pointer to xe drm fd
+ * @gt_id: GT id
+ *
+ * Get use_rpe. Function will assert if the sysfs node is
+ * not found.
+ *
+ * Return: use_rpe value
+ */
+uint32_t xe_gt_get_use_rpe(int fd, int gt_id)
+{
+	int err = -EAGAIN;
+	int gt_fd;
+	uint32_t use_rpe;
+
+	igt_debug("Opening attr: %s\n", "freq0/rpe");
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert_lte(0, gt_fd);
+
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(gt_fd, "freq0/use_rpe", "%u", &use_rpe);
+
+	igt_assert_eq(err, 1);
+
+	igt_debug("gt%d: use_rpe %u\n", gt_id, use_rpe);
+
+	close(gt_fd);
+
+	return use_rpe;
+}
+
 /**
  * xe_gt_get_freq:
  * @fd: pointer to xe drm fd
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 9ef15d7dd..7f824ca63 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -29,4 +29,6 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class);
 
 int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
 uint32_t xe_gt_get_freq(int fd, int gt_id, const char *freq_name);
+uint32_t xe_gt_get_use_rpe(int fd, int gt_id);
+int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val);
 #endif
-- 
2.53.0

