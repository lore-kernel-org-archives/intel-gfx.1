Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E524C433B4
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 17:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CFB61166
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 17:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CFB61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FDA6E959;
	Wed, 14 Apr 2021 17:29:36 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE26E959
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 17:29:34 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id z22so5392188plo.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=U3p66+Be9J9brLNZfLCAa72fmyHRhYkU2dLerndAukBzw9zqH+m1l2LBgLkyJu6/04
 s1uRRZ+UJIiAk+qKJDPUqbNlfS9edRSd1TqeoyJPJaOheuKDsALg4RevMCAL+aM1mJni
 RIbOhRQmnkWslS55DoyiBjiz4r02jbQvoJm18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=SksTuFkIbTkpR/YmpKTlGhuCmPc35fZrYQ+nizR/iv/OEfAakJxQPFEL075XP0NmWJ
 ot2pSyVWpbo7BALMVPOyzoifYWxMBHJsrFVuw8E1FKU7lLw40oR6/TDANpB4VMJqHcWI
 SBnh4U/46vK1npA2NdLXL26cHhcnJFuMgPo/NpPseDB1IgAEyEbb+rsswwUZ+Nkv6KtH
 QgCGbWFTtM/0ae5Bd7oJUvRlWgbUDj8ChNRRrQXeJWWXKxHrSaocn/jreuA1gveGCWY4
 4gNtzSdARbXZe0xPp8eK+/ShVs5ky5Ihnwg7EwOfB9Ar3cgPHqmRBBTyKJPIaUd/XHwJ
 EKUA==
X-Gm-Message-State: AOAM5335sFH72y9bMnkZRLEuvVajOS/60PGchyNh+QcbN+DIK7HvsL/v
 Qc0TWHm65lhKrzq2x/irRkwnrw==
X-Google-Smtp-Source: ABdhPJwPcZosbX6F/FEtrRwct5NPpkw0jknr5o9f0r7xAc5sBoT3Dcx5C3arvvo3qFB/+caOXsY09g==
X-Received: by 2002:a17:90a:ce8d:: with SMTP id
 g13mr4686960pju.85.1618421374136; 
 Wed, 14 Apr 2021 10:29:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 15 Apr 2021 01:29:14 +0800
Message-Id: <20210414172916.2689361-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v19 4/6] misc: eeprom: at24: check suspend
 status before disable regulator
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
Cc: devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
regulator in runtime suspend. If runtime suspend is called before
regulator disable, it will results in regulator unbalanced disabling.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/misc/eeprom/at24.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 926408b41270..7a6f01ace78a 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return PTR_ERR(at24->nvmem);
 	}
 
@@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
 	err = at24_read(at24, 0, &test_byte, 1);
 	if (err) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return -ENODEV;
 	}
 
-- 
2.31.1.295.g9ea45b61b8-goog

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
