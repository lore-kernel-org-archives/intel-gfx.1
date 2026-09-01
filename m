Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59FFC624D3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 13:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260D610F1D3;
	Wed,  2 Sep 2026 13:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="jCZmRtUK";
	dkim-atps=neutral
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6ED510EF29
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 21:00:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-92e50a650a0so37658485a.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 01 Sep 2026 14:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788296400;
 x=1788901200; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
 b=jCZmRtUKFTL00dPJ0x0K/ivKTaafbAkRiyAkKBpOftRV0ehXO/xAGVeTuxha75F2V7
 rdsA1IJrkMxDMNnabF6nI5bbB51eaeosCWyfhvpzwXBVifwNK/T9HRhfQk2BdEda/LJk
 smj6TP+TUxb05EjzKXBOHaOPVOUPJFUe8Vgv3F+IAgqzyUijI15qrK3Kx+Jz4eX+6WVI
 ETvOco4RnPVEAycL2EqyJaA2z4jVji2nmSqoEyVib62TRkfaqS96WQWCc2DEg1a0hZxo
 d/NO+kMj6yp2HzXKl5IYrHO3vUDnIFp4lx0XwxbM3xvWAUgG2Ra/tTTIZr3HRIKhY9Gw
 zn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788296400; x=1788901200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
 b=I0bcPlwk4wYsNYEKeuV+9wrRK+N3CexR8IAGufSAb+gQooI/fG5JQ0rN2lPuzgYk5c
 Ulr6dGo5I6/jTqvUuoLWtcZNs4nErPtrg3kiHNVGRfpYeVUsNocNQcPOg5stWZBumvQS
 wkixdLF0iIwmmXKnVjq0tA1hXdWsKGWAc6djh5pxEYOVQberapvjDojgavZ/IzMQMMQv
 e4Xo+DOTzF2U1zzfDw6zKmBM09K4grhKspkEHb4MAT0KpjJxJQ2KCWL0w4Jv7AusZRSD
 t6x4hXfiYpjXznnT5cKe1j/pzIiDldHDZrLRZkSKnYjt2oNUvOplCT0rsGE80fTFnc0b
 cn1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoP1cSsqoBq3nDsWC58hx8Fgu6VyDVepoOIHZFej3dn3rPqyj0Ew4tQVpBBZmTQvtoGE/ACg49tgJg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++k4e5HQv989uiMTQFPSapdZDn/qJMFg1m5Pf/pmJlJdTX00qdsp
 ydNQ41uEh2AA19cjgRLOKI5RqR+muQXWxiQUiPI8kqSiI2XIiJfNDce+KbdnKMRl6rg=
X-Gm-Gg: AR+sD130GgfJiXLdnkF7YDERiQg2kyRZyLfaqPtkC5biR6IB5ezEgs6k/B9ZtiB/yEZ
 rxFR9vZL/sswHl4HNn4pQxPujs4SrhTVK+pj1C+G2KQzzXsN/4ZsLAEwwQ18qQmWJ3eU293ugsA
 hRmFnL/bb4iYN4xZdSYVMbgfTYhaWXrH++Y5Ozsag8EWB7lI5JRO4mfvId9Ib3yg5n/4HWoBwjR
 RxXxHDFwUXWGDC0WcYZ600gboDN4UYEOfrfN+tARfpEwlEH2DieAkkHGrIK6hqiqRH7AHzOytfv
 o5FwwMGP/t+WnbAcAA8T39H+2XUB9a/xTmGqEV49NmOapzf5gWV2W5NdLDzWjEbun6Sdfv0/hrz
 xixHFnqz+oXt6nxpEKMNAxg7fdJsU30ZMT8hNqZPPH9w99Nqa0ov2mmhk0d2AO/ZtEIQqt4JGQt
 8rXWo1Q5XttCmZgYPgVCRdK6keA8OBDc5HSXsMCndHL3JvZu6ZerKGY8TDkq4HDg4ngMBG+ERXZ
 xIFesGDC23WgTWGlnkFZk5aq+xUkpgSEw67bFbliw74IbSBrEK0tARYU598onHVHrXfftL+tTEi
 ikYEcQe+YlL1+Bi7O6WA5yrmfNP3IFAHWFYIU/NHDlFaDK1NGpyxCg4N8s0ZTlD3CntR
