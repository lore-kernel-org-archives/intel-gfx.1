Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0BC5AD55
	for <intel-gfx@archiver.kernel.org>; Sat,  8 Aug 2026 16:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550F010E060;
	Sat,  8 Aug 2026 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="APNYwYEy";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36EF10E4A5
 for <intel-gfx@lists.freedesktop.org>; Sat,  8 Aug 2026 09:58:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47df6a5655aso40645f8f.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 08 Aug 2026 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786183105; x=1786787905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=78pbQXQC7rS+xYT3KOYvmzHciozgKbUx+FycpcHfTyI=;
 b=APNYwYEy45O1XU5zVOg4vrR1cRMpH0yxgVTywSWX2S/Tus9xyyT91zltrqNZUcqy0J
 XzMg5Ilp798DbDrkOqjAEpPF7rh2E1GBzpF8y7wWttFbXZcvZMhbUQZlIg5bvrEKaIdR
 iAZYlf+dbSvknO6WVFrT/KI3qt3uidKJNI+HHqCnMlWDQ0raqNgnjC7YQe4m2gDVUqAt
 7/aGq7jgz1bfct6xEhBh4Lw+AJa2j5J+NBPo8VYatelAWpaBVvoTlT4cBvZoyqE6rQTN
 NcsLSGRKwl0qW9vaY/IePLJAIZUu0iyOYLMdsmIV+VQN8rijyLpmSp4Nj1UnRmUuTtAZ
 vQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786183105; x=1786787905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=78pbQXQC7rS+xYT3KOYvmzHciozgKbUx+FycpcHfTyI=;
 b=Bcd7maWkc5rpmFw0Fw9KxcIdG+fX7gZoJs8mRhePUZRYDqHCX+VM0rnmMHlNTwQ+Rw
 oM5NyQwxKgKemqoFX2twGJ71O2giKf3M+CNUPTAeuh99MReZnL0lG++KNGZyw2N2Tgli
 4UYJIKXxd3rNnvDr7ngpLAxIu44JwEInZHHOlBVkf7S5Q36d64ZUQXTx6t5Ph2/o0mb1
 wSmW9Z/DfFjb4Hh2/n0lH9Wf4Kifp8j4LprYmEG9bpTxFnEV2lNKoIj6VgTpwR2UoazA
 /wYD6WgWPot4NkuBTR+9xc7vKrw/UsCxSe1PO7lNeF4E4do4X71cBNFC+MSYul9JEeew
 SRAQ==
X-Gm-Message-State: AOJu0YyXw+mDrG7GqnM91LGo09jN9cNxnSPcfLgivo2X2PHbeYqDK+75
 lC0owBLy6ShC6EXu/kSU4xb8iEuFDvcIWe4TKE6HpA4NhLqGdvOHaTaa
X-Gm-Gg: AR+sD11aThRq63gB+yh4XvFGZwPZaG/0R08CEVqMFoGdQZCztfCWhjz5lkZhTWij+ms
 M4cOUsGnKWmFSsRHZbFmgpzhTQRfeX2m9QuH4qsCGPrwXsa5G9+asK6gqQIIYnrUnzI9MptNh6f
 hPpwWNAp1f6sEF3KretWvx45PXDu2ylHy+nJyPz2f/imloXmRinY0RPujZKTyvIPf3M+YvQUuxr
 TBHsrsC4FpT647c4QZAk4ZeeSRmUf6Xop0FKlnC2cQ7pF9f1dNEcYKWd9ll+3yufCaVYT+kg1LZ
 TdgSchF5v4BdLyNCIU1aOKfB7POI5C+HhFfUSLy2Kx8qjPgrIK0vg/sz5qcs5W9mgUxSGQERTvF
 Ti7W94v+n7bh9acncYkxkrowyWT38+kbVUdET9Cie8tDwh2BJjwyLClamSdnqUV38AVZhZQ0oXY
 lqpXzlhH+Jc+KDiH+mmff07iI68rgyZX0yHjuvlBm4+6x+IVIYjKalu8FdZx6FMFVQyZwT4AhJS
 sFuMIU8xWgi8ZIlu37ARtQtQfCIbJL4ue7DqJ5Q1+jgxgNX9zgcNhgv2Efao/iBzlFi0NGUklNm
 GDuU
X-Received: by 2002:a05:6000:4211:b0:47f:96bc:e370 with SMTP id
 ffacd0b85a97d-47fec63bb0bmr22186473f8f.4.1786183105168; 
 Sat, 08 Aug 2026 02:58:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu.
 [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 02:58:24 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 4/5] drm/bridge: synopsys: dw-dp: Add HDR static metadata
 support
Date: Sat,  8 Aug 2026 11:57:23 +0200
Message-ID: <20260808095749.9428-5-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808095749.9428-1-royalnet026@gmail.com>
References: <20260808095749.9428-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Aug 2026 16:23:40 +0000
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

Send an HDR Metadata InfoFrame SDP (DP 1.4a, Table 2-100 and
Table 2-101) when the connector state carries HDR output metadata, and
attach the HDR_OUTPUT_METADATA property in the Rockchip glue so
userspace can set it.

