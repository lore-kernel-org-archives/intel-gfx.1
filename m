Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14E5606A329
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=cbvvM3Wb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3735C10FCE2;
	Wed, 25 Nov 2026 14:59:03 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316A610F661
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:37:02 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-92107df3f13so45747876d6.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534621; x=1796139421;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AcV4KUkU07rop7Py3BmlaFLMHEgbzvYTaf4xrz15nHA=;
 b=cbvvM3Wbgm9Lh9gK1r0lTZ+c1n4gkqH5rCf6rlv4FeVF2Ogaecu86y99bjhLc3VLnn
 tvwv5diFMojSCBozPt2NZxXWqg2EJs6VM8gvA27NoeMSU3UKnhv2kaH3mYQpq31KKj+g
 Se7rmgXL0QZm0AXSqdEggvODp7dv5ksCCH7ccNTCj7KuY3TudKBy60c/alh8fbXnSs8m
 4IABY7ZcapV+lmNeKV0zARPr0HHj8HRID6ak0AQwjQaS7sC69KksjkbtA4eVoFS4iQ5U
 Z4454IiwIVCTwKO5oMD2PGBknXqBGkA6ExoStKDT7xIuCyhKSO9ljaU7cWJuI1UvMub3
 gvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534621; x=1796139421;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AcV4KUkU07rop7Py3BmlaFLMHEgbzvYTaf4xrz15nHA=;
 b=cK5kP8kpkibA7qhd6j1xGcmvXvSEUpZgla3YqPapmtLJhAeqvc+Ek+aa/JeaayB+6L
 Q9/nYIsa/zAppCPFZCCC//I7OgKkVU9z4gy4rIO4cqOFJhqGOU1WXV9dcz3HrOL18d19
 U3O6OJrHQJqIMw0Cgx3SD1MQl9w7Fi8ZApJSqSi7NJBd0E0GHatLCOWyDRmADkXf8gfe
 TvgYjUJb9Ztr02zxalLcdZSOw2r5HxPivZSfMmJpiOws12CX3McGubHR2vdIfhoE9XTP
 lpey9DSyGqOMDMd0UpkfEm3K88ZKwGI5OQKsqVs8TcviOxZYlMRBdFtHyvhb6q6d5lcU
 31bw==
X-Gm-Message-State: APuU4Z8p443z4cm8qV/vpl60r4dj2oEechZLm7JPLAlRvd4b6KGQyHGZ
 gxVmrYhmGjxJItLaIH4zCBWUoSP/8sBIb8kIyV0jqziA2ddjhRkOUS7SeOL0xMgSbmQ=
X-Gm-Gg: AZFdTZdD9LWGXy0t56G1LG0a89Qe/Ww7IQ8dVqdrNEnEbhA4Tc8zRDpeFY/BTszizUc
 +MQ0LCJl7HmiFdGHLGuWp/pxfvqzveKpFLz92iBgITnVpgyapXJgSOklg6/FuYHGk81aChzTtFL
 F8xqPuZw3HkYacB788Gr/YnGagHg+3viilNXI8tNHsnFd1lOUNQ/8xwKvqxfgRyQcm0nMyovHRt
 crm9/N6ySPWzEVAdJrNjHDL/p3PBMTVjC0pMGhNRWd5uFAPQTb2z+MOy1lvCzsH6KRol1ha5IkN
 1RFBXMXSmshtf2tscOBxbJRDdgyGu8NB/MR7L3gCQq6+rBKpuxRYQI30v3ZL9xBvlykBliY2b4z
 krKU8ix8UFinrVlLgzjVSHyfda/wTknkiuBK5FWZEzUAfTHxkhg3dhPyzS7SK9R+c24qYzyRI6E
 dnJsQgDxtG2I9kHZCBCfB+8WqogV4mU61ikDy7Ewm9vMewmZRUGvg520jlK/l/yzUOpGJ/Oh4EA
 jHMY+yRfJNsurJh+6qDffWrRqZ62ZQqUuVCB2rtLVyk9K9OJS7Z2uFF6K/JJuknTY6WCNPoMxl6
 l9VEZtuSHWVgRxp1qTajrf9odo4h7MO90TG7ztUpRIw4k6fno2+NUXkRYlSD4ZvAP6MQiReNvb2
 WGegywi0bfo31LNnAV3pU0VTGXYYDfsHswX2ZWCWxqcM/t5W+pC7cwSNqGHSRNbxymJMK0EwUdK
 L+pJRLZnv98rKrQGjz1/9h768wT3vw4FfneewScwx4KMgz5pq9ziNl7lZaz04d3Dyo
X-Received: by 2002:a05:620a:1729:b0:948:48b8:6738 with SMTP id
 af79cd13be357-949ba823b91mr2481812785a.7.1795534620778; 
 Tue, 24 Nov 2026 07:37:00 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:37:00 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 3/4] drm/i915/alpm: Leave AS SDP Transmission in Active
 Disable to PSR code
