Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6DBC4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 06:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD3C608FB
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 06:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DD3C608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885D36E5CA;
	Mon, 26 Jul 2021 06:56:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B34D6E5CA;
 Mon, 26 Jul 2021 06:56:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E9133A0BCB;
 Mon, 26 Jul 2021 06:56:20 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lee Shawn C" <shawn.c.lee@intel.com>
Date: Mon, 26 Jul 2021 06:56:20 -0000
Message-ID: <162728258092.2615.14971865704293782067@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210723070548.29315-1-shawn.c.lee@intel.com>
In-Reply-To: <20210723070548.29315-1-shawn.c.lee@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_MIPI_DSI_driver_enhancements_=28rev4=29?=
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

Series: MIPI DSI driver enhancements (rev4)
URL   : https://patchwork.freedesktop.org/series/92695/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
77529e9e348e drm/i915/dsi: send correct gpio_number on gen11 platform
1994193a9893 drm/i915/jsl: program DSI panel GPIOs
4a2d5040a99d drm/i915/dsi: wait for header and payload credit available
cb2493d12c0d drm/i915/dsi: refine send MIPI DCS command sequence
fef2d31a1c41 drm/i915: Get proper min cdclk if vDSC enabled
b62bfc065334 drm/i915/dsi: Retrieve max brightness level from VBT.
-:58: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#58: FILE: drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c:154:
+	panel->backlight.max = dev_priv->vbt.backlight.max_brightness_level \

-:61: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#61: FILE: drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c:157:
+	panel->backlight.level = dev_priv->vbt.backlight.max_brightness_level \

total: 0 errors, 2 warnings, 0 checks, 42 lines checked
4956eeca561c drm/i915/dsi: Send proper brightness value via MIPI DCS command


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
