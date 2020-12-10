Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B757C433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 19:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6E422571
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 19:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6E422571
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CAA6E44B;
	Thu, 10 Dec 2020 19:52:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 429786E444;
 Thu, 10 Dec 2020 19:52:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1BA82A0003;
 Thu, 10 Dec 2020 19:52:05 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lyude Paul" <lyude@redhat.com>
Date: Thu, 10 Dec 2020 19:52:05 -0000
Message-ID: <160762992508.19115.6746074970173352602@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201204223603.249878-1-lyude@redhat.com>
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Add_support_for_Intel=27s_eDP_backlight_control?=
 =?utf-8?q?s_=28rev4=29?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Add support for Intel's eDP backlight controls (rev4)
URL   : https://patchwork.freedesktop.org/series/81702/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d5d9ce10b038 drm/i915/dp: Program source OUI on eDP panels
512d305a2664 drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
67aeac3f4a13 drm/i915: Pass down brightness values to enable/disable backlight callbacks
a0b1c9f85b6d drm/i915: Keep track of pwm-related backlight hooks separately
d2b61f334725 drm/i915/dp: Rename eDP VESA backlight interface functions
a39270383236 drm/i915/dp: Add register definitions for Intel HDR backlight interface
9a7fd4a45094 drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
-:151: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#151: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:147:
+			return panel->backlight.max;
+		} else {

-:172: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#172: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:168:
+	uint8_t buf[4] = { 0 };

-:191: WARNING:LINE_SPACING: Missing a blank line after declarations
#191: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:187:
+		const u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
+		intel_panel_set_pwm_level(conn_state, pwm_level);

-:218: WARNING:LINE_SPACING: Missing a blank line after declarations
#218: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:214:
+		u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
+		panel->backlight.pwm_funcs->enable(crtc_state, conn_state, pwm_level);

total: 0 errors, 3 warnings, 1 checks, 379 lines checked
d6f6f3fa825f drm/i915/dp: Allow forcing specific interfaces through enable_dpcd_backlight
b5315912cc7f drm/dp: Revert "drm/dp: Introduce EDID-based quirks"


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
