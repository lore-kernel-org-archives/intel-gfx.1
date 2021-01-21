Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37797C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 13:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92A2233F8
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 13:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92A2233F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B36E530;
	Thu, 21 Jan 2021 13:54:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33C26E530
 for <Intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 13:54:46 +0000 (UTC)
IronPort-SDR: KDVHnDwfhkggIoczQS7ge+bIfqwM1S2i+wTh4y1PzQjSXToiels4eF7LJSrsea7dRje30Vztv6
 jneihCVgW0cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166941921"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="166941921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 05:54:40 -0800
IronPort-SDR: 7nav0xZN8dhmGDtf/WcQ8pWDho5+CcZbleQaeYpAmC/J5oRFgKrT5+EZ7hilhjVorbKqAPqzla
 z5K0sZeDdDmA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="385315682"
Received: from pscheper-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 05:54:38 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Thu, 21 Jan 2021 13:54:30 +0000
Message-Id: <20210121135430.676447-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Decrease number of subplatform bits
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit 6ce1c33d6c36 ("drm/i915: Kill INTEL_SUBPLATFORM_AML") removed the
only platform which used bit 2 so could also decrease the
INTEL_SUBPLATFORM_BITS definition.

This is not a fixes material but still lets make it precise.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: 6ce1c33d6c36 ("drm/i915: Kill INTEL_SUBPLATFORM_AML")
---
 drivers/gpu/drm/i915/intel_device_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 79dab5a6f272..1d39a0f706d1 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -93,7 +93,7 @@ enum intel_platform {
  * it is fine for the same bit to be used on multiple parent platforms.
  */
 
-#define INTEL_SUBPLATFORM_BITS (3)
+#define INTEL_SUBPLATFORM_BITS (2)
 
 /* HSW/BDW/SKL/KBL/CFL */
 #define INTEL_SUBPLATFORM_ULT	(0)
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
