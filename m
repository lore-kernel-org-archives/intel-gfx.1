Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F650606A31C
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVINHjUc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6911122A7;
	Thu, 29 Oct 2026 13:14:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6401120FA
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 09:09:45 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cc7e79c1eaaso870238a12.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793264984; x=1793869784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xUj6TVOjgwc5QvLbDmyVtO9DIkzDrZhSpW5tg4WgAh8=;
 b=vVINHjUc8CfCj+3bXO3bG/jl+0GWDNQ/xg2c7uj9tiXmjyKPy5gQJasB4czRLCl0OD
 Jm3rn10/67LLh0K+3Yp5xI5Ub87rPWSEfihprGeXmKruo0PH9HhgSDKxq/zdJC0q51vY
 7DcukbYM0IaWHyHa96maKnlN97Km+Xn1YNHkmI6UZTUEjJDgdnnyipU6ksPSflU/2Yj+
 6ueAxZZcpUghqNwcFTWXyA8AzWead23hCV2EvhPblBR7l+DhwYH+prbUWUN/onaXhcbb
 Uh7saLynHrTOYFe0T5QsVNvaQtTEqTLG4ywtrmIi0UV5LAUtqRbKGQ2tg6isV2eykT5o
 uHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793264984; x=1793869784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xUj6TVOjgwc5QvLbDmyVtO9DIkzDrZhSpW5tg4WgAh8=;
 b=yRdQLPeDHuocrQk46L/Ot6LykSkhdcWe0qf6pxVvxXI7KLGoHaW19UF+tbWnxVVtO+
 2d8HOyuzrCO7FnzVkeGnjVD8Z8NB7EcXvFs1Nl6KxCwSUG/4fXuWbdUtMwy249DJ7zGD
 Mo51mpd/t7WnE6U5KXw+BLXSKooI3Gq5hxw/D5KISLtxdB/NjqHo8qB14LVoYYcBgW+L
 xBs6/qVoGo7vaWyVwb0pL8nFKKZIzx2cT0znvMTlWBSH3enOL1kIwLsTOT5XP1TrTuci
 KaNSr1uZriaTfuDHrBviINo5ylVZa1bhDoHPmKP7ROxSi4sv21xKLY2Ndd7OmRnXXfSZ
 OIgA==
X-Gm-Message-State: AFq9FYIDDGLq0GypWkc6+MMV0dO+hoLa/NhEYs3ocs8N0+qMRY1pO71N
 WdSdprwk5keC53XhhhDt53ys9WBZ2pCn9yTarqi/XyGDBy+YApaYgds/+nsGTr0Db3BF
X-Gm-Gg: AYBFou1YzCPrHXONi7+q6pNFw4E6xCLU+vNznw4I40gcCkRb8qxJRWmWEGKoX9gYUB4
 FxHBKVYVTNDrYcqjiuIN7R9R1cKLA+g8NnzU0O6MvWw6XIu5XNE4vzcFO8ZEbU0SeMIl77mGT+6
 Yhzt0wgu7o5sFmS0QnCt1lCs7dQ3K10fkQlDWeZijZpR7cVzdT1zVdZBSSIEP3k566pVB4L9GF1
 Q44ycJSRdHo6gmTix7J1SVufhrwThw5Fy7UWsg4jJXWcbA1uux2liTs1E7FQ5+Bt1hzfuSTvZiL
 bIHzox5HMRrnpaS6eXnGZk+A1TcsFonIZt69g+R1BUaeDZ9MXmiC6V6IlxiM0Q6AD4Jojuxv06S
 0A+P25EdiOiEUmAXc1odhieJTfmOffEukXSuGr7iFVkgVCyJS005qhEpnR4+LKMF8Ctp6YVdvRp
 T2l8Hv1i3trOuNqO05xJTTEHKC0B3jzkOAKaDvmb8ql4d7KYCSCcdFPUjeSU851x61udLMFk23c
 P6Qnq4j2wIRFVaVscVvYhKFNp2NdfAQHEvMDzHu+nNrvj2EuVFyQnjFWSNC5Xx7OXlJgYeg7k4s
 s3LgPU5K7pUv5ir170qr5TcHhdWOCRlce1332u+gAkegyVRmAJWJSTipioWTIQ==
X-Received: by 2002:a17:90b:5908:b0:3a6:fc30:ce16 with SMTP id
 98e67ed59e1d1-3ae581e1948mr3437116a91.51.1793264984432; 
 Thu, 29 Oct 2026 02:09:44 -0700 (PDT)
Received: from deepin-PC ([2409:8a4d:d28:eeb4:5bcd:9360:26aa:4f88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae6e9db612sm3484362a91.17.2026.10.29.02.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:09:43 -0700 (PDT)
From: liuwenhuan <liuwenhuan@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Wenhuan Liu <liuwenhuan@gmail.com>,
 stable@vger.kernel.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] drm/i915/display: Add DPCD backlight quirk for ASUS GU605CW
Date: Thu, 29 Oct 2026 17:09:27 +0800
Message-ID: <20261029090927.2318434-1-liuwenhuan@gmail.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2026 13:14:35 +0000
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wenhuan Liu <liuwenhuan@gmail.com>

The Samsung ATNA60DL01 OLED panel of the ASUS ROG Zephyrus G16 GU605CW
(Arrow Lake, 8086:7d51, subsystem 1043:3778) has no PWM brightness
input: its DP_EDP_BACKLIGHT_ADJUSTMENT_CAP (DPCD 0x702) is 0x86, i.e. no
PWM pin brightness, no AUX x PWM product mode and no PWM frequency
pass-through, but brightness over AUX. The VBT still says
INTEL_BACKLIGHT_DISPLAY_DDI, so with the default enable_dpcd_backlight
only the Intel interface is probed. It is not used because the panel has
no HDR static metadata, and i915 falls back to the PWM, which the panel
ignores: writes to intel_backlight change nothing on screen.

With enable_dpcd_backlight=2 the VESA interface is used and the
backlight works. Apply the VESA fallback by default with the quirk added
for the TUXEDO devices. The entry matches the sink OUI and device ID of
the panel ("60DL01"), so other panels in this model are not affected.

Tested on the GU605CW with 7.2.11 and a change that sets the same
try_intel_interface/try_vesa_interface flags for this panel: without any
i915 option the VESA interface is selected, the brightness registers
(0x721..0x723) match the enable_dpcd_backlight=2 case, the whole range
works, the lowest step is not black, and brightness survives S4 resume
and an NVIDIA MUX round trip.

Fixes: f30fddb44023 ("Revert "drm/i915/backlight: Remove try_vesa_interface"")
Cc: stable@vger.kernel.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Wenhuan Liu <liuwenhuan@gmail.com>
---
Based on drm-tip 9daba28e785e. Depends on 9499c3fca1c7 ("drm/i915/display:
Add quirk to force backlight type on some TUXEDO devices"), which adds
QUIRK_ENABLE_DPCD_BACKLIGHT.

 drivers/gpu/drm/i915/display/intel_quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a4..0d44d31 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -313,6 +313,15 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
 		.hook = quirk_enable_dpcd_backlight,
 	},
+	/* ASUS ROG Zephyrus G16 GU605CW, Samsung ATNA60DL01 OLED */
+	{
+		.device = 0x7d51,
+		.subsystem_vendor = 0x1043,
+		.subsystem_device = 0x3778,
+		.sink_oui = SINK_OUI(0xba, 0x41, 0x59),
+		.sink_device_id = SINK_DEVICE_ID('6', '0', 'D', 'L', '0', '1'),
+		.hook = quirk_enable_dpcd_backlight,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
-- 
2.47.3

