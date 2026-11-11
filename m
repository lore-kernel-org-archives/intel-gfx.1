Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E96606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SXdHwgkc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED34010E167;
	Wed, 11 Nov 2026 01:32:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84B10E99F;
 Wed, 11 Nov 2026 01:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794360759; x=1825896759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faZ+48maKkEWC5NsiDMB+zIyzLTXKdf1p60LVTkiSgU=;
 b=SXdHwgkc6gyXFVX2k4dgQonh7Kc+n9k/NEOQD1k6ejbRru/3GeeWUbw/
 uLJ2zLNz+q0yHiGXQd3nnlGUcJXU4embAqMADVKZbNGjqjFMckis/ASVK
 qYZui5N/mhPSzjsYkKw4ZxTDX5OF52TU3Rna7603WdvVXo7bZnQaZJahE
 SeZyYCaT1j3d3FkgKNxV0D0wtXz69mL8D0Jylpw5l+VofdY4+8ktH91XR
 oQ7lCNcbsShp5I8mVSGh7zCZ36IWEuU9hXWrC/HA2pRYE6ix3U7k+QvIJ
 nkowD7AUFw7kXSKx/Bc5g5rUU459RpXCtkxFM6Su5chY9Ac1XfUqQARlw g==;
X-CSE-ConnectionGUID: nGJoXz1zSuyeW6/G5peXgA==
X-CSE-MsgGUID: NszY+4ZQTsCm0EHJLEDuxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3031579"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3031579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 17:32:38 -0800
X-CSE-ConnectionGUID: hRZLH5KNSDqJbVoIvlzIGA==
X-CSE-MsgGUID: 3YWTyCVQS9KnezIp4YIiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8626391"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2026 17:32:39 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_gt_freq: Disable efficient freq using sysfs
Date: Tue, 10 Nov 2026 17:32:18 -0800
Message-ID: <20261111013216.3651641-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
References: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_gt_freq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index ab1c30ea1..26e05f4d1 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -387,6 +387,7 @@ int igt_main()
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t *stash_min, *stash_max;
 	int max_gt;
+	u32 *stash_use_rpe;
 
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

