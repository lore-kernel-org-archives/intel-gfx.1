Return-Path: <SRS0=F+1B=LC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F9FC47082
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 07:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2D061184
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Jun 2021 07:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2D061184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51286EACA;
	Tue,  8 Jun 2021 07:16:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC156EAD2;
 Tue,  8 Jun 2021 07:16:03 +0000 (UTC)
IronPort-SDR: 3NVN24qnKwEgxnlrPIKU/sRzjBtAo2//8QlYW7e4wMa3WvTWHoqMs5dkCR/nqAcK0+VovJ+/7+
 0IJjeoRmENGA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268641124"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268641124"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:16:01 -0700
IronPort-SDR: Dd8xgpuL08qByPnNm8zdHllA9neXyFa7L6pXiE+nRJV9RpcNv8xu8Yyk6MhKm0E+RNhOn27c80
 fGuR+f3vrJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552175174"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2021 00:15:58 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue,  8 Jun 2021 12:36:45 +0530
Message-Id: <1623136006-14276-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Intel-gfx] [PATCH i-g-t 1/2] tests/kms_color: Disable gamma in
 degamma tests
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

This patch disables gamma in degamma subtest which is missing.
It compares CRC between (linear degamma + solid colors) and (max
degamma + gradient colors). Patch also cleans up degamma before
exiting degamma test and cleans up gamma before exiting gamma
test.

v2 - Addressed review comments from Bhanuprakash Modem
Changed full degamma for reference CRC to linear degamma
Added clean up of degamma end of degamma test.

v3 - Addressed review comments from Bhanuprakash Modem
Fixed comments

Change-Id: Ibdb91b603e2e4024d170727d24c6a5425441e2e1
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_color.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 3a42532a5c27..1b021ac3ce0c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -32,7 +32,6 @@ static void test_pipe_degamma(data_t *data,
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 	gamma_lut_t *degamma_linear, *degamma_full;
-	gamma_lut_t *gamma_linear;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -45,8 +44,6 @@ static void test_pipe_degamma(data_t *data,
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
 		drmModeModeInfo *mode;
 		struct igt_fb fb_modeset, fb;
@@ -75,11 +72,11 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
+		disable_gamma(primary->pipe);
+		set_degamma(data, primary->pipe, degamma_linear);
 		igt_display_commit(&data->display);
 
-		/* Draw solid colors with no degamma transformation. */
+		/* Draw solid colors with linear degamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
@@ -103,15 +100,16 @@ static void test_pipe_degamma(data_t *data,
 		 */
 		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
+		disable_degamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit(&data->display);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(degamma_linear);
 	free_lut(degamma_full);
-	free_lut(gamma_linear);
 }
 
 /*
@@ -189,8 +187,10 @@ static void test_pipe_gamma(data_t *data,
 		 */
 		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
+		disable_gamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit(&data->display);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
