Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD07C12002
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 08:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7484A611CC
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 08:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7484A611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4A189DD3;
	Mon, 19 Jul 2021 08:35:42 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81C789DD3
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 08:35:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m2so21007369wrq.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VTY7si5+ogntqksXEXJbSR2eZtXFuLX27JSPFEg5ycA=;
 b=PnU7pULOGTNWvtQBUK2/lgrpjunyUy+WxlzuqNfq67yJilezxKBYaxDauOsSCrsPE8
 D4lhBnKAMEYXeXPUgcafYJJStezogt6z2iGbMQ4Nj0qFGcmD1TK5Ha4HG90LZLM8YOu+
 DIS81gr58lid9qihhl3aegx3BOO9e/BkcHmlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VTY7si5+ogntqksXEXJbSR2eZtXFuLX27JSPFEg5ycA=;
 b=JZhweg6ReprmLUsNQq5CYjF3TA7cdvccUMu9dNYQ1yqcM8zBKdYZhIcvNKMdbSyzL/
 3sEKE8h6EV3X7epZlTQlj75JJ4rxUgXEneyX/2vahs7YlDILubmc6BI/DPDUBCOc+1OR
 KZrw3jhjen32kfvRLl0PDpqWFOe5O/kpPWQw8VB5QRAZc0gA78YKcNMSywhwWothAiqA
 eirJRizUhF8+lzMf8PRePGpD7Rwn9+7YdHFJ7uooin3pXdH6IxbBaRicf16IgBqBsEW3
 Wfz6yLLfuPfY70kUUK9fcTFKK2WiXuErYh1uzh9lny+dFARHttvdq+mWtozp4srf6Osh
 a09Q==
X-Gm-Message-State: AOAM530If+2xOSweNxy1gj+8ppTz35jsWNfgs0GfPMF+83AffiTt+04H
 NrOWJJ9dUGBh+2pkaItYVC2s2Q==
X-Google-Smtp-Source: ABdhPJxazs4aZz2Z3D8GxSTBgdo5dXzcF1ySp6PUZMztMqd3JUyzBTrlhZ5s+iIaba3txdvBrUvveA==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr28438477wrn.205.1626683739625; 
 Mon, 19 Jul 2021 01:35:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t16sm18712178wrp.44.2021.07.19.01.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:35:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 19 Jul 2021 10:35:34 +0200
Message-Id: <20210719083534.2949348-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Check for nomodeset in i915_init()
 first
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Jason is trying to sort out the unwinding in i915_init and i915_exit,
while reviewing those patches I noticed that we also have the
nomodeset handling now in the middle of things.

Pull that out for simplisity in unwinding - if you run selftest with
nomodeset you get nothing, *shrug*.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 67696d752271..6fe709ac1b4b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1199,14 +1199,6 @@ static int __init i915_init(void)
 	bool use_kms = true;
 	int err;
 
-	err = i915_globals_init();
-	if (err)
-		return err;
-
-	err = i915_mock_selftests();
-	if (err)
-		return err > 0 ? 0 : err;
-
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
 	 * either the i915.modeset prarameter or by the
@@ -1225,6 +1217,14 @@ static int __init i915_init(void)
 		return 0;
 	}
 
+	err = i915_globals_init();
+	if (err)
+		return err;
+
+	err = i915_mock_selftests();
+	if (err)
+		return err > 0 ? 0 : err;
+
 	i915_pmu_init();
 
 	err = pci_register_driver(&i915_pci_driver);
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
