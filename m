Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6A606A330
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAamMi8M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7BB10F15B;
	Mon, 16 Nov 2026 14:37:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F93B10E337
 for <intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2026 01:43:59 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c40e30c26a4so358770166b.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2026 17:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794620637; x=1795225437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ln/RngDaBKEnJFXqfKaXLiW2drDb5LIdcMJafwzjtfA=;
 b=fAamMi8M1XatpkG2C72yQttqUVQGl0beWVEH8mopdMselkrRq8zyDEOQ1kqYo8c/wK
 Mtipv6PYv7EL7RHVgOE3ymJCTzU7jsFKN17f87znGTZgQ1iQNl+GGEwqWIc41Q9xj8sK
 DfyJecdWE959QjwuZyaBnSM+vE6FugyaroNLC0kP3LOELbItMusbMYO1ugLEWG+OsaFv
 qbggafHWHB+DEa8Sq+B/TKTXwB92AKxpuTKXa/nF/2kBlNaJ7SIa0ze/yPeYsFTbS+J/
 8yKR58CDFglbiuSc5joApMXrEP5H7hGoTSXTJuwH93SU6/Xfot8kCKBrN1Rt6IfUsZ7e
 U5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794620637; x=1795225437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ln/RngDaBKEnJFXqfKaXLiW2drDb5LIdcMJafwzjtfA=;
 b=UsdAOi8mcjewlVW4K1WsR2xaMUyaaVa9/UFf+ilB9uMXs4q+CdvZ9V4zeNZUhRGrv3
 Hlzoe2WJElvHa8J+BQdNBkCaC+BETKiZ1hkeeMreI6+7WdKqvTTLF7yA2B5BK2a3UY90
 9nXGKxvtoj8heplhRacUUexLA5hY39ticWdAHJutG5LZpEjf/Z8FtYm/tgRYso5nOQu2
 8uAAye/RsdUDKWzhLy1ju7oGwqfvnPjDsi+jAkEDM+I2mja6f1TBnt0SZsKnze8RRGpT
 g4dRMMtEZKqFqg6j/hrUmAosA0T7sfQ4LqUt0Uc6Wh341Kp6zz50iwhWFEUlycFL9V0y
 i0Yw==
X-Gm-Message-State: APuU4Z+nVaGs/Y1dqso0CJXBM8pZUhOI8SrD3SzJnG6OMfMfmSLh2pHS
 8xfE5Hc065WGZRuovs4ailLGhdQycH8M3NNgoApyANtECgSAKWTsvDL3ZP/9fDMKkTg=
X-Gm-Gg: AYBFou23LaCo/GHAKZuwiq/VdhpEm5A9KR0LsggXZ9or0HQAyMHfSeZopy7wve6eR7F
 lKgMR+CANNlwpYwzO6vWNEg2PSDbVfw/o3rxELHtEiebLfMe6Gn28ARLj0mQdK7i3dEZmnVYowc
 TlYQmGT2tIt6+j36HfsrQ3Qad92jQcgf6D4WxB+fnQCuOM7seK7/jjLteAlO/Y21i/oJtnlGzLl
 l1ow9xMYDo2Smg1zPtyJrzuJf1AObq8RHQHJ3vJqKnwG4hkl5U2OWc+wettnJ004oKSwjweUegr
 sqF7+5k4mDtzvEdCaGquRb4Cww7JfztZGRA/L+d6AFGyYtMIGCM63xsLmrOtX30DlruzmmPb7iY
 Q7YH9PK3j03KuCz0sL1EqHJ1skV4rtoYWFiFO5u0OYTOKZb5P4nPuOiNyDegzAwslNj2jeErVO7
 DmuSU3h6V1veC1/w5k5duaGgdRZG1X2Rk4GU5YkkG5pLkHuA4Tki/zU91bv360szbQNNIr+hmY2
 oZlH7IUIBdxym0mGmKApAElpZTmbChYZNhpYAbcjHDQJWktiYNUAb6mxKiTWMNRcN00zgIqVAPC
 gEYRNK+gU1jsIETvqSvGs2eujCsnjp8+p0AGTFgfCXv6aJ/6Alk4o35d4fFTqR75zHMuYP5eFxd
 ffUOISOmpAKXzErY1ue8myd4=
X-Received: by 2002:a17:907:849:b0:c2e:7fe7:2898 with SMTP id
 a640c23a62f3a-c509634b3fcmr384987366b.12.1794620637178; 
 Fri, 13 Nov 2026 17:43:57 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 17:43:56 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ElXreno <elxreno@gmail.com>
Subject: [PATCH 1/7] drm/i915/panel: Fix the pixel clock overflow in the VRR
 vtotal
Date: Sat, 14 Nov 2026 04:43:29 +0300
Message-ID: <20261114014335.2132756-2-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:25 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_panel_compute_config_vrr() multiplies the pixel clock in kHz by
1000 in a signed int. A 3840x2400@240 timing has a 2342.4 MHz pixel
clock, the product overflows, and the vertical total computed for a
refresh rate other than that of the fixed mode comes out negative.

Do the multiplication in 64 bits.

This needs a fixed mode above 2147 MHz, so one that uses the joiner,
inside the VRR range of the panel, and a request for another refresh
rate that ends up on that fixed mode, as the allow_modeset=false path
does for a mode that is VRR compatible with the current one.

Fixes: a2da67028cd0 ("drm/i915: Allow arbitrary refresh rates with VRR eDP panels")
Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 81e638d0c7b3..157be3153c7e 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -277,8 +277,8 @@ static int intel_panel_compute_config_vrr(struct intel_atomic_state *state,
 		int vsync_end_offset = adjusted_mode->vtotal - adjusted_mode->vsync_end;
 
 		adjusted_mode->vtotal =
-			DIV_ROUND_CLOSEST(adjusted_mode->clock * 1000,
-					  adjusted_mode->htotal * vrefresh);
+			DIV_ROUND_CLOSEST_ULL(mul_u32_u32(adjusted_mode->clock, 1000),
+					      adjusted_mode->htotal * vrefresh);
 
 		adjusted_mode->vsync_start = adjusted_mode->vtotal - vsync_start_offset;
 		adjusted_mode->vsync_end = adjusted_mode->vtotal - vsync_end_offset;
-- 
2.56.0

