Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3372F4613B
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31810E4FF;
	Mon, 23 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7w0e5ZL";
	dkim-atps=neutral
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0853710EC20
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:56 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-466f59dbe4bso564976b6e.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408295; x=1774013095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Zu2rs9LQXViGSxr3LJ2mebc7/BIvYzUYAAic1plGvM=;
 b=k7w0e5ZLr9fovWLe3iaT9eUbo/ALTH6NtnDM55Nc8RVm6sI/5GuCZlNsbCItF5HP0C
 yRUGbKbYqFwDibqk5Rd42ERkiFwSxjpO+s776p4PS1Y7ng7oAF23hJO3fVrBYuxvr53O
 2e56zJgMBCg5pnHVQnjMOWyTlTM3auser6dOT0cyTSey4xIcgYn+a9Q2kBcjNBjirWUd
 Kk2d7iGg6A7/F3I+C8ltJeANnhqosSkPBPCAIrOevH5G4xc8Rhsc9LwNc0k90mw4vfNE
 pEpCoKF+YA3R+ZHZIBujoaW06DKnrZQukikGba5JpFIUl7hmDZihsX6/8Iwgzwr+vzxH
 A7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408295; x=1774013095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+Zu2rs9LQXViGSxr3LJ2mebc7/BIvYzUYAAic1plGvM=;
 b=WorPC4YluJH/9Oiz/gxCct9o4X00EIz9O9/Y5uVNRQQ/rtg6jPo0JC0tpvjYHkghm+
 Fc9ysRQymLm04dbNCXR4RkfeMYYMXhInpDpTTPJB4koAA1P3UWiHM1GPdeHKDTvFJZEk
 9FLjAIMv2H5RdnqJjs+yKlnB7AgStojIL+ylrOj4nZzFbVkiAnc0sHm+riQwTg30k5yg
 XUC71kXRjOI40Sc4lAVgVjH5z1iFwv8E4R9ilgQn8GXfy/ay717iAPqKAteQCNLsas6d
 BqVYXgK8F52DLw6tPPZXSBmRWGHOzWqbM7GPFkOcy12nHCycAeibOeFkhptk2slluWjo
 3j8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE8jdRASNOE/luUzSPeOkOO9yPugG1PWzHfx/c25FdEehTCc3NKizgJZSARP97wfONG5AR2aDhQvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF+fG2eBLXahB9uLHxnkJmbYerPY+0+Rd/SwsIqVUBfYCte+QO
 weFrKdE98QSeARNafxyyfgpsU8eEAntVJI4G9lBAWBESekRX6LUnFd3o
X-Gm-Gg: ATEYQzw2k5h1+imZOJX6hGow2SN4LOCAULaIRhQH1tBqi/6+W4b/XuZbjup2ls8Hfin
 XHr2PhYXLgltJInU8bfF+tG8GImbcVO72dyceYMCM6gha6S61rS+6vmsnW3vwJE8DZ8BJhdMUKT
 4PaKvkd+VCNx1s/vmUzq3P6sLDndNB+OJDJLRDDw1LD1680KYLN2kI1B92sq6UpHpcvf8ejEsTW
 ZBCT6YEVzbO5HoVfi5ugCCnroxyAT94h5js6iIIx62INbf5c2qnTzleHO8DyoIVjdd6dEztTP65
 A/BHgpIa6KgIgjmpDCxg1GeSKzhxeyI9fu5IZb5KK53VFpvZNnTXNhhBfh69dZ4uoBWBA8C2YwR
 tv3RqlfD68cQWn6i3i7MAzs0Fd6g6Igs7ZsYkY8vKuv/0txxotp5LWRCGgZ80Z03kwvpyY0h5MH
 mEf/b2t8LB9NRGiBcG+XnJeGIFLZyMilES9FoEOz9jqCgOiv1V
X-Received: by 2002:a05:6808:2385:b0:467:1cf5:7684 with SMTP id
 5614622812f47-467570a44f8mr1658295b6e.6.1773408295128; 
 Fri, 13 Mar 2026 06:24:55 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 57/65] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Fri, 13 Mar 2026 07:20:22 -0600
Message-ID: <20260313132103.2529746-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:24 +0000
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4500deef4127..a0bb6110ad83 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -26,6 +26,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.53.0

