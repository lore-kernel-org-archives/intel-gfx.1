Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89A606A31C
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 02:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jLj1FPh1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D710E4E4;
	Fri, 13 Nov 2026 02:12:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3996010E4E4;
 Fri, 13 Nov 2026 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794535939; x=1826071939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvWIy7nE76Ak3knouWe+O+jdTwUPHKVpbufNjrYFysM=;
 b=jLj1FPh1tUgh6gxLWO+Jg6gIJAJqY6oaIlkRfbSymZMZA0UKawSts9XW
 YR6hcZh2V1zzKEtk/7WCNbOU4Vdot27YgYOjwn91Q0ANCGIf1POitzjpu
 Y8YPUTjRSqySaoN0mDO06M5NF0AYwDSYuO4uwWcvpyqGpoedurKyFFzf3
 sLb6UDro2d2Is1fvaQ0Z8LxQAYpFQeUJLr6cFKOsHgsqWNxZg2DqPkToU
 UHzOkQ3Cp8lrKkocMpSwALHWvTnUVrocIUl4l5Ym9Hld26PqJaU1ILN+3
 ETrQfW3i4xUTpYuXIauIM80Jbpaz3yH4oHiknayGIaJT+qzqbtbpNCNX4 Q==;
X-CSE-ConnectionGUID: yRYQOzGYSI69VWTWs30/Gg==
X-CSE-MsgGUID: LE22vv0OSoOUdwgbIvnTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3346381"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3346381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 18:12:19 -0800
X-CSE-ConnectionGUID: F6ClVgVFRdiTsuPRZ1XYgA==
X-CSE-MsgGUID: p2QgCMfrSYaWyTH7tEuGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8803891"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 18:12:19 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/xe_gt_freq: Disable efficient freq using
 sysfs
Date: Thu, 12 Nov 2026 18:11:51 -0800
Message-ID: <20261113021149.3941522-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
References: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
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

With a sysfs interface available to disable RPe now, we should disable RPe
and then proceed with the test. Before this sysfs was added, reducing min
freq below RPe would automatically disable RPe. Now that we have a dedicated
sysfs interface, use it. Tests that reduce GT freq below RPe should now
directly disable RPe instead.

v2: Init ptr to NULL (Anirban)

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_gt_freq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index ab1c30ea1..8a03f286d 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -387,6 +387,7 @@ int igt_main()
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t *stash_min, *stash_max;
 	int max_gt;
+	u32 *stash_use_rpe = NULL;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
@@ -397,10 +398,17 @@ int igt_main()
 		/* The defaults are the same. Stashing the gt0 is enough */
 		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
 		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
+		if (xe_sysfs_gt_has_node(fd, 0, "freq0/use_rpe"))
+			stash_use_rpe = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
 
 		xe_for_each_gt(fd, gt) {
 			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
 			stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
+			/* Disable use of efficient freq */
+			if (stash_use_rpe) {
+				stash_use_rpe[gt] = xe_gt_get_use_rpe(fd, gt);
+				xe_gt_set_use_rpe(fd, gt, 0);
+			}
 		}
 		errno = 0;
 	}
@@ -481,9 +489,13 @@ int igt_main()
 		xe_for_each_gt(fd, gt) {
 			xe_gt_set_freq(fd, gt, "max", stash_max[gt]);
 			xe_gt_set_freq(fd, gt, "min", stash_min[gt]);
+			if (stash_use_rpe)
+				xe_gt_set_use_rpe(fd, gt, stash_use_rpe[gt]);
 		}
 		free(stash_min);
 		free(stash_max);
+		if (stash_use_rpe)
+			free(stash_use_rpe);
 		drm_close_driver(fd);
 	}
 }
-- 
2.53.0

