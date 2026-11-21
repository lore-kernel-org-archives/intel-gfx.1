Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30D5606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=ET2Gx8SH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DAD10EEF6;
	Mon, 23 Nov 2026 15:17:59 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC910E99C
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:57 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-93f20c3aaa5so171377285a.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263956; x=1795868756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tcZXZrs3ZFR6YeXPhB828injGk6+cM/kVYYXx9ZN/FU=;
 b=ET2Gx8SHR7uUAOLLu2kfnQwQQWs/vXtWSwHFdWwTm8b3eZG41iFzo6B0zy1UAN3f/I
 RM89Md67DpEXf3UWwbGm2bkkCnE5R7fWwzP/hSih6VQfrLOx7IvgocupYGbmypD/YKSN
 p2nteE1kTsj3tSMhsqMD2BTTAlAu+wzEEz7ZFIbfOheY/9S9H7rve/+6rh+rB1IqujUT
 GKg2omzocW3ZHZh2xEvPwWW77D6DlFbFlsv0qQazhrZdZYbJHjvTWe4tBxFxoiTuPmWp
 1XX2LP5BQL4SgNTjTkiK1NF3e5dzi9ZuBLMUQz7WcRbBBJPh3paApHyjYCJQob1XkLIz
 o3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263956; x=1795868756;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tcZXZrs3ZFR6YeXPhB828injGk6+cM/kVYYXx9ZN/FU=;
 b=FqzWmo8fLRFibJeYeG9CRKIlU5hehysCH2RWNc+e+ymto/SMClqudurQP82eRi5PWx
 2dZbtnO26DdACoJOEWGltHzPBfMLDdC6qMOJBVqWw9DXPHUHx9LkmTM+G/e/HacHdLpI
 CGP9cPSyOIo97IUPp+G5rG407muffwiy1aQoQjlnyCV6qY9ogz3OFHXuO1DGiv1CXmtN
 KBDzVRfKl6p2BWN6dhulNd95OlK22t0aTA94UGgqdaR7gHhwU9o6i+4553Jm3d0qWuSa
 mHzOOcKjOVz2NalpwTeHpPbcvyV4pL62XZg6ahu5HXxyuTPQOG9CKv0jmI5vn/psrFbr
 OzSg==
X-Gm-Message-State: APuU4Z8upKrdJEUggV5xaWjikoQMwyBkTSMP0RzMn9oM8Z6FRGI39yY5
 aqqcuakjKY0cNHyPCWSzsvPEyVrUuBY1gktI86fRVK/N0wdWuXijXomaTWQea88DGKSvEKFTvvI
 wK50uxKKq3w==
X-Gm-Gg: AZFdTZfoGdcfdfkgSEkBDnl+cyrGfiUbmCvvVc+8vZuDdWKzbd7oiGqI0YXBxYoptxd
 3lLyqDfqP2rkZ1FkZ0/PbAN/xOY7IwMWQOEBGaQhf2u2qUK96MfO3IYKEyjcKjU2O7xZY3lg9cd
 bkW8LBL85q14cHyMWsCsw2l2yPbnbW0AcAoIJLHriM1WXw+4+JNmu/NJvce0t+B1oFT44gfZxdi
 TqfaAAJhnB70jqaohjo4TLk9VA/u9iJLudbkYDDz6afEUPwEKwRnnq3yJG3mRT0s662GTC5XIit
 PMEQf+tl9+IlF7ieyK8hbNFosULfILrLoDvLoGn0MwPB6SZKCqfWhpt4Iaimyu9RcfioyYY8oyB
 y3c7hockrcTqk5w6s6vshCUKrf60I2l9IEygdUWUPkuRaR3Saiw9KW7TDU3hPxpvRB/JEMIQjRV
 SGU7eCJUB5kduu4e2ZFgWtIbSh38fFyYVUuROYci+TlTLJ/9bD4I0quBzKdh/1zJwjFr1rBuUAA
 sOL2/rYjEZmB6qVnO8EBh7pmNnNBrczzjwKEXQ6s8lV1oyrF2rYsu4A7kiVmAUqfVtUBXzmT2V5
 87VD1ru3dm/lebdajKH0XXMTn8CTLZq4g6rPNXHEEhEXGUjZXLDuyDEjZcX8UAIUZoRRWneqKZo
 gsuIEz6Y4B8vVt5CSjibvIzSVWViC1fdNicwhycmqbas1GYWFAIjgIsfZtDORXrd6Io9c4iNlat
 E99/tJY9w5Y2Vr3vxUzo4IutbPRH5S/CJHSEtaNIstahEX8m/Ow1camGvq6VubuKTCtGwJTJA5x
 jfuHFBC
