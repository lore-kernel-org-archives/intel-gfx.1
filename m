Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B683BD58B00
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9BB10E4FD;
	Mon, 23 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHhoQ1LH";
	dkim-atps=neutral
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050E510EC15
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:26 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-4648447e29bso834121b6e.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408265; x=1774013065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWuUyl3pJMGaRe5YpqoxGiWQwsY1kd47fne8B+3aeoU=;
 b=JHhoQ1LHbhboxKzHssmKPQavUUSA9XfexDh9MzwWt/CfUYvXh9u2emKWta+s/Lgi9s
 cVmZU5HRH+g8VRE6LxWxAqwy4sOm/KqiT98i0VsooX/633mPOAPYrNlAjlraNOSuOc15
 jxGKEa0+ChhjZvhvdlDUfbB8Ey8euoRQixOx3OV9YlcMdN/iCAxpnEhRSz+DfQMOJ073
 myeJJIGOmdbX54vquwxbRytPL7kimfIqXQH5kjzO5z/lj2ZN9/aZTswOWrsROZK/0iEs
 2rICOXrSdVrU//84Vn0TahNNtJZf9AeeTc+aCG5R5idzVKWb9jRb53+PZDs3ZQtTnmU+
 9aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408265; x=1774013065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nWuUyl3pJMGaRe5YpqoxGiWQwsY1kd47fne8B+3aeoU=;
 b=eMfLgZC9GO361z2evRjYVWIFrwTbLGdGmwbFSc0DTKcfglcLaj8nE9tutR/M9vhy9o
 OsCG9zXPniMzdoVtoJ5gxg5/6C1/EjPR481KmQRpfexxP15/Q6/xRqu0sI36VvWdoRkG
 2Tk+Fxj4q6cvqtR3i4YNkiagw4VBHPCdODWxM3C7Nigixm2AkMjAx9nM0Z2zrWir9FTE
 GGDJ+TluMA5lQTIWFwjcS/4Qq0taG/D34xHbYHhNQPP6tqzAAjAziL2g4kiSTcaw3V4F
 cjVoCnoJ/2K3BpHLHTqfmkIyyFJ8o5/U+ki6Wk3zgwTIZG/N072t23WJaeNAYoqCbw+p
 FmWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUltWc3VIbEi4dWyoF6M8j7hWJJgZH8Zdwf39MkalCv+HIIVqZdGzXlZrmQOOFx0iObJi5mE8JGYo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRzzq5yLej3cYOFwmSI2cfcXd09a8ovZWMJ6V4Nhku5lM8qT0W
 3FtiiSCGjHSutCyjWY+HZfr9chmlUNOyehZKAQkY6wFFeA+gyQq0k0r6
X-Gm-Gg: ATEYQzzmmm2d2ESjTFG0SmS3xX00yUaWu6SWnRDWJHcGWRS4FtwU66xIIW8jwLccb1d
 RhaBcr3b36SNWx9pI6DNtReRKMsxzaFkB+AeG1J0Gk8PwqUShtyE7JdE4mzd+o/xMrfV9ZN9QB+
 oiWfLiKD7jtLCFgNMKXKhWuwKVNi21o1fZ34kMju2ErG+DQ+dBCkkIQm3FDm2HFhAdDsD8EifI+
 7BTOCflEilWI6aE3VkbxnICU+vEQaWJjgvdHwQzd9ehtHZlY/sALpdSKSbqf+6agcFSE4xAlbt5
 8B/4QBwWyRkr4YlcFHrFiOePtDJjuKxe4p/okjqL7X4fmAhL6qKC8HTXRQT2jE9Q7N7vR50uITE
 fJ73lcGj0A67/WVutVPFBP1MyUCY+wBTyCgOHUFpVirZclLTlbJn8+XTnozSynAJIV5fbcdALit
 gCe2vgKdzZ2xHdGIcvdnFtybF16vLvzAjKoVil6yojniX4Wnt/
X-Received: by 2002:a05:6808:30a7:b0:467:100d:22ad with SMTP id
 5614622812f47-4675708e938mr1535630b6e.18.1773408265054; 
 Fri, 13 Mar 2026 06:24:25 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jim Cromie <jim.cromie@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 41/65] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Fri, 13 Mar 2026 07:20:06 -0600
Message-ID: <20260313132103.2529746-42-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 5de9aaa5ba04..31c5294b252c 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.53.0

