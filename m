Return-Path: <SRS0=EOwD=GZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4BAC433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 11:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC627235F7
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 11:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC627235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610289CCE;
	Fri, 22 Jan 2021 11:39:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CAC89CCE;
 Fri, 22 Jan 2021 11:38:59 +0000 (UTC)
IronPort-SDR: G4Sl+RrQcjU+xn2uZVG1zd6ZpaYyK9o0luqw4qOmHfkywQI0AkewTNkPkeFzGG3NlYaTgwUaFb
 dyQdYFUefz2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="159210299"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="159210299"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 03:38:59 -0800
IronPort-SDR: 8+Or7uW3339JxHd6y9yrEDfpTnAn4bRwS0TsDFCVlp1d1ByzsqrFb80HPAAmh5c/Whg5Sa5Cxo
 3f2gGeZ93Atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="574599010"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2021 03:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A0E0D11E; Fri, 22 Jan 2021 13:38:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org
Date: Fri, 22 Jan 2021 13:38:55 +0200
Message-Id: <20210122113855.25770-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
References: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v1 2/2] drm/gma500: Get rid of duplicate NULL
 checks
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Since GPIOs are optional we don't need to repeat checks that are done
in the GPIO API. Remove them for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
index 7d012db6352b..3dab94463656 100644
--- a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
+++ b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
@@ -518,11 +518,9 @@ void tc35876x_toshiba_bridge_panel_off(struct drm_device *dev)
 
 	dev_dbg(&tc35876x_client->dev, "%s\n", __func__);
 
-	if (bridge_bl_enable)
-		gpiod_set_value_cansleep(bridge_bl_enable, 0);
+	gpiod_set_value_cansleep(bridge_bl_enable, 0);
 
-	if (backlight_voltage)
-		gpiod_set_value_cansleep(backlight_voltage, 0);
+	gpiod_set_value_cansleep(backlight_voltage, 0);
 }
 
 void tc35876x_toshiba_bridge_panel_on(struct drm_device *dev)
@@ -567,8 +565,7 @@ void tc35876x_toshiba_bridge_panel_on(struct drm_device *dev)
 				"i2c write failed (%d)\n", ret);
 	}
 
-	if (bridge_bl_enable)
-		gpiod_set_value_cansleep(bridge_bl_enable, 1);
+	gpiod_set_value_cansleep(bridge_bl_enable, 1);
 
 	tc35876x_brightness_control(dev, dev_priv->brightness_adjusted);
 }
@@ -642,20 +639,17 @@ static int tc35876x_bridge_probe(struct i2c_client *client,
 	bridge_reset = devm_gpiod_get_optional(&client->dev, "bridge-reset", GPIOD_OUT_LOW);
 	if (IS_ERR(bridge_reset))
 		return PTR_ERR(bridge_reset);
-	if (bridge_reset)
-		gpiod_set_consumer_name(bridge_reset, "tc35876x bridge reset");
+	gpiod_set_consumer_name(bridge_reset, "tc35876x bridge reset");
 
 	bridge_bl_enable = devm_gpiod_get_optional(&client->dev, "bl-en", GPIOD_OUT_LOW);
 	if (IS_ERR(bridge_bl_enable))
 		return PTR_ERR(bridge_bl_enable);
-	if (bridge_bl_enable)
-		gpiod_set_consumer_name(bridge_bl_enable, "tc35876x panel bl en");
+	gpiod_set_consumer_name(bridge_bl_enable, "tc35876x panel bl en");
 
 	backlight_voltage = devm_gpiod_get_optional(&client->dev, "vadd", GPIOD_OUT_LOW);
 	if (IS_ERR(backlight_voltage))
 		return PTR_ERR(backlight_voltage);
-	if (backlight_voltage)
-		gpiod_set_consumer_name(backlight_voltage, "tc35876x panel vadd");
+	gpiod_set_consumer_name(backlight_voltage, "tc35876x panel vadd");
 
 	tc35876x_client = client;
 
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
