Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF448F483D5
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFAB10E532;
	Mon, 23 Mar 2026 16:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewo/WpHF";
	dkim-atps=neutral
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513710EC13
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:47 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-467161c4a1cso841995b6e.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408286; x=1774013086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5CIU7Xv1sd29xtDEeVm5EwbYfV92LBvg9qr7+GGg2w=;
 b=Ewo/WpHFfm09kx5VmoNF8fezqzX7lZXSL9w261wvhsvP/Vmj0XQqLxSDCJMb3crqcS
 ciOSFuGZZBwRsTScKZ3f4h9qqUeM2/pyxok7xJO1x/A0HOuWMXPPBWCqysO8qXVm8qVW
 BOoMV0KqYp94hvNyx5RUqjwTjVyc6pC27hMUaB0Va99EIjpVDlw0GNN1CpF05TDfnKvC
 aIrlEsuLB7mNcgWWzOv1aNVgdzoo+30kwkSa7S8n+U5ZkUWyCpCi54cWaOvc9MzfmVS7
 2M22QOwxQh7bEApSPzIYqYrBKOQrJnKk8tm4or5jlHaizuefCY0m4rn0SE+8FsQqhhnu
 8Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408286; x=1774013086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z5CIU7Xv1sd29xtDEeVm5EwbYfV92LBvg9qr7+GGg2w=;
 b=MTaCHf5nk2ypXOmI6k61CUN5FESYE7wV3p0uj6q5OGvV56e782bYT5L7dRh/P+aAmV
 VeAqT+/glW1760Fw7gKz7LKuE9A/7thFkC2VvuUytIo8mJCb3GkIxkoOHVK8tTbnSdMu
 AZo+hoiqLklG2YN0OlHmgpcwkOyTnEwzlE36LSPsEbhg3QikumuQQBEIkogdhJJC8RC3
 S9c8d6pCpMaa7dHjPPG6X6gTe6fKDS9GnWPKGEK+C9+FzO43Hh1rfLn3Km2NO0YQx/3Q
 Y6Cpd6vM1sd53Dg0bi1W7usS7aHF7bVqvx2ZJ7P9rG7OWxewdYqS1DcfhGdRFSYzuLiB
 qJhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8daXyFfvpSR761+CgwKDPqweUWwMQ9KJQGfmFVblJutwtaB4Rbn6+W7dOmgRwVtju8YdsHMYRNXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJU06/HCHiSNQbqhBXK+Fsj90Y5b/9WPdnRJ2LhifJ6XJotDdd
 sOAlvVbq5kYhumiJLMOLkxNHoTjmB+Vi47YwE5CGKfrVJ0k37LYq6y49
X-Gm-Gg: ATEYQzxn2n3s5SeRiie4+tEvi27Q7t34boq2GwtDovWHSaBFRsuYn6eDTwdqNW41ixe
 Y/SOQPVPaFaZBBTzD2rzAJ76dO3yw3mB3PldvebAbgfGG8x9weEiyx6g1Xr+OSO8JEkPXiKOJDz
 d4WAYG3ss7g0qRlESk2z+TSGrJGGuf6uM/JlkPyBYA33X77wVe0NyMZ32OTrM9rtIob1unw4lEI
 aS1iF+4a5amwMbbC+7/vdHzKdpVE6ITtcDZgv+zq55xESibOcEgHtXbErY6ULoVl0EArCVe7jPZ
 +lOFB//2T4/SVWC43OF8F4MjeTSff6EikafgoHPN8Q0uotdWu6ES3A3Ns0bZQZQ53OKOZDIo+FF
 iOfZyYhzi5bspKWLj52bXwfGGAMo1kcEuASLsbEF35sGpM1ut3o4R/SA/yTAvSMpapmjeH1myUv
 hWhDjRr8kwOef7dMws/YvhCxeZa5dafM+D1SSRACoYm+n7h271
X-Received: by 2002:a05:6808:1302:b0:467:e7b:6fc4 with SMTP id
 5614622812f47-467575dca9dmr1665945b6e.45.1773408286169; 
 Fri, 13 Mar 2026 06:24:46 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 52/65] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Fri, 13 Mar 2026 07:20:17 -0600
Message-ID: <20260313132103.2529746-53-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 95020765c4c2..e22c15f045d1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -40,6 +40,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.53.0

