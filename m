Return-Path: <SRS0=q1oR=ME=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B09C07E99
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Jul 2021 13:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493A36108B
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Jul 2021 13:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493A36108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FA89BAE;
	Mon, 12 Jul 2021 13:49:55 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5AD6EB8B;
 Sun, 11 Jul 2021 05:50:15 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o10so15534129ils.6;
 Sat, 10 Jul 2021 22:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfbJyI1hmWPmulBvGl9yUX6sBfIUZuE+x/+Sb4PBAA4=;
 b=SXT+D1muNKI5ua6xuLy01IsiNNVAW/YwLCA/6pZSNl3BxgwBTBJS/ttTdjZmCvnJpV
 HeVS4rz6vpLq1rnZYVign5Ki4DWPILRyLnAyj2C9Z2+ew7+Jfle1uTXLyT13PLR93hTX
 2k7vxOOI4O7Ves/z5rJSFzJSbuS48hkXzcgCSBPmB7rg/xaRrNO4lPeXVo1wAosjQpfk
 hOBKnog3cC7liGBlJYDZQDsxObcSild+pPv2h3c2j7jChmXC0WAfUPg4EHR6jVQmEcoK
 BuQPUsgqUSvJHvqIifVSfyEpQ9ainHbC61tQstR9Q/ZRMEvnwIF/IQZxvJRUCBDduyfB
 nEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfbJyI1hmWPmulBvGl9yUX6sBfIUZuE+x/+Sb4PBAA4=;
 b=i4NG9zWXNi2kDud1A3F9GatIjFAgWrv0AAnop/xjhBG0OMz5bWCzUrlD+2dPHh+3T5
 mt0yTB3o4sKyqaDY/e52wzuJ/Qxcz/CXmlV1T67BwTBXJ5OXbrwEOiS1umkaUZ6QWepa
 wTnk0aCRLDzlg8M1BDrmcHugGkaIQM/ZbOkfXdwVnVY2kMCJ11447ZZwGzLQF/3h9wg4
 d9NBrvL4eXsLjq3iq5AYmihpgYqqizJgLbVRNdkotMV6UtosxWYKorZf5OK7hogtS/fL
 vRr73pdpSde7LYz0O2jeMbXoTMeCH2BOfvhvQ/7fkU2EjpR0ZlCJ32SHY9RB/i1zG1kW
 XP1w==
X-Gm-Message-State: AOAM531Fwnss48nqRkkBgL0hHoTYJvT+eymSbO+IEbVhPl/Vm5C0AdHv
 a84blrjXQB3xf2ScIAfAgV7XYVjkgxo6fZu2
X-Google-Smtp-Source: ABdhPJyxtqN38rozSDK3IWdzykjn6Ccg7cUzlLWdkk2kwWLYPIouP4b04xGQtDsPOJHTknN7CO1dDA==
X-Received: by 2002:a92:c56c:: with SMTP id b12mr33675200ilj.13.1625982615280; 
 Sat, 10 Jul 2021 22:50:15 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x8sm5852400ilq.63.2021.07.10.22.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 22:50:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Sat, 10 Jul 2021 23:50:00 -0600
Message-Id: <20210711055003.528167-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711055003.528167-1-jim.cromie@gmail.com>
References: <20210711055003.528167-1-jim.cromie@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Jul 2021 13:49:54 +0000
Subject: [Intel-gfx] [RFC PATCH v2 2/4] drm: fixup comment spelling
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

s/prink/printk/ - no functional changes
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 6419b4e7c5dc..4559583bc88b 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 /*
  * struct device based logging
  *
- * Prefer drm_device based logging over device or prink based logging.
+ * Prefer drm_device based logging over device or printk based logging.
  */
 
 __printf(3, 4)
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
