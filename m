Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3BB10D14BE
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1110E736;
	Mon, 30 Mar 2026 12:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJhJjzTm";
	dkim-atps=neutral
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6011F10EBF2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:55 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-662f30d3f1fso1458494eaf.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551354; x=1775156154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnDJitpTduufuEe6X95vH8IiBFUBoxeB6eQQOPNaxFg=;
 b=mJhJjzTm8qISXbzl5jpQyS4CG7SCSUDLI+0ASdFjNJPf7y4DlBcsex23kVzT8MpSo6
 HACOvlioMgkFt28hF3c/KTn18MFDVP48YOtG7eu5EAFChuNzUXatsVZQtwf0ud8TSdTO
 138YeFE+469ngqVh/LUjLnSkvSvW2apoHUvgGmNebys5QOiv15unTYxhmU0UFda7mfSh
 G0qioJsLGmUfxRp6nVZFavQgdLnlcJIh1+NfTsUqeA2R6gG40bZezwE33Tzczx3JZpUj
 YvrXb0d/8zbbBH+ZQEOY+eUXbK1tP3dh/WUEmD+RS5aPDPZqMkLEACukCkkruVG+7xus
 kKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551354; x=1775156154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rnDJitpTduufuEe6X95vH8IiBFUBoxeB6eQQOPNaxFg=;
 b=sVTl4iz9diDx4byjfr8Kl25uyS7/3907ftMrRxuuGe06LrKH/IzcOR6Pp1Lq140n7b
 9z6899QQ36ZEfRsgChqnLhwjBuzsAkZDPgw41g3WS4mGMYSQ9PiG6d+WJZ2MJ2a5wah3
 ayFj97gsoQWAhR/yDt8DZYkYeNEh/WXG1bLOFQ40hIt22CdqZ6Cr3JAhm+bAehJW2SWc
 hKkXHd/PA2a5OvRnCXMs0No3I4blWdTfBQsI7+oo9h0RTSknF6/zYezERGg0R6NETx7W
 2D1cHvi07HKgtkpIjP4lpE+vtWfoXEbQrWWzIIs5VPYCitFIo1NWyj/AJ1Wb0ZyXrwHv
 cVPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX643LRNgf292BVFZ+Cr7ILYVTDx6SwXfYu1U3IyxgjmtK2mLo+hWtl7ZIF7g2UmnSBzINSQLTPghY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8q4UZXB56lXuMTNURPho7/74/iLPYi7SKR55BQCk1zI/37ez3
 71EeNgHzDNARd2yZ7dyerOWHdwuvb/1waEwWCYPaydUxm92XLg0wE1+n
X-Gm-Gg: ATEYQzy4RjXvweRu9C0jpEkvr8APYHcrNhd3XNVg0VcSmBNGASD91aGWD+DHr78QXE5
 UNI8Hm5q3Xf0EpL1/ygHhxU8YgjPN0IbvJT4VrSNxp6xxwQcATcpZVNQypBKhN50bhDB+OSPZL4
 Qdmj4mkG+po+Xcv73ksDxJ7P+eRco38lqcAPUAx2HFP8eXCmRjABPfE+Piko+7g8GdsoAatwwza
 bXFvkiI3HjU4N6Yx3SHhKNktmmDYcZGWZ3nF73/ZD7jdtz2e5KIJvfhS86c19ravC2w8gfPh4+O
 5a9qnjfmnazijYn4kvPIdNw5sPSo6urwiGRfkKMUToXqcN6TWgodB5daDNDQPFbKCnldpvCrKd/
 puFZyPtAKgU5ONBdVLkORNQklbJHEdSVh9NZLdLa64yyOOIix9ia+yUjQUFcgygWWIBM+HJ/5oT
 HByHNCbV65/EIpArmlRUdpK/MeHLv4rBnTyOPXIwnIykJIg0jr
X-Received: by 2002:a4a:bb88:0:b0:67c:2bfd:24a3 with SMTP id
 006d021491bc7-67e10ce7d8dmr943404eaf.20.1774551354565; 
 Thu, 26 Mar 2026 11:55:54 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:54 -0700 (PDT)
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
Subject: [PATCH v12 54/69] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Thu, 26 Mar 2026 12:53:58 -0600
Message-ID: <20260326185413.1205870-55-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 08aca9035fc1..ef4423d4987f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -26,6 +26,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.53.0

