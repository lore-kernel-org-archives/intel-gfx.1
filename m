Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6859C531D2
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 14:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8310F145;
	Thu, 23 Jul 2026 14:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mbAgzanK";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E2810EE41
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 15:48:04 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-84861fc51f5so5320321b3a.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784735284; x=1785340084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oYgzICp3WWBVEAdBWpXW/nz3XQWTxOaX/2nc+F1fyyo=;
 b=mbAgzanKgbrsr/Rh8V4iysxZzDWxKj4GcWJEZkSL101AhSdl3cE/7OxD5XtNZ6Lcpt
 ECVnM/WtYPVYqoY0SNqhDJSp1d+LtDowPahjW6V4xe8umzNmlZSfjWi2YNlqN6M5bR9U
 /pIjHjWdvjRJCGGvrXgXlKsEvl/7H+ARtxGl8w88OZRRLQFJROCEwqvl/+1SCI3NKpwN
 AIpimg/YSqrd9Q8a4l4kbhZw8/F49uiq+zolMH3LedeY801czZzjkNYGimbEPCVACYn7
 Ecmi/Sp5IK5tBFkhBZOvC16N2oE0wBWrPCwSJX44XXExN8mEb/2rghG3V2E02SEx/lPm
 AlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784735284; x=1785340084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oYgzICp3WWBVEAdBWpXW/nz3XQWTxOaX/2nc+F1fyyo=;
 b=p7OQMK0hAkXC/sSpllzRqaOpQdUAWlvH0koAjNy/kAnxl4KhN6wC0MtLUobLk+u1mq
 CZpZnuG19P025RDsJoAvdpTaALQObNCSpG+cCOmJQjUawLLUQrQK4xboUzXeke1AGp8o
 gXqMfmqdcJr/wPusVAM0rDoQU1E4E1kbJiApj59Pv3bahG48Hlof8LKhlmSCZBTjvpel
 ngG8qbuQtrzUPi6hStXflS5ZM7TnjdQj6WiUkuL0zLyoDXy94oPHOyRoX7xKBSjRL1Nq
 MYz1hhyh+dCeQaBmIdlEPTqM3QWHxrvVOl07pu1iLNkA4qmJcG8Q+WCFHH501s6XsX+o
 t5kw==
X-Gm-Message-State: AOJu0Yyj3s0BioJVYx7IB92bvL+qDy30+fiGKzZpOKOvHgjPZ6rWsPKh
 53qOYuCixuNPaXK4Zx10uUdmznwdhWWkmcMXMkUpkvXvdsX9Ekjsi36zRPHDfEpG
X-Gm-Gg: AR+sD11gKtu4n/2zXx6V5h+txHgiXMJK9WpoNGWdUZC0ZbN4mAuCjfmBTITsXhSK7kW
 hRvR5TDB+mBy33Q2EAoNH7cuRmQrp7l580kwNtE3eR9JVCdwxq2fYt1jaADOaGtrIj0xTwAQFum
 mUvY2fzFR6KpZnHOxCmOINCLWqDUvEE4E5lB2q8NkqFsPUVYG0PuaT319fPrA/knxdAqFYFXUms
 zOpSYmRGctDfMVzJi2OlwwUQ7qv850XYzHIbnWtnP9zU3vKrgsO1R1mKnTHpFbJ7wSjL+TUurpX
 8rxxu5QdIC3hKrr6Y2YLcqeQyCqLtoihak9z2nF+XfL5RuuoVUnixIbQv1giHVi20ByybK5tq8z
 kGB6P2ZYQT7fXdG17Erx9nz8kHOHyk0tUTWIFQv3/Etd8B8M5+D0g05Qq8tjnyOUCuXLW4A4ned
 yl0GVvz1qczyT5YNENh49Dgry/dSS3c0XZD2+59BNRvQYFG+JZztBVLlSVSfU=
X-Received: by 2002:a05:6a00:1382:b0:846:7507:4e07 with SMTP id
 d2e1a72fcca58-84c29505e28mr24354626b3a.39.1784735283477; 
 Wed, 22 Jul 2026 08:48:03 -0700 (PDT)
Received: from cm5pi.lan (174-21-80-34.tukw.qwest.net. [174.21.80.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e175cdc21sm1567763b3a.47.2026.07.22.08.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 08:48:02 -0700 (PDT)
From: John Foushee <johnfoushee@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 John Foushee <johnfoushee@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/backlight: allow hybrid pin-enable + AUX brightness
 panels
Date: Wed, 22 Jul 2026 08:48:02 -0700
Message-ID: <20260722154802.3760046-1-johnfoushee@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jul 2026 14:08:34 +0000
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

Commit 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible
check condition") restricted the VESA backlight path to fully AUX-based
panels (enable and adjustment both via AUX), on the grounds that the
hybrid configurations are not currently supported.

The hybrid pin-enable + AUX-adjustment configuration is however already
handled: intel_dp_aux_vesa_enable_backlight() falls back to the PWM
funcs for enable when info.aux_enable is unset, and
drm_edp_backlight_init() supports aux_set without aux_enable.

At least one panel requires this configuration to work at all: the
Tianma Y156ZAN02.0 in the Google Pixel Slate (nocturne) advertises
DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP but not
DP_EDP_BACKLIGHT_AUX_ENABLE_CAP (DP_EDP_GENERAL_CAP_1 = 0xfb,
DP_EDP_BACKLIGHT_ADJUSTMENT_CAP = 0xff). The panel ignores the PWM pin
for brightness adjustment, and resets its AUX brightness register
(DP_EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB) to 0 whenever panel power is
cycled. With the PWM backlight funcs selected, the panel comes back
black after every suspend/resume or DPMS off/on cycle while all
driver-visible state (link training, PPS, PWM duty) looks healthy.
Firmware rewrites the register at boot, which masks the problem until
the first runtime panel power cycle.

Allow the hybrid configuration by requiring only AUX brightness
adjustment capability; backlight enable keeps using the pin/PWM path
via the existing fallback.

Tested on the Google Pixel Slate (KBL-Y) on 7.1.4: i915 now selects the
VESA AUX backlight interface, the panel's AUX brightness register is
restored across suspend/resume, and brightness control works over the
full range where it previously had no effect.

Fixes: 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible check condition")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16679
Cc: stable@vger.kernel.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Foushee <johnfoushee@gmail.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 7a6c07f..a5c03c3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -616,11 +616,15 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 	u8 bit_min, bit_max;
 
 	/*
-	 * Since we only support Fully AUX Based VESA Backlight interface make sure
-	 * backlight enable is possible via AUX along with backlight adjustment
+	 * Brightness adjustment must be possible via AUX. Backlight *enable*
+	 * may come either via AUX (DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) or via the
+	 * BL_ENABLE pin, which the VESA backlight code already supports by
+	 * falling back to the PWM funcs for enable when aux_enable is not set.
+	 * Some panels (e.g. Tianma Y156ZAN02.0 in the Google Pixel Slate)
+	 * support only that hybrid configuration and ignore the PWM pin for
+	 * brightness adjustment.
 	 */
-	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP &&
-	      intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
+	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
 		return false;
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
-- 
2.47.3

