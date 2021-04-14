Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91F3C433B4
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 06:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CBC61139
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 06:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28CBC61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774016E1F2;
	Wed, 14 Apr 2021 06:30:34 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A66E1F2;
 Wed, 14 Apr 2021 06:30:33 +0000 (UTC)
Received: from 1-171-231-81.dynamic-ip.hinet.net ([1.171.231.81]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lWZ2f-0007lr-7U; Wed, 14 Apr 2021 06:30:26 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com
Date: Wed, 14 Apr 2021 14:29:50 +0800
Message-Id: <20210414063011.996773-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/dp: Use slow and wide link training
 for DPCP rev < 1.4
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Sean Paul <seanpaul@chromium.org>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Screen flickers on Innolux panel when clock rate 540000 is in use.

According to the panel vendor, though clock rate 540000 is advertised,
but the max clock rate it really supports is 270000.

So use slow and wide training for panels with DPCP rev < 1.4 to resolve
the issue. User also confirmed the new strategy doesn't introduce
regression on XPS 9380.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3384
References: https://gitlab.freedesktop.org/drm/intel/-/issues/272
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 775d89b6c3fc..ca73e2179659 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1461,12 +1461,12 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	    intel_dp_can_bigjoiner(intel_dp))
 		pipe_config->bigjoiner = true;
 
-	if (intel_dp_is_edp(intel_dp))
+	if (intel_dp_is_edp(intel_dp) && intel_dp->dpcd[DP_DPCD_REV] > 0x13)
 		/*
-		 * Optimize for fast and narrow. eDP 1.3 section 3.3 and eDP 1.4
-		 * section A.1: "It is recommended that the minimum number of
-		 * lanes be used, using the minimum link rate allowed for that
-		 * lane configuration."
+		 * Optimize for fast and narrow on DP 1.4. eDP 1.3 section 3.3
+		 * and eDP 1.4 section A.1: "It is recommended that the minimum
+		 * number of lanes be used, using the minimum link rate allowed
+		 * for that lane configuration."
 		 *
 		 * Note that we fall back to the max clock and lane count for eDP
 		 * panels that fail with the fast optimal settings (see
-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
