Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B0103D959
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACFF10E746;
	Mon, 30 Mar 2026 12:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mj9P+dgz";
	dkim-atps=neutral
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2510EBF0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:57 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-40974bf7781so1893958fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551357; x=1775156157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=Mj9P+dgzDwdhPEqBHMNGeOF1x5WytNOWdAS1R3h8ApNSURK0dDaCkk7Em5A67zQGXE
 /cYTajPQARaA0Q7Mcv12PfBgNwZ5oQpM9KEzdoqsM+uCTWkj/K614s+7m1M4lPV2FqGj
 kNWriKbUbFc8dbkpNS2422M16aBpNVqsiupHMEbLUFb95eNj3QFNnVJd6bL5wXnn2Sv3
 eTDIlnej+JrkTmNTsvXz8hbzxRHDeLTMXmnItErF9NgrQm9JOwahvvwS6dAlEFGg967H
 qBiDurL3Pm/H4RLHRUxfdNL/Bwdz461poBO7jieXsL337UrF0eyklsmGR5UT9aeRzs2G
 MaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551357; x=1775156157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=b+2ssJHqUsnyehJSoDVBzzvIcOGtLybvylOLKMw9A+kkR8EiKi7+irw6DE8yWSrSEv
 LosKvbU/crCen0QzrT1Bs9GsmzJpb3L0bi8L+tMuNueQy0MRxw/dfn+pm7dFL87qxjcI
 xPGAXd4mpu6N2r0Gh4bPQO6w4CrbuLjJu8Wubisot5JYUtSxqE/cAFalOD/8bvwVgYOU
 WcLRolZ5LZPvTCflA/lfdt/9U4COq00mRKEwdkC+1TMsuGquq6ugPkjbpU5RR2RHqIuJ
 ZF3qqoPeMgbarqHmQK+in5oHYw6Aazw3994s+N41WkUKmC2mHqOrrjSpB115uMcU7fjM
 h07Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0P07/xniJcW98tloS392nuEYA/z7VZ1eZIB2tHsQAzVr8X5dpw/8ZWLm2+sNn1IUJITQyDK1401k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUWnvyHBUUPzBggzMK3rDGjG4eTkF2DQAqi50TRgOqp1D5W6Lc
 AYsxRLR5iJ6LBWsApRDfG83seELYxefaANe+qJpKmxHbZ9SPP3mefF5vffZh3A==
X-Gm-Gg: ATEYQzzpMxjm1gR19QrkXS/JbHoS8taKEoItFpTPu+yvFt6reWM4Wcso2jfNDIhzua3
 FSXaIpltTSdmgrw04VenkleOuIPUa5l00ZBEa3Q/FpHhf0+IF+iFpNd1uHEeHQA34XtVN+e/vm9
 BI9tNUHcKsRP4/ZEBj8BPkKcHWVqQ3Zzvp5ygzmWEoqBy1Kv78Znke+64nQS3HG98R5LRmdiN43
 INWgcu/L2UWxOi2ylUx0j3Zex/QAoQo2RFdCX9WfyUybQRG5xWSx0oGqZykpYolJHd66pQkDBNK
 8hiW4dHfhEa24raR7GbjndizFUfXifAXd51/sVaQ8A6Q7ETa1B2K1tEoBju+7yY/z3PskgIrcF2
 6/t7ieR6KCiyvUoXwpWwxVQJBjf049EXuEkoNagZnBzAzXikyIoRtoJiT21qYgpDFfPe4Tx6AXL
 a/YFfFW/Wb5cUtwtaNgF1jTbMDQNbYWPW2Ml2br0cexJoFnFaD9PayxnEfAtM=
X-Received: by 2002:a05:6871:4e41:b0:41c:4cd8:4e8a with SMTP id
 586e51a60fabf-41cd7bf490emr1301986fac.15.1774551357153; 
 Thu, 26 Mar 2026 11:55:57 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:56 -0700 (PDT)
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
Subject: [PATCH v12 56/69] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Thu, 26 Mar 2026 12:54:00 -0600
Message-ID: <20260326185413.1205870-57-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 87fd6255c114..a7133fb6377d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -254,6 +254,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static bool radeon_support_enabled(struct device *dev,
-- 
2.53.0

