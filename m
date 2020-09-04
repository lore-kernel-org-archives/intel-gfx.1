Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FF0C2BB84
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F8C206B8
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 14:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SHrI5Pte"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F8C206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1916EC30;
	Fri,  4 Sep 2020 14:40:16 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2BE6EC18
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so7034253wrt.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64XFBTpUz/+kegXv8JrCHRJD2MKSn8Wfz3YnsHGyo4c=;
 b=SHrI5PteHHk+OQ04euG4wDkT+NJ2wr/tY0ZI+HWYVsHcPA56/weXRIZ7Whlt7Yh4OF
 1yv/Tt2MpaNE60nA+Yr25ol8WHvVVnKLm6VDQFWxZdEnSakTDY5GXiNPBlJfapEwp7Xw
 tMxYKMf+EVP1wmpdxQvxb+lPPQWg6xm65nIWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64XFBTpUz/+kegXv8JrCHRJD2MKSn8Wfz3YnsHGyo4c=;
 b=Km6uUbItucZf1ZtqWo3GnR9c3f1ofBojVky8/9njdV9m77exsTWJNrx+s0FxB4C72C
 Kp++/SgYMDET8npYngOxTJe7yacSOXfPkGRwaSg0e4ICci7iH4N/clVctgQKx5mEH15Z
 uHw0dgiORr3GwuCbE4iK+9UGKfcenSC2mkXoNk/2d/9pOxjxxXHzOxA2mmpCGyNyGyWM
 onY62l1XwKglFBYlvSRRSprXH5V7x9oqVjFV1clOKmyDvBkkPWW133/0/DtNxrC0cnMw
 OY7iXT7DNqEql6ZlaMMSx/HCQPef9YO+8ZXBDlltEimq6wlVNP34ERVVwg9SrfAXGVkB
 bDkg==
X-Gm-Message-State: AOAM5323r/DnhJWwtGWzbCntCJFXY3NWdmfl8qLmqFfBORcRy6pya1js
 +YycqCVfxW/ltWezJvnaZSoFyg==
X-Google-Smtp-Source: ABdhPJwLjIlfjbdw5SBpzKtKR85U1vkmexzqifNRH1wlPreKUPygC/BY6mszJQHJW3yYqofuWPaKkw==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr7741915wro.407.1599230410818; 
 Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri,  4 Sep 2020 16:39:36 +0200
Message-Id: <20200904143941.110665-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/24] drm/arc: Drop crtc check in arc_pgu_update
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

It's redundant, drm core guarantees that state->fb is set iff
state->crtc is set.

v2: I had a misconception about simple helpers here and thought they
filter this out. They don't. Issue reported by Eugeniy.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index ef7dca789868..30fbb3052bc7 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -134,7 +134,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
+	if (!pipe->plane.state->fb)
 		return;
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
