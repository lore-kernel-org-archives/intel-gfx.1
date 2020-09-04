Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196CCC2BB84
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0DD206B8
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="GORAZSsm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0DD206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DD26EC24;
	Fri,  4 Sep 2020 14:40:15 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE686EBD0
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so6333512wmm.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDJeuyrd+AUwqoOu6VT/5MJu0SvohYtED5Ve7fFVICM=;
 b=GORAZSsmj4rtGcO9UKpWDyM3rghF078p9/UWtORYn573eMx879Ao85t5w0fF39E9b3
 9jV6GM/YcS2DO2PECIPO5mQO6cwFxgoTomTGOxAwdVWetuQMCdgCfmxeLicdLv75PgnQ
 QI1rUwQcX6ICRhn2ZU1+hEwqv5WiTmj4v8ADk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDJeuyrd+AUwqoOu6VT/5MJu0SvohYtED5Ve7fFVICM=;
 b=nJdKDC1yFH9IA6jmr1MwbS4o+YjhXqedfz11Pn7LNLxynMGegHnUhU6xOkDC+lICJL
 9B4p+uwO3va6UhowUSljMRrB+6Y404dzKOw/MQqNxwPFIYTXeinGb/5Md3cXoqiPf0bl
 2/PH0MWRnij1r6H3xaVrRqCR/d/cnq6011jCgGlIC1nisN8JUC206v6PuhCRwTBluXOt
 PmlKoyJ03W7S0+UpfGbI1yDuh0E1LbQjOBgb3pCQAD5uCqzr3ad5xOxheYgyi3sbXBGh
 4418gJjsmP0yC4M9B50Rjy5GHu56znyigtksZH+n393HRYIejGTqmRITw1ppydhdZTyX
 fNhw==
X-Gm-Message-State: AOAM530qKorgenuk0JW0tcKjU0dLMlS/PzcE/PrpqY5aTbLC5EpeY3Fr
 mjuE4d+FU6dfJmy1EaeJuDvAvg==
X-Google-Smtp-Source: ABdhPJxEbITXBwKzU+ml+q1ThhDDZYB/jwa1Zrz+jalRWGL2Ih6MgCU3AJwpbLbr+bypGdhy/dV3mw==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr8442227wme.144.1599230408829; 
 Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri,  4 Sep 2020 16:39:34 +0200
Message-Id: <20200904143941.110665-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 17/24] drm/arc: Align with simple pipe helpers
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Simple pipe helpers only have an enable and disable hook, no more
mode_set_nofb. Call it from our enable hook to align with that
conversions.

Atomic helpers always call mode_set_nofb and enable together, so
there's no functional change here.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 72719556debb..c7769edeefdf 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -73,10 +73,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	struct drm_display_mode *m = &crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -110,7 +109,7 @@ static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(crtc);
+	arc_pgu_set_pxl_fmt(&arcpgu->pipe.crtc);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
@@ -120,6 +119,8 @@ static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 
+	arc_pgu_mode_set(arcpgu);
+
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
 		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
@@ -139,7 +140,6 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 	.mode_valid	= arc_pgu_crtc_mode_valid,
-	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
 	.atomic_enable	= arc_pgu_crtc_atomic_enable,
 	.atomic_disable	= arc_pgu_crtc_atomic_disable,
 };
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
