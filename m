Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1154F483C6
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E79E10E5A3;
	Mon, 23 Mar 2026 16:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbdlu3v7";
	dkim-atps=neutral
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6C10EC0D
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:15 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-466f00535cfso1535013b6e.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408254; x=1774013054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYpsGA69YUPtgoC1KVPx5M4LxWSwSB6685GdZ08v/j8=;
 b=Bbdlu3v7dBaNu3JMakwuR3cyckp0f8rpJCpbGnSsLTwFBbZ3G+fr5XhZ+3Fae+13jn
 k8ON19LvtUQvx+lCarhI1cagUgnJ5VoPRhg5bgKVdbS4WYPYiQ9u3AK60mYSgjhM2sh3
 HC0T2QPdc9xTNtU5c4q4J3UR4cFboBfgrArPJ365JQ8CuDTrbzOkkxoENzZlPfovdI87
 4e3SWBEXJGcWkcFJ3fgnvPMI4Uy0UM3tZd48zKyM6dLD4wxRHldpqXG7R3WUdq5lEXWE
 1mUZfHN/dV73GkaFlymB80i4xTwOmOaHZAbcQIf3lga61FEgSTuWU0iKlw/996o4OuFc
 bULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408254; x=1774013054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eYpsGA69YUPtgoC1KVPx5M4LxWSwSB6685GdZ08v/j8=;
 b=QI2C604ETqKr6wfxOQ5od/AdhQR6D3fy/OHnIxcnvi4TmDtC2kKxv8Mi8ZFXYlyTKf
 RHplvARk+MJCz3a5nO+5yUK2xlaL1ucmI/r/HrZ7FlAKEbKObhE8OKHQLvCrJoiDtQ5t
 M7qhwwYsv/xwDGe0SdeGMBHkit09kmKvuJVKGHdp7TWtWjbxd7uaC/cG9kAYv1GIggO3
 LTxu/zfcxbjElCtlfs9UoivZ2+APFAmcIe0Qzs5Aj8SwLclB6XiQ2LxShEvGfK2cQrIj
 zBWgHUnADkQl7a3CHl6lDqi/0gdiN1hhX2gnV3UiljD2h2Wb7cYI4brKTGW7bq4Qe8Ta
 rbuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8QsrUAR5805sxJzF32C/sbhmK20wuuPAf/oup08taiB0l5Ktg9khPCdy5FznKDvI5Yj2XL9XdFGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO8AAxkhy9DJ4g3pofZV9B9Zg1iNg17Om0X6rq5TvEECL29wv2
 zmGkIf3CH6kSt3qNuPcT+HbKDT/wc72TinA9fvMsRlTIA6ZMFZdhA8Qu
X-Gm-Gg: ATEYQzxCATYpz+w8+/frwLfCyqVnCfMqGylKcT0liLdblxV4VpApdRxUovp3gsjip+A
 NLClOPUt7xl3SOO8LXqWSKg3jqcRyr6/X9NM1iD1No00/s10TYvktupLvMpBBf296hao04bIJyQ
 CVd57b6veN8ulZkwYXWY307DpOO/qgVZ2Hcas0nC6DWtXmHK9LbXSECp6BSNDI7kTNObMCuSpKl
 eqIR/3BdaPHs7xf78f2lB4QtHvs1br3zmm3Ztu2V1Hq6w4HpeWUU24zifNM6PLJmHaR3Ubhj+yX
 oBsEd4aVq6IgEB46mJDtZ6iRkl05RTkPW12SbXF74TRbauqTASYnX2s1piWiNBuWWLxf1szgcEb
 gaVcBnspKKz7ERPMLw3UU3ZQJ0zi/zNbgz55lmpFbCNhDSuk7rWpJUjOpO92b2mrzmlheXN9dFw
 rPLXZYFURIqE5Mu9iep/tbOmo1DtIEohnajmqoWJwYn8AOy1mM
X-Received: by 2002:a05:6808:191d:b0:467:32c1:ad08 with SMTP id
 5614622812f47-467575feaa3mr1733147b6e.56.1773408254397; 
 Fri, 13 Mar 2026 06:24:14 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
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
Subject: [PATCH v11 36/65] drm-dyndbg: adapt DRM to invoke
 DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Fri, 13 Mar 2026 07:20:01 -0600
Message-ID: <20260313132103.2529746-37-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index d07e7953c9fc..93dd714d4533 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -70,12 +70,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b743ee3f8f5e..94064ec6c229 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -147,9 +147,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.53.0

