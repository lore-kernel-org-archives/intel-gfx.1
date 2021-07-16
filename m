Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CA6C636CB
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 22:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B099613F1
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 22:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B099613F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jlekstrand.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC906E8C8;
	Fri, 16 Jul 2021 22:48:06 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC7C6E8C8
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 22:48:05 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso1701399pjg.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26BfJp5P7eFvEwspn0bZn+OrsVxNX++BisccW8Z+Oe4=;
 b=MjEi3RoRlDVK7ZRGa/CCM4Z2uU9RTRIixNhcNRPaxUKU3mvJLwjqnAnaBgsuYD32hv
 CrBhgnPd9SUkOt4sAzOZC3zmHSlKpY6J2coyo5+zB9AA5cT+5Gu2tinASllQhq4dj8Da
 Gq3QpIZUC0RWEaySkfFgbEHUjTwly2ESsZS/voQUZ1wd5nm4FwMlmu6yBORhWG3Oxi4w
 +6H5CIKr7dQyvIOK1SvSdLn7NuOLoLtC1lpp/3CUEOGa7wS0gZif4KVwL4Wb0QNDx2Ih
 OcKztb4Ul+OUxJ20mVJ26v05LUXrl2bc8hP6FH+1EfNoaYLwlFW7RTfj7BVj7PNjgfXR
 4hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26BfJp5P7eFvEwspn0bZn+OrsVxNX++BisccW8Z+Oe4=;
 b=ZfV3P6mvYfyWN7kNFu7lwlqqqS8q/Y+lZeLsiEP+qv/M+6X/3v1qHrrrL9hhNpgq9m
 Z++B83AAHP6+6IfvuMdib4ztzJglU3gpktjAdG93FOh4w01oF2re2lc4cD0zsjwhigJt
 s/Dzfi3mrfElC/DzyOGJCNavD9p7ux6znSR+bp6VVmlKDFUHtShgvwUwUc8kh48i5cuy
 wfOuGjv8BVl85WfGKxLU+fx7MP6s0HaAdfGFzP8JKclPRt6j1Gz93xeAIT4UiW5LPeSc
 IcjjRcEiDIx2Y969RCjDiUr9rS+AwH47QSoEDsnfcKWk6hv3Fs7DY/BV4oTvKQf9N07m
 2//w==
X-Gm-Message-State: AOAM530abQLpsQLqDafm0rRvy+WaiQtGgDyOaMi59MYegRdsX5cYIE0R
 02NJnQ5Qd6HjeI28y7f5INQhk/igJHhDZw==
X-Google-Smtp-Source: ABdhPJy1BDHpLHZlEZ+6VefSJXtTPuOJHs1y9CP2sGSyRPut6NuK1h3srvyxGQVhkZ0Cl5cciva4dg==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
 o101mr12037103pjo.208.1626475684933; 
 Fri, 16 Jul 2021 15:48:04 -0700 (PDT)
Received: from omlet.com ([134.134.139.84])
 by smtp.gmail.com with ESMTPSA id u24sm11991993pfm.141.2021.07.16.15.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 15:48:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 16 Jul 2021 17:47:57 -0500
Message-Id: <20210716224758.2162003-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915: Call i915_globals_exit() after
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We should tear down in the opposite order we set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 537f9c84a427 ("drm/i915/pmu: Fix CPU hotplug with multiple GPUs")
Cc: Daniel Vetter <daniel@ffwll.ch>
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
