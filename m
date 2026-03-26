Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8556E10D14AE
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A47610E6F1;
	Mon, 30 Mar 2026 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUCWAdEA";
	dkim-atps=neutral
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C71210EBF2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:59 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-40f1a1f77a6so940307fac.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551359; x=1775156159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGwHOHakhEHhnxVqmZq5DXxfR0MylvY9XafKKBqzVj0=;
 b=iUCWAdEAO1gVfN4+XaMQq4vLDknq2x2vA66IcR8iNK0Etrr5URWKtVnhnhgskqXtJg
 6F2kvkc7x9hNhr5hAet7NCQW/3vGIDFZjUrZdYktGDUPy8fHsgEl39P2n2jMWAcal7RJ
 EPhqh2Ao0R2GwF9m3zOvhw6uOmXhMj/+MbiEFELbVi/KsSpfRt3e8VTdIpJmxdcP4eb9
 gTWAHEZ+yo+CTj2JbNfVrDx3KZ0XAtzYib8iZQKoWZ8aSyEpZf+iL6swukJ0fu+unndc
 bYdEYRW0vNlhobK3FQpjL6Tw91GINx7u/ZunMZ8OsRKfgI5uIUoCtCx3ZRe4W/SKiU2b
 DtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551359; x=1775156159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TGwHOHakhEHhnxVqmZq5DXxfR0MylvY9XafKKBqzVj0=;
 b=oXc9du5JmRhoBIxBdRvzUzEn9P00un3VuKOFUgF90NvL+F1kMetdV0s0XkkHj20+Uu
 4OYEpteM32xRA7gVlVqtsIrmWKwYDmz4fZfO3eH+DxkEJK5Bp9NFoBJCDp9O7XowENXX
 uwhvmm4wT5gxwoTITZdf9U2OEjHmhTNYKtosRywOOIM/wXg//NcX0N9LERyMq4TryXXP
 8pqjOQ4NOnm/EGw3bbjHD01Nd4pba8FsDL8O0l7VotzOUdJHnt7tKGfGssGIWedN1w1U
 DiMxAcC2lpYUe7pXBfZLzYKN/BhFSgUapiAoPaJ2bPGGqfazJ3EepzWdH/E/W0BywJwd
 ZnXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTttqYQRBcyAeurRG59GSZEp2L20OxdN2NI0O8gaH5Hpo0X1Dcb1dnP9XiPVdnp1Cfq8VK0gPCMkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9iFd4UXpf+s0vs9CBCrKOzlxiy6eWI+QNGP/Qw34xbKd+DRr6
 TDN3vveg7+JIx2N5fqkmT87zXUhD9vpqNjRUhvZwXuzrl3iQx66OXtBv
X-Gm-Gg: ATEYQzwRfCMH7OeF2D0sr/WQUhp+UeH32YlnRBpDLIYgqFM0y8TrFE1i03wSjMk1NNA
 h/zCVe8MTGRjOoiyaxWy8gSJxeEhgH6gzCyVsjNa+R8AWsPFO1OicY/dVv2YztmAjTpyi4cMG0R
 V7ClfliSSMWU3HtjAUeFVKnUjSu8JYdZ5xfYoNhK7d8B19dzBrNhKDl/U/OIyS6CRWIXje+6pkj
 +KlnS1NRZfdUCOO3pn5Mn8FDbDjTV07ZHhdH0rDKxyO/Q2dk+xvqmi/TmRznILBEP++/cBqb+Dj
 jnlztgyHf/6gJEk1cfSqroW1gRFHeRu1rv1LOpprDAkQLIHp2L5DpWCAyM5bowdZRpGPSsGgyjE
 z/Wno+6wm8UWRRNg5IEDkkkbefl4hKKwg43qwhkSja0nZVF1eeDJGD5jqbFTQFkP1oIsL28yEj0
 GZ4mhRBmEiavBBeOTBzVb+c3HdaDzbTi86UHhsaWaQABcsnuaP
X-Received: by 2002:a05:6870:458c:b0:416:32c1:4276 with SMTP id
 586e51a60fabf-41ca7005de9mr4737216fac.28.1774551358609; 
 Thu, 26 Mar 2026 11:55:58 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:58 -0700 (PDT)
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
Subject: [PATCH v12 57/69] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Thu, 26 Mar 2026 12:54:01 -0600
Message-ID: <20260326185413.1205870-58-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f101aedb49a..d877d0a8c830 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.53.0

