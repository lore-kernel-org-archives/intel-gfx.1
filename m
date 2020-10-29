Return-Path: <SRS0=ieU+=EE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4036C55179
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 10:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757B82076E
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 10:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hkxe6zs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757B82076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69396EC8C;
	Thu, 29 Oct 2020 10:14:39 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1EF6EC8A
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 10:14:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t9so2065909wrq.11
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NH1wgxZzmNr+f4f/izYOW3Kn2sqLIMMHcPJO+vFYPj8=;
 b=Hkxe6zs+S5dTbcwUFC1+X5+n49A/SNSvIY83JbI54r1aawzTNDh5eYWpvB4WVQ91tB
 krPLqS63geCdVbXeMPHR+G6sOa+/n9rlBSdBs0haU3LWOIezU0gcsY0Jqby2ilee5eJt
 lLT7Oth/y1jCjqPGrmzJ0jBhsSuR5H3bwiXjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NH1wgxZzmNr+f4f/izYOW3Kn2sqLIMMHcPJO+vFYPj8=;
 b=tEB8nfYMFPSWQPVPr6k39KqnKn2OY3MyARTMAIGwp/+yWlJO4Ik+pZJDWo/P9aeTYP
 F04KOSj6jyiMocvylYinU5F6hULNA8Q181gxG47EA+LMfKZ39Kb52grpcMW6ohNaC5jz
 QHZObzIvaWBZFsdzE5I4m8WurjqDzugooopM32KtkgVbFsi93mRZ0fCQimONNggEPglC
 mUBDcFYamdV3f3qCvIZAZXV9nNTzOlEy+qD76+hin0fA1niLkAbCrRjAdAlcwX46j+Gc
 Fscz+QfrPzr++ANv01AlI3iqwSUMoKUUrRRaf1T/ku5w6XaRw0oW0Snd70TJfyFH+aNC
 f7eA==
X-Gm-Message-State: AOAM530zcln1t8SQhelznuSh865tEtrybI1OaVKZv/oOPMUsfSKSirUz
 89pqETjxOgAIZW6rJGKY3H6n1Q==
X-Google-Smtp-Source: ABdhPJwKhZUv0/sxV9eMLtbW41ionD/GZOnsN7WT3fFy3s7vVW47Q/DgBSrBxSdS4kDGU3LeYplh0A==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr4370597wro.328.1603966476296; 
 Thu, 29 Oct 2020 03:14:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e5sm3897753wrw.93.2020.10.29.03.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 03:14:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Thu, 29 Oct 2020 11:14:28 +0100
Message-Id: <20201029101428.4058311-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] drm/qxl: Remove fbcon acceleration leftovers
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
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

These are leftovers from 13aff184ed9f ("drm/qxl: remove dead qxl fbdev
emulation code").

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_drv.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 3602e8b34189..86eee66ecbad 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -166,20 +166,6 @@ struct qxl_drm_image {
 	struct list_head chunk_list;
 };
 
-struct qxl_fb_image {
-	struct qxl_device *qdev;
-	uint32_t pseudo_palette[16];
-	struct fb_image fb_image;
-	uint32_t visual;
-};
-
-struct qxl_draw_fill {
-	struct qxl_device *qdev;
-	struct qxl_rect rect;
-	uint32_t color;
-	uint16_t rop;
-};
-
 /*
  * Debugfs
  */
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
