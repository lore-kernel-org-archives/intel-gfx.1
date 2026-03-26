Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECA610D14B8
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751B10E716;
	Mon, 30 Mar 2026 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpID93gh";
	dkim-atps=neutral
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC5110EBAC
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:48 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-67c1b8b1f96so849681eaf.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551288; x=1775156088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4prZoq+o67W5OQsgLrKexlAzQC80y9w+24uEfnXM5Y=;
 b=WpID93ghVpitifRDUJcKgOvdzsq91/FZOXI6zs/WW14ShmaWjwlQ8stnpHC1XrkDpv
 Gb9ChAY3hOu+4kfF4Er6HsQ/1V6iowLKwXo9xLSRIXm4aumvsoKntGCKTwoA9REc2s6P
 I/tqJN7Qb2SNBmRlKK4cXFoYiWIEicnRl85iRqt2M8l1WrMudzRnbpk0d//P7vRr9E00
 j0i1oS35jKjbOuWfgb1z4ViS/zmmyJG9hcw2Nw2maDRyGWDJljcZWepH48Pz6eudF5xZ
 wioUqrK+9uLrMQRghCS4oOReQagv7LTAIUr2HWrOMsPb8IyZmhrs73yWj6qF8CluBUJV
 JlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551288; x=1775156088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q4prZoq+o67W5OQsgLrKexlAzQC80y9w+24uEfnXM5Y=;
 b=bVYo9CXzhjONJav0idKRuDyf1jFT/RBBaYyjXyhkYDzn78o/3S6Rd7lcKqp8JkFywR
 jnqUYZtJ69N3VuOrfDTA7KgWDcVNyJ6xv+ohS7+GujRhXT5HigUSbEtT5wl5KuLfGhnO
 tg9qeiPpCsMIJmdZaY225fzq0Ix0YmhWDvo8d3emeVDq4lyvsvEPEJf/9mNX5exY3HLz
 XRB9g+MOmpudishp03U+z4gUYAXUzHkeHOPNF3Y3FV+SvWc1go77IjBxUmMvEEkEgd90
 lOluGgP4uzG483w7bGUk0E7NdyDM0emUYxGQOrTkoiV0KPwOWH+2y7NQc62NrkV3v60H
 444g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsQjfxVIFkhhjMyDcFiW1+L6MYmOdO5cdWbDH5s1r4/GD8lwDjW5IEiNi0sUougWyhvLIwDNTF4c8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN3eynHogSg+qsBLpXz6WYGPUxtJkgXcVwOWjiwKm2MZLIHNTY
 JywZSsTKmr7JVa1AuByGWoIWNrl6UHOKIsWgJ1Fc3euROGibgPTzA/ER
X-Gm-Gg: ATEYQzz9zzFlYtQbwSNRbSKveZKgvFVqRrF9//Otam1wKQQZg5a73ce/r1gGCap8A3N
 OCyWnvs58ascihnWRmLOWijfsEHE5Bt0W7i/h/8W4lbma00HZtDsAyDMR6YJxqrd2Cqwjeg3LIw
 6iRtwBUIgaKOwJSjCBLCH58WGIKJ4w9CjAAQHCUEoX1mo/+8qObIaRhh8H9gHzPGs/Cw5EDTn7u
 0LymB4IuRtboyFpNuS2t9Wcp99MCJdDh0Dyj1Ujh9W8qdKh6YiQIDfhFNgNEjJqdzKeLDUq65rg
 3h8UA+Dy6i5akjiJB83+TjTRZOXiUPwcmKfwtdaUq0I62ZkGNtdudqHLxNhyOBcCVirfS4CPXqz
 6AS03gAbL9llbzJqelBNoJxxFToTWpGrvuMEs9Zz4O5hvhtPqWCfadnkD3UEvB2nLthh5OZF29V
 U06tJWLCjM/ENhPDzo3SaG/1fiIPEkiAZmCtECik7pBKitUa4c
X-Received: by 2002:a05:6820:1893:b0:67d:b2f2:6e72 with SMTP id
 006d021491bc7-67dff3ce6efmr4416641eaf.13.1774551288030; 
 Thu, 26 Mar 2026 11:54:48 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:47 -0700 (PDT)
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
Subject: [PATCH v12 12/69] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 26 Mar 2026 12:53:16 -0600
Message-ID: <20260326185413.1205870-13-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.53.0

