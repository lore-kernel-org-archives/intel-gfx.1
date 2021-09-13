Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACF3C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A6960E9C
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14A6960E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694DE6E20C;
	Mon, 13 Sep 2021 17:43:06 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF4A6E20C
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 17:43:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="282748757"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="282748757"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 10:43:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="698939132"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 10:43:03 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Sep 2021 10:42:54 -0700
Message-Id: <20210913174254.21735-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Update memory bandwidth parameters
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Earlier while calculating derated bw we would use 90% of the calculated
bw. Starting ADL-P we use a non standard derating. Updating the formulae
to reflect the same.

Bspec: 64631

Fixes: 4d32fe2f14a7 ("drm/i915/adl_p: Update memory bandwidth parameters")
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index e91e0e0191fb..23121ddd2580 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -222,31 +222,35 @@ static int icl_sagv_max_dclk(const struct intel_qgv_info *qi)
 
 struct intel_sa_info {
 	u16 displayrtids;
-	u8 deburst, deprogbwlimit;
+	u8 deburst, deprogbwlimit, derating;
 };
 
 static const struct intel_sa_info icl_sa_info = {
 	.deburst = 8,
 	.deprogbwlimit = 25, /* GB/s */
 	.displayrtids = 128,
+	.derating = 10,
 };
 
 static const struct intel_sa_info tgl_sa_info = {
 	.deburst = 16,
 	.deprogbwlimit = 34, /* GB/s */
 	.displayrtids = 256,
+	.derating = 10,
 };
 
 static const struct intel_sa_info rkl_sa_info = {
 	.deburst = 16,
 	.deprogbwlimit = 20, /* GB/s */
 	.displayrtids = 128,
+	.derating = 10,
 };
 
 static const struct intel_sa_info adls_sa_info = {
 	.deburst = 16,
 	.deprogbwlimit = 38, /* GB/s */
 	.displayrtids = 256,
+	.derating = 20,
 };
 
 static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel_sa_info *sa)
@@ -302,7 +306,7 @@ static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
 			bw = icl_calc_bw(sp->dclk, clpchgroup * 32 * num_channels, ct);
 
 			bi->deratedbw[j] = min(maxdebw,
-					       bw * 9 / 10); /* 90% */
+					       bw * (100 - sa->derating) / 100);
 
 			drm_dbg_kms(&dev_priv->drm,
 				    "BW%d / QGV %d: num_planes=%d deratedbw=%u\n",
-- 
2.20.1

