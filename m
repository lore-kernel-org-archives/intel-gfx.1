Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95750C05027
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Mar 2023 18:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8110E863;
	Tue, 14 Mar 2023 18:04:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888D910E1C2;
 Tue, 14 Mar 2023 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678817081; x=1710353081;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=73ohp16erGlzXfKkzILSU6H9V8mY9Bg8S6ykeLgj2Ag=;
 b=VUeVx9zdH9Vz3/x2omTOfyGysPnqInawsFPGojUbD8NT+XwNr4erqYOJ
 J+8P5LBS0rjY+K3sm7KakINxIpSdRHdIxSrsl42gt5bsaAD+a9k6x6R9u
 opjamLalyaW7ZB4z6ML3xA83t7j3CAUik5DlAagPmJmBaa/hkJYj8d4fs
 1qtYxrPXkP8nMMOoRV6VU8CULlJsL5ghr7f0DwjWsTK8hW4nIhS612UMb
 +c8Sy7eQ67G2BF0QH4ZnVuc/TI13NN1vEGt/anwiPMpWtx5qxKirtP+ls
 GCIwfcRIpe6iAZCmcmRTD3C71I3aM+L3v3HN4ZQGEMBSZHsOmDksvltXR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339868973"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339868973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789463354"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="789463354"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 11:04:39 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 11:06:40 -0700
Message-Id: <20230314180640.2275192-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] i915_pm_rps: Enable waitboost tests for
 SLPC
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Waitboost is supported with SLPC. Re-enable the tests so
we have coverage.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_rps.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index 4865ed1f..d4ee2d58 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -939,30 +939,22 @@ igt_main
 
 	/* Checks if we achieve boost using gem_wait */
 	igt_subtest("waitboost") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		waitboost(drm_fd, false);
 	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
 	igt_subtest("fence-order") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		fence_order(drm_fd);
 	}
 
 	igt_describe("Check if context reuse does not affect waitboosting");
 	igt_subtest("engine-order") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		engine_order(drm_fd);
 	}
 
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang;
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		hang = igt_allow_hang(drm_fd, 0, 0);
 		waitboost(drm_fd, true);
 		igt_disallow_hang(drm_fd, hang);
-- 
2.38.1

