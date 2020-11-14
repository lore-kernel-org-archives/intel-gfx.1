Return-Path: <SRS0=QofO=EU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB4C5519F
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 05:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F68C2224F
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 05:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F68C2224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F0D6E8DF;
	Sat, 14 Nov 2020 05:05:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEE56E8DF
 for <Intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2020 05:05:05 +0000 (UTC)
IronPort-SDR: R4SlCB37+uA1pI+LFm7gX5fKni8LLX6bx3oA+cmiVpvudQcxd6qb0lolUyen+M6wDsiNTwAQ1n
 g5AfV+6gt6Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="149831841"
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="149831841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 21:05:04 -0800
IronPort-SDR: pK92/e/8N5gFNP117X7TDejpfBFLaq2IjHxJLg2oChHzrfG/hqG0kVi8Fu7yboejxdbJsc1DVi
 TUH8pJ5ExdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="339963846"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 13 Nov 2020 21:05:03 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kdnkE-0000gM-K0; Sat, 14 Nov 2020 05:05:02 +0000
Date: Sat, 14 Nov 2020 13:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Z Huang <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
Message-ID: <20201114050409.GA41755@f0cb0f02b819>
References: <20201114014537.25495-8-sean.z.huang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114014537.25495-8-sean.z.huang@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Intel-gfx] [RFC PATCH] drm/i915/pxp: pxp_sm_reg_read() can be
 static
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
Cc: "Huang, Sean Z" <sean.z.huang@intel.com>, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 intel_pxp_sm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
index 3dd5a9e3926ba4..7f5c47ee452d61 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
@@ -10,7 +10,7 @@
 #include "intel_pxp_sm.h"
 #include "intel_pxp_context.h"
 
-int pxp_sm_reg_read(struct drm_i915_private *i915, u32 offset, u32 *regval)
+static int pxp_sm_reg_read(struct drm_i915_private *i915, u32 offset, u32 *regval)
 {
 	intel_wakeref_t wakeref;
 	int err = 0;
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
