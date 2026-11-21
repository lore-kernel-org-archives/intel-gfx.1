Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7496606A333
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=By/f/+j1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665BE10EEBE;
	Mon, 23 Nov 2026 15:17:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA010E9A9
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:55 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-930c0f9c1b1so197910885a.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263955; x=1795868755;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pbpRr+2ryo5edvUo2p1ilxCl28GiReMUUvndavjAz4s=;
 b=By/f/+j1jv3prYqds0Z8iY1p3HYLZROv4BSAczjKWVJ77ppgPAzU6BqmFusfMY71VD
 1vz1yWrcy/pQl17gz0Ph3IpDJZTd4S8fQJR5rehrkm2WL+Gg5zU/JRatRbYLHG0QfC/1
 GAa5fX/OXxh4pA4LDqtnk2eWLJtyAwJSIpyjDcYjhHq47/5r56EZv8h0/4JdtE0PFdHX
 dt3uAsAVwHnB+f6tqlcK2AculCLf6+1yE2gfcswU2SnELo+aaNAzrU57Icfkl1kk6mLA
 nIK1WwoaYDqw01hRZyaWCxxFgQZP4OY0Im2vpx/ozlM9XMkGrH8ocxn+j5nGaXSaUXCY
 utzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263955; x=1795868755;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pbpRr+2ryo5edvUo2p1ilxCl28GiReMUUvndavjAz4s=;
 b=YTKfhop/LqAkEfLzWOJ+gdBQkW76At4j+HT2ZSpP4lxYVJbWQg3yr00/8yD4temQJ/
 DOOMoOFSPOUyFVJIl4M1ytXsRsShZFISRO0ZkWRB+ar5hBQzNOJVJcOifd45TZqwWkJh
 G142zNZ/2BC7kyjzyLKQbASp1fV43I2ozBMzT3iItT8+sSYIcGEJaGEdMfaV5wv8qF2d
 iBpM4DWDrCf8Mo2svHVWPs6qybbv9OBEaf96WrGBniyab5MW9SUaJ9gC2Uw3KxX8zRXy
 fBRy3jq/0eCTDwdGBPTbJsZhRXU3mxzZ36b8VpwKOc3vOOKxH0rd7xcPjUCLS55qbZ1F
 h19g==
X-Gm-Message-State: APuU4Z88cYn9th8Vm1VcwKHuXYhA9H/ov6MiNn2x7OVLI6Alkt3MKVet
 Dr612L6Nh//EhPhGeu+YBt6I45afQGEhDXWHtII0on9oGFlnuoisXRnKPO/sgh3Kmmk=
X-Gm-Gg: AZFdTZewKmccH6/d+HgFxGm2XeAqyR0LK7NObC2Nsoca6MhjLJtrMjvCKD4R2ZI/PTj
 OVxYsv4b0QCFwtOTlF/5J8Qe4Sb8JwHgGXXH+RIXMNAq8QTkowq5qSxHbQVNrqxBf9szixyjQ0u
 Fuu+zdKJ4EKW7fGHt/xB0mP/vV1my574Lc+3RRKQcxFBDM5KpdCfmRg/PqH2+986z5B7/XwU8ig
 ozvhoMj9KkUPCGL4afV9dZx2LIxFO4XcpEE1X7+MS9pk6UyRK6mBaN1BPK1lhbf9WboCNnuXgVI
 5l2dViB0fHjJvE4zkLB/lUV1BA6rtwF8quZNX/rU4c+C31tePK+M5QOBIKOky+BJErCTFYf4zXQ
 S5Q0dAZrJLO/YaLxD0Wu4Z1+TJ/8TLcu9/iEgB9M/0Z62O+26HPIqSny801p/39LdEkdOiVB8bg
 XP0bguA95+N9oM4Q7xkSVlp2UowzyM35Gc194VCNkVohFEGmcnG2C7mWVixLvfeHNXOlMaPJvI0
 T5mkwOuN4VukOfBcRetp0UqUFeasuW7QugxNFxeXtWj2qc7ofXxcJIiFhru/XqpzsnE7m3z0MA5
 Q6xHdgi3oHrHaPrsrAHl78k6U3vXJFUlOkMwTcU1FlW2ouue/j97IgI6KZcULLVu3X5cDUTd1uY
 u1iknVfo+4qs/rILEZFhajiSRqPhJ01Zz3aUpA8jE4hLT687tz8puDhlEkVeCosAt/1h+JDRo88
 RZZ5CeSfpCkoKcyzDuG/pkrfgJ1Z5rFdHE+D9U3hWQ8+NXiJq4muzDxqqYYIjCUVObMD8eL7225
 Tk2aUyo
X-Received: by 2002:a05:620a:29c8:b0:949:6fd4:3552 with SMTP id
 af79cd13be357-949baa0b570mr952702885a.34.1795263954662; 
 Sat, 21 Nov 2026 04:25:54 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:54 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP in
 PR Active
Date: Sat, 21 Nov 2026 07:25:47 -0500
Message-ID: <3ab45d0e8c1bded51e0dadd71fd5b3fa0a1cad9e.1795263689.git.j@metarealtyinc.ca>
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

Add intel_alpm_pr_as_sdp_in_active_disable() to set or clear
PR_ALPM_CTL[AS SDP Transmission in Active Disable] without touching the
other PR_ALPM_CTL fields. PSR code uses it in the next patch to send the
AS SDP in PR Active while frames are being updated.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f54b29e19..910067d27 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -511,6 +511,28 @@ void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+/**
+ * intel_alpm_pr_as_sdp_in_active_disable - suspend or send the AS SDP in PR Active
+ * @intel_dp: Intel DP struct
+ * @cpu_transcoder: transcoder Panel Replay is enabled on
+ * @disable: true to suspend the AS SDP in PR Active, false to keep sending it
+ *
+ * Set or clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] and leave
+ * the other PR_ALPM_CTL fields as they are.
+ */
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    enum transcoder cpu_transcoder,
+					    bool disable)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	mutex_lock(&intel_dp->alpm.lock);
+	intel_de_rmw(display, PR_ALPM_CTL(display, cpu_transcoder),
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
+		     disable ? PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE : 0);
+	mutex_unlock(&intel_dp->alpm.lock);
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index f8f605d94..a45ddd04f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -14,6 +14,7 @@ struct drm_connector_state;
 struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
+enum transcoder;
 
 void intel_alpm_init(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -37,6 +38,9 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    enum transcoder cpu_transcoder,
+					    bool disable);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

