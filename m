Return-Path: <SRS0=cAZQ=JJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE7AC43461
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 23:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114746117A
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 23:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 114746117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9589F8B;
	Mon, 12 Apr 2021 23:24:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EBD89F8B
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Apr 2021 23:24:20 +0000 (UTC)
IronPort-SDR: uZtNT+ovfkcymFmibKSrwvs4VrcA9/k53Fjadghmne6j8zpCdCa49/1nw/mysijuR/r0zxhzD7
 xH2efnCi5m5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="214771409"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="214771409"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 16:24:18 -0700
IronPort-SDR: Q6sEHYWB6nFslLcQf9E2r4mGPHFwE1rRzLl8DacBDG7sIv9TjsV+Wf4r4+3WClW6gOzQQJfF7v
 TRZt8rHLUNtA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="398552824"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 16:24:17 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Apr 2021 02:24:13 +0300
Message-Id: <20210412232413.2755054-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210412232413.2755054-1-imre.deak@intel.com>
References: <20210412232413.2755054-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: Drop redundant address-of op
 before lttpr_common_caps array
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

The addres-of op in front of an array is just an alias to using the
array on its own, so drop the op.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cbcfb0c4c3708..7f684d33314f9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -37,7 +37,7 @@ intel_dp_dump_link_status(struct drm_device *drm,
 
 static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel_dp)
 {
-	memset(&intel_dp->lttpr_common_caps, 0, sizeof(intel_dp->lttpr_common_caps));
+	memset(intel_dp->lttpr_common_caps, 0, sizeof(intel_dp->lttpr_common_caps));
 }
 
 static void intel_dp_reset_lttpr_count(struct intel_dp *intel_dp)
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
