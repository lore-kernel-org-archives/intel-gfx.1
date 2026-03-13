Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD21F483C2
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A0E10E59A;
	Mon, 23 Mar 2026 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJsTz4Cv";
	dkim-atps=neutral
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0C10EC13
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:45 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-46702742c99so1402148b6e.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408284; x=1774013084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGwHOHakhEHhnxVqmZq5DXxfR0MylvY9XafKKBqzVj0=;
 b=aJsTz4CvCeOsXdRdEquKBA5SJsAyDCqUEOQyu1zTmEpIT1RFS6MmIrUm4cq87fB3Oc
 eRvF27tONI6SmsBFv0ISviq8x+1AjSFZx8jXAug6Vi9LirRI0vUC6vQjzBRpSPfaFkWy
 MnQhVWJyl/euCKqDkqgoHajbwk6LNujk0L3V/p5b8ma1XGLL9bkiR/ZypLl2Ql+5XtPT
 0yVD6zjIbYgiaemj3uRPIGcqzqFJccqusbe4eOD61qsI1fuynjDJVa7C+XGStlBoDP8D
 yQ5R97NZCNqGRK7Al5aZEdcUtxXttB8R2gfMctVQdu9MrQQPZ8IvKIeCJhLafYZiaMGk
 9q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408284; x=1774013084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TGwHOHakhEHhnxVqmZq5DXxfR0MylvY9XafKKBqzVj0=;
 b=A6hZkWK+3gTwSWMXDqmGF7HKh0E/C1JowJ9pYhPv8E3hj3LRG04hak3BSF5B1ziDPX
 BvnGRQyKwUukX7NPXGEBkkMb3vbJDB6tHEgx6L+4ZcLAIjxXM6tTrtLBOr0WQOhQwQ7C
 kngwK+8PL30+e/bfbc1MhYlgd0o96uazzdgoeXnlcQ6eSEpRqXsaRAmc5mgsf0NargRl
 xmi5cQyJy3M7K/i2cPfEFtQ+/t4pcjSRikS29h3J+57aNFbr1ynP7ogdhqcsSUAZ0q9f
 MhHdtN+APFJepzFQDeX1M0VVokmDgdFQziR599q4n+8uxFeYrYaFtIS4wAhj4ToULERr
 MH4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHBJlXHaHIpqMfMqjcjaN88dTISe626qFoXR2Lrk4ggc0w81jWvgjpAsFpjl2JYSrI7fRvKZKt20w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLTanxr2MGWv4Tj+di5cegj3gBc7tvuHDl46qqAH+ijo9CcSfL
 KHzHP79hs0lTabzrdXIIkD4RrVxlZN63UpM+12RvOssEnJEtWY7kcPoY
X-Gm-Gg: ATEYQzzYLkKWb6Mc3LrxBnAk1PlbBRqJno5cypGiCPrKvZACRpcUkpzmxB4gvB7BdQ5
 GCUwlytpJcd8THz5WOWdtKFtX5f2pgG6scAjcWy+56ucktazlRgVgzthVuNFKUH+al4uIwewaJB
 CoR19Vwqe0gLmaxN0/sWjLTYytp5jbruJlHXMNtqT+VF6WRS2wtrBUTDSB+6uPZJYXO60g5csWJ
 ZfSgcJ2geX4fWze5dgcxFPYuZbCmcFBJ/acgnBG+ZgJf2R/QkrpniQv4JmdBl9/A4vtBxS9opbC
 9E9+vNpnRuJdBgNvXE6gweVrUuoEKYWOyCmiPGuMT7c9+Ts7Al8hIHLFpdSvmdvZ5Ed00t1zZCC
 feTcZwEkMgRbrYa+Tl6D5VukqdkBO05M3rrk40kS719GYMrVT4i0NDUuHXCMsMdDdDa/FH9LkBQ
 l85620M2Bz7nyJBaYy80FTARb0MNb+y2YDQGXvvEWyFXFqmqcQ
X-Received: by 2002:a05:6808:1a21:b0:464:3d5d:d9d4 with SMTP id
 5614622812f47-467572d38bcmr1582676b6e.39.1773408284383; 
 Fri, 13 Mar 2026 06:24:44 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
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
Subject: [PATCH v11 51/65] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Fri, 13 Mar 2026 07:20:16 -0600
Message-ID: <20260313132103.2529746-52-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f101aedb49a..d877d0a8c830 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.53.0

