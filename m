Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F792C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64F110F6BA;
	Thu,  3 Sep 2026 16:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="0Y/1EBPL";
	dkim-atps=neutral
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6FE10F2CB
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 16:25:35 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-517dc520840so14135421cf.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 02 Sep 2026 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788366334;
 x=1788971134; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=V7qmVbRhinvYtRSTTEwdvGYu81SZGmRElA5wi2fGPso=;
 b=0Y/1EBPLAtBz2Ky4XN+hNgKlER2cpFe9PWmVotaZkSFgZPOpBzqWlqzKoA9bJawQUs
 3/ltDF9j4JGAV/gG6WSkk8KMkcmqE9jxQy+VlchinNSmCBCFSZGv9KnJ61xCfbxPT+ro
 UJILtLuYDzPOPrk/vk8s7ai30PhDl4dtqAsIc9pTp+MXlI/f/BQRT/mUIRMy7so6eCqC
 M7ulCZ+u1J54CChAJO66KOoEBUONrg0pNwU3UJLjPeAP3IhFcbzogaLi8BL7YszBvRf0
 Nobaj+ZJZ66M0EA6xCA1HzT2ajXkcQIrKm5gVCBMUrz7SE3Pqgg/0KwG4RPl+uwPmXqq
 uXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788366334; x=1788971134;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V7qmVbRhinvYtRSTTEwdvGYu81SZGmRElA5wi2fGPso=;
 b=eQrzV0p0nAE68RL5NXE6mXPy1H0RSTi5+gMZbyu2BYT25E9GUyZFvE98lmDFBZlXJd
 ydQqf8fONMAQGpjrKblh53URVp85oOcBwImvHMiIGbQmj3H03bW5exKJwx5u8mCvhM7H
 rxSS9/lbkPl3/lC9XQ36S4uoZgunfdn9ltBAQa9P82LP2ef9lUQwWnsZ9eRUfyJbiguD
 CX1fnMFBgGG5Am+TCtklXnbWCc+h/P5fIAv1pjPP/jzBWfUFDrusnNi9NK3yAKP+YAGy
 j1v/OzWRTBgha6DgHXl4uRVHpaW9F8UAHoScOXiI942PhnvqKUEaBR/MMS/ixrdYiCMx
 D3Nw==
X-Gm-Message-State: AFuF++lFotDt65uvqwqw+81JmWjfyLiMKFvxLJ20GVvX2VjgFQSr6Mxw
 n+cF4z3XKzT2M6M4xmJUT1Ext3ule6W55GzZvwprOrf9iWCYGOqL0/6sgsx1pO317LkaXZeCfWm
 Iy9deDuf4+09+wqS5Hdyb6wPGhMexQqAbQDOqwhAzKyXd+6pOx1h7cXCZriVJ20JQo6L/nwwuvJ
 2DnytVdonGUp6sQZmEE59YD9wDlv/iRFCgsIt8a8EU6mO5mWuVMVl4n1c=
X-Gm-Gg: AR+sD12ioE49/rXMGwUp1NC3qCIZULlDCg2sGiHW0U8MC+Rzsxui6REa3hVdU0fOwWz
 8FsxlG0j33d2yhWoWBGFLi/03/TkQu6CfcakKuz0CAS+sY93BnjgIMdGEolo0fMvhzthnLawGpf
 cBXus3WG7EPisxr4re7NaYPtFLYpKJt+nUDSdZqHY4j33ezxFQXupuqSMEsoNb1n117VcrPotD8
 lO3EOlyBbMKcIv/6GJe+K3NO+TqSX9mgLvaQgiEjwseTIJA8cu7lPkwunYlGvVNaMP/AqvXpHlh
 IZGzdeYxQUq0Bi/huuMSwgNbZKpIMJXf34coadbVhG1NC3PmRQWZjtcXY18fzEga2W/C1apRwmt
 u3EvgFIa5Q+KCTJA75kl7T3Hbwcjj9hz94ibhkgW7hprlZqTQ3E+/h3ZHRxF1ypBrb1Z27nuUe+
 WZjlvh+1PjAsTvAics1Uleeq3pjqLeVcAFnmJv9hGPvNtl5j+LPODhahHSJxdRR0+ZPUvUfVBd2
 LW+wRqaDb2d0IZRhE+JaXZGNWcBpV3MD+T8NXfg+T9n4XEApPeI1kgDlzqJYNJ0v+93x69b34tx
 0fB001segD/Ypuq6Tpz4fx/H+1W2MeCCDkGnkpvPJ9xQKbGcij4+e6F8VZOFmTQM+Z1jvg==
X-Received: by 2002:a05:622a:4c0f:b0:530:256c:3718 with SMTP id
 d75a77b69052e-53036d5178bmr79887851cf.38.1788366333864; 
 Wed, 02 Sep 2026 09:25:33 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53033247019sm21878631cf.27.2026.09.02.09.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 09:25:33 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/i915/alpm: Keep the extended fast wake ahead of the IO
 buffer wake
