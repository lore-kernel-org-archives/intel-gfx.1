Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF210D14B0
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C310E6F2;
	Mon, 30 Mar 2026 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lgm8kYVx";
	dkim-atps=neutral
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0410EBD3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:26 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-417571c6083so746874fac.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551326; x=1775156126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U461BxJhRY45gNpAWL37hzV1gL48r7XKATdpr+1ais0=;
 b=Lgm8kYVxz4VV1XOLEvaGh9N7OWpoTsHXNkDRq57fTT7M2fgTTV2/r2s9c1BIhHqdsq
 pH/+bQp6EnucPLKf+9fbUcxBVHJVbX/U1hBe3+vyOt20UQdfqDroFrI+wjcXOYi+jUDq
 hDCrCWr7PkmdmjMoLI/SrjtkjF6wmFHGJjnV1tc3mMtvXzqfRxZVqzBecyQg/UXJRFg2
 09tM1XuIZXcfICaa8sfNjsuNcTg758FXNojFN+wjbnhOylgzTnx2KncCKU3upDR3HxJg
 ZW3WTX4YfCTP+ePqLe8MoTwkQQnfcR7o2ptxpA+/hVdPT2MI6qg2iiNJHCS2aiUlRXyo
 86uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551326; x=1775156126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U461BxJhRY45gNpAWL37hzV1gL48r7XKATdpr+1ais0=;
 b=L5MSUX79y8FJOGwHilnYCnUPZGbYDWKPjCeFlVRYXdfHeIHvhVx7POcanA4aBV1bp9
 b4ah/7r19iRvXOnHpcoTLavBOUT68n1Vd/scU3J9WaB8EScZlWcWKayMUuat0XTt3HgU
 7s0XMqX86iW9G0+7doLFD3XGaYgZLGCldCJAOBQ8kN3RueJOPgZSnyVP+q5GUd5/Kxgo
 6FEQ7uZGpi3gnByZtfbHCSzRQOMJPTIvh4ygbSJp33Fuo9ysHEwx9QhkWzmJH5FCMgpW
 OCfiBCdw1LkkZzPQJQrag/KOR7W36VoTODZUMnWL620c8F2gfukRIT2326VMWFlhqhLc
 8INw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpE3z5mDheCpj4MkOCcip66UuQy7ZFG2MS6MXCea59PjW/MUcctHVKx8aKV3hNfQ8Gu+7b4isSo4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Ytcov+VRmvrGK3lRMdF8N7AcXE5l6oORiPvNqQWU9dxMqY+R
 01ptksz4A2YoehEnSBL7kpshyEAmwca0HCELCV6StlioNQTHnNkE9BCg
X-Gm-Gg: ATEYQzwcVPYyt7cW4Jby2/adsFbE93Uojq98fm0bs2jTpamiJbQvizOIj8P5ZMKRrpO
 pr3nHEnwiE4J7LbzFs4gaXouG71+20KdNj0Nt8ooKjV9OafZtaTsSpTFTo8vgu0fiXNa3BOBbXS
 mlGUdlTyrJexpdxW2SHanTBYPJTuUx/2s183xukg9FspInDTTB1LgUqLLoTOcGdBEooauSyePl/
 HE+J/SLPpaL6U+3w7SxH9Kj5OL32GsRkAo15frm2PuNrGHjHlgUUjh702au/HzRwIaO3HklkNEV
 SLdy+hrrSbfcCXtSRNwyzDhfrdsRXvl3zc9esvJrvaPH8CicCz5n16fIjFhtvJSBZi5hednQEt6
 mAlebzmDUPwzUcGhxSx/om/NOSf6cTBmt6sXGsKPJ/HJyMiT7nY351t60nTJ2tnzO8S5rqlm1k4
 I+xAcX03TFLVTI1HDkBwkojIiq0QYJ7FTjFOumep5Ch3ApQhKP
X-Received: by 2002:a05:6870:5494:b0:3e7:fa5f:7269 with SMTP id
 586e51a60fabf-41ca6d6a46dmr4909366fac.2.1774551325975; 
 Thu, 26 Mar 2026 11:55:25 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:25 -0700 (PDT)
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
Subject: [PATCH v12 37/69] dyndbg-test: verify DYNAMIC_DEBUG_CLASSMAP_USE_()
 compile-time CHECK
Date: Thu, 26 Mar 2026 12:53:41 -0600
Message-ID: <20260326185413.1205870-38-jim.cromie@gmail.com>
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

Add another failing use-case, this time to verify that _USE properly
rejects an offset > 62.  This is an incomplete test; the proper test
is: classes.length + base + offset < 63, but the macro cannot test
classes.length at compile-time.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 779309898422..72a1a1c89cb2 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -156,8 +156,9 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_maptype, 3, 10, "no such type");
-DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60, "one", "two", "three");
-DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 100);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60,
+			      "base", "plus", "classes", "length", "too-big");
+DYNAMIC_DEBUG_CLASSMAP_USE_(fail_offset_big, 100);
 #endif
 
 #endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
-- 
2.53.0

