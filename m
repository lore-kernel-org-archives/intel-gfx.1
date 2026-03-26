Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3134FFF494F
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897CD10E6FF;
	Mon, 30 Mar 2026 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFEkD2RB";
	dkim-atps=neutral
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708A910EBF1
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:03 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-41708f6c3feso861726fac.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551363; x=1775156163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=HFEkD2RBiZ+QnERy8d4HYH5M3Rt8TCChNjU4ulYuUfrTdbzOS716n49p7ammYpfhSW
 6t37gaOfohwdNmoZbFprhwfSs/zQJFWmzm+Y7hqou1FrY6t0EWjuQAUpcmIoDuIPkijU
 8p5K0cpH5Up113nV1/2DS2dHooC8WLst1h2GcaAmQx4e+DxRNAPQxc0wR4T169v9Yj5o
 Nsp5wxf/4XNacC6lDrKj1PICVIn7kjqxXfNEUQmICicjXkIuopk2Zgs1wL6/9BbbzzpG
 5D1SS7smoxRv+W2bJWgP92I4NuZw4u/vv5ADf17Hs50MCpMow4gcjm41QpNEj3FWBAUD
 VH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551363; x=1775156163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=mHknGQwqib+TwfpKS+yGrsEU9HRGGB6/QfVfd5cf0HnbY2NMAui0LHt0IrMBRMDcQs
 jiRyRQSmPg3HBuHJx8oJuMSUc6b5m7V3lAeRKJMsjFvOU89QF6UXIiALC+W6M7MPs8nT
 Nf7Xqyw2/K2+N/bos/C8auccf64sl2UExq3h9rNz9RiRsRfVkIvJa7FoU32D6Sqb0nlQ
 EE57mBk2qaSEtdz2Qn+pgxf2y17zqRLWvEcPiBgz620hCL/azI/qESpQNXetn87S+HEH
 i9twngGmERMvW7nEcuRSg9nEdw66hYhQUrmGDTn9GquB7kNd6yW12p31ZOcTnvX9ONsC
 MWGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMYNcyyvzdXDfoGYmQyxGxPUM1yC/rl8jR5U8pRBjSGHzYIUhaHWjqaqC7Cf7rBpCFa2Qmiu9gKMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6odKhzd3KIjCse7VY7vGGwfhQtOL0MFlbU8V0XGsXjeJnw4v0
 OSAye7+1np5XBQURKlHnLFbDJpiSjdbeItqWE+1Ii5IsdzNYCatyaUCV
X-Gm-Gg: ATEYQzzFh5qAENrw6RD/r4XO1a37urJjqSIEgNVogtEFTF430aVRrryrsFqp9KgwEfi
 n6cMP4NHUS4DorpW3IUluuKgGVfvhnyE54bUrtYHnivz6eDt5LAydaz1kRslgGN24H1WHMrTyvM
 rPIT+jsxyFMm3sKH85/gIGeeSNV+jwnNKhnG15zCQNiRzujaYERZ9Ym1eBB66f5x4RUUDQ5WMXX
 PIr3r2lflX9xRdtqyUgB1sBkzJQs1oh6irs5F/tvZXv/xpq0btFpAtRStCz0aU9ZbAzcTFqCCbv
 7wD8+S66vwbznbUVQmqnRiW7amXj59YUcKFzY/lAectYkC6h0O8eBPcSHhlHif66O9qYzyhAlOS
 mb5bdiIIEaNj5FUc+oF+k1mbAnGvb/9SN3tmeP2tPDpifUcS5ZPnRSCLeH24i96JaOqyAPusNZ3
 f3cTpV2HfDqpoIMaeQ8BcrWVlea+RuczER7qxnYlDdZrJYcLjq
X-Received: by 2002:a05:6870:6486:b0:416:414:bbd7 with SMTP id
 586e51a60fabf-41ca6e689c4mr4624024fac.21.1774551362660; 
 Thu, 26 Mar 2026 11:56:02 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v12 60/69] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Thu, 26 Mar 2026 12:54:04 -0600
Message-ID: <20260326185413.1205870-61-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 Mar 2026 12:57:43 +0000
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

