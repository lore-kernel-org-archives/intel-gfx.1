Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DFAC5DF97
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 19:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D910E337;
	Wed, 26 Aug 2026 19:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="tMdfO2AW";
	dkim-atps=neutral
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com
 [74.125.227.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4457310E250
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 04:46:19 +0000 (UTC)
Received: by mail-pj2-f11.google.com with SMTP id
 98e67ed59e1d1-38dbe53179bso185504a91.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 Aug 2026 21:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787719579; x=1788324379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Y7De7ARri1xphmS54uZC/QqgzV63JLdS9IYgu5HWyo=;
 b=tMdfO2AWRRwF+t7TKVwre7ii0e4xnVkLyrk2JI9SbclMYHxCATG+RpYU3X6uS1wtY7
 OKLjMBxHPDFpqV3wiMxRjo07nqQyjZ9neNxTvD7sdzk5Rc5a0IxsPyh1cJCr9VxoEZ/c
 UAeiuap/Yy/ERkrltuNP25o7w1a10xzclWKg0arsglruPLNu9VCXXJaeyfmOqu8NrAwQ
 RbJUEsuxtkwZQUXskvlk687gsAI5f5WyRm4y9q9QHfAPgCX/UbQmqDSVpTdvR0Ea8mY0
 GoYu670K/J+XPT0y6JO+BTlykouGMzMToSs9I1HP6fdSWwNhzFLu9PnTjIIcS6ppW7vV
 m2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787719579; x=1788324379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6Y7De7ARri1xphmS54uZC/QqgzV63JLdS9IYgu5HWyo=;
 b=Mr8/0EliKmmlDcDDjTHWC6UsoIJQJIn60OwL4GfCmhq4ews2bDbndHKnktW5ZT+UW8
 hQsgdrvAr1/+kwAqAyOFchzwvzvgw/J8dUzwQtvCHugeN7bWrt/5xBuU8vJZOJOo0iTI
 by2+P3yJ8QZa5VIrVGCKeNtR0xIgl0DVZxyHuBufnsgGwrdMW2pwXvq75/9q5xPK+YwX
 A1Sr0r321wys3I7C8Wr935P6oXis7oW2g1xiP2PZgF5ZCyDDm67is5a4VOPTv64OVz80
 dhq80QRbXNumJdGl4GbwOKe2t0WXa5pKum/IOeZMy5sQLGPaPCmzVXu3ppNhdq3wnHva
 SPvQ==
X-Gm-Message-State: AFuF++lRjdzzqDRebEpIkg1M8lP7JrOFGRjqX2mz5obR+6x9hp/BXuVh
 iAC1fORKq6q9ordtGzNX/DXV8gzHXMJKwt0RjG0Vwl8rRJu16+6ngwobRvEj4y10nx7lbA==
X-Gm-Gg: AR+sD10GzINf9VL8zj2yGBFReP+Z99G6xhF2T6SKrj8MjFvKweeojtNYKUCobpQMjf7
 J6gyZachcwbbm9tr6CamQARUiQaiCyv7I9z4jb7sgq0C/yBI2OcXp7vhVncHmTamcdrKt+obGYL
 N3RMGxECyrgvxePCV0k1w3qlZ+GLP0t4Y9Zer821w8woSQHE8SujkCmVlwzmDLYs99wUFJxmjji
 HIKI216FTpVRSh0/uFX/KA55Yzx/HbEKCKABDXvgMvanFSK7S3yVBebGJA59sLDKaQDLJ9bE+5M
 JazqXt/le7FytGCC8RTuPBpweYNSaoHSeZET9UD3+hFlis9OuFbkOw66m3b8XcZlNTpvBNrVLpj
 aBaWNqDco2Crc/FnV7clFFPFtDvLTXy9eQv4fkkkmEzTO3VJCADxHTm6wtFwONbg0Qq07N99GX/
 FcfHGQyCT04LR1mpkOU4hszLv34k/1h+8jfVdMWLnkGbopPteNZL6Tsw/O/IMHOGxgFtOZ3m8T2
 2L9Gl3PpBrsA0BYMTNB0Q==
X-Received: by 2002:a17:90b:5543:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-3966d13eb75mr9224027a91.3.1787719578654; 
 Tue, 25 Aug 2026 21:46:18 -0700 (PDT)
Received: from DESKTOP-BDFNLNM.localdomain ([27.63.245.244])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283fa89e8fsm5398718eec.8.2026.08.25.21.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:46:18 -0700 (PDT)
From: tarund18303@gmail.com
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tarun-tarun143 <tarund18303@gmail.com>
Subject: [PATCH] drm/i915/dp: remove redundant link state check
Date: Wed, 26 Aug 2026 04:45:33 +0000
Message-ID: <20260826044533.9292-1-tarund18303@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Aug 2026 19:47:01 +0000
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

From: tarun-tarun143 <tarund18303@gmail.com>

The DP link state is now checked and recovered after link training,
including after modesets. The same recovery path is also used from
the hotplug and HPD IRQ paths.

The link state check from intel_dp_detect() is therefore redundant.
Remove it and rely on the existing link recovery paths.

Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 113d767e62e9..ffd39206b958 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6379,18 +6379,6 @@ intel_dp_detect(struct drm_connector *_connector,
 		status = connector_status_disconnected;
 		goto out_unset_edid;
 	}
-
-	/*
-	 * Some external monitors do not signal loss of link synchronization
-	 * with an IRQ_HPD, so force a link status check.
-	 *
-	 * TODO: this probably became redundant, so remove it: the link state
-	 * is rechecked/recovered now after modesets, where the loss of
-	 * synchronization tends to occur.
-	 */
-	if (!intel_dp_is_edp(intel_dp))
-		intel_dp_check_link_state(intel_dp);
-
 	/*
 	 * Clearing NACK and defer counts to get their exact values
 	 * while reading EDID which are required by Compliance tests
-- 
2.43.0

