Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EC606A330
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=cPgiK+np
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44A110FCEF;
	Wed, 25 Nov 2026 14:59:08 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C97F10F640
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:36:59 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-94959217274so501032785a.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534618; x=1796139418;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=F3fUstdnw1R9iAM56oJ0cEix/cakuApF68cHmWXsObA=;
 b=cPgiK+np+KYAcxSCf++8QZrXRDzed8SBpyDwjlQGFR35d9+oJ+IXaAYshZaVQ6s/2w
 qQROnhyYzDjDHkMEVgrf5tgEGBnGxktkaru3JmBlyAN0YBQvT/nXD5RXS/AES76iMHh+
 2vmXU7g66aXmHyx7umEgMc6burdAecsA8rmA25v/cWaR4ywBMr0AcA2qSxrGkyglzObj
 SyUY6y14TTY26Bk52tZ6wkxWXXHWTWzXY5LICM1Z6TNMGbPtv4pUF3AY5O+qlv0TTSFf
 WzhF/KRpFQN5kKTGVbVpblJCQMgaD6cM9HfumhZP3Nzl5rNIeU3XbpyxdjWVGIcRWZVf
 uN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534618; x=1796139418;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F3fUstdnw1R9iAM56oJ0cEix/cakuApF68cHmWXsObA=;
 b=WbGGsYgQ+5PUwSFC5RorR48eB0NN1xbgkIgElrral9i4uP8iTsKnAOTAH2WECxgNsR
 uZCf4bJxwc0SV4wS+xLdhBWefRa/F/3JhP72Rbio9bP82aG8aM0xa2mLAGDqOzQfe8Zb
 mDr2ATrZ0H001dsZxoMKwvjHzxGZUTUMQoktL+A5RqGhgIk5FscM0TnPFCddbX74Zcqa
 w3SVE3xRgq17enhAjlRYUHioORnvND2xM9INfO23v4LoiVxRP394QJqk/JLGp1xbrrJQ
 IaG9wPbH7UjNfZHHGgqH7o9Jv7m+UA7kwnV4KVf8J6sMekJnmLDCK7fT2tvJdO1nm6sY
 dKRg==
X-Gm-Message-State: APuU4Z/X8gpE5HVgBTqfdSEq593AR2O5ToqOX83PpdR9/ZyKy6BcJrHD
 XUZvF+w98IHxv/HfUvRjfpaJx0scGoKADayVXRU4fgAqOlQi9pQCAiIkHyALSb7RdTc=
X-Gm-Gg: AZFdTZdiWN4RBdg7l3kWto57P8qG4yYmuPwj2KQdbtCU0Q7tnzkQXDdni2mbXzLro4i
 nEEpM7sCLG20FPL2+Tjm/AtP6s3ierNnwsT9k2JynYRy18NPvtU3kJkDDnUwN6oUrsvp8W3N/Kr
 LzwA72oRHdVTwV/OEjFjX9l6kGe13IWOWQGYtgt5vwZqJ/JJVCq4OGRkNfPTtLiXXStk5kdQiZ+
 T+Kttb3zdkQidcJpJnLEgBYyEZ0yOskpGV/AXi681C1UOi4Z3rcyRhmwxyxgKQbpx+ZE6fXJ5dH
 l1SKzmSJ1m215mY4HR+4mzB/tlT5Jtgh8SYfGRRKejaFnq8XqUr2PQkaFnY9vXXvMJmHu1NUFcW
 aSrHFhxebAxu5Xx3k6pWrLh6Idje70VC4wlWSodiwzufkXRCoEIU1lHf+Z5v8MTS8alH3gu77IK
 lo0fxxGV9xvK/n6MxoOaQ4TMsRN9EIMyoknLhvCmYRa62Y0ajyOXinGxvAX/pIir5aB+yyStyBQ
 eR9qEcgNIZH4r/xyJNZsGUpd6LKlDI3smawIJE1uUrG/MDL2cpucOOksTWVK1A67JYeuQneyNI7
 kE/BvdUVrEB/p86KRjqbvcM6VZlQDZRBjtxVosuqL5QGmM/ytqCh5SnBG36yVjyIV4jPjkEPA8y
 wWdszAT3yUbC64qLAA7uM8zy+bVyxJcRPViE3CJkRy5p88uFKvJUXQOy0ogmxerll7rbNZddEpU
 dXubN5TvFCdTel7BUVV9bu4Er4UD4n4YhzKglOFLEMuBQgXYwUMmgGc5gB/fObjq9m
X-Received: by 2002:a05:620a:710c:b0:949:673f:72c2 with SMTP id
 af79cd13be357-949baa0d90bmr2625315885a.53.1795534618332; 
 Tue, 24 Nov 2026 07:36:58 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:36:57 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP in
 PR Active
Date: Tue, 24 Nov 2026 10:36:52 -0500
Message-ID: <4801e395b4ec582fd9b1bc80585c556349ffb663.1795527921.git.j@metarealtyinc.ca>
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

Add intel_alpm_pr_as_sdp_in_active_disable() to set or clear
PR_ALPM_CTL[AS SDP Transmission in Active Disable] without touching the
other PR_ALPM_CTL fields. PSR code uses it in the next patch to send the
AS SDP in PR Active while frames are being updated.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f54b29e19..24f1dce72 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -511,6 +511,26 @@ void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+/**
+ * intel_alpm_pr_as_sdp_in_active_disable - suspend or send the AS SDP in PR Active
+ * @intel_dp: Intel DP struct
+ * @disable: true to suspend the AS SDP in PR Active, false to keep sending it
+ *
+ * Set or clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] and leave
+ * the other PR_ALPM_CTL fields as they are.
+ */
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    bool disable)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	mutex_lock(&intel_dp->alpm.lock);
+	intel_de_rmw(display, PR_ALPM_CTL(display, intel_dp->alpm.transcoder),
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
+		     disable ? PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE : 0);
+	mutex_unlock(&intel_dp->alpm.lock);
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index f8f605d94..6ce583d32 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -37,6 +37,8 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    bool disable);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

