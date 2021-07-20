Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB63C636C8
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 18:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2401B6108B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 18:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2401B6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jlekstrand.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316D76E20E;
	Tue, 20 Jul 2021 18:14:08 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DEB6E3C4
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 18:14:06 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id j73so1694528pge.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=oU2HnYhGE8o2NkgmMyZjIYvpuESvFhw4ZfkgBIuirSkIk9t3bhTEwG8AWOPUYfHeG+
 b0ZW5UsDOaAsg+zGuTgJD0+q0nghtv8Xs/83N10CiNLouppM3zKo9hxLq9lWQGmmsm0q
 ZlDNd8bbSNYEkwgbdvKXJIgqtkqbn3JB3f42uB5bM/EI5KVBqW55DhwHoLTQg18FJQUY
 HAb7Ktgg9tBoAeydGdxnMakwfF81+865n1/xh46Nj04IXhxiKM36TApHJq/IyLXNInSF
 LTlQ2fswnlBYuOHYk2yXXlc+UIGvxgvGDyMoRgT1Vj+qvzrfTjNUkQcHsmf5gkHxZejv
 RYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxrOgIujpF8i4wx+EiH358bwMj50Ob54hlyrZAnhxWw=;
 b=KEVZvGDILoSjU2FsXGgG+Y/bjheqj3zG4lpJFEFmFMhQfvdNi5TeFNT74ZD8L4bbc7
 aNpKIFar1argtZpjZRzYvPTDrbrqJVCQy5OCEZ20osUwkLYVS+DKBmQv50d7N+IyQwuP
 vmAvF7GE7ocPgt9OFC3noKMeq13QOqg3TQRZhzReOaFBFe3J79J0NImKZYbIhEnYsm2N
 A67E7Ip0Df9Gl9dPhRIlGrO5hHj4McgcciJjdRymwBUEggB/ngrk2dFkcvsC83kc2O5W
 BCzbp8aLQfePZyY6BF66nwULfh7didIJ6RKcIKBKkpAxFxc2T2BHtXbYqVxv8P+n9wL8
 ZLVA==
X-Gm-Message-State: AOAM5339YD0etsMJ/+qVMit51PAoi4/IZAlrSJrawYFAlb19rsuWotIe
 goKuM9qZ2BiNRcIYGv/e4V7ahwvMIYinFQ==
X-Google-Smtp-Source: ABdhPJy6RU5PpaNR5Ngfb6/CODW8S2VhgR3uhiR+BF2t6gWjGYM0NGW3IEGx3kQTCl9677N8Mqmz4w==
X-Received: by 2002:a63:e250:: with SMTP id y16mr32142980pgj.247.1626804845887; 
 Tue, 20 Jul 2021 11:14:05 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id c2sm26436573pgh.82.2021.07.20.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:14:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue, 20 Jul 2021 13:13:52 -0500
Message-Id: <20210720181357.2760720-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720181357.2760720-1-jason@jlekstrand.net>
References: <20210720181357.2760720-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/6] drm/i915: Call i915_globals_exit() after
 i915_pmu_exit()
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We should tear down in the opposite order we set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 67696d7522718..50ed93b03e582 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1244,8 +1244,8 @@ static void __exit i915_exit(void)
 
 	i915_perf_sysctl_unregister();
 	pci_unregister_driver(&i915_pci_driver);
-	i915_globals_exit();
 	i915_pmu_exit();
+	i915_globals_exit();
 }
 
 module_init(i915_init);
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
