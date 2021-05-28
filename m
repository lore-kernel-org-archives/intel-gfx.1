Return-Path: <SRS0=v7GQ=KX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD253C4708C
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B4D3613AA
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 04:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B4D3613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DC86EB12;
	Fri, 28 May 2021 04:44:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CD36E832;
 Fri, 28 May 2021 04:44:41 +0000 (UTC)
IronPort-SDR: zB4hPGhH3SjmxNjhfsbKp8/SEmf9tInDXjTKD6tw/J6AMCVnxJuXu8BJB7HhFbm7pxlxvrsuxa
 4/NZWo4LajgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="264088600"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="264088600"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 21:44:38 -0700
IronPort-SDR: WydeoKPW2rabg3YKZWQ6/ikD7J47nsYprNx9l7M1PuKcIYs6mPgjam+LaCcfOXcxMz0hIm/Cbg
 wj1fW4RlnTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="631664702"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by fmsmga006.fm.intel.com with ESMTP; 27 May 2021 21:44:36 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 28 May 2021 10:05:43 +0530
Message-Id: <1622176543-12759-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_color: Fix pipe degamma
 subtests
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
Cc: markyacoub@chromium.org, charlton.lin@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We need to collect CRC with no degamma transformation
and after drawing gradient with degamma LUT.
This patch makes subtest pipe degamma code
similar to pipe gamma is written.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_color.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 3a42532a5c27..2d55f2611e72 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -31,8 +31,7 @@ static void test_pipe_degamma(data_t *data,
 {
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
-	gamma_lut_t *degamma_linear, *degamma_full;
-	gamma_lut_t *gamma_linear;
+	gamma_lut_t *degamma_full;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -42,11 +41,8 @@ static void test_pipe_degamma(data_t *data,
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
 		drmModeModeInfo *mode;
 		struct igt_fb fb_modeset, fb;
@@ -75,8 +71,7 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
+		set_degamma(data, primary->pipe, degamma_full);
 		igt_display_commit(&data->display);
 
 		/* Draw solid colors with no degamma transformation. */
@@ -92,7 +87,6 @@ static void test_pipe_degamma(data_t *data,
 		 */
 		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
-		set_degamma(data, primary->pipe, degamma_full);
 		igt_display_commit(&data->display);
 		igt_wait_for_vblank(data->drm_fd,
 				display->pipes[primary->pipe->pipe].crtc_offset);
@@ -109,9 +103,7 @@ static void test_pipe_degamma(data_t *data,
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
-	free_lut(degamma_linear);
 	free_lut(degamma_full);
-	free_lut(gamma_linear);
 }
 
 /*
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
