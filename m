Return-Path: <SRS0=b/6W=GX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C46C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 11:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC08F22A84
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 11:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC08F22A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060F56E160;
	Wed, 20 Jan 2021 11:07:23 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5176E048;
 Wed, 20 Jan 2021 11:07:21 +0000 (UTC)
IronPort-SDR: Hn8lOCGYx4jVr4Vb9d33R/RmXAhBY8+oMwWO4o8R9Jr4BExTYu78BjNMFGliOh/edbzE4fU89B
 vveHWt8+KDMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166749396"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="166749396"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 03:07:20 -0800
IronPort-SDR: VE4z5akVVYbUUZY1kHUMTxwRqGQcbZkCTHSGQvToKJ7xlbs6fL6oSZMcz4nZgNeAY1L3gF4/IS
 IKCZrS1VdSzg==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="384798622"
Received: from oreunova-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.45.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 03:07:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 20 Jan 2021 13:07:08 +0200
Message-Id: <20210120110708.32131-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/msm/dp: fix build after dp quirk helper
 change
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, jani.nikula@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Commit 7c553f8b5a7d ("drm/dp: Revert "drm/dp: Introduce EDID-based
quirks"") removed drm_dp_get_edid_quirks() and changed the signature of
drm_dp_has_quirk() while they were still being used in msm. Fix the
breakage. Functionally, removing the EDID-based quirks has no impact on
msm.

[The above commit was merged to drm-intel-next; make two wrongs a right
by merging this fix through drm-intel-next as well.]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
References: http://lore.kernel.org/r/20210120105715.4391dd95@canb.auug.org.au
Fixes: 7c553f8b5a7d ("drm/dp: Revert "drm/dp: Introduce EDID-based quirks"")
Cc: Lyude Paul <lyude@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: I admit to not even build testing this one. I'd need a config,
possibly also a toolchain setup for that.
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5d96d7..36b39c381b3f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1420,16 +1420,14 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 {
 	u8 *dpcd = ctrl->panel->dpcd;
-	u32 edid_quirks = 0;
 
-	edid_quirks = drm_dp_get_edid_quirks(ctrl->panel->edid);
 	/*
 	 * For better interop experience, used a fixed NVID=0x8000
 	 * whenever connected to a VGA dongle downstream.
 	 */
 	if (drm_dp_is_branch(dpcd))
-		return (drm_dp_has_quirk(&ctrl->panel->desc, edid_quirks,
-				DP_DPCD_QUIRK_CONSTANT_N));
+		return (drm_dp_has_quirk(&ctrl->panel->desc,
+					 DP_DPCD_QUIRK_CONSTANT_N));
 
 	return false;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
