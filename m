Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC5CD5BC8
	for <intel-gfx@archiver.kernel.org>; Tue, 26 May 2026 13:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6F10E4D3;
	Tue, 26 May 2026 13:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ExwsO3CI";
	dkim-atps=neutral
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4F10E309
 for <intel-gfx@lists.freedesktop.org>; Sat, 23 May 2026 15:41:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-36974217d4eso5367672a91.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 23 May 2026 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779550890; x=1780155690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=tlfATX24+gOXKKLMuPk5Ufobg0T/xx+iuzrEcxjjNAY=;
 b=ExwsO3CIx3xEyreCPIAJ5fqhz9hJRSYl9pKkj3oY4/3IMSHPTgrPJRB4M3xk48F9TV
 wb68oNnwQre8IQ1VlQwi2ZGUqpG0q9aGt2l2m/5MiYQ6ydoQSsLezzZUKUH5ClE49MTE
 UtaE6n6XR0Ancqx7hIc+gsWfdyP6VxoXf2tKirm7zDMgcQDENlYnisM06WbkYv0fkxP6
 XCxGYcIH4Xm4ePprmbHE8yhY22NjvsoFVnPKeV44M82pB9mEovpKIFVEPhXbwAWB0U2M
 JcW2xtS6MJe3gzq+ZrCxlsKYzLbwb4UTaA4EvjVhJcndwRfZoby3rcMlPS5YJwN9ne8Y
 y/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779550890; x=1780155690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlfATX24+gOXKKLMuPk5Ufobg0T/xx+iuzrEcxjjNAY=;
 b=DMAXXPxBrqXoNrNeCke3+lESa2XzaNZqXfMro4sKDWwbgSGq2M3DpZlDZPb5A+9wkn
 A08bbsjj+nfSOZELvy1TGUU9/th6Igz33WFS0oUUkc67mx8KvGKrNKVbigTNK00iylpL
 WfP5vaYKPi1aS1e451iZZA6hoXjScDOv2s8/bJnyyKCqAYLTcHUHDfqjDVrUpWMes4Ug
 t7hDmBdXCSp1aQ7hodp7VhhR/MF517eV2WzYCZeVfLA+19wQa8TnlirRrvWA/j3/2aRU
 JEbAcehnPas2YoruajeiEbdBSCY3IjYEoZjGJ8iHrF4wd6ClhyYQfrUfPLbBx1di2M+t
 fOKg==
X-Gm-Message-State: AOJu0YwdZQESmDGX0zk6v+9K1gT1fBZ1Z0NmUuxt3yiu/+xtVmtN0oCK
 wPIodCOPXR539N09PjR4ixhS1C2G0ctMi31qzPCiGOllh2l+lNFNH9la
X-Gm-Gg: Acq92OG9yEjB3u92goCGm8puj/J2lBz9hwQousoZt+5EAWm9k7b9gFk+0+A6rWxvQYw
 ZPdn8P0YoX4nRhCWpba1FD1klS/fU5QT+4dIt+VIxHJ45BR+tobcBko7bMyt7J7cMZHywHTuZPp
 8gJIVfyYD3+Q2pAa1bDPYKcgrBDY2nDOsccpyDd1vUcp0mFW2YdVI7MQiSGvGWdwt8xYwAab/iZ
 IArjNzWGrerc3Sqz3dnPa5Znjf4qmqvqw6O69NdfguE/rUQW6jIULQjmnwWwRJp+bALkNEfNR5c
 ktJRED3Fd/57PW/f2ZhT4w6Tyhfb/8ze0oAOHq54e1r7hiDF8Zzm8xIK7TfoZc1sDUSQZidNTw2
 m98f+/19OclTh2KLfk877ykCJZA6/LQJNBY5caG3GrwEu59Ahe//f4aBJJOsH4Bfva34WkWPTJG
 vjs2xJrF3ViRfiuW1MtfKGLTHKA+biIlQZsCTqpi5ygnSTMv7dB2WQ1Vmu51gBAoPiPmOcKy6rY
 78=
X-Received: by 2002:a17:903:19e8:b0:2b0:6e4a:32d0 with SMTP id
 d9443c01a7336-2beb06a6053mr89764875ad.35.1779550889927; 
 Sat, 23 May 2026 08:41:29 -0700 (PDT)
Received: from nixos-office (mx-ll-171.5.30-148.dynamic.3bb.co.th.
 [171.5.30.148]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb5695c40sm45239765ad.5.2026.05.23.08.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 08:41:28 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] drm/i915: use 'depends on' with visible DEBUG_OBJECTS for
 DRM_I915_DEBUG and DRM_I915_SW_FENCE_DEBUG_OBJECTS
Date: Sat, 23 May 2026 16:41:21 +0100
Message-ID: <20260523154121.147103-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 May 2026 13:02:27 +0000
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

A previous version of this patch[1] accidentally introduced an unmet
dependency bug, because DRM_I915_DEBUG selects
DRM_I915_SW_FENCE_DEBUG_OBJECTS without also depending on DEBUG_OBJECTS.

DRM_I915_SW_FENCE_DEBUG_OBJECTS currently selects DEBUG_OBJECTS even though
DEBUG_OBJECTS is visible to users. Other config options use 'depends on'
for DEBUG_OBJECTS, so let's do the same here.

This select-visible Kconfig misusage was detected by Kconfirm, a static
analysis tool for Kconfig.

Link 1: https://lore.kernel.org/all/20260502191932.4491-1-julianbraha@gmail.com/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2:
- select PREEMPT_COUNT, avoid recursive dependency

 drivers/gpu/drm/i915/Kconfig.debug | 3 ++-
 lib/Kconfig.debug                  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 3562a02ef7ad..657cdf49181e 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -35,6 +35,7 @@ config DRM_I915_REPLAY_GPU_HANGS_API
 
 config DRM_I915_DEBUG
 	bool "Enable additional driver debugging"
+	depends on DEBUG_OBJECTS
 	depends on DRM_I915
 	depends on EXPERT # only for developers
 	depends on !COMPILE_TEST # never built by robots
@@ -153,7 +154,7 @@ config DRM_I915_TRACE_GTT
 config DRM_I915_SW_FENCE_DEBUG_OBJECTS
 	bool "Enable additional driver debugging for fence objects"
 	depends on DRM_I915
-	select DEBUG_OBJECTS
+	depends on DEBUG_OBJECTS
 	default n
 	help
 	  Choose this option to turn on extra driver debugging that may affect
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8ff5adcfe1e0..6501b7040706 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -760,7 +760,7 @@ source "mm/Kconfig.debug"
 
 config DEBUG_OBJECTS
 	bool "Debug object operations"
-	depends on PREEMPT_COUNT || !DEFERRED_STRUCT_PAGE_INIT
+	select PREEMPT_COUNT if !DEFERRED_STRUCT_PAGE_INIT
 	depends on DEBUG_KERNEL
 	help
 	  If you say Y here, additional code will be inserted into the
-- 
2.54.0

