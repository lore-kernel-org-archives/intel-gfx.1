Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAC606A890
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw3gATfw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C369810F159;
	Mon, 16 Nov 2026 14:37:37 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88BE10E0D8
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 00:02:36 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-67c0bd676eeso2088708d50.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 15 Nov 2026 16:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794787355; x=1795392155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=y5g9gX+PiRwxc1Lcoo4j5plcZ5ytlB3/FlKk63qNKGI=;
 b=Aw3gATfwKCJXaDERQa2BcE2LN6pt5Crr0mF2bjorPi8LG6VfedaaHJq5LalhOdVfvP
 khx5aOeitfrfNTwHC3eaKQ1nFUXhVg85MJThG1o26YmB1FfeLChHI8kV25RlLxL9P8/Y
 z5LBE3qQuGxit4wKZm/5BfNPwvYqtJw5UrwTZn2iPDuDBMGyDnOIcftA4T9NT4PzqTKV
 1LwFSSZrB/bttPD1e86g1RL0Njeu6H9SeTUaKxuavTWyFhCefNMv0X74LQGtwTSCYEER
 xa68+yXtFyL81AhL9eScCywpBGJwPHKqUoxd+I3sDw75nWFGZlrVA3GCjZHFfR1oktv5
 A6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794787355; x=1795392155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y5g9gX+PiRwxc1Lcoo4j5plcZ5ytlB3/FlKk63qNKGI=;
 b=TKaEZwboETJkrm8HAPAvFDj1ij9x6Czbx2SQJffnTemmJkSAYXDnKpXXonBSn6Z++M
 FMjKefgYNrVwaGg3xQRvIQZUTZHJUv0Kmw4u9Ac+9p2pZ2Y5T+NkurAK5uKiJ41qfxNH
 04HoLdwwWvd81+0TeedPVJGH1qHI+wErtG4LBQkL/8aHmDyeCq5DIpNTvSjs+PKSAC/b
 Dn3YqIiV/SJwD7zAQtzOGi/Da1oYHxfnqCwizH/s/jO5CQR52DqgiGayziF4S71QteYp
 K3vXGBFJS0PPaLylNex8QN9igQgpTWlZuWttNNMJW6IjWfwIXq7WKwZIZrOErYNnB/6G
 LIUA==
X-Gm-Message-State: APuU4Z/wESIZ9iLRYazY0rUnm8l8UUMw3SI2APHLqDUasIHiRrnivtzB
 o/1oHjHDd0ZQ5d0UaGSRomIQiNgn5+ODydGxLM+fKLfuwJZw/dQwvNBb/UZj+G42
X-Gm-Gg: AZFdTZc6Wxq9ZWHBL37GaTeWmzBwE6p+/dJFWA0cLuVPsebr6n/xzLTSq3oIPn0/BD0
 AA03gIE84YaP4iyw1cV3vBEHrrz7uFPiGPqSiXoOGE+zx3r6XGVFPYOJNa2FsnhD4eykNH6h6Ds
 laV2RtFUo4ZwPXU5DWpQDk5FNQAweiFhWcsLsE+uYeQfEJ1+BONwoxQ/FYDTec5bFsC/9Na82yu
 lmqx0+NqKp1fIKtie4gFVPqQ2N3FbWuO4dLoZPWvxpGkUUi4qKqmn9xvsn1cXTzX+HQq/mgIXYl
 V3d9uJPTG5aMMQHgEzg4NLHuTwUhsucsUiui/xuhNbWK6RvuqdNEcQpbZ+HtWLUkq31tPorrixS
 uQbtOvB9C2Pp2023eGpvOyJC8oa2eXhFMQII9gDXL/jln0nZfLnhU3lEb8Q6vaokiHKLncaNdH+
 ecMkiw1R5t9wg4hWo9CC3X9FdDW8kNFiWT6U7jwR+NEY6c3LqPFPVDXTT7PE7WwYq0gWL/sLeVj
 c3xxgac6ZydDST7bpseJuoyj+ddP/d6S2QjoZV5Y5fl1DTrS/L6jlUdQ72ENGFAjPCJ80n7djVn
 bkrdy8mAzLAmLm6U7rti1DUKe+Lo4uhs0Oam58yKurVoQzBPrkHoGryt1a1bMQJBzLgnWKGshDk
 urQ==
X-Received: by 2002:a05:690e:803:10b0:677:d180:d39c with SMTP id
 956f58d0204a3-67d8965a4damr3708220d50.20.1794787355165; 
 Sun, 15 Nov 2026 16:02:35 -0800 (PST)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67d8a6210ffsm8400263d50.20.2026.11.15.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2026 16:02:34 -0800 (PST)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, i915-ci-infra@lists.freedesktop.org,
 Lucas Moreno <lucasgabmoreno@gmail.com>
Subject: [PATCH RESEND] drm/i915/bios: Fix reset sequence order on GLK VBTs
 with DEASSERT_RESET in INIT_OTP
Date: Sun, 15 Nov 2026 21:00:30 -0300
Message-ID: <20261116000030.8978-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:25 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Resending: the original posting (Oct 13) has had no comments so far, and
Intel GFX CI did not run on it because my author address is not on the
allowlist (LGCI.VerificationFailed, Patchwork series 176138). I also
asked in the thread and on i915-ci-infra, with no reply yet.

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

