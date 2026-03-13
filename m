Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFADDF483C5
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E08F10E520;
	Mon, 23 Mar 2026 16:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="czQYIsQL";
	dkim-atps=neutral
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862F710EC11
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:35 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-4672076355aso1531025b6e.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408275; x=1774013075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=czQYIsQLuF0FbFYZUigIVCp87VtIq/aJP+Cs1Map0OEeb/Aqe+jrbZX5uynErI8zUn
 K4VVtESQDcdG4chFk7XYBSSeXrj/iO2vD6wMH4p2gC5K2+7dWLz7J/zMRIlR6L4VZGvf
 TEH5s9TlcbUDuzJxqMW+9vwV+USKQ85tOcE5BtehWHd4y71D19xRJFjrCL87wZBasuGL
 BDsJNo+p5PnOQJ4egT4dc1+rF15alaL/i3j4D7W82DuWlbN0ctsJOcYCrsX/wYGs6tGZ
 pNUapJoxm0chOOsjA87x4eEEHadfupZ9z6lao3aRu+doWBB4s9LwU04mTC8zac9if+Hv
 YKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408275; x=1774013075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=Y8r7CJpm4Ra6NQRMscJ1mA2KSWB6N3O63fFRm4I2OICwoFkJCRxs3P0noK/aXiSsAe
 RHeHmfi5ylvfZAdyVbzTOXAwjNZ1D62ae0K9XgCB+zAkSJl/NcdqOakj/vbejW7J1782
 7d0BOwyr42Pe+zVxl913741OY1Dpb2GaShKE6JLKa01LeK5xaQGGmmDCYxv0RFyCp1Oo
 NXZYsqrIu6WIdu3ZymRCA+YTdy8+S93ftsjlzAQ4+3fL0WR17zV1WrXgXvn5Zbzf05fv
 hMP3xoGIWP9i2MVtXjXVW9DTgDEixTdxc9X36O93pFrItT4tns6J0pqREeDZqoLBk+gF
 noLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0yWS9QqqByAAdJWozlgT8eZVpkaBBSWb3BEF9rZh63fFJq7Ur7g8laUjxF7NxKvm9X2Ktq1wE5TY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj92LYMX0513QctnE5OMOJb5cb+1A74vGH5xdNVg+VwpGUTfCe
 8NiWBD6WiQ6xtbLmA0c7Ku3aDMNNmAUd8eEYzxcb33E2U8FXtxQV8j1R
X-Gm-Gg: ATEYQzyb0RbenQkJtgGxJKWFJChTRP0EpLwFLCwpRzMA72enF6LCUF3AeUrZgX1SNmf
 T+5nlYcXTrjFsil++BUDX4rycdCOCr80m5WTVG2cfvNGumACYAiI7+ZsVTJI/9wWVJVYVu79xAQ
 ryGDVt7WA9Biph1GMD0fVDQupJU84fWWSrFJn/O9AVlZxKWSfWeRmbCpOJvA4roTUcNxxfQgzQO
 TUNbGEMT6ptiItOmBP5RSjpAH6bwMbyhsNh0B/7t1BIeFTrl4AERVhrnTp632zHcOGjxrGS83tW
 v4/om9c8j/XrC7NxUdo5AkqCF2OVlsrjkkjScX4pfcFPTdidRkEtXHAY/PShQzEOEKPfCEgSxB3
 oDzUu+FcJ16u7VqracpbObDJzKVgnjk2UH8AN/WHqrL3Vs4CpqaYwBoNYhXqHM6i1VSOUu02tF+
 f4TJ0DNMn7c8D28jmfbCnafYS9D1k5NoRKJcKcfa1YdsXk1vcw
X-Received: by 2002:a05:6808:c162:b0:463:ab56:9ed1 with SMTP id
 5614622812f47-467570952f1mr1501954b6e.6.1773408274705; 
 Fri, 13 Mar 2026 06:24:34 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 46/65] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Fri, 13 Mar 2026 07:20:11 -0600
Message-ID: <20260313132103.2529746-47-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 7a95d2dacd9d..8958e115abc1 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -35,6 +35,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.53.0

