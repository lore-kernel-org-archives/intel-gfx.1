Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9451210D14B0
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD4110E6F0;
	Mon, 30 Mar 2026 12:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kL9ayPrG";
	dkim-atps=neutral
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C7B10EBF2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:15 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-40f1ffba6a0so829258fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551374; x=1775156174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmHuo2gpKk+a4rM0v+S94FJooBnanLI4bt90pYFjtcE=;
 b=kL9ayPrGAGqh+ywZ8LRrvxK+1hYDBHrCaEKVqh/vkdUtKPmuXX/Us/C1JKkIefzAPB
 mGdoJ1pY4RyThNvw8ZVyZgv6l1MUbWu+gjpGuzZRRpEWxk8ssRaGQRpoYE9AHt94ATgZ
 TYOrpVatRgnIT5mrgMq0WsNvx9d+09NlRVCEnobOm4TmsMQF90/HzWTjGfyV6TFl5ukV
 gz8EChw8AHVmuyTUKCMxiG05Ne3fgJYDNZCFx77R4C/4OsDL40njq3bDKpH7U5AINZaz
 5Dh6hwzSnF+T6iKbSv6xEzgL9j3R/PmvjwOpfoK7g506/HUaH2bRi2m3owC51cGcDri7
 O5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551374; x=1775156174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZmHuo2gpKk+a4rM0v+S94FJooBnanLI4bt90pYFjtcE=;
 b=KDb6V6G35jqddQbFIwWPHvVYABCC8bNM7MYCaX4L0fpZSTDFpRwoDRx1geC5zknvQh
 f7RFKXDotSvya61597aqDWY1JaTmAdLqqgj9F53YTf1qu5nFyw3im4I8wHR8FmNxVV/6
 Q4qTtXiist/j4KLWDVgYc4jG1G3gA7wk+10ILla9oHCYbEL3eCWWjHR3wkpTzcvG33Cw
 HBpVLBXnglA5YSBhBj7Iz+GN8T3dmBfnNdobpqWEUwYqAZrbPrIXIDo08IToPA7dY0a5
 QUDo3yoHPzj2FsvmhC3TxnlMNU3bMhgXyKo4DFpRWDF56l1rL0epc0uf1FU0jr+7uPyt
 BmTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU+V6xbK5jun0nJEcLwlINSxtyRNITgfiwV1p80fdc5UomX8RXW3aIkr9TeaKwnRNMX5MdTO0eLys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHO/t5JXSWRy6mfpDF2nqZox9LPPSv+XuTRH6S6ykkW/NY1orb
 fI4BkUV6falEwQ7RlfTJIqW5Jyyerc+vQkA/g0ZuLtJwwK0HGYH82Zm/
X-Gm-Gg: ATEYQzz/vZMHw4W0BAowB0C2Xa7gQYVu741u8tqZdOSEexvY3GoOjTrDIfN1v3W5j+7
 5vXRhUQ550gbHSH4sFXU4wGMXE6+HeJnuFE1SgWgzbPD1rgDVY1N9/ryJdsSLXTkY6sQXZdyfyy
 yOAmeyxYlXE3vXg/fAktpznxbBNek7MlOOAVmqxUYTPiFUUy2jaJQYOgJCW3IskAw0W2DnHLeZz
 H4PeJnmsjnqlvR69HvxylykxnceS+ZU9KtkNm96mYuJ5pqP9x7C5A1Vd+mCqM6PidpS8b1rTc5P
 ktEw7gSpLw3w/xscvWZ3xGnnffwGpOLwFl090jkYDuaRimra2ExmGHFOkAoTRhZTN4mRADPAvwj
 vkCbaKNOqD1eLRH2u/AfFOFQLeqRssx5HJ2tXHIi0GnWkg7A4lUcWoT/8DHg1EOe0SNbfSXuxZI
 tKAIPbamJKfbvHEXr3XETFoLB28SJiXaVJZfAFFqnI+JYKP909
X-Received: by 2002:a05:6870:d60c:b0:41c:5a3b:1afd with SMTP id
 586e51a60fabf-41ca6ddce00mr5003080fac.13.1774551374333; 
 Thu, 26 Mar 2026 11:56:14 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:13 -0700 (PDT)
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
Subject: [PATCH v12 68/69] accel/ethosu: call DRM_CLASSMAP_USE
Date: Thu, 26 Mar 2026 12:54:12 -0600
Message-ID: <20260326185413.1205870-69-jim.cromie@gmail.com>
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

ethosu.ko has several drm*dbg() calls, it must call DRM_CLASSMAP_USE
to tell dynamic-debug what classmap enables them.
Also include drm/drm_print.h explicitly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/ethosu/ethosu_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 9992193d7338..a0b8cb81a359 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -17,12 +17,15 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_accel.h>
 #include <drm/ethosu_accel.h>
+#include <drm/drm_print.h>
 
 #include "ethosu_drv.h"
 #include "ethosu_device.h"
 #include "ethosu_gem.h"
 #include "ethosu_job.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static int ethosu_ioctl_dev_query(struct drm_device *ddev, void *data,
 				  struct drm_file *file)
 {
-- 
2.53.0

