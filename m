Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD65C433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 06:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7289164E07
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 06:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7289164E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6D86E28B;
	Mon,  8 Feb 2021 06:05:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6BC6E28B
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 06:05:47 +0000 (UTC)
IronPort-SDR: q9b6FmerqiXIfb6ZyRdtP9Y3OUFc+lzOFHOA3e9AUUJjgRLofdLDjerWjQ+LcPv7cH4Pazs5bL
 vzSYYyF/YpTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180888307"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="180888307"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 22:05:46 -0800
IronPort-SDR: yRWY4enH13fg31iepoA+UOQADbb0yyu6qjr2+LkWfyiRpBd5Zz/fBQLvfEkWeiWeJb77hoUH66
 kvg2jFTd9MFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="509358805"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga004.jf.intel.com with ESMTP; 07 Feb 2021 22:05:44 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Feb 2021 11:25:54 +0530
Message-Id: <20210208055554.24357-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] i915: Fix HAS_LSPCON macro for platforms
 between GEN9 and GEN10
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

Legacy LSPCON chip from MCA and Parade is only used for platforms
between GEN9 and GEN10. Fixing the HAS_LSPCON macro to reflect the same.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4fc9a8691873..fd04fc434ca6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1763,7 +1763,7 @@ tgl_stepping_get(struct drm_i915_private *dev_priv)
 
 #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
 
-#define HAS_LSPCON(dev_priv) (INTEL_GEN(dev_priv) >= 9)
+#define HAS_LSPCON(dev_priv) (IS_GEN_RANGE(dev_priv, 9, 10))
 
 /* DPF == dynamic parity feature */
 #define HAS_L3_DPF(dev_priv) (INTEL_INFO(dev_priv)->has_l3_dpf)
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
