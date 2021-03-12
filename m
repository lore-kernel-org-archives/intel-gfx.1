Return-Path: <SRS0=hFQw=IK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6FAC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 13:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1B160190
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 13:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1B160190
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9916E0AA;
	Fri, 12 Mar 2021 13:34:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8466E0AA
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Mar 2021 13:34:43 +0000 (UTC)
IronPort-SDR: IMdjjJGJq9OIC7hYEITMeJ1XY2lOnXpQiXIFmZ4hP5JNhSUbS72Ti882acJytQuxPRLA4q1HJU
 yDsyK8DZKYNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="185475774"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="185475774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 05:34:42 -0800
IronPort-SDR: PXInT6DJpC8+/CsqIFPAYDkFG8AdZka6rLJg1C0oj2Lu6wpGtZ3wRZuNDM1P6gJLIRE5kSoFLp
 V1c1eLs9FhxA==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="387350912"
Received: from joemurpx-mobl.ger.corp.intel.com (HELO helsinki.intel.com)
 ([10.213.209.246])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 05:34:41 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Mar 2021 15:34:30 +0200
Message-Id: <20210312133430.1478156-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display/psr: Add sink not reliable
 check to intel_psr_work()
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

If the sink state is not reliable, it does not need to wait for
PSR "IDLE state" for re-enabling PSR. And it should not try to re-enable
PSR.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index cd434285e3b7..7f555407de06 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1686,6 +1686,9 @@ static void intel_psr_work(struct work_struct *work)
 	if (READ_ONCE(intel_dp->psr.irq_aux_error))
 		intel_psr_handle_irq(intel_dp);
 
+	if (intel_dp->psr.sink_not_reliable)
+		goto unlock;
+
 	/*
 	 * We have to make sure PSR is ready for re-enable
 	 * otherwise it keeps disabled until next full enable/disable cycle.
-- 
2.30.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
