Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73173CD4F26
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Jun 2026 08:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0337B10EA18;
	Tue, 23 Jun 2026 08:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="nO/hURDq";
	dkim-atps=neutral
X-Greylist: delayed 576 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jun 2026 08:51:42 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22C10EA18
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 08:51:42 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 706823F2C5
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1782204125;
 bh=YRUdbfA4V8+mw/54eWhWx7hbp+2WiDaQD/36neeUeQE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=nO/hURDqPv0Hw+LeLdwYSAUk9XCKOBR9X3Z/uIukpBB3qVPz3Pw+1ESZJgjGJ14Pj
 nKO4TdZw5pW1QHKNGOc4HnV3dJxVarsK3IxuDleBCezW0zOPqHvE9C/erIscGYpVjy
 bq52dGJcTAj4QzxwpIjl4Rja+SCm01bq716vSYAFXPaAnlJSsuHh/RSXyidt7d3KAq
 tRNokxpmLunnnuk4TKtjmLpt0pUmKPvTOdjm28W79pIWLL+X4I6vG3n73M54UcEx6f
 amxwZsRaXibaFzggaJ4YcHAhUaBnr+TlH10lCJO0QgS5ZlGMARuGNuLo/BzZO59l3Y
 UBCOlIMc0AZpJ4drsYivLxXMABmq+CvzMwppXP0agREcOcThVUc54DwPW10QMvmKQw
 h+K1xspjEjve9A3kpo4snPags7/TC5pjfCn5aeQfe0hYmBLFPgz+Me5up9PvH2uz92
 macX5KHODPLXe6RDwJf2v0l5ghVB2jplbqqAv5IstVl8q7OtdS9M5sMyPAtEQ8Zh2v
 0MLn8M3P+WDNaCvgAr1DlOJhh/OaOC1PUR0aBGpGdXzbon1jNpLYGERow5EtQs/GvK
 lHv2moGgCZ3pz3vNoglD686SDlGC1pd6RUDAcOV2qC7cFHjrhJaBROxO4Fe4623vsa
 Pkr2HLigBqiT+hT4YZb5y6j8=
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8426ed9f24dso545585b3a.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 01:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204124; x=1782808924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRUdbfA4V8+mw/54eWhWx7hbp+2WiDaQD/36neeUeQE=;
 b=Y1nbw9iqmB79WKVb78gczIGvfAVbC8pZ+toJ1pHQ6haGG++8g/PFkgeAxnEXT2Aa8G
 uWztgwofwL3S+Baj5dKxPihcpltehREjV3Z2AoWLVlHq2kp6/NmNJloR0ySzDltJDW05
 NNlIRzDAvwO2F2A2NEpY9RstqBL79ONQztJVsUOH15e/w8xnXEIbG1GoBK9JevtNfelA
 X7xNSw398BWQd+/ddKiTMlSwmKU0Do4Sv1dUct/09YKjoebbIdy/fha7S4szgdCZSZat
 RYv8rXBKEmpTN0ohzvyv2vPQZn5aENgusxqciNghsgchiICsCuMTcanP+GgEUzSKyWUv
 eZ2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GcNK+/BHfoRGw7MmFsJpnS0FhEi9aTfB9nrdaKO51+IAotctXfu3hwufdCdAKSW+EaZ2f72Qk3Qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNho8in6d2twJlh2JvpsyZHJhcmTXa3JL9RWEYmCD0di8exENi
 iR9BCGV4W6w4d2ihVjIAYj125By1v3q5n3T37msumXajhnqtnWWjtikbqhXjrpzWnEGlC6nYvuh
 IhNresPYNshC6wQeNnPs8gvTKjlrEAddIlp67FE8nvroW2KxLaMXZeXpxaI8A3nXSQvHG2Mfu0l
 Pglr5RJ3a/zg==
X-Gm-Gg: AfdE7clHcUOIR9TAuNZ0NJFPaVbQk4CFRBJBIeyDawexJHiU1dD0EeSfuZ9XjxSJTsw
 Ks8x1cLKjeXomu8+ECp9rt/DI2jkqCvPPVEX7oI7ne4/QtVuIElTD9rAHxdlJN8KhUEtUsYkanh
 e+2DDLxjkc+Hp3Irtir6o4QOji4t1x4a1fJAJf6mjAPzFTBJ477q9LeQm8qSkW1zeZCdv08yinY
 EZzUqWFRU56K4q8W7V3tq7ceHQT0ieQI3+PjCRwApYqJfilrdw2NSXvIuUAv2nma2lp84lFHi9R
 AYu80Xvp11IIN2PJpl0ttBUWXV2wLsKiuc7AJY7G2gUKgvdS1m7YbHDDgkUX853WwqmQZqclZSl
 qMuf445R8BsiWEvbkms67WRXqEyczvFs07gtPhYaGoaV4/rdu5uAbRkFtucXZCrPB9LZj0MwcI3
 AKn1pXMZU=
X-Received: by 2002:a05:6a00:21cd:b0:835:447b:a2ac with SMTP id
 d2e1a72fcca58-84591b23f6emr2544149b3a.5.1782204124102; 
 Tue, 23 Jun 2026 01:42:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:21cd:b0:835:447b:a2ac with SMTP id
 d2e1a72fcca58-84591b23f6emr2544117b3a.5.1782204123617; 
 Tue, 23 Jun 2026 01:42:03 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564da30b5sm10828955b3a.25.2026.06.23.01.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:42:03 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/i915/psr: Skip PSR exit for legacy cursor updates on LNL
Date: Tue, 23 Jun 2026 16:41:37 +0800
Message-ID: <20260623084137.3421894-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ORIGIN_CURSOR_UPDATE falls through to _psr_flush_handle() on LNL
(DISPLAY_VER >= 20), which calls intel_psr_exit(). Cursor plane updated
via legacy ioctl (drmModeMoveCursor) does not dirty the primary
frontbuffer, no PSR2 state change is needed. Match the existing
ORIGIN_FLIP behavior by unconditionally returning early.

Before this, the psr2_sel_fetch_enabled guard only prevented the early
return when PSR2 selective fetch was active, sending cursor updates
through intel_psr_exit() and causing a black line artifact on some
panels during the exit/re-enable transition.

Fixes: ef39826c12b4 ("drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e138982dc91f6..32bee6c03b754 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3771,8 +3771,7 @@ void intel_psr_flush(struct intel_display *display,
 			goto unlock;
 
 		if (origin == ORIGIN_FLIP ||
-		    (origin == ORIGIN_CURSOR_UPDATE &&
-		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
+		    origin == ORIGIN_CURSOR_UPDATE) {
 			tgl_dc3co_flush_locked(intel_dp, frontbuffer_bits, origin);
 			goto unlock;
 		}
-- 
2.43.0

