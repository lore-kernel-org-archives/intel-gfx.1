Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F43F10D14B5
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A207A10E74D;
	Mon, 30 Mar 2026 12:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AceqeUAA";
	dkim-atps=neutral
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1710EBF0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:04 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-67934c83063so567343eaf.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551364; x=1775156164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUW+eTRlaAbHOLDd6X1oNyvzhDfkwQ9M9VIyPQZn2Pc=;
 b=AceqeUAASmYrB+Yn6vZD4ll2gGiHJ5CYXL0iGLMhrGLcPDLVtxeXnf26V+x1DR90de
 VShXFkgux1UEott3lKTJgyt4S6J2kHP24YDHzDEKgnoEZ7pKNvb1EueBxIZJ7uE6GNbu
 WrNSxTORF8dNRsraijWZrTJjOsA5/zD1KDngeOdpb7mxDxZqDW6gMfxejYnNa0UawRVr
 fx8el25nqspEj9LccL6PWA3IW682vxLTQ9zgFX1sY+iPYTvFZXRiRUOHhltzWOgL5dBq
 fqjYSPDI8dAbBKLYe9kl+P3TKteEY1Px2vnq2VCLoppi8t3ZIbWnLRIkJvwM7oTna2he
 49VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551364; x=1775156164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jUW+eTRlaAbHOLDd6X1oNyvzhDfkwQ9M9VIyPQZn2Pc=;
 b=Js9YgwEVa9xYu1FG1QRDqje6AEA2RJvn/dWRBs2hv6iCxE2UeDz6g90Ta+BaVbQhnh
 W+RbebCyNAJuo/X4yuw2jc/P8b5fJyVshXmbNyuBm2EW+2rHvQSaA6gsZXbWTiUDaOYH
 JpNdnEj1H4YXkuneazxldXSBE3cohR4nXy9DOTC+wMWglrzY7bb3gXi9jgwouFABvkX1
 UBCcqCIvTF4NbEQNP9ZodiHO6wBgHMjegLbazCPLxnpzyjNGal7rv+QK3GSRPzwdXsZy
 PmSq9hHDHr3Nr1lu2oS3g4yyPLieVPB82htQ41kmDsclsZIA3NrxAjbGJts2WU07LVil
 RnWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+855BZlmzDP9QK2vXeZwRPo0AqYI78TFKRf/OQ5imU+s6PJBDBbUbC5+tXiJyTwC6JSxP0nzdg4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP19IltiJK0lLFWiw8OdsKyTGjPKR46DQLbPPgW2G0TIWEPi21
 +9PZeAhcOMANOIOB9ePM7xW5F7DmGoX4lDTY6Zl28yjdfpnLlznVq35A
X-Gm-Gg: ATEYQzxaWsDuWsTZXtgokS3mDTFohPg06Ty06AuMYgLpT4vmOq51ITZ89arh/gBB42s
 PL7B2x8DXBwDAYLUiLld6VonrV81/nh3F7/IBqfASdcqulm8D/i2nx1t24ZNyFWbBIwhluq+dcH
 BNm8+H6rni9K+e5vVhXaJB/Fj4GHjccfsj1XiN8BRi20zI10IbQSHYZm1TZ5IrlHZY6fQBwATv8
 hDn7KHIGl3MA3nz3Egh9llmJbV9QD9gsAtVdZji5BwYlrickmR4uEg0xp/P337xgTsHg+Kf+0+A
 zhetnpxV27nvCEHSsiTvP454Jv5hxVW7Q6zQ+2oEY92wPSux3UwFW8gAZz2cf90OUkptE9PO8UU
 CvgsZSms6LsqSfIvhL/saoWNhD99gi7DZs4AXLAAfXtLIQRkASKmcDSROiejSUvi04F2UnlQLRN
 XCxv03Yc7bhKvXLj7uuuwzq14cpyUnL+tCMEl1RAY9IHFznBg1
X-Received: by 2002:a05:6820:1909:b0:67b:be3b:ec49 with SMTP id
 006d021491bc7-67dff4039b0mr4290155eaf.21.1774551364004; 
 Thu, 26 Mar 2026 11:56:04 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Ruben Wauters <rubenru09@aol.com>
Subject: [PATCH v12 61/69] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Thu, 26 Mar 2026 12:54:05 -0600
Message-ID: <20260326185413.1205870-62-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Acked-by: Ruben Wauters <rubenru09@aol.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 17c2dead2c13..c49f9135dc7a 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.53.0

