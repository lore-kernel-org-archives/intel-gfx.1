Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147C10D14AF
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10610E6F7;
	Mon, 30 Mar 2026 12:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZMkGPyal";
	dkim-atps=neutral
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9310EBF2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:49 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-40ee9b945d5so940655fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551349; x=1775156149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6v3HiIDRukL8wqePVR5l3Bo2Gj7Iv9DgR3CyiTeT7DE=;
 b=ZMkGPyalke32jfwoc3i7uNz2Gb4x03y5A0A/4NUvd4qEd/w+Xcs/lw2QiPsBaHEZRU
 PiMFJ757QHujz2cHiVEf0fi2GwZ0pb4DgULx2fG8snpGk62w1R+GLy6oWm2yPiWgy4b7
 eyM3H8fND1ubd9uZmjDiwGEHpR4WdhPXQzJp7X4oAkV2Kyh2J4LfuE4eCcOALxh42Lcd
 6IBQj90k0/TObRrz/b22rs4xTHG+9NUb8tM7s0XI0vOqurdaBrxY9+Zj0Rm5s+RG6Ldq
 OQewAhcQgPYSpvjo1xc2NPtqL3/u+k07pKLWN3Dq19qm21kbpbeRulikonSVppnA4Ug6
 5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551349; x=1775156149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6v3HiIDRukL8wqePVR5l3Bo2Gj7Iv9DgR3CyiTeT7DE=;
 b=Uq9cVdIY0dh1M+lJpPihRR4Vjrdju739OAILAOCuKQYO7fyDsnPafIORYvGUT2QsMU
 YhP1hUTwZMHNWWDnVOO5Q/YktO4ODehjHjDFKxpREwVfBQLTcnG6fPKqjeyXRslR9XvV
 tabyr9mc9tVm1rwnorowJeg5R3vmHWQuB+SeSTkJcpqnRlFx9ICaKrYgNLBIRc2L7KDg
 cJnqps/SlAOMjJwyso9cE5xJZxXiH55Q6IjOi+AOQ5h7fK+Ny4OX18+8/ImrdhsBBlza
 1UKAuGBvck63WSDfUktYu8GmUaoOqBTCi6hV129T9jRj//L6K6oFT7CcpdYfQEudRzmF
 viVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlkwpidHwhJAj2Qor99TketQe9wZH1z+X2sKiHiDGin/+Dx4pHawp0n6WRv9OW1WDPmsbJjrD6i3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa+kGfcJ21bYH4LWEPxaSI7tjiRKX2sFAF4u5iUtO6xDxBmc1b
 glAen/sp7pc4Jo7newPOqKxcbWFYfW1/xTxcWNxuIeu8mfKFjIJ7opIk
X-Gm-Gg: ATEYQzwsP/gPA+4IMUBPQyXdD1Y2ZrJzWAlwgUSbkv4bm5a9nxLZhk8rvkk31oL5rZG
 JIR1KXXsEa/R+jcMSCoaKBvIuUn6gjgzNPrGYvmduiUaK0F24UEp0FCExuajVGC4rDXbkCHw7gc
 CNff1h0xsva46LG7wVzdT1pq5/YvrK875GraftxObR6I2lxgfs1aPXabkmEHN3RswKmaGwnqW56
 JVU1x2BUpLCUgBqn235Z+tQ61ZMDGJnZdBVCkmgOvd0pfoJTJBnV6CGkVvR+tYFOG8eTsOHkiqR
 2kWUj9rx0EGX+VJ7tC72IxRO7jvTEbFK4Q9AY3R1AH3qQG5MDTOLAuXIQ1UQNnORjQhi4eUqnOV
 ozCIAO353Gms0DH5Lq74slqMNKl2DDZS38mF5tf01FoNEFdOkLMPs1K1pwTvXo0ryzECce4mfg1
 TOhD/nxeTS2jArhYiE0vgGvZRvC+yGLWMCl52+z+e9vQVvtPWPoy3v7DwitLE=
X-Received: by 2002:a05:6870:2f12:b0:417:a36a:6074 with SMTP id
 586e51a60fabf-41ca71894d8mr4456214fac.51.1774551348686; 
 Thu, 26 Mar 2026 11:55:48 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:48 -0700 (PDT)
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
Subject: [PATCH v12 50/69] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Thu, 26 Mar 2026 12:53:54 -0600
Message-ID: <20260326185413.1205870-51-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..3af476f0449f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.53.0

