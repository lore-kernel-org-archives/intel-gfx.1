Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01257C982EE
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7E910E393;
	Mon, 21 Sep 2026 12:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="au+one7x";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5A10E472
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 17:17:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-398b1e63c49so2054180a91.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789838263; x=1790443063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H22gG3gfK534GA7eikUt6vOg1Uc/mcVXz/VN/miRKww=;
 b=au+one7xZpijm1AwMzFGLdDyQdLtHEBD5jdXihECmRd2qFmDhlNyOwAv2ZzgvInk+2
 rPUduyWLBHC+5oqghGqScg/kExdAT29UkQYQphfrvkeOHD4LFrTAh6O/HdcgOKgVWwsg
 Leh7irzqK62MKThcHUjfaaeRrVZSL3V63HZh7zQxjbIjrcPGZ6/zFvqTNlS8R6ivb3Qv
 p0c6O4iNBnekJXIITpu8e8rmDRi/Ls7jGY48MGw39sYigFQ3VtdwOq/bgbfFrxK/yPTZ
 zk6PbPtYuWB1JpRXz1/uJiLFqXF2ZlIxskchiDO4SKpZTwWUs5kjnYWqp010VmyJldMp
 Yktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789838263; x=1790443063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H22gG3gfK534GA7eikUt6vOg1Uc/mcVXz/VN/miRKww=;
 b=1+jbKUQ5WrME9DMtGKaq1qTbfyGdhDr9knM58O0tIZh6WMj6AkhNhW4uohfgl+ObPf
 pepVnvewWAtxF6u7WIbgxvXLXYJMgfJrO2+BKqb7iOKfU+ZhxnfhIqH1JvEyUxUMTowi
 /iRht7mNmPBFJbI+WltCRCpyU6NWFhbJ9pIaUrf9e55hnMt3QgBnXHkoGMIzrxtRCC5R
 abVu/4OkU8mc+7diYAVKWDHigRz2rux/EeEaD96GlVG8oMAUGrMfYDVFvsw96Q8ybpNT
 jeUt83kQRIphOMBvy19BOfgMZ5hbUfrfgLKbY+rS5nPEREveVr3aQ9a9WxGmeOXiwb3v
 AHAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1v/XSN9JnRZdi38hOfQU2JQ0zRf3aVdij48j7GZV766HdSNiXvN5Kyo1BHc/+ay4sWkjRu122rQM=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kTnNZtzL92qjxR3XwNDlF+qTzlomM9z7CkckijvtZi/hjgD9pi
 tObeEtj6zNsuAY57KTnqt3NWurkUN27cdAixuzeOrq7YWd8yDk8qXnc5
X-Gm-Gg: AYBFou00TDlKUTzfoj7J0rs+mFyS+YIFTH/SpWBGSAXCmgvGF/HpTrLo3/pzv3P+GQ5
 q7L/B0COPsnBuoBBS5qi6aFQlRd3NGMjsVl3WS2q8t3FIWrLOmPIlAlZEgqEQR5HYi/o2jmzvQ/
 VLxYhN1xF4TzF4jQkhoXAyR8MfK6BwO+OkHCa4pxF0Kl4YBcBDvHvuclhRss/TvIj/TCh3R80r3
 EbgxOO+gw1D3PdXopnxyVmcYdEtdewoMjJkvK+NF9Z/7OwLshscoETUBhUEcnd8YRD2Kwur8eNd
 DScMykfUx1a3WdSayYVxw/TZYCEdv0B1qfcHgBQjczN1poyoKRI3K/kxIfzu/yRi62/DgWMn1qU
 +BcjNTK2QGZ1E4tbXMCDgiawF6lh242lRJoCXFDuUm2xZN0waQua/gS2FumlGtf2yvk+rua95OO
 rILDaZkbwC417l8nWrqNjPrvjp5LNA6AulFOsujP8sWZqtKNae5ZWnTRaN64twgH48
X-Received: by 2002:a17:90a:e7c7:b0:3a0:25f0:d89b with SMTP id
 98e67ed59e1d1-3a025f0de30mr1987486a91.50.1789838262634; 
 Sat, 19 Sep 2026 10:17:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144d55e71a4sm6919949c88.13.2026.09.19.10.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 10:17:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Guangshuo Li <lgs201920130244@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/i915: fix mock ring memory leak on context allocation
 failure
Date: Sun, 20 Sep 2026 01:17:10 +0800
Message-ID: <20260919171710.3699710-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2026 12:56:44 +0000
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

mock_context_alloc() creates ce->ring before allocating and pinning the
context timeline. mock_ring() initializes the ring reference count and
returns the initial reference to the context.

If intel_timeline_create() fails, mock_context_alloc() returns without
dropping the ring reference. The same leak occurs when
mock_timeline_pin() fails after the timeline has been created. Since
context allocation did not complete, CONTEXT_ALLOC_BIT is not set and
the later context teardown does not release the ring.

Drop the initial ring reference with kref_put() on both failure paths.
When the reference count reaches zero, intel_ring_free() releases the
ring VMA and frees the ring allocation. Clear ce->ring after dropping
the reference to avoid retaining a stale pointer.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/i915/gt/mock_engine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 79741f043f03..fa4368730d33 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -170,6 +170,8 @@ static int mock_context_alloc(struct intel_context *ce)
 
 	ce->timeline = intel_timeline_create(ce->engine->gt);
 	if (IS_ERR(ce->timeline)) {
+		kref_put(&ce->ring->ref, intel_ring_free);
+		ce->ring = NULL;
 		kfree(ce->engine);
 		return PTR_ERR(ce->timeline);
 	}
@@ -178,6 +180,8 @@ static int mock_context_alloc(struct intel_context *ce)
 	if (err) {
 		intel_timeline_put(ce->timeline);
 		ce->timeline = NULL;
+		kref_put(&ce->ring->ref, intel_ring_free);
+		ce->ring = NULL;
 		return err;
 	}
 
-- 
2.43.0

