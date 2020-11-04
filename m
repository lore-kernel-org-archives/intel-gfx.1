Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A802C2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 19:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10AA206DB
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10AA206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686966E25A;
	Wed,  4 Nov 2020 19:21:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121306E25A
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 19:21:53 +0000 (UTC)
IronPort-SDR: 6Pjp7ZEEcbhYUF2JMlDQXh/XXv3iOKwjYXiOJ7pVj9iq+OUZB39HiFZ3NcjH1FB2rikg6Maqqz
 Jf/zcGYgHEHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="233434865"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="233434865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 11:21:51 -0800
IronPort-SDR: XVzzF2kCkGlI2bhwDuNsyXdiOeuvsrgDAwJT1UYl6KlK4XKDCsa5zUtiaHIGin9PKQpHtCM5xr
 UsPQfePxlLJw==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="529045160"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 11:21:49 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  5 Nov 2020 01:26:04 +0530
Message-Id: <20201104195604.3334-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104195604.3334-1-uma.shankar@intel.com>
References: <20201104195604.3334-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] Revert "drm/i915/display/fbc: Disable fbc
 by default on TGL"
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

FBC can be re-enabled on TGL with WA of keeping it disabled
while PSR2 is enabled.

This reverts commit 2982ded2ff5ce0cf1a49bc39a526da182782b664.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 32c411414908..c159d501fa52 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1439,13 +1439,6 @@ static int intel_sanitize_fbc_option(struct drm_i915_private *dev_priv)
 	if (!HAS_FBC(dev_priv))
 		return 0;
 
-	/*
-	 * Fbc is causing random underruns in CI execution on TGL platforms.
-	 * Disabling the same while the problem is being debugged and analyzed.
-	 */
-	if (IS_TIGERLAKE(dev_priv))
-		return 0;
-
 	if (IS_BROADWELL(dev_priv) || INTEL_GEN(dev_priv) >= 9)
 		return 1;
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
