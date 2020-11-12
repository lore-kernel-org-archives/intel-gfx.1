Return-Path: <SRS0=k0IE=ES=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42950C55ABD
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 11:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98DB2074B
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 11:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98DB2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE156E203;
	Thu, 12 Nov 2020 11:45:08 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4605A6E203
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2020 11:45:07 +0000 (UTC)
IronPort-SDR: VaN3+1kUj15qkLWtMXcNwy0e36qtRFS6wGANCjDsEDRYPEE5W7qk+j6eDHCsK7ukBGal5E16EL
 RQWSXIe84o0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="234458577"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; d="scan'208";a="234458577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 03:45:06 -0800
IronPort-SDR: HxBh5DE+3P8ianV8MtrfGweO6hwTxYScb9sxZAZSDdCcidB+Oz2tewlmgoTgv+zt6ypKNFhMa2
 FEyJFV58uHeg==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; d="scan'208";a="532118995"
Received: from mghidovi-mobl1.ti.intel.com (HELO localhost) ([10.251.81.155])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 03:45:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Nov 2020 13:44:36 +0200
Message-Id: <4b7bae47d444f1ef779a3ede481a5dfd4667513d.1605181350.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1605181350.git.jani.nikula@intel.com>
References: <cover.1605181350.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/9] drm/i915/cdclk: prefer intel_de_write()
 over I915_WRITE()
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Let's try to not add new ones while we're phasing out I915_READ() and
I915_WRITE().

Fixes: 27a6bc802bd9 ("drm/i915/dg1: Initialize RAWCLK properly")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c449d28d0560..088d5908176c 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2710,8 +2710,8 @@ static int dg1_rawclk(struct drm_i915_private *dev_priv)
 	 * DG1 always uses a 38.4 MHz rawclk.  The bspec tells us
 	 * "Program Numerator=2, Denominator=4, Divider=37 decimal."
 	 */
-	I915_WRITE(PCH_RAWCLK_FREQ,
-		   CNP_RAWCLK_DEN(4) | CNP_RAWCLK_DIV(37) | ICP_RAWCLK_NUM(2));
+	intel_de_write(dev_priv, PCH_RAWCLK_FREQ,
+		       CNP_RAWCLK_DEN(4) | CNP_RAWCLK_DIV(37) | ICP_RAWCLK_NUM(2));
 
 	return 38400;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
