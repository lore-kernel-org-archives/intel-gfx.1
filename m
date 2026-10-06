Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B1CA600A
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2026 14:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9157C10F620;
	Wed,  7 Oct 2026 14:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="Uoti1ZnQ";
	dkim-atps=neutral
Received: from mail-qk2-f0.google.com (mail-qk2-f0.google.com [74.125.230.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543C10E195
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2026 22:05:04 +0000 (UTC)
Received: by mail-qk2-f0.google.com with SMTP id
 d75a77b69052e-53396c7c8e6so15080131cf.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 06 Oct 2026 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791324303;
 x=1791929103; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uXqQO72vQX+CVyP9Remda0/fLyiwnBhlCt4n7YoBuOk=;
 b=Uoti1ZnQUfmURcV3F1cXVgJt4dDEFHkKg3fvkt2fa3lMaFHS+w5oBueHW3Po35rAF4
 m5TLrLVRX/kCaV1fr+MJiRdRa6Fh+rRVjFpXcI0Q8nLfOp9WbXW5JQ3VoHnT7hCyRZA8
 Lrb8bFRxqooP1hnjUXNrLszhD4AkiRZ/UwGe+LBzHvxJTSLWPLb9nLSUSKgnuQ7R/zfX
 NMVnR1SBlBTxT4c+ohTMBlKOsahYcfJsBVEB459NSutiEKXbEAg8EO3QwxAtKZD5X9hp
 BEfXm8GL9icUJpuTsjAEOTQTEJ2RKh4qpDDARMMtyUWi54UM0GQ/jvmXKifz+4xkehuP
 jO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791324303; x=1791929103;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uXqQO72vQX+CVyP9Remda0/fLyiwnBhlCt4n7YoBuOk=;
 b=PUQofvMcIKFmnCjjR5cbtBjn1Yt3T1tgwCh+ajIyAZouktBJHfLxUGG8rjjhK9YOLn
 K98jxj34Nh0fmxxXga0ihe5Nl+O1XS5ho3Nd5mQqsqUmgRH9bDsDY2B12MoSKQ3NZ4GN
 PT9kYhVBaHQb2R7qOc41rKBTFYBM2wXn4hxJxEL4ReWcXzAITybiXI8fRmY4itX7IwPp
 fgqP4kKUnXV/0mmKdmNa2+fkDbfhIEhIt+tudprKmS9vepXLurwx8mYe0O3D+BRUBWjJ
 RWx4Yej0uy3n2Szmgd/JRmci/rZcLOu2BNu33ZnjqO4bJZawomLX3MbRt065x/3ykPOv
 onTA==
X-Gm-Message-State: AFuF++l5YhgbQI7WjgEdS7rH0VfWLLJjyyfzOmhlBMIyo7eXZnPWh9AM
 ommkLW8Dc4TW7gE4nwAhGapSZaZreKoenW1uY2iz2GJDONLS5jGOXIAuqcUYwIomtOA=
X-Gm-Gg: AYBFou3YWMMOyTFRZcFspHKx3oPspu4SDhEM1mQaSXIwOkC/OBuLvdrdHWUbYx6q3ES
 3QwKt/oPYE2WtEjrd/Zbqak2Pk0Pa9wHDe7JQkC0ofty6QEPQWvD99xbKuSdVLtfVRXVLOU64yt
 rnKuHKMo/J5gAK4Vg2G1WVfHwYaIFJfLWgZvHxeEXK3kK9tNHL/efrrlOfP6d/CQcaoa56Tql8q
 fFBNqC6UlJuKshwIj7oJaRVqymUasGvog8ikjW00WbpPTc4BjxMgNR+LSgueMakSPjMVdwz9K82
 AuRPS5KOhEuLF8Q7CivzN5TEAJDN/nDij+sok8lztNuxXXRm6062stq8tX34wS6+J1nNeJAaMkh
 L4eRDQ6ZAiPnHChxjGx4hs/oDv7auLQ2zSonkUiOgqPV1HIT9RUT2TiCm2dKePjaxCgyKnzkdWa
 Vuuvo9KpWLjLpvtKtDYSak/y+LiLLYufM1ivVaSFD6tE+LejmOeMp4HrYtfWeu8sQHgxAYttwvE
 oZDjOS8nVke7ZJtQy7sZCVLNyaLxltbhaUK3iC7T0QaDm+3OPWj2J8echB1ZdvzIZW6UZazxtyT
 5D80OLJkxaMSd7UQCsMj6jYJMGUqM6ucc+unv9aTnZ3QQLPCZTS9DLC5Ocu2YTI=
X-Received: by 2002:a05:620a:19a1:b0:93e:980a:2ff1 with SMTP id
 af79cd13be357-93e9b802152mr58804085a.69.1791324302737; 
 Tue, 06 Oct 2026 15:05:02 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93e990fdb6bsm62466685a.7.2026.10.06.15.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 15:05:02 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while vblank
 is enabled
Date: Tue,  6 Oct 2026 18:05:00 -0400
Message-ID: <20261006220500.3417572-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260923041342.2146450-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:06:25 +0000
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

Sinks that support async video timing in PR get the AS SDP suspended in
PR Active (disable_as_sdp_when_pr_active). The LG panel in the Dell XPS
16 DA16260 (sink OUI 00:22:b9, "Balsa2") then judders while frames are
updating, with the source flipping at a steady 8.33 ms. Leaving the AS
SDP on fixes it but blocks DC5/DC6.

Clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] while vblank
interrupts are enabled and set it again when they are disabled. Panel
Replay already holds DC_OFF while vblank is enabled, so no DC5/DC6
residency is lost. Not done when AS SDP skip frames is in use.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8930
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
Jouni, this is the fix for the stutter in the thread below. The 0x107
bit 6 patch there is still correct but is not enough on its own.
https://lore.kernel.org/r/20260923041342.2146450-1-j@metarealtyinc.ca

- Run as an equivalent change on 7.3-rc4 and rc5 (PTL, xe) since 28 Sep:
  smooth, DC5 still reached when idle. This drm-tip version is build
  tested only (W=1, i915 and xe).
- A seamless VRR toggle rewrites PR_ALPM_CTL through
  intel_alpm_configure_pr_as_sdp() and sets the bit again until the
  next vblank enable. Not handled here.
- A second machine shows the same thing: XPS 13 (1028:0e53, same sink
  OUI), fixed downstream by exiting PR on every flush (issue 8930).
- Separate from this: the panel judders for a few seconds after panel
  power-on. Locally I hold PR inactive after power-on; 3 s was not
  quite enough, 8 s is clean. Not part of this patch.
- CI has never run on my patches (address not on the allowlist, asked
  twice). Could someone trigger it for this one and for series 174810?
 .../drm/i915/display/intel_display_types.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 36 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0e3083e85..75113ed10 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1816,6 +1816,9 @@ struct intel_psr {
 	bool dc3co_allowed;
 	/* DC3CO disable work */
 	struct delayed_work dc3co_work;
+	/* AS SDP in PR Active follows vblank enable */
+	bool pr_as_sdp_follow_vblank;
+	bool vblank_enabled;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00d0146b2..0f0b1fc94 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2166,6 +2166,29 @@ static bool psr_interrupt_error_check(struct intel_dp *intel_dp)
 	return true;
 }
 
+/*
+ * Sinks that support async video timing in PR get the AS SDP suspended in PR
+ * Active. Some then drift out of phase with the source and judder while
+ * frames are being updated. Send the AS SDP in PR Active while vblank
+ * interrupts are enabled: Panel Replay holds DC_OFF then anyway, so this
+ * costs no DC5/DC6 residency. Suspend it again when vblank interrupts are
+ * disabled, before DC_OFF is dropped.
+ */
+static void intel_psr_pr_as_sdp_update(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	lockdep_assert_held(&intel_dp->psr.lock);
+
+	if (!intel_dp->psr.enabled || !intel_dp->psr.pr_as_sdp_follow_vblank)
+		return;
+
+	intel_de_rmw(display, PR_ALPM_CTL(display, intel_dp->psr.transcoder),
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
+		     intel_dp->psr.vblank_enabled ? 0 :
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE);
+}
+
 static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -2225,6 +2248,12 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.enabled = true;
 	intel_dp->psr.pause_counter = 0;
 
+	intel_dp->psr.pr_as_sdp_follow_vblank = crtc_state->has_panel_replay &&
+		crtc_state->disable_as_sdp_when_pr_active &&
+		intel_dp->as_sdp_supported && intel_dp_is_edp(intel_dp) &&
+		!intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state);
+	intel_psr_pr_as_sdp_update(intel_dp);
+
 	/*
 	 * Link_ok is sticky and set here on PSR enable. We can assume link
 	 * training is complete as we never continue to PSR enable with
@@ -2400,6 +2429,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.pkg_c_latency_used = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
+	intel_dp->psr.pr_as_sdp_follow_vblank = false;
 }
 
 /**
@@ -4163,7 +4193,11 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
 				intel_dp->psr.vblank_wakeref =
 					intel_display_power_get(display,
 								POWER_DOMAIN_DC_OFF);
-			else
+
+			intel_dp->psr.vblank_enabled = enable;
+			intel_psr_pr_as_sdp_update(intel_dp);
+
+			if (!enable)
 				intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
 							intel_dp->psr.vblank_wakeref);
 		}

base-commit: daeb062fc40f727fafefed080c6d12a5ad1d0d12
-- 
2.56.0

