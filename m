Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E594EC01DF
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243010E467;
	Mon, 23 Mar 2026 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKeTrWaO";
	dkim-atps=neutral
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D02110EC13
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:43 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-4672076355aso1531119b6e.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408282; x=1774013082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=cKeTrWaO8+7NbjvlsLvxuJdULdr8/5E1ueOEF+gFvVZT5/OfTShPZOtz48zOx0P9jj
 L7VRYk0b9JURzCuOmD6iprkxhORHgbHP7aGyMjFiMV+tCILx69JoO32SpRrpG5Dz1qLa
 lY8chmEwKPvddi1oFmLWBYV5z6/iCVZ1AgnNoPZk8YL1l+GwCH3AANM/sIZ9q+G7wEKR
 q6KxhvXyN+7XsoRDXF4J4YdtDz1c4QnfoxSsvaV5evo8UHI7x1RPgr+1iMmZK4RHFOta
 9ZEqML1c9B6gOvmTUcbNev0Zw+frDhx8a0p9eE5yOLZ/NWh05fhS2K0TpDopBEQknjgI
 HmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408282; x=1774013082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=OJjcZJ9+dEUaIF86A/jzknEznXOzm16kxfTfj5j4U6Ho2PG9K3AVMQmdMrrLnzRMzk
 9ouB3VjiOY34ff+bhvFSAq2QlXIF5MDAqPO9C7JuRwb8KpgTUixLnxDM/4FrZV90n0CP
 ur6VB5xov2RCl0KCuuBiIE4Dnnp0/S9OEReauebiQoSZoXDiQRRPFfAjPrwUmte5JXhk
 G3ogkf4CbotDjrb05espLRMLkDbmwINP2mTMa3CUCLjf6S6TDbOfdMT8FgIfi5/qm+zi
 oSL6aGI6JBn4gNkMzqxwZlTisTBMxG/KEN1qryFwtqRiIGdYokmtDQLMkS7lpwqABIKL
 ym7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgSMHp5uutZ291kQ8MFKG/GvwdJuy5hjGU7keRhtThI4zhl1AtBNOpZVBH6+0K8ii33aWbdv/Z/x0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA8J9ETTnvmtxKoj8mf0eLehHMSggg6IxaMlVogcUkwqbleYV7
 o5qYo/nbBjUrd5LbtPIg33CQuD0Drdz/zg+t4y/01RznCTqCVyQvpXX9
X-Gm-Gg: ATEYQzxyQM8p8wh7AVXXJLoukEKmBSwdBPyhEiFBoKmCFga1KLunkIgGP+3Mx7LGey0
 GZyBI5mCCAE1TYuItjT44Z70/Tdr0karSAyPunAM5D5D627M6iVa7b3tJ8dzMA0vUdKc9v8b7UJ
 L0yaRFk0V6XrLMUFo1e2P7kk4MN/zkfNH7MnEUPaR3l9bMZfaPINym98J2raIEc2VT4YtRe9Hs/
 ykSIr2l+GUXbVGSp6Vl34liEOWnSAH8UJtL0/FPoRyUHMSfBdY6s8UgufSsAR27uM5cVMoxbea7
 BG/guSAAtAmHjWd6LUmH5Juu1MAcdeuE1J2/z0Y+ze7lGAf2ROUYoLOmQM7HDNqvavWTomlTMFK
 OnjoitMXhcEj2/JFkDj7cC/660k9bPbBVktDyqtX2NHgPQOWODRUDHTR5NyqgXicuc4eVs+XAUz
 AkvBdpnPHVQ1ecxbqNYNkZ0z21MoJvGW7141PJzTodznIe3Ds3
X-Received: by 2002:a05:6808:c2c8:b0:44f:78fb:7b11 with SMTP id
 5614622812f47-4675753904dmr1572573b6e.39.1773408282489; 
 Fri, 13 Mar 2026 06:24:42 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 50/65] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Fri, 13 Mar 2026 07:20:15 -0600
Message-ID: <20260313132103.2529746-51-jim.cromie@gmail.com>
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

