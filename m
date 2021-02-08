Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDDEC433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 17:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E453664E7E
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 17:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E453664E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1396E580;
	Mon,  8 Feb 2021 17:40:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D6B890EF
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 17:40:37 +0000 (UTC)
IronPort-SDR: 6lLdeoL1Ggt6Wlm+j12gYCV3YWdxW1vcpXlxGRjL9wgiNG3B0LwUwwUiJyTpEDXlZNA3VLQoKT
 Z3eOfKvdj2EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="200812316"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="200812316"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 09:40:37 -0800
IronPort-SDR: YzYlV3GopLJNtn/loM0gmh+Ycy2RlWMARSTqIkfu1KhfO2hTicrHcfxF/WFn+LN9JVigg3+GIb
 oJotIgFf5JmQ==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377857786"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 09:40:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Feb 2021 09:40:29 -0800
Message-Id: <20210208174029.45621-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208174029.45621-1-umesh.nerlige.ramappa@intel.com>
References: <20210208174029.45621-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] i915/perf: Add additional OA formats for
 gen12
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Gen12 supports additional OA formats as compared to what was added
earlier. Include the additional OA formats.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e7e097ec70e7..93f3e2c5c89a 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4292,17 +4292,14 @@ static void oa_init_supported_formats(struct i915_perf *perf)
 	case INTEL_ICELAKE:
 	case INTEL_ELKHARTLAKE:
 	case INTEL_JASPERLAKE:
-		oa_format_add(perf, I915_OA_FORMAT_A12);
-		oa_format_add(perf, I915_OA_FORMAT_A12_B8_C8);
-		oa_format_add(perf, I915_OA_FORMAT_A32u40_A4u32_B8_C8);
-		oa_format_add(perf, I915_OA_FORMAT_C4_B8);
-		break;
-
 	case INTEL_TIGERLAKE:
 	case INTEL_ROCKETLAKE:
 	case INTEL_DG1:
 	case INTEL_ALDERLAKE_S:
+		oa_format_add(perf, I915_OA_FORMAT_A12);
+		oa_format_add(perf, I915_OA_FORMAT_A12_B8_C8);
 		oa_format_add(perf, I915_OA_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(perf, I915_OA_FORMAT_C4_B8);
 		break;
 
 	default:
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
