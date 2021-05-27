Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46B1C4707F
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 07:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C81F6139A
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C81F6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104866EE30;
	Thu, 27 May 2021 07:42:19 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02796EDED
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 07:42:15 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id q25so3014740pfn.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 00:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=SQtH/jrOEE6kk88cKkvSxsBamCau/HA6LO+WkxXT2OKIUlRPbubDXoPKK/J84DK90z
 tViLy+vQKnLAJK2PRgLoPMSraWAe08TSrKhWQ84yPmrmIDgjwjiC5qveCCmsX3JtUhaM
 S3QI3SIPi49owjcScyBxFzBrkyDdvujgOkMaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=o3mIZpLe5uu4XkODvJ585RguSbcXzBKhTlvsX1j411g1wNvNmifJjfPhD+DmwhXhfB
 3ASTxCUP4ZVLS+uqIfXjXkpIusLEur1ruvebFEyDJt7HmV/h9lTdz0CXQ8Y3k7lqA/8s
 cf/IYGUFGcMsf7nVnlOY2hHdrmfSVVK7BLpoFj9mLubRBaqIPJed2xECj49qmRmVRn1L
 x34qJ3hnaoFg5aZSHTODyxFVmY4faf7KCJsi+9BOaBlOt50OVCJfux8ieypeBAXoC4yg
 rLnfZP8lKcXGjdzM8azLGyI86Socwa9qUtK8jYUHGaDToxw+NkYUEa+57mUkPki0Io0K
 rBeQ==
X-Gm-Message-State: AOAM533hx8HUzImD0EXfa3Rh07tpE7AKi81M078RqoIvvr5GTTRAIJBo
 vxBAfQ9tzCkohTnATLIwoOS96g==
X-Google-Smtp-Source: ABdhPJxuVP5C820VQJBG/Cqe/LBzPydpiOkSUvB5K7U8neoHStr0iUEtdqLCANJ++y7pTtplnH8sHQ==
X-Received: by 2002:a65:6849:: with SMTP id q9mr2443138pgt.377.1622101335476; 
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Thu, 27 May 2021 15:42:02 +0800
Message-Id: <20210527074202.1706724-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527074202.1706724-1-hsinyi@chromium.org>
References: <20210527074202.1706724-1-hsinyi@chromium.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel
 rotation
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.818.g46aad6cb9e-goog

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
