Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E2110D14B6
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 12:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0EC10E6F6;
	Mon, 30 Mar 2026 12:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f6sNWf4n";
	dkim-atps=neutral
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EF910EBF1
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:02 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-40f387a688dso1105457fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551361; x=1775156161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=f6sNWf4nDUQIKef+ex8VL4Cihv0ZtbNl98WZhd5bg5JWD2e0bybN0NSAIzH0JxO3Rw
 YjGyIoJYrp6dc8zMNsvMo4IoWCreyEyJLcF/pG/SboNpr/Dyuhy7Pxmp57RwZ/NQ0797
 /bIB6f7RV4KupxX9Si2zq5PzNbKkt+z5lZ+mqKOtv6lrOMXnVEJf6d2ac/+yAMUXqcoi
 sAEsXwS90Uy0yRyZBXD+nQEkYUJZbVWaTTH6QXxjQdK4PnDn5nVokv0jeitEkZhVYYyw
 8GXV8C9LW9Kb8x9glPnhUicW51XlR4rS376ws8aZiipU33/RaDQnmlyXv3C3uFUNwaZB
 1vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551361; x=1775156161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=JiwdN7AJGCup11MjPFoxyXOGoDuUJbvGmUeFyIXziDIZT3W78TWhmXP7pVb0KwVEOz
 KtM109XGR8gZVNH4gbwWW0xc0P+WN0aQiIquoIrREnTxf1EyGBbaIsIUj5Dw1XVTrjXw
 1mjorY3PhjrajUCcFm51pTuKsAjbxx22tXP+i8shZ9d01+u4ygRpInmdyEIHQFhFcLQ3
 Ht7dEjXp11tkhOzYBSfnoCsRn3AztgAU2QXprSDWlUyPSz/7pZz/OMtDoa2Gm7VZFi4u
 2Ov5l8EHZwXBKXDgbOi/gAm7piyC0zPLBulwFp+yELCAPvGQTzx/BMrZurlgpU3cvc9h
 qWNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBCVpaHE3DmasLYGN/7wbA+2Dh/v9BO36VGxBHiCLwcsCKs5I1ZgZ5RD6Nahrs7pIiVV2PoVUZ8F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE7ZXKOadgaldeW0KUG5OpMLap9ygV81Ku1HraNiXNQJqn/J4k
 QMJFMkQ0H1wO8cjGZH14VBFM4bTOWFwLtOEOPYZC00bV+pQiOFVfGJKt
X-Gm-Gg: ATEYQzxxHO2k+pqISpUWfUKDI/7dA1dmTu6drJ8+3nE2cBrvNfI1jdRWXKOGeSJOIuo
 q0q156lxV6LNFtsOi60xdx38HiMbbzzGVxHE++bSAyltZqlxu5neH7oHIUzPj5YUqm4g7qiKH+U
 y31aFkT5IX8xbmnB0nA4Q3GeCXMERg7bgZdYCyiFh4dX4cCHWw7l1SpF6OT2ibJX8ywagVChfwe
 WF/dsyLzL/f8XLN3TnpfkR4LWqVPPNo2PrWPOrH4xKr+FTXsf+C0CtVO2LgfOjh9QdGPU+n1D7V
 kMOJ2AkPn+Ds1BTdCLbbUhPxMeN20JAUS7SZq7opM+b/rxVxjz1foS6K65yg8cZPJ3t1UE+acVr
 fmBlUEAkPjU8njeByhXwGOxXOJHRrVKL3al2Ak5VLFWma0aGHh684WcZfE0Pep+ciAHPuOmngjq
 2Y6Op0Mp1teH7wckp8x6kqbnp/Z/xiSLKGjfHFJQrX3S4oF40T
X-Received: by 2002:a05:6870:b14b:b0:417:56da:593c with SMTP id
 586e51a60fabf-41ca715dbeamr4692008fac.45.1774551361348; 
 Thu, 26 Mar 2026 11:56:01 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:00 -0700 (PDT)
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
Subject: [PATCH v12 59/69] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Thu, 26 Mar 2026 12:54:03 -0600
Message-ID: <20260326185413.1205870-60-jim.cromie@gmail.com>
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

