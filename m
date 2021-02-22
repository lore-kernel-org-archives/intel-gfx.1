Return-Path: <SRS0=ktOb=HY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5474C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 10:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FC664DEC
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 10:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FC664DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581506E932;
	Mon, 22 Feb 2021 10:06:19 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10896E932
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 10:06:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r3so6755923wro.9
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XTd2xcZO6rfYz+GL8IrUYzSOQrcSm1K+ucx+r825GYw=;
 b=CRPLPieGKd/s1xtUt2XfCQyh/d+gWsf1NWQpuFuHpfgUrdOde67ofiYdRHtu91pYr6
 xkx1giUEvH7kafzPPtXsp1WC8Kd4ycUsTbNITVXXleVQdzPmMuzHrbDS5bloWTtqss/3
 DzauHNjx83YkebW/aLoUR5/ZsblEGJQb5PebM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XTd2xcZO6rfYz+GL8IrUYzSOQrcSm1K+ucx+r825GYw=;
 b=gKFGb2r02slyBwjwI6RszyHBWhV9s1Z6bVkfvCGdur2rvAi9wdCXle/lGINnLdPvir
 cuNJeDuEXviSwR8oCiKeg6uGa3aOWslKlItAcHUQImOZJf9eEopJqyZ21334QFNBMb2n
 aKgDMhAQMCK59dE7D4DuQ1+W8KLLWzSeP/n1/CGvqVPs9vclUMc25nYejot8omwxgX41
 nq1dESivgAhmYMUmP4R2TkeCkKBMsjs4AFIn4XY0EwOx5Vh/rc8nDGxY+ZCz0AsTey10
 99SWwu5OcCfsIpklGYOiyvGj3dMFhBqjePX0m0En78nm3XYo8HnUH75W8wEUXpJEC6Fv
 FYiA==
X-Gm-Message-State: AOAM531Hci2Ui5hIUgmaPxOLTNqMZ3AQIYX0ADthZyVQYi8g+8Ryi4gh
 h5lO2OFuloBYrYNwW+2gDdR7Hg==
X-Google-Smtp-Source: ABdhPJwxsPWVCvn3sfu+AfZSCkvdx+tfpUSIp7DqYlVMaHSEAJj8qnn5l+NsFV3YRWVwT4LQmNwpRA==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr20813358wrr.82.1613988376483; 
 Mon, 22 Feb 2021 02:06:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u142sm25986018wmu.3.2021.02.22.02.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:06:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 22 Feb 2021 11:06:08 +0100
Message-Id: <20210222100608.400730-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/compat: more dummy implementations
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

drm_noop really doesnt do much, and who cares about the permission checks.
So let's delete some code.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_ioc32.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index dc734d4828a1..33390f02f5eb 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -302,12 +302,8 @@ static int compat_drm_getstats(struct file *file, unsigned int cmd,
 			       unsigned long arg)
 {
 	drm_stats32_t __user *argp = (void __user *)arg;
-	int err;
-
-	err = drm_ioctl_kernel(file, drm_noop, NULL, 0);
-	if (err)
-		return err;
 
+	/* getstats is defunct, just clear */
 	if (clear_user(argp, sizeof(drm_stats32_t)))
 		return -EFAULT;
 	return 0;
@@ -820,13 +816,8 @@ typedef struct drm_update_draw32 {
 static int compat_drm_update_draw(struct file *file, unsigned int cmd,
 				  unsigned long arg)
 {
-	drm_update_draw32_t update32;
-
-	if (copy_from_user(&update32, (void __user *)arg, sizeof(update32)))
-		return -EFAULT;
-
-	return drm_ioctl_kernel(file, drm_noop, NULL,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
+	/* update_draw is defunct */
+	return 0;
 }
 #endif
 
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
