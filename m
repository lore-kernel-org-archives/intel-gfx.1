Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D2E10D14BF
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F7F10E72A;
	Mon, 30 Mar 2026 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ke/ptBKm";
	dkim-atps=neutral
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3310EB8F
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:44 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-40f1a1f77a6so939334fac.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551283; x=1775156083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/SjSwC+RMF8YRDI51sil3K6xHtCNjZlX0uljPPVd8o=;
 b=ke/ptBKm4p0ve06eSY2eIJ07OdE5RuwqIBhgbMR4ZPd5ufLiLOMoP6E8RP48+FRCKw
 Z1374oLFBknREp1qQUERPM1vKbmu1M/reuJUzE+hzmupgXJF1sQSSjY6ku5H0KBj/Gk8
 wKSL/Yaw0+CZyuSMbvrtYIfj2tmki6g9/HkR1H2yGBlWu+mN7A1wQY8TtoAW7erqxFGy
 awesWNVaGrkUaOgHnfjIi54A2ZhI7YqoAOTSvdl62JQxV0hRzM1gKFwm9vVLjt3eUC8V
 iroybWNjPiKgaRHYlk43naFxGbk+elRtuezp/wapaI9Y8+iL01ZxV/guXxJjlPyBW20m
 WSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551283; x=1775156083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/SjSwC+RMF8YRDI51sil3K6xHtCNjZlX0uljPPVd8o=;
 b=B8kttr4e0RuK8nDKluKRSiy9KbZilouEITcJHlWyR5jAFajCAOFtnPtj1uEuc2Wg/x
 oG8bPfuZoxUeLoxxv/hrxma3CorvvCE4sfMqDLLMYeFtUx6sB0AHSSUfdIwHc7m26/Ts
 fynZVQdhFQqtWBcAxA+rmbW2mCuI4Svnqz8sxW+gDyHH3qrRuNKcFe6fKN9OTjLvWGTO
 GDQ446RHjELybrSlDzcwL4GzLqZll1X9XhHdsI6bKk+L4pwnOKA3n1dEXc9hA7NXdm5/
 BMr+Csf7GRP6m3YanJ7zjuoHexCni46HjPdGQIUyp2Z3z4mWc/rEd9hZ5Naiy4Q1JBwD
 cm7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRAnsPUCk2789kAdNCniGluaKAFL06y2kir1wvAL31BOWva/A0KrLIXrtUuj+KoCXOswb0Ghm24uM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7QeVQBNhBlATugZlz+7QDeHOVhnBi6denypEa7rEJzLWybIlq
 MlcdjRzWc5V6kKGQwxMmWdNyhq93UtCxbHevY60QLiRJB/FUTK2J9ZJb
X-Gm-Gg: ATEYQzyLJ+VIz7ucNzsq9mqFDwkNRSwPTtuTyhJGnygHNaVSVG4ic9qlpHmqVsMO1Qm
 3GiEyimSbOmTmslZzKMWPI/9dsq0CEkPgxLq9skgdQ8JZkCQTqe/eBjznD2skGwFwr0IXyALDj/
 vU1bSWpUJuHzQBAf2GUEQkfsRm2L8gphLpYN5/fQ9wNMY3Ac9HLbJ8YB05B21JD/H4xrgwf+os4
 4Ajrnsv/RndWNelGAI4osr6t3A5QVqyu7+d6aVZewaOKNzhcpSo9WuGQ1yxSYgRGl6h4g2dAqfJ
 JrFy7WdhhiaDajy6L44GB0FIx5BhSC0XWXDcTG+qa67MAw+s/onwOcWbToGUaGD4aA9ODiK/BDa
 pcEPevnnT+BDMuxURzvQcQM8L9knoHtXTDPVDJK4Ano1SiA7N14/8cEQquWCZjLkUoPh6MUv+iX
 jRXePJ2oznUsAkmasLTBlUxYNxtjAnU3kleJYjVy0bQMEDF2eY
X-Received: by 2002:a05:6870:f28d:b0:417:c2d1:fc2b with SMTP id
 586e51a60fabf-41ca6e86dcdmr4692709fac.21.1774551283268; 
 Thu, 26 Mar 2026 11:54:43 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:42 -0700 (PDT)
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
Subject: [PATCH v12 09/69] test-dyndbg: fixup CLASSMAP usage error
Date: Thu, 26 Mar 2026 12:53:13 -0600
Message-ID: <20260326185413.1205870-10-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.53.0

