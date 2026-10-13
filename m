Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D771BCC6B2C
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2026 13:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A68210F4DF;
	Wed, 14 Oct 2026 13:44:29 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE3C10E6B6
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2026 00:13:20 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-16079d54c17so2867980c88.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2026 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791850399; x=1792455199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ssLrVFVKbOQOIJ6H07sgHPkguKF6w1CUt9WHQ/AI/u0=;
 b=OpuPUXIv6bzDz7J46BFdlPa8nLSP3EXdC49eRhdK8WG5i96l4NEqbfSDRFREgtnsbo
 hWongCs61AkyPwcWK2RHEC77QicgAKaMZuaDITtaMTI1ZGrp0EJ+yBwhmVMRV3iB8iUY
 pflURV0Do+RNxbIt36yfjyWn+7RVComwA15Uwo9RcU/GR5ifXS5fPKeKgKfU0kk7Gc6G
 ZP7s/M78bxs2nUMfzymTlN51es3VK5wY8M65fqRSZcBq8Jgs/COvgl3dCEHXreGOlHpJ
 u7HoL7QMiZ/MhhTsgPwz5RAXVV3loRykINFbOhjUP8kc4Ggri2rRO4+eJzWdpVzP9+u+
 YsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791850399; x=1792455199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ssLrVFVKbOQOIJ6H07sgHPkguKF6w1CUt9WHQ/AI/u0=;
 b=tkpwA1+YucsiNRThgHZjkcczVsR8teTG+/3iJNJ8Lwj7N68HD6J8N9FsbW3U57zZ9c
 vAmxbr2UCTTC4uVNVKSy42Af6PIjRKSdV64i51/5BoQ3XlByAT5BDNZy1gqG7uE31iBU
 hd/RSCtZUyfo2Hiah/bXg0fGlp/PWVHZ2K1+t0UR43TcUGhpP/+c4XJ+BrvyKRNZ81mX
 aQ5uRxmby/Y5hexobj65SfRoxOOfgfuUVyoHXMi/fQYHYsAZLJUfC7jOUdWDJjcDYrzn
 HlfhRsBi/B3bkZRyp1VjOMi6cS5T8LviIM4aGJfrcGir59YcRqbLXi+zjXbp/804GjwY
 4EhQ==
X-Gm-Message-State: AFq9FYLAUhcB7y0LSNC6miIzDs+W52RjCFOfoOEYkRhVLa/7JFCINQZp
 wXESCnz2pGJc6mqi88wCDaBpJfoGqJx8qoSqfwDdYe+oZMo1cWTSz7dH4ymjNHGjs1s=
X-Gm-Gg: AYBFou2nqP4f8lxDMNsBhxycEL/wXE0WQ1BxkLCcSyALb5U/x7dDGO4lz/bTohWqM3x
 7GBJPCkyjQ0IkBcHlO9xXbibo53gYQS0ueJu544bdlIsWAGfaGEGCbnDIDyd8Op8bkORiRab7eI
 w5fCYc24Xl7ydlisM2vBNFD4aGi2upOBFDksV9dGTbvRGb5fN34exwPZkiA5+/mdH8R4ye+pW25
 ZJT1yLaDcJ2kOEf97KB/1wG5YHn/WiJnYhMOrZVdYxxI7N/8mjH9uh8oMBtC1LK+P0V381Kr/wq
 JC0kaMMlOezNG1Rc0bQNWxVm8sT4HU6mVp0KWsMn4WcAx3kok+AXMVxNR5Y0x2ztBYawpP2BFTX
 tuYXxZLNSIhpRCwd3thaqMddSHvAcEUhiEMeaxpeN1/u0BxIxhe2DXq2EDRYwGH3Qxhmv11+U32
 m6rXo0Q3TVH9Y0awRrBHIjU8bmqubapHunNqq6RlZg2Tmfmq2QKp4Ghtq3sWfYM/lxAaVCC2DOd
 1EIOKQTiKs81+YIbLrVPhcy4QU4L3HKdnegdU5KJAFbVxMg+OGJlqxcgA==
X-Received: by 2002:a05:7022:1507:b0:144:c127:dd19 with SMTP id
 a92af1059eb24-16a60346a0amr21328278c88.37.1791850399074; 
 Mon, 12 Oct 2026 17:13:19 -0700 (PDT)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a1becb11sm31175790c88.4.2026.10.12.17.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 17:13:18 -0700 (PDT)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas Moreno <lucasgabmoreno@gmail.com>
Subject: [PATCH] drm/i915/bios: Fix reset sequence order on GLK VBTs with
 DEASSERT_RESET in INIT_OTP
Date: Mon, 12 Oct 2026 21:12:45 -0300
Message-ID: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Oct 2026 13:44:28 +0000
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

Some Gemini Lake VBTs, such as the one on the Lenovo IdeaPad
D330-10IGL, have an empty MIPI_SEQ_DEASSERT_RESET and perform the whole
panel reset pulse (GPIO set/clear/set with delays) from
MIPI_SEQ_INIT_OTP. The driver runs INIT_OTP after the DSI host has been
brought up, so the panel gets reset with the link already active. On
the affected machine this leaves the panel black with the backlight on
after S3 resume (the driver reports success at every step), and
randomly on boot and on output off/on cycles.

