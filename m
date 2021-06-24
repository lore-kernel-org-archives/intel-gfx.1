Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0F0C48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 10:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C93F613EE
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 10:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C93F613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D786EB5C;
	Thu, 24 Jun 2021 10:55:29 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963F6EB5A
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 10:55:27 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id f10so2773837plg.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovqPGUQPtbi9LNkbTpa5Y8dCy9rTdlKhQzy2ogksdJE=;
 b=LZguRud9skgmE05y7DdRbbHenMIcXxUkQGAfGtYIuObeQwsrZBdlKras4snIntfFGW
 UMvilXQaSeu16CBluo5pYm314hKeCeddvQxIFODOQk97WxdR4bJYCnYbc/xbC6619FV5
 5jsAp3Wx33VRGJQ/6MIWYVtEOf/O8w+Ubdx9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovqPGUQPtbi9LNkbTpa5Y8dCy9rTdlKhQzy2ogksdJE=;
 b=ixNYvjXGTvGaoZw5DAqI5vhyYZhGy/VmGwIJFPlbS4K+CRpSnlT+3Cy6dm8svWs6lc
 VvPkrniICai+NiqUyWloswl6shVNKv3/7EpL7THkQUTP6nqi0E/GXoD04E09P6M/ucR7
 z3m5ieKPIF8i+iA442c2IZEmioQWSHvbmrx86K7r6VrlcO+4y2m1loKOrwkfB19+fbav
 rxrjjcYbeHx/xacV8/G4RT9omoI3PDGp3DD/xdYrdNu8R9XdTDqh1iSX3SWX2xBzz7oL
 2zgCQKTdqNXgkRWYl5iiHWwDW0BKSLQ6IRIUqshUWu47T1MN0Afc6HZJKBQmRmBk5m+J
 rVPw==
X-Gm-Message-State: AOAM530vFHf2p3GXRtUSXiUClc8UXMyu8RyTk6uKJWdHILl3oqmdh7Hs
 ALq6sZg4U05lATuDOW2eYNyEqg==
X-Google-Smtp-Source: ABdhPJw1VAb8x6usa6X7gmyM/UenV/k+g8Gc96ZuEqGo8DCN70yTuL0TZ9yHRL+gn1ALSzPY8Iuylw==
X-Received: by 2002:a17:90a:66ca:: with SMTP id
 z10mr4765432pjl.78.1624532127367; 
 Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:368f:686c:969:1f38])
 by smtp.gmail.com with ESMTPSA id t7sm2212536pgh.52.2021.06.24.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 24 Jun 2021 18:55:16 +0800
Message-Id: <20210624105517.3886963-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624105517.3886963-1-hsinyi@chromium.org>
References: <20210624105517.3886963-1-hsinyi@chromium.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 RESEND 2/3] drm/mediatek: init panel
 orientation property
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd92..9da1fd6491319 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.32.0.288.g62a8d224e6-goog

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
