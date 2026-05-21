Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DADCD5BAC
	for <intel-gfx@archiver.kernel.org>; Thu, 21 May 2026 19:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E858C10E1E4;
	Thu, 21 May 2026 19:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=poorly.run header.i=@poorly.run header.b="K0/Nz9Ah";
	dkim-atps=neutral
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6B810E1E4
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 May 2026 19:40:20 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7c23248f3a3so70776487b3.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 May 2026 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1779392420; x=1779997220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnQAGH+dQomGlGAwfQhy9zQFwVfiPtx2RAkCuL4b3E8=;
 b=K0/Nz9AhjgLbQvy2v2LRQ8MzQjeD74zVk5xkqP5NRJfyNu+HVuscsSuftqeMlIRiq/
 p4/Nlwk2+AUC9k1HIMqh5RFYReTeTUTxnfow4VjCoCa2qMx4ppVhA7jSAAQ9zp4VBdck
 705jiT0LA9eC1WbRkdHF0tT6bM+qIgI418462cKCeP/dwM7FajIS5CfCVAoXQaIGfy+T
 xVI0DPj0YSMdRYCGos7BusAm3EcVAWAACF9Dq0LOu+AV2r65OfOzKt7WXvID4MVItq0q
 uoH90Dvm575ALor/0mjK9v3b4RTpceNKz2N2Z3mNcSPIRinQIIzSfNrvUUbEIpVd+ZcP
 XfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779392420; x=1779997220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dnQAGH+dQomGlGAwfQhy9zQFwVfiPtx2RAkCuL4b3E8=;
 b=EN0uPk8iC5hVDAu/IUghGSRFtEyKI349y8JAuBvHNgWwuXD7g5dvc1+xX2cpMrCc/z
 F8qEuKA8UmsUGR89r6sLv/kfWAKGNK1gL6zrFO9BPwgghARauMGluc4InZofxn6xVmeJ
 AAllYkfTHNTKRM/d2oLNllhoQNU+uos6x6C4w/5jsxpATH/9aIPaqBwnrifvSxphsR1c
 lBomsUy5h79fJlzZs98PdWqyE9ZprRlWciE3gHdF561yonDWGRGIZwsYWxvYiHCatwAX
 LgUSuKVA6F/hhmwUt1jXUH5ecHlPP1C6Z4MsrcOeD2L99NyyDCmfVeyzE9LrqpxhAgcO
 9hPQ==
X-Gm-Message-State: AOJu0YzVi5rOzQc0h2zCm+1XrHWr7rsF9W+G1PcqMfaFbh5JTgcbVXtL
 qxabqMqoyrXiGMSYLK+107DfkyYNvTynVq2xTzEpdIfY9Lp+VlReOkvaLarPA52aTVKmaZEkCtu
 uXZeo1HY=
X-Gm-Gg: Acq92OEUz7X/HneRGTdNAiwsuNUx7s7guH6st4oyCN+I6MeqPEDBlpZ7T/uFGiswbpN
 B3BJf0B9rhUm17yR4/LmbhFW8sGk7ADs3OcIhxHwdG3698Azwv9eTFAOAhfTvum+4wuNc6DSDjk
 HOWWZDj8GLCTSj6EAkpAlfGtWaCQKFtKpB+Xc7FMGEseka2MQeFnKtILLPKGo7QpPwCe3hIDtMk
 LkVCwS0JJeY8y6kZYJoHl8zz1YEp7mLUiUOqK8r7KX5va2Vtc+NgEHUkiuPKWu04NoduOnDtffg
 zlFi/4c5h8pK6HGh80BaG7kpOcU32gSUVHavgolokFptcSBvl3dSaFONLA2W6pfwy7CEVo7v0v1
 aycm28/rfP4G60pjyXxReZmkl8ZToIIybqDPQCfX5LadwUAENTe+Y4ShN3P1U8f80UhTl0HT0z/
 RwIsBzr1ScTjc4H2Ybzb0ih5oe5R6SVJKcVxf3vkX3Ea2PDw9QwbrWN8aDSmEohNussg==
X-Received: by 2002:a05:690c:6887:b0:7bf:dc60:ad14 with SMTP id
 00721157ae682-7d3387835d1mr9226977b3.46.1779392419677; 
 Thu, 21 May 2026 12:40:19 -0700 (PDT)
Received: from localhost (182.221.85.34.bc.googleusercontent.com.
 [34.85.221.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7d35f7e286esm321947b3.29.2026.05.21.12.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 12:40:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Sean Paul <seanpaul@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/color: Fix step discontinuity in Post-CSC
 Gamma LUT
Date: Thu, 21 May 2026 15:39:44 -0400
Message-ID: <20260521194018.2445206-1-sean@poorly.run>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
In-Reply-To: <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
References: <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
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

From: Sean Paul <seanpaul@google.com>

Fix a step discontinuity in the Post-CSC Gamma LUT when SDR dimming
is active by clamping Segment 2 to the last user-provided LUT entry
value instead of hardcoding it to 1.0 (1 << 24).

Link: https://lore.kernel.org/intel-gfx/20260521180143.2143262-1-sean@poorly.run/ #v1
Signed-off-by: Sean Paul <seanpaul@google.com>

Changes in v2:
- Split out into separate patches for pre/post csc fixes
- Dropped loop bounds fix in favor of [1]

[1]- https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel.com
---
 drivers/gpu/drm/i915/display/intel_color.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2d318e922671..90d5dc2ef3e4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4023,11 +4023,11 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 						   lut_val);
 			}
 
-			/* Segment 2 */
+			/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
+						   lut_val);
 			} while (i++ < 34);
 		} else {
 			/*TODO: Add for segment 0 */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

