Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB96C88E50
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 21:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42710F30B;
	Fri, 11 Sep 2026 21:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jB4Yr0RH";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074F710E402
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 20:02:14 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso11997895e9.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789156932; x=1789761732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
 b=jB4Yr0RHvhnAQV/NgIpMAsjfti/wrso5mv1Pb2Aptx6lPPCxdtimMcI4K+MZvaUzUu
 Eh2jKQHdF/L3NIdXEGx1ZFBMVVxxzc+PwY04lvQgyUy48VKRtDzJ+4BsZGcveQqmZkdK
 D6wlKe07gcJIiRWOPKAWZDMYITCI7Z9I713avAEIEzAtzUasr1uIFRaPYLdTCbhWF9e1
 RPE6mtFcpMKl4QUjPi2k18YVpc3ZzRyQh1qXI8171OAEqZjvfWJNH1DBYwmfAmAs6P0v
 ZhfN3KSuG2mYG/Zst/HFvKpMukTgR4VHXYE433d0q/6K11BAwG8VKU+LGryfOPXsvbuN
 k8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789156932; x=1789761732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
 b=Jl6/fVso1BsoS8dGiEeRHLrnbtv/b4JD2k5bnLuzqxmLDt93bI+YicfQc1cisrsrRk
 1UotbgYkVITgDyF2ehajfG8Szq5aM+ZW8cZCcRjuBJG4ZJl6L10o+jIvIbAxsarhJjER
 rYwhInhyuRcljue+NqTt1I1P84ri4EhVitp852NxnzZCeU/OPQZXrZ7+Ef8JvUMcp2pX
 eUL64th9NpgG02gJrQ+ti1Myb+Q0XRfJ6STcpKI4sPq5+wzSjK/3i+8kxMVa/ILPHNYl
 86A0Qay4h9mzlMXS2N0ZR+xjDLmuQEniKxhlNKlu2I6NIfIg2cZqK0KKh5E5+sDDPKJE
 h/5g==
X-Forwarded-Encrypted: i=1;
 AKwUvBylU8qJQvnaUxMHVZKHfS+qIeY5QNcDk4Qf7mQV3qzy/J58cfP3G51O8qgcuwtKa1IKAV8uo7LyB8A=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mb8vGiL115C7Qar/vZNrjoZwk3+Dg3k1/JgRU3jJr28W2GhTB7
 fkbh0GPyNWiWg36k8dz286B8qImZ2Yy4WKgFWdTF7njnzVV1kIo0NKBj
X-Gm-Gg: AYBFou0z2b2BFHQIs4TYD85xsFB0jgg6y+JXnlDzaGtUJ13eRlg3LRm4s6y9S5jImkh
 H8SyhJ+O4hXaUdSGxcSBKEdqECqg11mpqcfkMoVTlQgTrBL82uax4py+N3bI3/RdJgQ+VBWnAyq
 PbkkNI0Bte1O7pN30fvfQDj9epAqyo/nfAM0GbBr6VXZVsJfigY1H2cSjQ1YM2L28Yv1cfr7aV7
 vHgQ6rj2+6vCVJiUwNlVrW9HVGK39Ks8AHoZwSE48KYpRAToY/cK2/mf95Sv3jKAX8EsnHNA5Gm
 yLjVgA2GWeASFnvpUdk+umf+ZTSNjsEA0PdFzOdtZLAPzSogFjMFw3CFXi/fFBMD0hUr7k6WF6y
 ljiJLtPCO1dDr1kCpkF0lkWAeJa2dESEhp/Uhr48Z4OWWsvbzMtyxmnNGN1pd7W/VFEluum/YQh
 XrhCN7pwbxHZCxKAMFu5UJJWyZRCbB89u1WNM7PHYFI4O5xLIOrG+IggdE6wif+uISfh3RmgpC9
 WBm3Fv66KJaxz5CRKSHrgjjNF++wIQUXvmU8wywMg4NHhoNUt4oq429YSxbr59XnBqvyxBbZXtc
 9EM+xWACOhl+Akpb7H0yVRdhCUqAvG4i3Phk
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id
 5b1f17b1804b1-49e6198f947mr76504605e9.12.1789156932186; 
 Fri, 11 Sep 2026 13:02:12 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e69f02c92sm28156515e9.2.2026.09.11.13.02.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Sep 2026 13:02:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/audio: Fix names that do not exist in kernel-doc
 comments
Date: Fri, 11 Sep 2026 22:00:53 +0200
Message-Id: <20260911200053.78731-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Sep 2026 21:45:30 +0000
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

The audio component overview still refers to the former
i915_audio_component_ops and i915_audio_component_audio_ops struct
names. The generic audio component split renamed these types to
drm_audio_component_ops and drm_audio_component_audio_ops.

Update both references to match the current types.

Fixes: ae891abe7c2c ("drm/i915: Split audio component to a generic type")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index eae76e9611055ea684dd98c34889be2413a89f80..c703da26914c1d957dff61a0220b70d3275255ce 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -63,9 +63,9 @@
  * covered here.)
  *
  * The struct &i915_audio_component is used to interact between the graphics
- * and audio drivers. The struct &i915_audio_component_ops @ops in it is
+ * and audio drivers. The struct &drm_audio_component_ops @ops in it is
  * defined in graphics driver and called in audio driver. The
- * struct &i915_audio_component_audio_ops @audio_ops is called from i915 driver.
+ * struct &drm_audio_component_audio_ops @audio_ops is called from i915 driver.
  */
 
 struct intel_audio_funcs {
