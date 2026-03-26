Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C110D14AD
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9318E10E6F9;
	Mon, 30 Mar 2026 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kecb9Wbb";
	dkim-atps=neutral
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAA010EBE9
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:42 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-4094b31a037so992303fac.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551341; x=1775156141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93dR2Z7/f38EiX2nhH8I335LY48jx/pTe8LM2CbujQc=;
 b=kecb9WbbHe0WJPkkW9xYW6t8hBEBq8OQ23n7G6ZP/lhh1HqeogNq1ZB6UvbGmz58hm
 C83d+dGlcAkdgECZaJ/pVD9jhxO6y7YndsV6f6BCjzGNoG+lE8fMM0PQ4nEejwja3FAL
 QFz1a2I92n7i3cikCYwCCc9p54GKPqh38mWdZEFnTpDIupMbLHXT7Vug1Y4tSkzZMNkR
 SUWeCxlKMXYV4Wba9wfSudsrQ0SZQ9W6G27WEsNhcFNigAE2sXKpFZBrvq37ujajJfKu
 55ImOKrPurq+HkBX1qqg1GRcgrc04p93W/rtanU/0o8wBmC+tFoZfcixbAwc08S2ej8b
 lg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551341; x=1775156141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=93dR2Z7/f38EiX2nhH8I335LY48jx/pTe8LM2CbujQc=;
 b=s5kVU1twvihKuj7v4MG3q2V6tkjGIVRuHe0ODR9OMCwg5SYKRC1vBAL2U863VOtHlq
 xMRDauv41qt5VhMKqzWiGVz7xhsQQSL+ZjVs//QIynHg2o77GuCnuTyfmkoAstfVJH1c
 bwYmzq8u8T4XGF3LOw8UFQIWSJElSrnPiWsdKnpArcRiqiB1gPg83Ta+nIpoSapeMECu
 xagxp9IuMyuhPFvOnb3Oogo+kfIikA2oL+hDAMcyJ+R0hVdMfi5l/9Dv0TJHaYXuDhwS
 esgEoRVg/idufEgytPLzNAsPiOOFjHwiY7zc0I9a+0EQFM7QG4dkOgUysH9PV/BYbXUu
 1WTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS1NY3ujxFmQfLVXbPucglIvqjOYVqa6vwsrv0PmzNUafO60tEGJqgJcgGHEH2898FpVGjnPr6nY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSNlE5G9KYBPbxpUHjVSh0cNaHZnWWjuiHTGGSbxniKe+RrNSj
 7vWkFg/0PI9msSCkXEPDMjd1Y7vCYMZj5Q4/RneTGEnTvZCl1zzMhIii
X-Gm-Gg: ATEYQzyDharJod404ztUSCF5xoL9P6+ZcwRowZKy1C8tjICtUVd7l23IihNcS6eVocW
 qgi6hG4hHTHsiAtvbNWffAKlAvQBBi/v/u6bXFuGLE0AUPG1WVnmWfcwkDjYiM9lGiN/3lbMD3P
 rtZtu8tTBtU0kSyAQVt5jCfJ6zpbV9XITGsTkEWI406I4fbWI8i1vTl5RSD35Yi7xcU/1YjKiFk
 34VUCXxL6qyXH4dUfd2BPCjsxH7iNzuTfOz+0733iP5IXAGs+WOgd2uni6AFfSOIfR08G+kDUMY
 uUFJelAx86v5ep5Umb/rwUwRDqTxpLo33f15PzS7M+fb4SBF4CBcCokHXTQUsPi8el8x1GAOzRF
 7QZ2JE5cq2C7xss3RZISWQzxOYupN2w2r2kCBcvY2XICxGceS+yPx7DzWBmqU/wNwO4hwDiUdst
 53hY6A/+QaXoy1aadujesonrMJHS50ogZ9NGvJyEQz4irWsRdv
X-Received: by 2002:a05:6870:209:b0:417:2b13:f2cd with SMTP id
 586e51a60fabf-41ca6d734dcmr4697103fac.10.1774551341455; 
 Thu, 26 Mar 2026 11:55:41 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:40 -0700 (PDT)
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
Subject: [PATCH v12 45/69] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Thu, 26 Mar 2026 12:53:49 -0600
Message-ID: <20260326185413.1205870-46-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 95d26f086d54..e5dd051eeba9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -249,17 +249,7 @@ int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 uint amdgpu_hdmi_hpd_debounce_delay_ms;
 
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
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.53.0

