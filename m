Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A107DCD6E55
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 21:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76010E9C2;
	Mon,  1 Jun 2026 21:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Va6kpgDq";
	dkim-atps=neutral
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB410E9C2
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 21:26:38 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-304e7fbfaf5so4913593eec.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 01 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1780349197; x=1780953997;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3wh4yLz791i01l520sQwg6kW5ZiiNJNQAQS8T5VXvN0=;
 b=Va6kpgDqPQ2lIOctYgxX6FMUJOogniQXVMFPnv9hERgKlRPqdIAeYqlOvdUB6vq1BK
 9JzwNlOIfxmcw9IXVKS0chkMgIz8bkMyCt8qF0R4INIzZhlhhgMbt6+hXtN48qpbJSjI
 hiSpS33jMInkpOR8gGDwNGi+mj4947kYrK/26dbJbuR4fnLXFcHh2ewiIy//DlMAIRR7
 vofNtti6/3itkaAuDGfxqyCnNQCbZ7M6zTPiNKGaFTGTrzK1LDw58FDkIo+GNdYihfWA
 +zeNZqhdX/ay0U6Y9ul05kEorjIYaaCC0LGkseLlORa1ySfvZw/dNj5qEILbpOJMscOm
 6FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780349197; x=1780953997;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wh4yLz791i01l520sQwg6kW5ZiiNJNQAQS8T5VXvN0=;
 b=KDnbmWGA0eEfeHIBWoRzQiZK8/Txhd1eUWk0aOIvqcrPxzi9J+yVbKguX5FkCrSaMz
 vNsMMMlmogRwo/YHEvx8xGyXfek1bJKitstaWz0E6ICUbzITqGgMbUOKBhXJSX7yAPP8
 Kgo5Jlpbux3EymSdgeHpAdy0/NnErfO86YhN1WpEXS/OQfIwfXTvHtfSeQ9xpahLMwbB
 LFn1VdwWJCXDtEswJJtQ5oIwnfolWQMoSw8AHeEbEeErnNXzgQyoTexItCmWWp9OVwCX
 DNicOBKUrxeAp2svFVMt9q2MbRwb1UnkMXHZ0Gayc1xlcZ79pEE6wMSxSzTnVcluqKjY
 N1fQ==
X-Gm-Message-State: AOJu0Yy/J+95Q7zKh5qGsG787Dq6SzwaNAwgVFrcjg+q1fYUQoMQQ0Mi
 HfNJKsg6ACELJ9nkqm8HdtaZtn5ddQLdxDnA39dvk70hqJ0I2S0BiaChwABKJ4gZesWGSc5iEor
 Jq4CepduKNoD6k+Ep9DcUWk2VrlZazujnCuptbF8TFhmZBWajL5S5H7yhgTqho6Yoms2iNjVkS/
 w89yqreIOMEjfl8gG1petKuE98FRnBxI6P/FQ5QKOsGW8wpKlxvavLJjelP6c=
X-Received: from dybnb27.prod.google.com ([2002:a05:7300:cc9b:b0:2f9:af7:504e])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:8607:b0:304:e2a5:689a with SMTP id
 5a478bee46e88-304fa5a94a8mr6334105eec.21.1780349196938; 
 Mon, 01 Jun 2026 14:26:36 -0700 (PDT)
Date: Mon,  1 Jun 2026 14:25:54 -0700
In-Reply-To: <20260430231206.772649-1-jdsultan@google.com>
Mime-Version: 1.0
References: <20260430231206.772649-1-jdsultan@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260601212613.3682640-1-jdsultan@google.com>
Subject: [PATCH v2] drm/i915/dp: Handle VSC SDP revision 7 in unpack
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Manasi Navare <navaremanasi@google.com>, 
 Sean Paul <seanpaul@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="UTF-8"
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

VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry Format)
unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pipe
state mismatches during state readout because the VSC SDP state is not
properly recovered when Panel Replay is active with colorimetry.

Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()
so that the state is correctly recovered.

Signed-off-by: Juasheem Sultan <jdsultan@google.com>

v1 -> v2:

Rebase onto latest upstream
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6ef2a0043cda..b8746dab051c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5343,11 +5343,15 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 		 *   VSC SDP supporting 3D stereo + Panel Replay.
 		 */
 		return 0;
-	} else if (sdp->sdp_header.HB2 == 0x5 && sdp->sdp_header.HB3 == 0x13) {
+	} else if ((sdp->sdp_header.HB2 == 0x5 || sdp->sdp_header.HB2 == 0x7) &&
+			sdp->sdp_header.HB3 == 0x13) {
 		/*
 		 * - HB2 = 0x5, HB3 = 0x13
 		 *   VSC SDP supporting 3D stereo + PSR2 + Pixel Encoding/Colorimetry
 		 *   Format.
+		 * - HB2 = 0x7, HB3 = 0x13
+		 *   VSC SDP supporting 3D stereo + Panel Replay + Pixel Encoding/Colorimetry
+		 *   Format.
 		 */
 		vsc->pixelformat = (sdp->db[16] >> 4) & 0xf;
 		vsc->colorimetry = sdp->db[16] & 0xf;
-- 
2.54.0.929.g9b7fa37559-goog

