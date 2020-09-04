Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C388BC433E2
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E796206B8
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="O0AR/e4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E796206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5A6EBED;
	Fri,  4 Sep 2020 14:40:09 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352426EC00
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so6307569wmj.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=du/z75457y6KI1rsQmBRtEQ4cXiJI1WVzJRMvyz/O3E=;
 b=O0AR/e4rSWoS/mHwwcO30vgbZIBmW5cF2/mKIMzDpdw6TiG4uHSpWQE5Pik+5YQZmD
 N5AoPcHOaZyHd78CDcUFyPC5WOz7HnGmsiQbRfSvCiu9XJmV5dXdbsYI9WCwWNVKL86A
 1orrxZ9LdvOJMt7Mw2IROBnQgM+zRcZAVib9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=du/z75457y6KI1rsQmBRtEQ4cXiJI1WVzJRMvyz/O3E=;
 b=JirDdnBt23ppB//Oojrd8zMmHCzMILSFcJs/5iQ1nk85FHw75Ghg3Dfh+t3VRNCuGz
 N4iM3LWp+bwRMa7vdeQ28zeUUUDkiQlyKapx8dyR0wRrjvs7AwSymalJ8slP/IQOwzDs
 rlyvlLoWhEOJ7NLFlzRw8dUlvB1vS6V08ZuL2x5bcNUMNVJY6PzS8BWhL6S+vWFBt9n+
 PpryF1iL0WH8UWB7+dH2sZhQRNp8v/sLjiraBPLd6MciJ8WHIrZYJtFLjyRwc1B5FwKC
 jdc5fBsScG7cf/9NJaL8EViGopGvIgL8Aw9roE/5TZ0yaAj778NIXofWi62iAKax4e6i
 VZKw==
X-Gm-Message-State: AOAM531PYuyiHm62hvHpxI6P4/S4CRV5LCE9c9S8lnxNxuMYjVOVUU9d
 QGmu6hQFeTZo2EdFlDbOm1PJG2Fcq1zoKNHk
X-Google-Smtp-Source: ABdhPJx2VS/zkTx2NmlxxniPZd3sxAnKtpQbp6GS47CjxR1z9nx1eqsz0p+ByDvUCPEQ/u4PbSbw7A==
X-Received: by 2002:a1c:e917:: with SMTP id q23mr7694766wmc.125.1599230406838; 
 Fri, 04 Sep 2020 07:40:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri,  4 Sep 2020 16:39:32 +0200
Message-Id: <20200904143941.110665-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 15/24] drm/arc: Drop surplus connector
 registration
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
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drm_connector_register does nothing before drm_dev_register(), it
is meant for hotpluggable connectors only. Same for the unregister side.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_sim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index e42fe5d05a3d..3772df1647aa 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -29,7 +29,6 @@ static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
 
 static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
 
@@ -80,7 +79,6 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(drm->dev, "could not attach connector to encoder\n");
-		drm_connector_unregister(connector);
 		goto error_connector_cleanup;
 	}
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