X-Received: by 2002:a05:620a:410c:b0:949:aa6d:8244 with SMTP id
 af79cd13be357-949ba9b7e65mr944597285a.27.1795263956102; 
 Sat, 21 Nov 2026 04:25:56 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:55 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 2/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Date: Sat, 21 Nov 2026 07:25:48 -0500
Message-ID: <ada2073fc66fa74685b73ac085513c5299b1526f.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:58 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sinks that support async video timing in PR get the AS SDP suspended in
PR Active (disable_as_sdp_when_pr_active). The LG panel in the Dell XPS
16 DA16260 (sink OUI 00:22:b9) then judders while frames are updating,
with the source flipping at a steady 8.33 ms. Leaving the AS SDP on
fixes it but blocks DC5/DC6.

Clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] on a frontbuffer
flush (flips, cursor updates and frontbuffer rendering) and set it again
from a delayed work once there has been no flush for 6 frames, the same
idle time DC3CO and DC5/DC6 use.

disable_as_sdp_when_pr_active is now computed after the AS SDP config
and is only set when the AS SDP is actually sent, ALPM AUX-less is used
and AS SDP skip frames is not.

Fixes: d6a8336c5f06 ("drm/i915/alpm: Write PR_ALPM_CTL register")
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 90 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
 4 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d2916..991d3a2fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1823,6 +1823,11 @@ struct intel_psr {
 	bool dc3co_allowed;
 	/* DC3CO disable work */
 	struct delayed_work dc3co_work;
+	/* AS SDP in PR Active is sent while frames are being updated */
+	bool disable_as_sdp_when_pr_active;
+	bool as_sdp_in_active;
+	unsigned long as_sdp_idle_delay;
+	struct delayed_work as_sdp_work;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797..7b8a8c3a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3830,6 +3830,7 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
+	intel_psr_compute_as_sdp_config(intel_dp, pipe_config);
 	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd1656360..8407b34f2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1704,10 +1704,38 @@ static inline bool compute_link_off_after_as_sdp_when_pr_active(struct intel_con
 		DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP);
 }
 
-static inline bool compute_disable_as_sdp_when_pr_active(struct intel_connector *connector)
+static bool compute_disable_as_sdp_when_pr_active(struct intel_dp *intel_dp,
+						  const struct intel_crtc_state *crtc_state)
 {
-	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
-		 DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const u8 *pr_dpcd = connector->dp.panel_replay_caps.dpcd;
+
+	if (pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
+	    DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR)
+		return false;
+
+	/* AS SDP skip frames needs the AS SDP to keep flowing in PR Active */
+	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
+		return false;
+
+	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
+		(crtc_state->infoframes.enable &
+		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC));
+}
+
+/**
+ * intel_psr_compute_as_sdp_config - compute whether the AS SDP is suspended in PR Active
+ * @intel_dp: Intel DP struct
+ * @crtc_state: crtc state
+ *
+ * Must be called after the AS SDP infoframe has been computed.
+ */
+void intel_psr_compute_as_sdp_config(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state)
+{
+	crtc_state->disable_as_sdp_when_pr_active =
+		crtc_state->has_panel_replay &&
+		compute_disable_as_sdp_when_pr_active(intel_dp, crtc_state);
 }
 
 static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
@@ -1745,7 +1773,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	}
 
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
-	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
@@ -2183,6 +2210,47 @@ static bool psr_interrupt_error_check(struct intel_dp *intel_dp)
 	return true;
 }
 
