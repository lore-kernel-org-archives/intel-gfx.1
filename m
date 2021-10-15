Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA270C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D1561151
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D1561151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8AA6EDA1;
	Fri, 15 Oct 2021 13:39:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ABB6EDA0
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 13:39:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="288777722"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="288777722"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 06:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="481692709"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 15 Oct 2021 06:39:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 16:39:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Oct 2021 16:39:05 +0300
Message-Id: <20211015133921.4609-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
References: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 04/20] drm/i915/hdmi: Unify "4:2:0 also" logic
 between .mode_valid() and .compute_config()
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

Currently .mode_valid() and .compute_config() have their "4:2:0 also"
logic inverted. Unify things so that we use the same logic on both
sides.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index e97c83535965..18e7ef125827 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2179,12 +2179,13 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 
 	ret = intel_hdmi_compute_clock(encoder, crtc_state);
 	if (ret) {
-		if (!intel_hdmi_is_ycbcr420(crtc_state) &&
-		    connector->ycbcr_420_allowed &&
-		    drm_mode_is_420_also(&connector->display_info, adjusted_mode)) {
-			crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
-			ret = intel_hdmi_compute_clock(encoder, crtc_state);
-		}
+		if (intel_hdmi_is_ycbcr420(crtc_state) ||
+		    !connector->ycbcr_420_allowed ||
+		    !drm_mode_is_420_also(&connector->display_info, adjusted_mode))
+			return ret;
+
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+		ret = intel_hdmi_compute_clock(encoder, crtc_state);
 	}
 
 	return ret;
-- 
2.32.0

