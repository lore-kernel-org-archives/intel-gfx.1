Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7BCC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9D960F12
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E9D960F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610FF6ECEB;
	Mon, 13 Sep 2021 17:58:33 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D5C6ECEA
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:31 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id r21so8839662qtw.11
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=HSkzBKaW16XHN25FVhfE4ylfh7Ho8sKCp7NrHnYeZ9jqVbeqyvv5nhvkjL7XnJKf4/
 BaklNXOp8gHXE+dIxpH1EqfKnYbBykjq53Yy+f9sYHgj5MhRKM3vU+TNRzbWCCrlgjRL
 d6Btg46MYbzPzLbcJsGef7oPKYbzbT8e8DOQ5S6WvYFiPu11tikgrc5rpfIXNQze8xAS
 EF5ybQt4EiD/YWqON6MYIWklZfZEaCODI3MttyJMNpzbQRoqnK4w7g5RcGHiZtTbrP1P
 bFHxJyDV5PUtAZJoKr8Nn73rhfQAKxB5ggKQWeIGZ3g1VCe/ow++3JDp6sm+AthJmZrI
 oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=BrrJAIwo9eoEAylFHM+HBJw3MnXY/ycpOCltB4Nib9EAaTo2HGvVfsmby0901Ywk/t
 FVErPS3nqEUnElB+g4uZSNWcti2ZlpMD9eJYBgBA52oiaVGm+PCF7ROy5CaxZwiGSqm0
 fnr6QzbgvM8v/n653SuUMhLhp5iyvIp6A/9Av2nY75syXspDg+LCTabSYy9mZVEfA8ID
 C+CjIWz1fX2E+yDOwpij3e/d57J5RVVdqDb8woEAr7nDFNr/yRuvWQchLDujfJ1m1cRe
 bQ6+wUcWNN/JMWM9D/KX6Y+IXgBUWyslcgdiWfjvySqnzIX1Xm1VMt9Ccp3ezmhFHCKU
 eUcg==
X-Gm-Message-State: AOAM532JmA6o8k5MNY7WJBSMc0o0S62NVkIzTrRXQkVz2o14XdeVdM2c
 We3qPgIjP+efoILXPFYcuHHkug==
X-Google-Smtp-Source: ABdhPJwprGZQb5yj3SWlC8k2jMSq4z8CKpwRKlPSj4/nEKy9bCRmbnJ3kYbKUVAN837wrtFHdahvyQ==
X-Received: by 2002:a05:622a:199f:: with SMTP id
 u31mr763515qtc.141.1631555910663; 
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v145sm5853873qkb.132.2021.09.13.10.58.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Date: Mon, 13 Sep 2021 13:57:39 -0400
Message-Id: <20210913175747.47456-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 08/14] drm/msm/dpu_kms: Re-order dpu includes
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

Make includes alphabetical in dpu_kms.c

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..fb0d9f781c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -21,14 +21,14 @@
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
-#include "dpu_kms.h"
 #include "dpu_core_irq.h"
+#include "dpu_crtc.h"
+#include "dpu_encoder.h"
 #include "dpu_formats.h"
 #include "dpu_hw_vbif.h"
-#include "dpu_vbif.h"
-#include "dpu_encoder.h"
+#include "dpu_kms.h"
 #include "dpu_plane.h"
-#include "dpu_crtc.h"
+#include "dpu_vbif.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
-- 
Sean Paul, Software Engineer, Google / Chromium OS

