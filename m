Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA5FC433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 03:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DD3611BD
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 03:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15DD3611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9835F89DEC;
	Tue,  9 Nov 2021 03:41:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FCA89DEC
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Nov 2021 03:41:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229835182"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="229835182"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 19:41:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="533543983"
Received: from tsengwil-desk1.itwn.intel.com (HELO gar) ([10.5.253.7])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 19:41:43 -0800
From: William Tseng <william.tseng@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Nov 2021 11:41:25 +0800
Message-Id: <20211109034125.11291-1-william.tseng@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [PATCH] drm/i915/dsi: disable lpdt if it is not enabled
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Avoid setting LP_DATA_TRANSFER when enable_lpdt is false

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Cc: Cooper Chiou <cooper.chiou@intel.com>
Signed-off-by: William Tseng <william.tseng@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 168c84a74d30..31cea17481b1 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -183,6 +183,8 @@ static int dsi_send_pkt_hdr(struct intel_dsi_host *host,
 
 	if (enable_lpdt)
 		tmp |= LP_DATA_TRANSFER;
+	else
+		tmp &= ~LP_DATA_TRANSFER;
 
 	tmp &= ~(PARAM_WC_MASK | VC_MASK | DT_MASK);
 	tmp |= ((packet->header[0] & VC_MASK) << VC_SHIFT);
-- 
2.17.1