+/*
+ * Sinks that support async video timing in PR get the AS SDP suspended in PR
+ * Active. Some of them then drift out of phase with the source and judder
+ * while frames are being updated. Send the AS SDP in PR Active from the first
+ * frame update and suspend it again once the display has been idle for
+ * as_sdp_idle_delay. DC5/DC6 needs the same number of idle frames, so little
+ * DC5/DC6 residency is lost.
+ */
+static void intel_psr_pr_as_sdp_suspend_work(struct work_struct *work)
+{
+	struct intel_dp *intel_dp =
+		container_of(work, typeof(*intel_dp), psr.as_sdp_work.work);
+
+	mutex_lock(&intel_dp->psr.lock);
+	if (intel_dp->psr.enabled && intel_dp->psr.as_sdp_in_active) {
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       true);
+		intel_dp->psr.as_sdp_in_active = false;
+	}
+	mutex_unlock(&intel_dp->psr.lock);
+}
+
+static void intel_psr_pr_as_sdp_flush_locked(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	lockdep_assert_held(&intel_dp->psr.lock);
+
+	if (!intel_dp->psr.disable_as_sdp_when_pr_active)
+		return;
+
+	if (!intel_dp->psr.as_sdp_in_active) {
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       false);
+		intel_dp->psr.as_sdp_in_active = true;
+	}
+
+	mod_delayed_work(display->wq.unordered, &intel_dp->psr.as_sdp_work,
+			 intel_dp->psr.as_sdp_idle_delay);
+}
+
 static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -2201,6 +2269,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	/* DC5/DC6 requires at least 6 idle frames */
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
 	intel_dp->psr.dc3co_exit_delay = val;
+	intel_dp->psr.as_sdp_idle_delay = val;
 	intel_dp->psr.psr2_sel_fetch_enabled = crtc_state->enable_psr2_sel_fetch;
 	intel_dp->psr.su_region_et_enabled = crtc_state->enable_psr2_su_region_et;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
@@ -2211,6 +2280,9 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.io_wake_lines = crtc_state->alpm_state.io_wake_lines;
 	intel_dp->psr.fast_wake_lines = crtc_state->alpm_state.fast_wake_lines;
 	intel_dp->psr.entry_setup_frames = crtc_state->entry_setup_frames;
+	intel_dp->psr.disable_as_sdp_when_pr_active =
+		crtc_state->disable_as_sdp_when_pr_active;
+	intel_dp->psr.as_sdp_in_active = false;
 
 	if (!psr_interrupt_error_check(intel_dp))
 		return;
@@ -2243,6 +2315,10 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.enabled = true;
 	intel_dp->psr.pause_counter = 0;
 
+	if (intel_dp->psr.disable_as_sdp_when_pr_active)
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       true);
+
 	/*
 	 * Link_ok is sticky and set here on PSR enable. We can assume link
 	 * training is complete as we never continue to PSR enable with
@@ -2419,6 +2495,8 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.pipe_mask = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
+	cancel_delayed_work(&intel_dp->psr.as_sdp_work);
+	intel_dp->psr.as_sdp_in_active = false;
 }
 
 /**
@@ -2449,6 +2527,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 	mutex_unlock(&intel_dp->psr.lock);
 	cancel_work_sync(&intel_dp->psr.work);
 	cancel_delayed_work_sync(&intel_dp->psr.dc3co_work);
+	cancel_delayed_work_sync(&intel_dp->psr.as_sdp_work);
 }
 
 /**
@@ -3853,6 +3932,8 @@ void intel_psr_flush(struct intel_display *display,
 
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
+		intel_psr_pr_as_sdp_flush_locked(intel_dp);
+
 		if (intel_dp->psr.pause_counter)
 			goto rearm;
 
@@ -3931,6 +4012,7 @@ void intel_psr_init(struct intel_dp *intel_dp)
 
 	INIT_WORK(&intel_dp->psr.work, intel_psr_work);
 	INIT_DELAYED_WORK(&intel_dp->psr.dc3co_work, psr2_dc3co_disable_work);
+	INIT_DELAYED_WORK(&intel_dp->psr.as_sdp_work, intel_psr_pr_as_sdp_suspend_work);
 	mutex_init(&intel_dp->psr.lock);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index d545fdaa0..ddeccb3a9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -80,6 +80,8 @@ int intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state)
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+void intel_psr_compute_as_sdp_config(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

