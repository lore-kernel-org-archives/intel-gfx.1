Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD68C4332F
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 14:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC3060FC0
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 14:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DC3060FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11B56ECB9;
	Mon, 13 Sep 2021 14:45:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08A36ECB9
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 14:45:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221361462"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="221361462"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 07:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="551697623"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 13 Sep 2021 07:45:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Sep 2021 17:45:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Sep 2021 17:44:36 +0300
Message-Id: <20210913144440.23008-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913144440.23008-1-ville.syrjala@linux.intel.com>
References: <20210913144440.23008-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 12/16] drm/i915: Simplify
 intel_crtc_copy_uapi_to_hw_state_nomodeset()
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rewrite intel_crtc_copy_uapi_to_hw_state_nomodeset() in a
slightly more straightforward manner.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a5450ac9e2d0..5716085e15f5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7347,18 +7347,15 @@ static void
 intel_crtc_copy_uapi_to_hw_state_nomodeset(struct intel_atomic_state *state,
 					   struct intel_crtc_state *crtc_state)
 {
-	const struct intel_crtc_state *from_crtc_state = crtc_state;
+	const struct intel_crtc_state *master_crtc_state;
+	struct intel_crtc *master_crtc;
 
-	if (crtc_state->bigjoiner_slave) {
-		from_crtc_state = intel_atomic_get_new_crtc_state(state,
-								  crtc_state->bigjoiner_linked_crtc);
+	master_crtc = intel_master_crtc(crtc_state);
+	master_crtc_state = intel_atomic_get_new_crtc_state(state, master_crtc);
 
-		/* No need to copy state if the master state is unchanged */
-		if (!from_crtc_state)
-			return;
-	}
-
-	intel_crtc_copy_color_blobs(crtc_state, from_crtc_state);
+	/* No need to copy state if the master state is unchanged */
+	if (master_crtc_state)
+		intel_crtc_copy_color_blobs(crtc_state, master_crtc_state);
 }
 
 static void
-- 
2.32.0

