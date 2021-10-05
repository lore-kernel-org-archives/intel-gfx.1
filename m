Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695C5C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 06:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E07610E5
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 06:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E07610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E67B6E2DF;
	Tue,  5 Oct 2021 06:51:59 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB9B6E2DF;
 Tue,  5 Oct 2021 06:51:58 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633416715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gia7rDZsepYWedc3tB5iiMNpDT1qzajEGVwArNWFmlA=;
 b=eMCHt19i7ek8k2IUmX+bjsicNtWIu/FbLWufCHWnKsDBegazSN5q7U9liCHg8PRxk83lWA
 UAUMi8pPPaTCzNOqe8DwCHkpQB5xzgcDrqS2YYbFhIHbxGJTZW2IXY6lNQTrNmskxyHPJP
 P1h0UhZlf3Bgzc5/dbLjBVaztc4tuPaaW4dHFwdWbHXlOJ5niuCJC19JY9ZAy3bqgFvZcf
 PAZk1E5ylEo+zoMrAaLcROKmOIoh6vXWOJTzvMYFgSiHWSLUJbGhyAVaDk922IONAXRTL1
 nrz5EHAHmFW6x8e5lwOk6ZbPoe4ZueHY9k+XH83V3jOiCDUhSiaY8uFDJYLxOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633416715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gia7rDZsepYWedc3tB5iiMNpDT1qzajEGVwArNWFmlA=;
 b=FqRKijl2PDI5oEIQXDDoS9qX3ZLDXZdQHljrgwC7rs6p+Cf0KnlMQGXB6ZAeLQLc211WCm
 VpuC4yP52DkJEMAg==
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Tue,  5 Oct 2021 08:51:51 +0200
Message-Id: <20211005065151.828922-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [Intel-gfx] [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY by 18.
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

The warning poped up, it says it increase it by the number of occurrence.
I saw it 18 times so here it is.
It started to up since commit
   2f425cf5242a0 ("drm: Fix oops in damage self-tests by mocking damage pro=
perty")

Increase DRM_OBJECT_MAX_PROPERTY by 18.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

I have no idea whether this is correct or just a symptom of another
problem. This has been observed with i915 and full debug.

 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c34a3e8030e12..1e5399e47c3a5 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
=20
-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 42
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
--=20
2.33.0

