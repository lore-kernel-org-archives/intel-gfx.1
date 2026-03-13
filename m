Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E3F483C1
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73CE10E59E;
	Mon, 23 Mar 2026 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="cn4uBlPQ";
	dkim-atps=neutral
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C868E10EC1D
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-46704177543so1451520b6e.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408288; x=1774013088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=cn4uBlPQnD4xb1VX/FDyKIceMKu9O5wBmsuYpo4Qtb3i1C8Lek4JzAi220qGfDToiV
 MOJ3bOdvW0wk1g3jyRMd69Il7YzqgzmnxMKfEG8Ds4npK2eQTYwjJflPGozGr641A5cg
 MchZTSVm5EVy6VoyWl1tqYIYXNrM3h8+1c7C6nrqeU8TikVswAZX5As9XTvieVFZNSsc
 mRceTTOhq8Ck72m/CluU7T+qzmlTodkA/MkZepkOIDS2hZ0dZsK5ptIbtvrMSEqK1J5h
 7bjfNmaAgOfesqIRTReplPgl8PcTa1mjZo+uefIseyHAaob/iJpZoEfx4oA6rCitA6/s
 zviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408288; x=1774013088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=KVjiNEsji8O6sNNBZz3G8DUbOHue5pYD/W62THdNtfTryrI+Eea7HOcrWsr1/8cAAZ
 EkDQegsW7IIv0FzVrzkmrQdSAaAeJaaqH/JU7q9O5PwZh1Qf9kyI+kFe58GRkUcBqsWb
 kMxKYSe+kIsda+WDT1iGHdwqn0vtIvCTd7+zJJ+QTeNnrOY+fXt6B7bohFS6eJnuqXus
 FkoEnc/lwJpFfneDqubMPQrcH/bEuwP6ophHhVxjOmBvT/hbSAbqHKsTXrm6xgxAqs+a
 aSRVPwS+0IbbL0kRKS4fVcOcU5kLTeoxGn12pXTxE4gid6AvDsGwStTuiTWVzjPLBV/P
 kVCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMMDptx0hG2iGWd/p78A9b4rR3dEegXFNlvVGMmOcpq8pMNVKuZGjESo+lgvjr3TdUgWtjk0te4ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFEzuO6cyhQJPNzkiYF5DZEy9yWHVyS3lIyIG1G3rMrXl0EF+9
 rc1ipDaEND4cA8supjXqvGouSVvIqIj4iBljL5/kTtPjWez4zMJq13Zp
X-Gm-Gg: ATEYQzx45OuM8kstyi4wS+h7UPw9ooqfJX/ukL6ODZySG8tulf8/38OI61e2aAH7lAg
 OrPxY/V3+18QqayzGbO/OGslANsv0/pqec/sdvCXs7wBmZRL+IUEcyJipfgQbQxCiWjfFc+kvIw
 ABsjosIUHInCJs4E6X9y2fwqS71YvzQRsz6lqtYQDbPuQX5AvrlPP+b1LrlPeeM4oPnBaYIY/ff
 Fz8s7mQ6zoUy3ARD/aCSurKld5dRRAqomIfGMYv/82Ik73tHsLGoBP8JWASlfhhUa8HPCUJEshB
 Pq0CfpT/iP6eJu4fxUSFskBFB6od2SIyP6MX8FJtVsqqU6TQzjoe/uOiBizh4jPlyd5hlazr6ht
 ia+kSDwWi4W0Mww19Uk5wX7JZb56T/3S0AKw/kPKlhW97iX2s8kxMdc1PR4zglBQm5qj2QZZTEe
 HcvnKde3PrjZF5prdu6CZ3Qcoc3VtOkP3Etp27WftfKobGgG37L0mH34m8o5U=
X-Received: by 2002:a05:6808:6d84:b0:466:f57b:2ae5 with SMTP id
 5614622812f47-4675742c896mr1590777b6e.47.1773408287937; 
 Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 53/65] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Fri, 13 Mar 2026 07:20:18 -0600
Message-ID: <20260313132103.2529746-54-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 08a0e9480d70..58fea20a1e81 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -21,6 +21,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.53.0

