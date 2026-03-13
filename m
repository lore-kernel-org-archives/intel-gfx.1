Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959F3F483C2
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5207110E5A4;
	Mon, 23 Mar 2026 16:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="miC9CbxZ";
	dkim-atps=neutral
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B710EC16
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:52 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-467161c4b7aso1095876b6e.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408291; x=1774013091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTjuYz8WFf0eQNRg6nVDQpGTB8XKqFnwBf6Q0eE+UZs=;
 b=miC9CbxZA3Q2OVb7/3qLrlGvVdfoLr0E9PEeQcJfx5QYJTRR3/RQNUCoKee6T3a0qZ
 qAmjKIMk6XVo264IMUjBdn1NDFI1DlyUMK9fgPQCW3YlS0md4ZQIo+DqiQBowZL9CVKc
 jxopzN9BGdKhGevF5YZ0jOaXbfo90qQqGm1VpaxpsSR6IpCGiG/84PJt7vwlZaqHX8yZ
 KMpLU5hPOSaj13+1sk+9Tq6pZhGIU9vV52Tndh7oUL2/lWTdpNe5C/GsO1YPlmCA6dpD
 ZUnyGLyYJN7rop6lgwdg9K7qzGvdLs6zrEpd78WEndLO2dEDtzw5OIgJFSAI23XxnHKu
 QkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408291; x=1774013091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hTjuYz8WFf0eQNRg6nVDQpGTB8XKqFnwBf6Q0eE+UZs=;
 b=S20os6E6y9/TYyLIBpalPj8flzaGSYmzyc9smbaqE0aMQ2qeR3ipRD6ph603WMOmIf
 EWL/8zeLwLhFH4d1CRYj5zXx89XX9o9hRq6+NWyI28juufpD9YanGjTcnURjdsGFGNdZ
 Tjkk1hDMBTolx924FVARny/l5QwpG1+9NiMKFpvVaXowoc8IWaqQtqOaf+ORangxJJdE
 QwpXEOFsqJr9nJG0C8XKi6T/6KmUkW7wT49UjcMriqoSK3muly8U72avu4FVPEtmIahV
 KMcwQknOGN+TBU7LJxBt9UhrzNi1baIrXJZ8t/LeC+LdkpiiwkcDXnLqJDjzbvIUyZKX
 AB3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2NJ0eb8G9AViCCShxA1UkjwWtTscoGI1lRASQde2GQCfomR5IxkSPfyROrY4HorvdAYZfEa/o/uo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqApIuEDNb+2Est6JE1hEuXHMtQ2svl6OwNw8SxlJ7xNIXRF5R
 S3anZAgD21ypoNlVcK4cRzJQFMwqVPdtQk9cYMpib4lH9TVbEAI3BOcT
X-Gm-Gg: ATEYQzxPcqKr+DVpTjjRFD4VyqIczs5uLxMQTIqvaZTqRg0MoDHh6MvFHfJ7tsNUjFV
 /UXdw1sFlkAn+70gXKmdeBOxitKROgMq4CfOwB51+Wf7P7aIr4JkSH5VAwLiC0/LUm1gTyNlcnt
 g0/WFv66jYqL3InJUsFzH+4P58DzwIxdp3kn3mQLirYpuCUvD0NPmYlu+bcBdrXJCIB160mYyH+
 Y1lqqvoiUgr1h+DL4xof2ip3uS6N1/oP7R3kdQvSzYelWgos2tjlA2sU0+e7xfAdm+fi2JsdUbG
 YBGd46E6QY8Z2O1ZywpXuQdUyxV1Z1ErNC2D2bEFuBoSZqk3aVipMGlv+jBF9nwvEidt/x6xvZA
 e6fS8TxJQLZ+KzOLieZT8CuzUDiCf7TmcJ5OUIjyH/K70o2WXv+5w/OVLWud2W1hva5ndSQeXki
 Rw51W+wYMOYdwl8WxqQ2sQjJ9aNfT8gDjEKxBOHxPxak9ebWQ2nnviqIupNK0=
X-Received: by 2002:a05:6808:3447:b0:466:f6ee:5bce with SMTP id
 5614622812f47-4675763031bmr1507247b6e.56.1773408291458; 
 Fri, 13 Mar 2026 06:24:51 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Ruben Wauters <rubenru09@aol.com>,
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
Subject: [PATCH v11 55/65] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Fri, 13 Mar 2026 07:20:20 -0600
Message-ID: <20260313132103.2529746-56-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index d0122d477610..cf2692d89bc5 100644
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

