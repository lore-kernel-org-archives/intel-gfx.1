Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E8BC433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 04:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF6E222BB
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF6E222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F189DC1;
	Wed,  6 Jan 2021 04:26:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2427989DBC;
 Wed,  6 Jan 2021 04:26:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 14405A8831;
 Wed,  6 Jan 2021 04:26:12 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lyude Paul" <lyude@redhat.com>
Date: Wed, 06 Jan 2021 04:26:12 -0000
Message-ID: <160990717205.18710.5071764868512550010@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210106013408.271217-1-lyude@redhat.com>
In-Reply-To: <20210106013408.271217-1-lyude@redhat.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Add_support_for_Intel=27s_eDP_backlight_control?=
 =?utf-8?q?s_=28rev5=29?=
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

Series: drm/i915: Add support for Intel's eDP backlight controls (rev5)
URL   : https://patchwork.freedesktop.org/series/81702/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
ec0e241787db drm/i915: Keep track of pwm-related backlight hooks separately
-:593: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#593: FILE: drivers/gpu/drm/i915/display/intel_panel.c:1815:
+	panel->backlight.pwm_level_max = intel_de_read(dev_priv,
+						 BXT_BLC_PWM_FREQ(panel->backlight.controller));

-:634: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#634: FILE: drivers/gpu/drm/i915/display/intel_panel.c:1849:
+	panel->backlight.pwm_level_max = intel_de_read(dev_priv,
+						 BXT_BLC_PWM_FREQ(panel->backlight.controller));

total: 0 errors, 0 warnings, 2 checks, 740 lines checked
36a625852ac9 drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
-:162: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#162: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:149:
+			return panel->backlight.max;
+		} else {

-:202: WARNING:LINE_SPACING: Missing a blank line after declarations
#202: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:189:
+		const u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
+		intel_panel_set_pwm_level(conn_state, pwm_level);

-:229: WARNING:LINE_SPACING: Missing a blank line after declarations
#229: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:216:
+		u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
+		panel->backlight.pwm_funcs->enable(crtc_state, conn_state, pwm_level);

total: 0 errors, 3 warnings, 0 checks, 401 lines checked
2c68f1b5fd1a drm/i915/dp: Allow forcing specific interfaces through enable_dpcd_backlight
eafe126010a5 drm/dp: Revert "drm/dp: Introduce EDID-based quirks"


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
