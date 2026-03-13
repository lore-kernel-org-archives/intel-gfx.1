Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CE3F483C3
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A14110E59B;
	Mon, 23 Mar 2026 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy2pEatb";
	dkim-atps=neutral
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643110EC16
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:50 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-4671cbce626so1073286b6e.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408290; x=1774013090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=Cy2pEatbmGnoDRrLfCijQ5Qka7X715kGRZl6XvU8E5Ha7mV3HsiKtgOoJ7BcQ9P/hr
 shN8lfkRgtXwwRXFq/1IMrYBqJRkLsBzcLCpbIgakMYs1Q3azBDH9f2RzT1gC6L/dJxP
 aX2AUwpIlGIgPpqpf70f+5fpyUputSEhXKPVrsYNTCtsEXGxzFDEcRl9DnOWTB8rlQT1
 1eyqhG3GiV1JdoSF0/GHcTMWUbbpqoJCJzeGKmSDqPJLw13W1mGHiCjAprRORlf4eMEi
 gbQB2HuHmGthvQWo2DzE4TUg/bQPnN0zR+4ZTI4TUvmtKoa6ibSNzVRH4SRJi57rmgu9
 HO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408290; x=1774013090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=tAZVdWri3YPpk7hHMyfwes/3WxBCtiBE39zR5GLFuUc7ZWyW3MIKyImljXr4ke13Mg
 W/k0VRfm7qAULJeKcV5SB3wMZdgnnT7iKQoq1eCHBHaXS+xlHXyLY9yXxebAO3nb0xkE
 05cCGWWRI8jommnXg41IGVSB/rBQAp/oUNzxv0hNw3NU+fMV4gi2jwNe7mV6xKNAJipd
 6a6MSkyFcVpctGdRfwJlZWy7p8zh1Or2KIyhBK/RYfc9u1VgvYkcORQwd13LQ6/AjLpK
 k/JAkvh0zoczQZDPivyDONp/Urqz211nvgQlgTo2kETwB7NJ5m7Jb7bvFH9o1rCpTn0t
 S3gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV/B+F7Kkv6HJG6mD6Ovbo7vwoxRQ8xChNF8rsRxCDfgVyoDskf4vcIEbI/SV33nRrvh0lrnsJBmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1zrRL0Wfsk9VpWdUbi9zNlTOYcxgjn7j+hR0UrZ1qHHjAbyM2
 odgLUwiflvjeYxwtGc5Kn12QWSyKTBaZYd47AjwGv8Q45adaw4YYKZgP
X-Gm-Gg: ATEYQzzbPNjEJTcmFAKWY3+Ggr9z7xWnEAsjFZVPPqUyKB3KPW8QGOGS7gb4GjtMQR2
 D1CsyIQ66gcv9r7F4DVmE+bVjmIJXd1mP9ngDW61qH005C2Of8Enf8rhLGRcR711IxPZAZWMNH3
 kZFzgeoiL52ZfK1nygFX7eX4kk4eJt0U2vmkRMAMZlenBj0CUdu1yVdyuOyIu1ixyPHavvVm2Ye
 9CpKQf3sJe9X/tJaTggxj164Ft/l0skvXJ+Wkklsp+ebqJ3aOmGlPa94r8uiJMjacpoTppIIqst
 ci/WLkurdbZ2trxdYW74o6AR9lHmA9Mqw4IroUSPvDjunTx4ayI/ynrWQTbd1ZjXW5LVwniEK8p
 agJIbdrgASwwLz/3ZVcOMM89QsrMeeS9QzAzxv/mbzB15cUfSV26gwhsaAjqGsXPunbnprL8VKV
 jQzCTxYBbOgaD/9WZq9JBnSr/mBakq2vQ39QaDYaO5jPlgv0ie
X-Received: by 2002:a05:6808:2386:b0:450:89ee:922c with SMTP id
 5614622812f47-467570dd9e9mr1673636b6e.27.1773408289722; 
 Fri, 13 Mar 2026 06:24:49 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 54/65] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Fri, 13 Mar 2026 07:20:19 -0600
Message-ID: <20260313132103.2529746-55-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a32be27c39e8..02a703e5de80 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -28,6 +28,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.53.0

