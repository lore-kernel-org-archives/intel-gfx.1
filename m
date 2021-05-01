Return-Path: <SRS0=9yl+=J4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA72C433ED
	for <intel-gfx@archiver.kernel.org>; Sat,  1 May 2021 00:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648C361406
	for <intel-gfx@archiver.kernel.org>; Sat,  1 May 2021 00:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648C361406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0156F615;
	Sat,  1 May 2021 00:28:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903D6F615
 for <intel-gfx@lists.freedesktop.org>; Sat,  1 May 2021 00:28:58 +0000 (UTC)
IronPort-SDR: 3kX38eBze+OCLQKJyBwq/DsI22ZRjnCqRUTq40R7sovpkDfB9h8Kce6IGwxG/0/IhMJH4Cr+Yc
 DWN/UFOqr26g==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="176884729"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="176884729"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 17:28:57 -0700
IronPort-SDR: n27LS7sd7tz17bJ2AB3hW8GOJqyIdMC3Lj1d7BS8d3olXq8hXXUmQjmIf6mL3yH/OPQB9Rng0M
 XVqLCpZLr0eQ==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="467045356"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 17:28:56 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sat,  1 May 2021 03:28:52 +0300
Message-Id: <20210501002853.4132009-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/tgl+: Add the missing MC CCS/XYUV8888
 format support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Make sure that the XYUV8888 format is handled correctly when it's used
with a MC_CCS modifier framebuffer. Besides this format not working, the
driver will also return an incorrect error value when trying to use it,
indicating that the second color plane in the framebuffer is set
unexpectedly.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6280ba7f4c172..13ed9055918fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1263,6 +1263,9 @@ static const struct drm_format_info gen12_ccs_formats[] = {
 	{ .format = DRM_FORMAT_VYUY, .num_planes = 2,
 	  .char_per_block = { 2, 1 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
 	  .hsub = 2, .vsub = 1, .is_yuv = true },
+	{ .format = DRM_FORMAT_XYUV8888, .num_planes = 2,
+	  .char_per_block = { 4, 1 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, .is_yuv = true },
 	{ .format = DRM_FORMAT_NV12, .num_planes = 4,
 	  .char_per_block = { 1, 2, 1, 1 }, .block_w = { 1, 1, 4, 4 }, .block_h = { 1, 1, 1, 1 },
 	  .hsub = 2, .vsub = 2, .is_yuv = true },
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