X-Received: by 2002:a05:620a:72c3:10b0:92e:bc28:5479 with SMTP id
 af79cd13be357-93960cafc51mr14525185a.2.1788296399612; 
 Tue, 01 Sep 2026 13:59:59 -0700 (PDT)
Received: from jake-laptop ([153.67.1.208]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f1aba80sm33533585a.20.2026.09.01.13.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 13:59:58 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jouni.hogander@intel.com, mika.kahola@intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/psr: clear the Panel Replay error status register
Date: Tue,  1 Sep 2026 16:59:56 -0400
Message-ID: <20260901205956.130779-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901203633.92628-1-j@metarealtyinc.ca>
References: <20260901203633.92628-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Sep 2026 13:10:12 +0000
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

psr_get_status_and_error_status() selects the DPCD offset to read the error
status from based on whether Panel Replay is enabled:

	offset = intel_dp->psr.panel_replay_enabled ?
		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;

but intel_psr_short_pulse() acknowledges it unconditionally to the PSR
register. Under Panel Replay the error is therefore read from
DP_PANEL_REPLAY_ERROR_STATUS (0x2020) and the acknowledgement written to
DP_PSR_ERROR_STATUS (0x2006). DP_PANEL_REPLAY_ERROR_STATUS is never written
anywhere in the tree; it appears only in the read above and in its own #define.

The sink's Panel Replay error latch can consequently never be cleared. Once it
latches, every subsequent short pulse re-reads the same errors, so PSR is
disabled with sink_not_reliable set permanently, and until a short pulse
arrives the driver keeps Panel Replay enabled while the sink is reporting
errors it cannot see.

Observed on a Dell XPS 16 DA16260 (Panther Lake, Arc B390, display version
30.00) with the eDP Panel Replay quirk from commit cb8d155b0806 removed
locally so the feature could be exercised. The sink reports a persistently
latched error:

	Sink PANEL-REPLAY status: 0x2 [active, display from RFB]
	Sink PANEL-REPLAY error status: 0x1:
		PANEL-REPLAY Link CRC error

which survives across reads indefinitely, while dmesg stays silent and Panel
Replay Selective Update remains enabled.

Use the same conditional offset when clearing. psr->panel_replay_enabled
cannot be used at that point because intel_psr_disable_locked() clears it
earlier in the same function whenever an error was detected, which is exactly
the case that needs the Panel Replay offset, so save it beforehand.

v2: use a copy of panel_replay_enabled taken before
    intel_psr_disable_locked() clears it. In v1 the condition was evaluated
    after the disable, so it selected DP_PSR_ERROR_STATUS in the error path
    and the patch was a no-op there. Caught by Sashiko AI review.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3840,6 +3840,7 @@
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_psr *psr = &intel_dp->psr;
 	u8 status, error_status;
+	bool panel_replay_enabled;
 	const u8 errors = DP_PSR_RFB_STORAGE_ERROR |
 			  DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
 			  DP_PSR_LINK_CRC_ERROR;
@@ -3860,6 +3861,12 @@
 		goto exit;
 	}
 
+	/*
+	 * Save this before intel_psr_disable_locked() clears it; the error
+	 * status is acknowledged to a different DPCD address depending on it.
+	 */
+	panel_replay_enabled = psr->panel_replay_enabled;
+
 	if ((!psr->panel_replay_enabled && status == DP_PSR_SINK_INTERNAL_ERROR) ||
 	    (error_status & errors)) {
 		intel_psr_disable_locked(intel_dp);
@@ -3885,7 +3892,10 @@
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
+	drm_dp_dpcd_writeb(&intel_dp->aux,
+			   panel_replay_enabled ?
+			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			   error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
