Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20338C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA59160F12
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA59160F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6866ECF5;
	Mon, 13 Sep 2021 17:58:43 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752D6ECF0
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:39 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id w78so11508644qkb.4
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WixXNmtyoiXEy7RQ0nNgxkRw7PoZo3ZaXRRkl9iKMJ8=;
 b=I/UaVMecvcM+k2gT3PjP5wddh3bQ8UHcCogsdvqPwDESDz4vXOPqouC4J/HswClhM1
 d7VgageqVVw3F3yoX/VwRZNgqjxZY/xi1KQEMLbtZjrdHveFiOLos5RX3OL6cA70PeI4
 xmE3pojIcPkkFl7sb7HHWcV+8TYFPvS8F7rpM+W0FNBRc8c8XX2Zd2JVn2UptM3NJu4N
 kOihGA+pf8REnoqXEWNfEbVwrrLN7R4dy824jeTyjdiLsHkupY6x97PAv7aTClzvusUB
 h+xUW93HzkQUpdPF7HAk6y8UuspU2IOerfI4bEDGtW/7L0P8m7kZ8UcunUxOAHBZ4qae
 NQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WixXNmtyoiXEy7RQ0nNgxkRw7PoZo3ZaXRRkl9iKMJ8=;
 b=1cwtYX23EcNZterBhmPJbR6nqJbA54qVXpsSIECkFa03mUhEs2wu67kvIKZeRK+zj9
 VUQQj3nhFqvWBflR5pfknxYwmLnX7MmeTNHvY7wSlKHbO8ln6aEMSAjObRQrKXompZ1o
 wXGyVsbfv/cxxBKBpTmEWrJsRjkEpm2AcSX0NiAvxhoq8zwi3QPMCxyrWucwCasun+Qa
 z6tQo+Gytgrpv3H2N87mWeVyiYMC8fiNZYyL6nDjBckHAaBm5sF4FGD0902o3V7J3CVr
 FYoLUsm9U2h6I89phVwlK15rMPWSNCnUr/S/fxjfUrj4iCK3VnEWrVKlb1UrUacaEw7b
 Yw8Q==
X-Gm-Message-State: AOAM5310wFIlxgYK4YOZOxf2RSrpO0aLIA7aQhACu/kW5dZS67rEwAqk
 RyRcqlZ9i8IL6Gaa/DB7/JMSBg==
X-Google-Smtp-Source: ABdhPJxV4HKhaM+RdqnvexrMa34TdLzrTDhr6eL6BIPJw40Fwr/H+NzEhdf5G9qmgDNHQTsXq8g5JA==
X-Received: by 2002:a05:620a:1aaa:: with SMTP id
 bl42mr828693qkb.469.1631555918441; 
 Mon, 13 Sep 2021 10:58:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id z11sm4358476qtw.8.2021.09.13.10.58.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:38 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Date: Mon, 13 Sep 2021 13:57:41 -0400
Message-Id: <20210913175747.47456-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 10/14] drm/msm/dpu: Remove encoder->enable() hack
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

From: Sean Paul <seanpaul@chromium.org>

encoder->commit() was being misused because there were some global
resources which needed to be tweaked in encoder->enable() which were not
accessible in dpu_encoder.c. That is no longer true and the redirect
serves no purpose any longer. So remove the indirection.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ----
 4 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 984f8a59cb73..ddc542a0d41f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2122,11 +2122,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.mode_set = dpu_encoder_virt_mode_set,
 	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_kms_encoder_enable,
+	.enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
-
-	/* This is called by dpu_kms_encoder_enable */
-	.commit = dpu_encoder_virt_enable,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fb0d9f781c66..4a0b55d145ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -381,28 +381,6 @@ static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
-/*
- * Override the encoder enable since we need to setup the inline rotator and do
- * some crtc magic before enabling any bridge that might be present.
- */
-void dpu_kms_encoder_enable(struct drm_encoder *encoder)
-{
-	const struct drm_encoder_helper_funcs *funcs = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
-	struct drm_crtc *crtc;
-
-	/* Forward this enable call to the commit hook */
-	if (funcs && funcs->commit)
-		funcs->commit(encoder);
-
-	drm_for_each_crtc(crtc, dev) {
-		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
-			continue;
-
-		trace_dpu_kms_enc_enable(DRMID(crtc));
-	}
-}
-
 static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..f1ebb60dacab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -248,8 +248,6 @@ void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
 int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
-void dpu_kms_encoder_enable(struct drm_encoder *encoder);
-
 /**
  * dpu_kms_get_clk_rate() - get the clock rate
  * @dpu_kms:  pointer to dpu_kms structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 37bba57675a8..54d74341e690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -266,10 +266,6 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_complete_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
-DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_enc_enable,
-	TP_PROTO(uint32_t drm_id),
-	TP_ARGS(drm_id)
-);
 DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

