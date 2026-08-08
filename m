Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA99C5AD55
	for <intel-gfx@archiver.kernel.org>; Sat,  8 Aug 2026 16:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09AF10E4E2;
	Sat,  8 Aug 2026 16:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ST42Sa1V";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60CE10E4A5
 for <intel-gfx@lists.freedesktop.org>; Sat,  8 Aug 2026 09:58:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47fe45db360so32575f8f.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 08 Aug 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786183103; x=1786787903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bygF4+CGk1HszXnKQxQkJUMmXmQwnL2yRQrBPqNom6w=;
 b=ST42Sa1VqmdePuhIQ3TQ8avga47TvKxamNgKy+GrqNX62SdNtt+uicmxQ11eddcIIQ
 r9we2fjf6sLe8eea5vQKgRC7IyyTKQK0rhIhsHryy8FIZWhbGh2Rjin3ZRM+YraLHsV3
 Nn0knDawzBXY0NTBM5EdC5ediBhpYDcI8EyORCCPvN5o8VM4AmOA10BAmh6E9crequkM
 n7Y+fI1xmHKlyCgHrii12jNfvOdoQMZiA87Kv/ds+bRS0Zw4649TL2RnkTcMqVjHoMaT
 j0soDag6Gk9HdQBFi54S8yuKziw1UuKmV6w3kbEl1ppspJDmUi1N9FrRJUcQEYXtD0Vz
 cRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786183103; x=1786787903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bygF4+CGk1HszXnKQxQkJUMmXmQwnL2yRQrBPqNom6w=;
 b=Ngx319Y1eVjVltSPFn9H33jQ6wjJ9D0nyl4nz5GwrQ24+RHutIjyGkBVhissCfelpE
 qZ0hzrbN7n3ZvxBNcc5uHKKxICJ1xpEXYn6OyuX6I9Rz3aHwb0pfW3WxKHfBVYSi+8cC
 xxNeVgMt4YYos0/lCUIShbOpkkYluGEwoXmPv2VBaNlpdu3gSBlXqhe4c18FdLai88zw
 Zf5ahY8KNE//NjZkfrKxME1Eos+N7Lkv6PHQjMRQN+uOJtRe3RrbP3u+eKxXlxkvnfAP
 ZdchtDRO972cSlBcgsuZXwcYTVRie3l6U78yETcMEX+9UeyUH7Tz+P7V6FZuZuu7NqfC
 V7+A==
X-Gm-Message-State: AOJu0YwqTDjRLDRw+iz1HGDNWwJ/tyWdAbUSLYqT/0WPGHYQv3UzOAjS
 WgRJHplSSRfQgYOzDYXVrkwgqowusLvmB2YHCwh7Z/6vnx3CE+HBiRIj
X-Gm-Gg: AR+sD10SJfkiekbrtEfNHK6TH8aqCNSfGV4gWFvwglOR6qzG0c6VUOBIRfwkquZ5Nu7
 XKZN1QskFHvH91UjE2G0w0hQiUKA8xbxELOIFjW6LOCf8nMaRPNRAJfvzkuMD+UazdS1cLCAv0V
 VXHX3fKG+10620NjtKWlGzASVXFP8XmJylz/vBgLDNMzHhqkqBeZunCPx1Q/FmXqoz469HWdv4P
 IW1oT2Zx0i6eP2sv0jeXbv+sU1LRxQAHHO2IsCUMHgOjbXSEDTBUZvHrPh9EzHjPFma+AanmRcF
 GPPer29TbzvwqA99F2TJCNtRrMHrf1mWIACNvhiqS+hC3aoaGWtWigYtp/WdaAhbKQXWnU00bz2
 b2KeqB8b2vtsHkoWGHexIazP7JqJwCSTVpEa1jhisrSt/nRhXQUWQE8AK5gpHP9qUDMK+6zt6Eq
 sgzaecJb1fLwDOM5bxuVrrdWNae37jOfSmPKurublPo2um75QGpA9OSIIFSz5XKK1IB4TZcQMQJ
 /nOsloai4gFU7Y0n/mNIwBqsbEVMnm9L4ZqJQsOV53LRoYVixhwpOJ2h5J3eprPX0syQA==
X-Received: by 2002:a05:6000:401f:b0:47f:7e91:3d55 with SMTP id
 ffacd0b85a97d-47fec520b24mr21741731f8f.2.1786183103128; 
 Sat, 08 Aug 2026 02:58:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu.
 [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 02:58:22 -0700 (PDT)
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
Subject: [PATCH 3/5] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Sat,  8 Aug 2026 11:57:22 +0200
Message-ID: <20260808095749.9428-4-royalnet026@gmail.com>
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

The dw-dp bridge already filters candidate output formats on
conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
validates the result against the link bandwidth, but the connector
never exposes the "max bpc" property, so userspace cannot limit the
bit depth. Attach the property with a range of 6 to 10, matching
dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
deepest entries are 10 bpc.

drm_connector_attach_max_bpc_property() initializes
connector->state->max_requested_bpc and therefore requires the
connector to have a state. Rockchip binds its components before
drm_mode_config_reset() runs, so the freshly created bridge connector
does not have one yet - create the connector state before attaching
the property, exactly like drmm_connector_hdmi_init() does for HDMI
bridge connectors. The later drm_mode_config_reset() then re-creates
the connector state, and the preceding patch makes
drm_bridge_connector_create_state() restore max_requested_bpc from
connector->max_bpc, so clients that never set the property (fbcon in
particular) keep the full range instead of ending up with 0.

With the property attached, compositors such as KWin write "max bpc"
on every atomic modeset; any in-range value is handled by the existing
format filter and bandwidth checks.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 770ab042a187..4dc29963b5d8 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -172,6 +172,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 				     "Failed to init bridge connector\n");
 	}
 
+	/*
+	 * The components are bound before drm_mode_config_reset() runs, so
+	 * the connector has no state yet, but
+	 * drm_connector_attach_max_bpc_property() requires one. Create the
+	 * connector state first, like drmm_connector_hdmi_init() does.
+	 */
+	if (connector->funcs->atomic_create_state) {
+		struct drm_connector_state *state;
+
+		state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(state)) {
+			dw_dp_unbind(dp->base);
+			return PTR_ERR(state);
+		}
+
+		connector->state = state;
+	} else if (connector->funcs->reset) {
+		connector->funcs->reset(connector);
+	}
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