vlv_fixup_mipi_sequences() already handles the same kind of VBT bug on
VLV, but only for version 1 sequence blocks. The D330 uses a version 3
block, so add an equivalent fixup for GLK: if DEASSERT_RESET is
missing or empty, ASSERT_RESET exists, the panel is in video mode and
INIT_OTP only contains GPIO and delay elements, run INIT_OTP as
DEASSERT_RESET and leave INIT_OTP empty (or swap them if an empty
DEASSERT_RESET was present).

Tested on a Lenovo IdeaPad D330-10IGL (BIOS G0CN14WW, Celeron N4020)
with an otherwise unmodified v6.12.107 i915: 10/10 S3 resumes, 10/10
rotations and output off/on cycles, and 10/10 reboots with a working
display, where it failed every time before.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13225
Signed-off-by: Lucas Moreno <lucasgabmoreno@gmail.com>
---
Tested on v6.12.107 on a Lenovo IdeaPad D330-10IGL. This version is
ported to current mainline, where only the platform check differs
(display->platform.geminilake instead of IS_GEMINILAKE()). I could
not build or test it on mainline on this machine. See the discussion
in the issue linked above, where Ville pointed at the empty
MIPI_SEQ_DEASSERT_RESET in this VBT.

Question: should this apply to all GLK with this VBT shape, or be
limited with a DMI quirk? I only have one unit.

 drivers/gpu/drm/i915/display/intel_bios.c | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 97cbae2..d1c48d9 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2056,6 +2056,84 @@ static void icl_fixup_mipi_sequences(struct intel_display *display,
 	}
 }
 
+/*
+ * Count the elements of a v3 MIPI sequence, and report whether all of
+ * them are GPIO or delay elements (i.e. nothing that needs the DSI host
+ * to be up, like sending a packet).
+ */
+static int mipi_seq_v3_count_elems(const u8 *seq, bool *gpio_delay_only)
+{
+	const u8 *p = seq + 5;	/* skip the sequence byte and the size */
+	const u8 *end = seq + 5 + *((const u32 *)(seq + 1));
+	int count = 0;
+
+	*gpio_delay_only = true;
+
+	while (p < end) {
+		u8 op = *p++;
+
+		if (op == MIPI_SEQ_ELEM_END)
+			break;
+		if (p >= end) {
+			*gpio_delay_only = false;
+			break;
+		}
+		if (op != MIPI_SEQ_ELEM_GPIO && op != MIPI_SEQ_ELEM_DELAY)
+			*gpio_delay_only = false;
+
+		p += 1 + *p;	/* length byte + payload */
+		count++;
+	}
+
+	return count;
+}
+
+/*
+ * Some GLK VBTs (e.g. Lenovo IdeaPad D330-10IGL) have an empty
+ * MIPI_SEQ_DEASSERT_RESET and do the whole panel reset pulse from
+ * MIPI_SEQ_INIT_OTP instead. INIT_OTP runs after the DSI host has been
+ * brought up, but the panel reset must happen before that. When
+ * INIT_OTP only contains GPIO and delay elements, run it as
+ * DEASSERT_RESET instead.
+ */
+static void glk_fixup_mipi_sequences(struct intel_display *display,
+				     struct intel_panel *panel)
+{
+	u8 *deassert = (u8 *)panel->vbt.dsi.sequence[MIPI_SEQ_DEASSERT_RESET];
+	u8 *init_otp = (u8 *)panel->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP];
+	bool gpio_delay_only;
+
+	if (panel->vbt.dsi.seq_version != 3 ||
+	    panel->vbt.dsi.config->is_cmd_mode)
+		return;
+
+	if (!init_otp || !panel->vbt.dsi.sequence[MIPI_SEQ_ASSERT_RESET])
+		return;
+
+	/* Only if DEASSERT_RESET is missing or empty */
+	if (deassert && mipi_seq_v3_count_elems(deassert, &gpio_delay_only))
+		return;
+
+	/* And INIT_OTP only toggles GPIOs and waits */
+	if (!mipi_seq_v3_count_elems(init_otp, &gpio_delay_only) ||
+	    !gpio_delay_only)
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "Running INIT_OTP (GPIO/delay only) as DEASSERT_RESET\n");
+
+	/* The sequence executor checks the id byte of each sequence */
+	init_otp[0] = MIPI_SEQ_DEASSERT_RESET;
+	panel->vbt.dsi.sequence[MIPI_SEQ_DEASSERT_RESET] = init_otp;
+
+	if (deassert) {
+		deassert[0] = MIPI_SEQ_INIT_OTP;
+		panel->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP] = deassert;
+	} else {
+		panel->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP] = NULL;
+	}
+}
+
 static void fixup_mipi_sequences(struct intel_display *display,
 				 struct intel_panel *panel)
 {
@@ -2063,6 +2141,8 @@ static void fixup_mipi_sequences(struct intel_display *display,
 		icl_fixup_mipi_sequences(display, panel);
 	else if (display->platform.valleyview)
 		vlv_fixup_mipi_sequences(display, panel);
+	else if (display->platform.geminilake)
+		glk_fixup_mipi_sequences(display, panel);
 }
 
 static void
-- 
2.43.0