The infoframe is built with drm_hdmi_infoframe_set_hdr_metadata() and
packed with drm_dp_hdr_metadata_infoframe_sdp_pack(), then written
into a free slot of the SDP register bank with vertical interval
transmission, so the controller resends it once per frame during the
vertical blanking period. The SDP is sent at the end of
dw_dp_video_enable(), next to the existing VSC SDP; the connector
state is passed down from atomic_enable(), which already looks it up.

The allocated slot is tracked in hdr_sdp_nr and released in
atomic_disable(), following the VSC SDP pattern exactly:
atomic_disable() only clears tracked slots, so an untracked slot would
leak on every enable/disable cycle until dw_dp_send_sdp() runs out of
free slots and fails with -EBUSY for every SDP, including VSC and
audio.

A metadata change on a live stream (HDR on/off toggle, different
mastering display data) forces a full modeset: atomic_check() compares
the old and new connector state with
drm_connector_atomic_hdr_metadata_equal() and sets
crtc_state->mode_changed, the same approach as dw-hdmi. The resulting
disable/enable cycle then drops or (re)sends the SDP.

Commits without HDR metadata are unaffected: with a NULL metadata blob
in both old and new connector state,
drm_connector_atomic_hdr_metadata_equal() treats them as equal, no
modeset is forced, and dw_dp_video_enable() skips the SDP. This keeps
plain SDR commits a no-op even for compositors that write a NULL blob
on every atomic modeset once the property exists (KWin does).

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c   | 44 +++++++++++++++++++++--
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c |  2 ++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index df149c52fce0..ca997ea53e66 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -24,6 +24,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -369,6 +370,7 @@ struct dw_dp {
 	struct drm_bridge *next_bridge;
 
 	int vsc_sdp_nr;
+	int hdr_sdp_nr;
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1171,6 +1173,28 @@ static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
 	return dw_dp_send_sdp(dp, &sdp);
 }
 
+static int dw_dp_send_hdr_metadata_sdp(struct dw_dp *dp,
+				       const struct drm_connector_state *conn_state)
+{
+	struct hdmi_drm_infoframe frame;
+	struct dw_dp_sdp sdp = {};
+	ssize_t len;
+	int ret;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
+	if (ret)
+		return ret;
+
+	len = drm_dp_hdr_metadata_infoframe_sdp_pack(dp->bridge.dev, &frame,
+						     &sdp.base, sizeof(sdp.base));
+	if (len < 0)
+		return len;
+
+	sdp.flags = DW_DP_SDP_VERTICAL_INTERVAL;
+
+	return dw_dp_send_sdp(dp, &sdp);
+}
+
 static int dw_dp_video_set_pixel_mode(struct dw_dp *dp)
 {
 	switch (dp->pixel_mode) {
@@ -1265,7 +1289,8 @@ static void dw_dp_video_disable(struct dw_dp *dp)
 			   FIELD_PREP(VIDEO_STREAM_ENABLE, 0));
 }
 
-static int dw_dp_video_enable(struct dw_dp *dp)
+static int dw_dp_video_enable(struct dw_dp *dp,
+			      const struct drm_connector_state *conn_state)
 {
 	struct dw_dp_link *link = &dp->link;
 	struct dw_dp_bridge_state *state;
@@ -1440,6 +1465,9 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 	if (dw_dp_video_need_vsc_sdp(dp))
 		dp->vsc_sdp_nr = dw_dp_send_vsc_sdp(dp);
 
+	if (conn_state->hdr_output_metadata)
+		dp->hdr_sdp_nr = dw_dp_send_hdr_metadata_sdp(dp, conn_state);
+
 	return 0;
 }
 
@@ -1597,6 +1625,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
+	struct drm_connector_state *old_conn_state;
 	struct drm_display_mode *mode;
 	int min_hbp = 16;
 	int min_hsync = 9;
@@ -1616,6 +1645,11 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state->bpc = fmt->bpc;
 	state->bpp = fmt->bpp;
 
+	old_conn_state = drm_atomic_get_old_connector_state(conn_state->state,
+							    conn_state->connector);
+	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state))
+		crtc_state->mode_changed = true;
+
 	if ((adjusted_mode->hsync_start - adjusted_mode->hdisplay) & 0x1) {
 		adjusted_mode->hsync_start += 1;
 		dev_warn(dp->dev, "hfp is not 2 pixeel aligned, fixup to aligned hfp\n");
@@ -2016,7 +2050,7 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	ret = dw_dp_video_enable(dp);
+	ret = dw_dp_video_enable(dp, conn_state);
 	if (ret < 0) {
 		dev_err(dp->dev, "failed to enable video: %d\n", ret);
 		return;
@@ -2066,6 +2100,11 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 		dp->vsc_sdp_nr = -1;
 	}
 
+	if (dp->hdr_sdp_nr >= 0) {
+		dw_dp_clear_sdp(dp, dp->hdr_sdp_nr);
+		dp->hdr_sdp_nr = -1;
+	}
+
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2668,6 +2707,7 @@ int dw_dp_probe(struct dw_dp *dp)
 		return ret;
 
 	dp->vsc_sdp_nr = -1;
+	dp->hdr_sdp_nr = -1;
 	dp->audio_interface = DW_DP_AUDIO_UNUSED;
 	dp->audio_sdp_nr = -1;
 
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 4dc29963b5d8..c5bc178c0a50 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -198,6 +198,8 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return ret;
 	}
 
+	drm_connector_attach_hdr_output_metadata_property(connector);
+
 	return 0;
 }
 
-- 
2.43.0