Date: Tue, 24 Nov 2026 10:36:54 -0500
Message-ID: <95100661ae88bc344a7217ddda1e24c9a769fea5.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795527921.git.j@metarealtyinc.ca>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
 <cover.1795527921.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:59:02 +0000
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

PSR code now sets and clears PR_ALPM_CTL[AS SDP Transmission in Active
Disable] around frame updates. Stop setting it in
intel_alpm_configure_pr_as_sdp(), so that a seamless VRR toggle no longer
suspends the AS SDP while frames are being updated.

A seamless VRR toggle can also change whether periodic AS SDP is used and
with it whether the AS SDP is suspended in PR Active. Route the toggle
through PSR code so the latched setting, the idle work and PR_ALPM_CTL
are updated together under psr.lock, and the idle work cannot set the
bit while periodic AS SDP is programmed.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 24 +++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c  | 36 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr.h  |  2 ++
 4 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 24f1dce72..454654a5c 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -438,6 +438,8 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
  * bits. This is a full recompute of those fields (the base value is built from
  * scratch, not read back), so it can be called both at PR enable time and when
  * VRR is toggled seamlessly - which changes whether periodic AS SDP is used.
+ * AS SDP Transmission in Active Disable is left clear here, PSR code sets it
+ * once the display is idle.
  *
  * Caller must hold intel_dp->alpm.lock.
  */
@@ -467,9 +469,6 @@ static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
 	} else {
 		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
 
-		if (crtc_state->disable_as_sdp_when_pr_active)
-			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
-
 		if (intel_display_power_dc3co_allowed(display))
 			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
 	}
@@ -505,12 +504,25 @@ void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
 		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
 			continue;
 
-		mutex_lock(&intel_dp->alpm.lock);
-		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
-		mutex_unlock(&intel_dp->alpm.lock);
+		intel_psr_pr_as_sdp_update(intel_dp, crtc_state);
 	}
 }
 
+/**
+ * intel_alpm_pr_as_sdp_configure - program the AS SDP portion of PR_ALPM_CTL
+ * @intel_dp: Intel DP struct
+ * @crtc_state: CRTC state
+ *
+ * Locked wrapper of intel_alpm_configure_pr_as_sdp() for PSR code.
+ */
+void intel_alpm_pr_as_sdp_configure(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state)
+{
+	mutex_lock(&intel_dp->alpm.lock);
+	intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
+	mutex_unlock(&intel_dp->alpm.lock);
+}
+
 /**
  * intel_alpm_pr_as_sdp_in_active_disable - suspend or send the AS SDP in PR Active
  * @intel_dp: Intel DP struct
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 6ce583d32..831de0514 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -37,6 +37,8 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_configure(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
 					    bool disable);
 void intel_alpm_disable(struct intel_dp *intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 62cda4365..04003a96b 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2234,6 +2234,42 @@ static void intel_psr_pr_as_sdp_flush_locked(struct intel_dp *intel_dp)
 			 intel_dp->psr.as_sdp_idle_delay);
 }
 
+/**
+ * intel_psr_pr_as_sdp_update - reprogram the AS SDP on a seamless VRR toggle
+ * @intel_dp: Intel DP
+ * @crtc_state: new CRTC state
+ *
+ * A seamless VRR toggle can change whether periodic AS SDP is used, and with
+ * it whether the AS SDP is suspended in PR Active between frame updates.
+ * Latch the new setting under psr.lock together with the PR_ALPM_CTL update,
+ * so the idle work cannot set AS SDP Transmission in Active Disable while
+ * periodic AS SDP is programmed.
+ */
+void intel_psr_pr_as_sdp_update(struct intel_dp *intel_dp,
+				const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	mutex_lock(&intel_dp->psr.lock);
+
+	if (intel_dp->psr.enabled) {
+		intel_dp->psr.disable_as_sdp_when_pr_active =
+			crtc_state->disable_as_sdp_when_pr_active;
+		intel_dp->psr.as_sdp_in_active = false;
+		cancel_delayed_work(&intel_dp->psr.as_sdp_work);
+	}
+
+	intel_alpm_pr_as_sdp_configure(intel_dp, crtc_state);
+
+	if (intel_dp->psr.enabled && intel_dp->psr.disable_as_sdp_when_pr_active) {
+		intel_dp->psr.as_sdp_in_active = true;
+		mod_delayed_work(display->wq.unordered, &intel_dp->psr.as_sdp_work,
+				 intel_dp->psr.as_sdp_idle_delay);
+	}
+
+	mutex_unlock(&intel_dp->psr.lock);
+}
+
 static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index d545fdaa0..56f2260be 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -80,6 +80,8 @@ int intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state)
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+void intel_psr_pr_as_sdp_update(struct intel_dp *intel_dp,
+				const struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

