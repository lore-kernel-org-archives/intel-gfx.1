Return-Path: <SRS0=w1eM=KC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A74BC43460
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 08:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB0961132
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 08:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB0961132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tuxedocomputers.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E8B6EDE7;
	Fri,  7 May 2021 08:49:17 +0000 (UTC)
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB656EDE7;
 Fri,  7 May 2021 08:49:15 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 1E384C800B2;
 Fri,  7 May 2021 10:49:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id xMR939HFgnDh; Fri,  7 May 2021 10:49:13 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f12F200FD3bB57523c33F70.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f12:f200:fd3b:b575:23c3:3f70])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id CE809C800AA;
 Fri,  7 May 2021 10:49:13 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: ville.syrjala@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri,  7 May 2021 10:49:03 +0200
Message-Id: <20210507084903.28877-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507084903.28877-1-wse@tuxedocomputers.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 3/3] drm/i915/display: Use YCbCr420 as
 fallback when RGB fails
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

When encoder validation of a display mode fails, retry with less bandwidth
heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
to support 4k60Hz output, which previously failed silently.

AMDGPU had nearly the exact same issue. This problem description is
therefore copied from my commit message of the AMDGPU patch.

On some setups, while the monitor and the gpu support display modes with
pixel clocks of up to 600MHz, the link encoder might not. This prevents
YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
possible. However, which color mode is used is decided before the link
encoder capabilities are checked. This patch fixes the problem by retrying
to find a display mode with YCbCr420 enforced and using it, if it is
valid.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 ++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9f3da72dabee..3c4d7a3e0969 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1897,6 +1897,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 	int clock = mode->clock;
 	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
 	bool has_hdmi_sink = intel_has_hdmi_sink(hdmi, connector->state);
+	bool ycbcr_420_only;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		return MODE_NO_DBLESCAN;
@@ -1913,12 +1914,22 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 		clock *= 2;
 	}
 
-	if (drm_mode_is_420_only(&connector->display_info, mode))
+	ycbcr_420_only = drm_mode_is_420_only(&connector->display_info, mode);
+	if (ycbcr_420_only)
 		clock /= 2;
 
 	status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
-	if (status != MODE_OK)
-		return status;
+	if (status != MODE_OK) {
+		if (ycbcr_420_only ||
+		    !connector->ycbcr_420_allowed ||
+		    !drm_mode_is_420_also(&connector->display_info, mode))
+			return status;
+
+		clock /= 2;
+		status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
+		if (status != MODE_OK)
+			return status;
+	}
 
 	return intel_mode_valid_max_plane_size(dev_priv, mode, false);
 }
@@ -2125,6 +2136,14 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	}
 
 	ret = intel_hdmi_compute_clock(encoder, crtc_state);
+	if (ret) {
+		if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420 &&
+		    connector->ycbcr_420_allowed &&
+		    drm_mode_is_420_also(&connector->display_info, adjusted_mode)) {
+			crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+			ret = intel_hdmi_compute_clock(encoder, crtc_state);
+		}
+	}
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
