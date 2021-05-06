Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3CCC433B4
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 19:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA5C610D2
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 19:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA5C610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5900D6ECFC;
	Thu,  6 May 2021 18:57:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF1B6ED95;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: 35NUItjSCHiKwpV7FyO0tGl7Dunz1+6w8LVQhvMy6NF49O20Jit56jBU8hDOFGHIuBxwRPOdi8
 hQKKuM8+ZvOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531033"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531033"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: CsOxVTHxF2P1Vgn9Qk6xccDztrrJDFsvOfQYSXl4Wv9+Gg/rTi/8ZG2NlhNKdbiHR+3/sLvPQU
 J2gpLJSFJF1A==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583610"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu,  6 May 2021 12:14:31 -0700
Message-Id: <20210506191451.77768-78-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 77/97] drm/i915/guc: Connect reset modparam
 updates to GuC policy flags
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Changing the reset module parameter has no effect on a running GuC.
The corresponding entry in the ADS must be updated and then the GuC
informed via a Host2GuC message.

The new debugfs interface to module parameters allows this to happen.
However, connecting the parameter data address back to anything useful
is messy. One option would be to pass a new private data structure
address through instead of just the parameter pointer. However, that
means having a new (and different) data structure for each parameter
and a new (and different) write function for each parameter. This
method keeps everything generic by instead using a string lookup on
the directory entry name.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c |  2 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index b37473bc8fff..bb20513f40f6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -102,7 +102,7 @@ static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
 		policy_offset
 	};
 
-	return intel_guc_send(guc, action, ARRAY_SIZE(action));
+	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
 }
 
 int intel_guc_global_policies_update(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 4e2b077692cb..8ecd8b42f048 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -6,9 +6,20 @@
 #include <linux/kernel.h>
 
 #include "i915_debugfs_params.h"
+#include "gt/intel_gt.h"
+#include "gt/uc/intel_guc.h"
 #include "i915_drv.h"
 #include "i915_params.h"
 
+#define MATCH_DEBUGFS_NODE_NAME(_file, _name)	(strcmp((_file)->f_path.dentry->d_name.name, (_name)) == 0)
+
+#define GET_I915(i915, name, ptr)	\
+	do {	\
+		struct i915_params *params;	\
+		params = container_of(((void *) (ptr)), typeof(*params), name);	\
+		(i915) = container_of(params, typeof(*(i915)), params);	\
+	} while(0)
+
 /* int param */
 static int i915_param_int_show(struct seq_file *m, void *data)
 {
@@ -24,6 +35,16 @@ static int i915_param_int_open(struct inode *inode, struct file *file)
 	return single_open(file, i915_param_int_show, inode->i_private);
 }
 
+static int notify_guc(struct drm_i915_private *i915)
+{
+	int ret = 0;
+
+	if (intel_uc_uses_guc_submission(&i915->gt.uc))
+		ret = intel_guc_global_policies_update(&i915->gt.uc.guc);
+
+	return ret;
+}
+
 static ssize_t i915_param_int_write(struct file *file,
 				    const char __user *ubuf, size_t len,
 				    loff_t *offp)
@@ -81,8 +102,10 @@ static ssize_t i915_param_uint_write(struct file *file,
 				     const char __user *ubuf, size_t len,
 				     loff_t *offp)
 {
+	struct drm_i915_private *i915;
 	struct seq_file *m = file->private_data;
 	unsigned int *value = m->private;
+	unsigned int old = *value;
 	int ret;
 
 	ret = kstrtouint_from_user(ubuf, len, 0, value);
@@ -95,6 +118,14 @@ static ssize_t i915_param_uint_write(struct file *file,
 			*value = b;
 	}
 
+	if (!ret && MATCH_DEBUGFS_NODE_NAME(file, "reset")) {
+		GET_I915(i915, reset, value);
+
+		ret = notify_guc(i915);
+		if (ret)
+			*value = old;
+	}
+
 	return ret ?: len;
 }
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
