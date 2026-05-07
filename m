Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E126CD37BE
	for <intel-gfx@archiver.kernel.org>; Mon, 11 May 2026 14:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213610E7A0;
	Mon, 11 May 2026 14:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2B4D7yi";
	dkim-atps=neutral
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668EC10E29B
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 May 2026 15:55:20 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-50fb1932b62so7294921cf.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 07 May 2026 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778169319; x=1778774119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWM+10h5MUyRseSBiItZP2GSRhredA2eS6xYxv/W1C0=;
 b=A2B4D7yi6HrFu+vnQ9OcMMYSFMgJDBpTo9mGlPsB46lRGWdBpjKJVKTTaZ0RUWYLcw
 h0Zl6FGJKKDiKswXhXMc1qrcrwTLv7NRwtFDX31fDsi0ncok5yxjVHbaiviD/fzIpnPT
 ZuN1hbajjN+gG3MHJIWIO3qZlyRdGzPcqhy8qeOxfXnto0saO4Dr8+DnHNfDDZfhu86O
 vFvxr3t9IX+OgpdI5Lq7hRN2HyTIj5ALKLWsnTRgbZ8TDUHilOmXz42JLGyxs9fvxMfL
 UQyMM1sTr3HPlCkQY3pm1em9UjWuN6p2b6MjiYlXybd8kXw82/b/am/Sv/AQdrIxzKen
 BKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778169319; x=1778774119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lWM+10h5MUyRseSBiItZP2GSRhredA2eS6xYxv/W1C0=;
 b=Ajb17LqTGPaB6QU2vRNx0prmjixZmwmjaeTDxGu4b0HN2FVg29hLrnEmRr4p8fe8vs
 pl+0kUKMh+4DAzq3/PcSVTdRgW8GTJykTonnaN2JAbamxQuePMANcbBPnCebrUBQb/TK
 xOwaNSY9L4ewhI6BZgHIt4AQ4wzHppwW3hvipAhDHTbx74amt3DxG6YIhLKhvVTd/5r2
 0XAe/6A7T2kBWxLtHIXoqVzIRAl+kAnGBCDFtAyrB1Hb9J2d2NCf0NyZ7Ndi3WyZ1Fk1
 XInIBAG2I4kECzRBNlwuCenzV0M7R0Vd00ltF9+zYitcYAtKSudM1zYK7ao5dnmj4Z/l
 wfXA==
X-Gm-Message-State: AOJu0Yz2Ma38RnKq3IYdlGz3gfIXUC5W1cSAp7hhN6kumm/bXCHd2+JG
 /c7FceA3H6Ruf/edh/w5JSSzXzQQ1ZTh44hRBiFz7eAh4bJMyNAfZl8/C5eGxgoMYn8=
X-Gm-Gg: AeBDieswGm0k7PW3Ct4lDYjlJ0sDTSXJ6W2KbtYsLTjFLTdgSo1AuEWlLGSM18RzNem
 gzWBU9oPxM2GyfLKP7I9pVjG25+Lpf5cS76/xi6SAmCuTs+mWj/dTVlDzIa2v4vJcgK4szEO7LV
 4w4M8KpudlTnC82oAV9vfQNZ6qO1yBSbmhy2HaFOgx7A2iygW13q4rUNGdl+3RueVxIEo4WYyLI
 OrLEICwzD3PMToG+fod/kW/DZtMLQhNFb0UisFEXrz7ShT0hjQQmld4TSkqaZLGU0hcJXWfTb6U
 0hc7mCO2SI1NUJ1sr85EwNfxgujKdLNd3vncoZv4P670VLWGyzOee0eI2PezN1LG5vzeePeb9Np
 R9N9mZeL3Utpw7M1kL+uFlpIJzkfHii564M7x198hRhlm0tYi5Ova9N6wvHFUXg6BluQZwfF75b
 BL1bBzSXznvwq+qJLCtZKQbzc8fg4SLY3DTj53s59P0J9WVBSCq4Ms5tGtXpUfpd7plsHJNkLzy
 3cN/SfGCA==
X-Received: by 2002:a05:622a:5e0f:b0:509:2858:3c63 with SMTP id
 d75a77b69052e-51461c31c60mr117627021cf.23.1778169319242; 
 Thu, 07 May 2026 08:55:19 -0700 (PDT)
Received: from JTOLLET-M-FKW7.cisco.com
 ([2603:5004:20a0:100a:af70:41c7:fc15:4203])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b534ac8ef3sm219635096d6.0.2026.05.07.08.55.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 May 2026 08:55:18 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status
Date: Thu,  7 May 2026 17:55:16 +0200
Message-ID: <20260507155516.60972-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260113143107.1446909-1-ankit.k.nautiyal@intel.com>
References: <20260113143107.1446909-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 14:40:35 +0000
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

HDMI 2.0 section 6.1.3.1 specifies that after enabling
Scrambling_Enable and starting scrambled video transmission, the source
should poll Scrambling_Status until it reads 1 or until a timeout of
200 ms expires.

Add a polling step after enabling the HDMI port to check the scrambling
status when HDMI scrambling is enabled.

On some HDMI 2.0 sinks, omitting this check can result in 4K@60Hz
(594 MHz) failing to come up correctly because the sink has not yet
finished its scrambling setup. In practice, waiting for the scrambling
status here fixes such sinks.

While this synchronous polling is not itself explicitly required for
correct modeset sequencing, HDMI 2.0 section 6.1.3.1 does recommend it
as the way for the source to verify that the TMDS link is functioning
correctly with scrambling enabled.

v3:
 - Add explicit HDMI 2.0 section reference in code comment
 - Clarify commit message around the observed sink fix

v2:
 - Poll TMDS_Scrambler_Status for up to 200 ms instead of using a fixed
   delay

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6868
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c | 26 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ebefa889bc8c..8659d1861c2a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3505,6 +3505,8 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
 	}
 
 	intel_ddi_buf_enable(encoder, buf_ctl);
+
+	intel_hdmi_poll_for_scrambling_enable(crtc_state, connector);
 }
 
 static void intel_ddi_enable(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 05e898d10a2b..234866310c14 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2693,6 +2693,32 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 		drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
 }
 
+/*
+ * HDMI 2.0 spec, section 6.1.3.1 (Scrambling Control): after
+ * enabling Scrambling_Enable and starting scrambled video
+ * transmission, poll Scrambling_Status for up to 200 ms.
+ */
+void
+intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
+				      struct drm_connector *_connector)
+{
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct intel_display *display = to_intel_display(crtc_state);
+	bool scrambling_enabled = false;
+	int ret;
+
+	if (!crtc_state->hdmi_scrambling)
+		return;
+
+	/* Poll for a max of 200 msec as per HDMI spec */
+	ret = poll_timeout_us(scrambling_enabled = drm_scdc_get_scrambling_status(&connector->base),
+			      scrambling_enabled, 1000, 200 * 1000, false);
+	if (ret)
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] Timed out waiting for scrambling enable\n",
+			    connector->base.base.id, connector->base.name);
+}
+
 /*
  * intel_hdmi_handle_sink_scrambling: handle sink scrambling/clock ratio setup
  * @encoder: intel_encoder
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index be2fad57e4ad..0fa3661568e8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -70,5 +70,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state,
 			unsigned int type,
 			void *frame, ssize_t len);
+void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_state,
+					   struct drm_connector *_connector);
 
 #endif /* __INTEL_HDMI_H__ */
-- 
2.54.0