Date: Wed,  2 Sep 2026 12:25:31 -0400
Message-ID: <20260902162531.73598-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:11 +0000
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

On display version 20+ the extended fast wake time is programmed in
ALPM_CTL and the IO buffer wake in PSR2_CTL. intel_alpm_compute_params()
derives both from precharge + preamble + PHY wake + tFW exit latency
(42 us here); the IO buffer wake only differs when io_buffer_wake_time
is larger than the precharge, which is not the case on this panel. So
both end up on the same number of scanlines, 11 on this mode.

On the Dell XPS 16 DA16260 (Panther Lake, LG panel with sink OUI
00:22:b9, 3200x2000@120, 4 x 2.7 Gbps, DSC) equal values make every ALPM
link wake fail: the sink sets the Link CRC error bit in
DP_PSR_ERROR_STATUS within ~25 ms of it being cleared, on every wake, for
as long as PSR2 is active. Changing the two fields at runtime shows that
the relation between them matters, not the absolute time:

  fast wake 11 / IO wake 11  -> CRC error on every wake
  fast wake 12 / IO wake 11  -> clean
  fast wake 40 / IO wake 40  -> CRC error on every wake
  fast wake 40 / IO wake 20  -> clean
  fast wake 11 / IO wake 20  -> CRC error on every wake

The fast wake sequence has to start strictly before the IO buffer wake.
With the current values PSR2 on this panel only looked usable because
the constant wake failures kept forcing the sink to resync.

Make fast_wake_lines strictly greater than io_wake_lines on display 20+,
or, when already at the maximum, put the IO buffer wake one line below
it. Use the larger of the two in the vblank and guardband checks, which
so far only looked at the IO buffer wake on display 20+.

This is one of the two machines behind the eDP Panel Replay quirk in
intel_quirks.c (Dell XPS 14 DA14260 / XPS 16 DA16260). The change does
not make Panel Replay or PSR2 selective updates work there on its own:
with the wake fixed the panel still never receives a selective update
(sink 0x200a stays at PSR_STATE only) while the PSR2 engine sits in
SU_STANDBY and consumes the TRANS_PUSH frame change events. That is
reported separately on intel-gfx.

Link: https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealtyinc.ca/
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7521
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7682
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f138376..c244273 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -238,8 +238,29 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 		io_wake_lines = fast_wake_lines = max_wake_lines;
 
 	/* According to Bspec lower limit should be set as 7 lines. */
-	crtc_state->alpm_state.io_wake_lines = max(io_wake_lines, 7);
-	crtc_state->alpm_state.fast_wake_lines = max(fast_wake_lines, 7);
+	io_wake_lines = max(io_wake_lines, 7);
+	fast_wake_lines = max(fast_wake_lines, 7);
+
+	/*
+	 * On display 20+ the extended fast wake sequence programmed in
+	 * ALPM_CTL has to start strictly before the IO buffer wake programmed
+	 * in PSR2_CTL. Both are derived from the same precharge, preamble,
+	 * PHY wake and tFW exit latency above, so they normally end up on the
+	 * same number of lines. With equal values the
+	 * LG panel (sink OUI 00:22:b9) in the Dell XPS 14/16 DA14260/DA16260
+	 * reports a Link CRC error on every link wake. One extra fast wake
+	 * line is enough to fix it; when we are already at the maximum keep
+	 * the IO buffer wake one line below the fast wake instead.
+	 */
+	if (DISPLAY_VER(display) >= 20 && fast_wake_lines <= io_wake_lines) {
+		if (io_wake_lines < max_wake_lines)
+			fast_wake_lines = io_wake_lines + 1;
+		else
+			io_wake_lines = fast_wake_lines - 1;
+	}
+
+	crtc_state->alpm_state.io_wake_lines = io_wake_lines;
+	crtc_state->alpm_state.fast_wake_lines = fast_wake_lines;
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c0933dd..ec80a2e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1443,7 +1443,8 @@ static bool wake_lines_fit_into_vblank(struct intel_dp *intel_dp,
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 					       crtc_state->alpm_state.fast_wake_lines) :
-			crtc_state->alpm_state.io_wake_lines;
+			max(crtc_state->alpm_state.io_wake_lines,
+			    crtc_state->alpm_state.fast_wake_lines);
 
 	/*
 	 * Guardband has not been computed yet, so we conservatively check if the
@@ -4556,7 +4557,8 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 						    crtc_state->alpm_state.fast_wake_lines) :
-			     crtc_state->alpm_state.io_wake_lines;
+			     max(crtc_state->alpm_state.io_wake_lines,
+				 crtc_state->alpm_state.fast_wake_lines);
 	else
 		wake_lines = 0;
 
@@ -4612,7 +4614,8 @@ int intel_psr_min_guardband(struct intel_crtc_state *crtc_state)
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 						    crtc_state->alpm_state.fast_wake_lines) :
-			     crtc_state->alpm_state.io_wake_lines;
+			     max(crtc_state->alpm_state.io_wake_lines,
+				 crtc_state->alpm_state.fast_wake_lines);
 	else
 		return 0;
 
