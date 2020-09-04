Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A981C43461
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 12:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3C420791
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 12:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3C420791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219A6E26C;
	Fri,  4 Sep 2020 12:01:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC3D6E26C;
 Fri,  4 Sep 2020 12:01:32 +0000 (UTC)
IronPort-SDR: Dkx60BFjI4qNuAUh5wsybFPE0/lYzcRnhUlObYPmWjXO8AwbPpnIJONxOKC9XcwDtpE243GyyI
 qNnazGfVcpDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="242548495"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="242548495"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 05:01:32 -0700
IronPort-SDR: 3XFK1uwixj27q9XuEn9RZFQj/3VOqhm5BrSz2ndAttHkffoOKrrcKgDxqpEIP3I8Oifqsh7TyL
 bYreST9/2Svg==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="298390180"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Sep 2020 05:01:28 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  4 Sep 2020 17:03:30 +0530
Message-Id: <20200904113330.19815-8-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904113330.19815-1-karthik.b.s@intel.com>
References: <20200904113330.19815-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 7/7] drm/i915: Enable async flips in i915
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Enable asynchronous flips in i915 for gen9+ platforms.

v2: -Async flip enablement should be a stand alone patch (Paulo)

v3: -Move the patch to the end of the serires (Paulo)

v4: -Rebased.

v5: -Rebased.

v6: -Rebased.

v7: -Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6fa142b1c6ff..854413973637 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -17974,6 +17974,9 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 
 	mode_config->funcs = &intel_mode_funcs;
 
+	if (INTEL_GEN(i915) >= 9)
+		mode_config->async_page_flip = true;
+
 	/*
 	 * Maximum framebuffer dimensions, chosen to match
 	 * the maximum render engine surface size on gen4+.
-- 
2.22.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
