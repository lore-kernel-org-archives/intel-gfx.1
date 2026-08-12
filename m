Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C6DC5DF61
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F0010F0D0;
	Wed, 12 Aug 2026 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIB27nUK";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339110F007
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 13:56:43 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-46f88060e8dso109267f8f.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786543002; x=1787147802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cjqqYdlJxczb+huWu8sxbAJ3m1jklduZMwUdXKo3Ujw=;
 b=lIB27nUKqnwRv9StQQX2ra9M5Lb6klstSyBZjEH1NtCECxiz4BS1VpzJPhAQmNndhb
 vnm4vFPfgKKycsg9w49VbKPwbvzWh4cTNUwsUzNVgLaaMqpnJSFIhAqcUDx/mQcwtq7L
 fPM0BOKKBg/StZM8ObxI1BLRtvPhIv78Lj8jAAZ4daIaEqzd4yzAbZHFdHEn4I3lNgFA
 1cpxomHm50k/xKJzx6x/PPpImUEl2n1anhLun+LOUnZCt0B/TMdvKRHcMtaW7Yd5er99
 YYtqbtTql69xauYQC25MBPsJEqA8vfixEJ7h7k3w7quq/sSyBMjdU/sUnFHtx3iZZMfV
 /F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786543002; x=1787147802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cjqqYdlJxczb+huWu8sxbAJ3m1jklduZMwUdXKo3Ujw=;
 b=Wn9NhvgSSMy6GCT/ZgDAaXOeD1fVQY4NL3qKQ9URME0/rhPlUnRoqUo5M7QwcYm99Y
 IlbtktmPsOtmyR6B/azM5yDYKnqko6u1Noraz6VU5+Rq1jHVUwqfzn+qAPXqnN5t3FU5
 Y8f2FCnLXXlzev0cL9F8zJXH10UV7q3ouO3nwVJLekA0ijwoSLOx232iuV0d7nUinXUY
 mJ/FWAb1n3A3JEjyuCGCBC+m1osGn/py66zTbpnAD7aWSOWlKxBQ7xBhm5qCiRZGf/g7
 f/21C3BDbuzBdSSfz7k7GuOyr2kPxDOQrP9I/7dChjxHmDwKs5Vk61kZA7a7NDyX1Kip
 UwSg==
X-Forwarded-Encrypted: i=1;
 AHgh+RojYV0Ow9f1L6P0ar2JUopkknjuidB9JvT27kio8ZyMUcn29odJfl4UozdU62zfkaEwsd1lPcD8Pto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnY+at1QRtpZ6q5USHWEPntzKhiUI0S2zBThJ2aUI8t7XmL2EO
 js7XkgHgQJWY7ixY/a+f48sFQ+Y6sXZft9tQnFtje+qKDpKOagZn04ED
X-Gm-Gg: AR+sD12XFIJfz2LE9MPIF79G3guhDvt7+JkNZuQc4KwX+S6pT6PDlHMJ88P0IzcLzd3
 oj2HXH5Av1CJSY3Vq7pHs/Ml0mHOgkqxRtMG08JTw/QFGMEPhcuTLqEA06T5i2R33ge2hk7fhqn
 tpyq/HdjnJF9D2fsOhh7r5NU8VjOnkYwq5M0UF9iP+oXIZaHNSXUoVhHDznbRthS2ZBD+kp9xow
 1TNb69hErQb/I9qPtv9piIKvtXWyECqDhIg9DnMMwzrJLqi9tn0IWeM4wkqOnWC0MLYcDuyjdA1
 ALmKrgSJBvAHhr7XhIE0Z4NaUbI671uQjhymab9lC86ixegjkmHXctuOmMZegV9Ftll3DtzfYZd
 7o/SqdwQ9OQpVMceSBDI+Va/fOlEWQ6lADmg2RSa8jaVbXmqXoC5dZ8uQsz/XxYsjbJsWKH36S+
 BM++mAkM5p028HGX03WSIYgC21B3iPphZwP6hHdf1XDuqC2NIjktRJV1og0YOjcyLrTHg=
X-Received: by 2002:a5d:5f41:0:b0:47f:6fbd:f23e with SMTP id
 ffacd0b85a97d-48152cba2aamr4137759f8f.4.1786543001607; 
 Wed, 12 Aug 2026 06:56:41 -0700 (PDT)
Received: from localhost.biz ([185.61.25.133])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5f27sm7351303f8f.1.2026.08.12.06.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 06:56:41 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: [PATCH] drm: i915: fix sizeof argument in reset_csb_pointers
Date: Wed, 12 Aug 2026 16:56:26 +0300
Message-ID: <20260812135626.16959-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:47 +0000
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

In reset_csb_pointers(), drm_clflush_virt_range() is called with a size
calculated using sizeof(execlists->csb_status), which returns the size
of the pointer rather than the size of the object it points to. This
could lead to incomplete cache flushing on 32-bit systems where pointer
size differs from u64.

Replace sizeof(execlists->csb_status) with
sizeof(*execlists->csb_status).

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: dc0406820ee7 ("drm/i915/gt: Drop invalidate_csb_entries")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index e693b0c9d2a3..9ac67a0cbb1f 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2833,7 +2833,7 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
 	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
 	drm_clflush_virt_range(execlists->csb_status,
 			       execlists->csb_size *
-			       sizeof(execlists->csb_status));
+			       sizeof(*execlists->csb_status));
 
 	/* Once more for luck and our trusty paranoia */
 	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
-- 
2.53.0

