Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182ACC63697
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 10:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A054020DD4
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 10:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A054020DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003326E88B;
	Thu, 26 Nov 2020 10:52:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0906E855
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 10:52:08 +0000 (UTC)
IronPort-SDR: dtiW4INuTOELkgvOnEClRUTVkiS2R8TA8s90V2rlIGmHjLpesIJLKwZVBRCM6hTwCmUj0tQ3U7
 tvA2LxTyyVjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="168766387"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="168766387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 02:52:07 -0800
IronPort-SDR: sh/Mck43CF+dg77FR5uzPMgQZHSf2N2VBNF6qc95Ec+dSHtAwjWnfnVNIy8fXyJim+/LE3S/UN
 sOxrIOnHn7dg==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="547673958"
Received: from gprisant-mobl2.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.249.41.50])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 02:52:06 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 26 Nov 2020 12:51:55 +0200
Message-Id: <20201126105155.540350-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/perf: also include Gen11 in OATAILPTR
 workaround
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

CI shows this workaround is also needed on Gen11.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 059a0beb486344 ("drm/i915/perf: workaround register corruption in OATAILPTR")
---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 3640d0e229d2..acdfbe5344a4 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -913,7 +913,7 @@ static int gen8_oa_read(struct i915_perf_stream *stream,
 		intel_uncore_rmw(uncore, oastatus_reg,
 				 GEN8_OASTATUS_COUNTER_OVERFLOW |
 				 GEN8_OASTATUS_REPORT_LOST,
-				 IS_GEN_RANGE(uncore->i915, 8, 10) ?
+				 IS_GEN_RANGE(uncore->i915, 8, 11) ?
 				 (GEN8_OASTATUS_HEAD_POINTER_WRAP |
 				  GEN8_OASTATUS_TAIL_POINTER_WRAP) : 0);
 	}
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
