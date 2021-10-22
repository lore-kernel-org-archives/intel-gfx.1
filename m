Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C981BC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 10:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787BF611CB
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 10:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 787BF611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99A6ED06;
	Fri, 22 Oct 2021 10:33:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2836ED06
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Oct 2021 10:33:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="210066662"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="210066662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="569011830"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 22 Oct 2021 03:33:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 13:33:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Manasi Navare <manasi.d.navare@intel.com>
Date: Fri, 22 Oct 2021 13:33:00 +0300
Message-Id: <20211022103304.24164-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211022103304.24164-1-ville.syrjala@linux.intel.com>
References: <20211022103304.24164-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 5/9] drm/i915: Simplify
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

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 640d87a00e15..e745eb4650e4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5762,18 +5762,15 @@ static void
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

