Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386ADC43219
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 13:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C1161BBD
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 13:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08C1161BBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41416ECB4;
	Mon, 13 Sep 2021 13:52:20 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42196EB17;
 Mon, 13 Sep 2021 13:17:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6961545wmb.2; 
 Mon, 13 Sep 2021 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=eHafF1f4FLFyeSseJox98EKzdW/NnA3X0UYxAFaxI+XPciSSmj6wQ09p6tfWaRe9BA
 5oHi4ptPueYeEreNPjT6ULrzsv9VlMM/dwlG85SexbAhpY5IUXDZEJgPHeCgHoDbjcmX
 KcWw61VD0RFMAyW05WFocLI4jQHuj7VDcoQlnn8fSmtuM734OCej2gphI3Ix/mEOYTi5
 zdHT9TDf1lOb7GPGgl3whmL3TxWiql8plQ4swPhNVg2Tk+V0+OBVVj4E7GzFgQm0QlMc
 091Suem5M/RFy5c9Q1Uqr+7DEXvRXHa1Us9FP9CHOc1mUPXDtJI5Auxg4tkyGwfMyJc8
 BBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=P75jcbTjPWF5JQbyYAACXxj7oVSAL2vA3YHr04FBhiQhZKBI1RBb51Ln1w7MGVixhc
 vZlp50XaTHrPWdmhuWQZqIydsjgXpmsyNADwXur5f4fuNeWe1WA4fvH+pRQffMpudTac
 TZYCaJ8iRbezmXRHBYCogTH9ZFJ00eb+uoSg344IpBvnz8WsvjDGjw2EQ/E+vfmZF7K5
 1m7xKSuAYOhKu/pOTRug8gxgahy4VmT/DRbhN8Cw+ioe8Fgu1zJaRvqVgB77B9Mujp3F
 Ya3bX21Fyl0ql80ORfksOAb7nE2eWtJ2etN3g5DtL2S0m/t6Xpc6wniHSP34w785zRh1
 ryvQ==
X-Gm-Message-State: AOAM530/gRux+TsaQvnwBmMIQXqBL8jvE/WEWeL785yRSJVh8CcBncjw
 u4sCFulvecblhNIpimJW3m+VnZ+TPAGc1vjI
X-Google-Smtp-Source: ABdhPJzzX3f036I5MetbYr7KHLTBrIz3UM2p+tS9h5Jr8u0cPVGaEVuQyigmNaQb4tUhcP23EwO2xA==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr11110088wmq.2.1631539063899; 
 Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Date: Mon, 13 Sep 2021 15:17:06 +0200
Message-Id: <20210913131707.45639-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Sep 2021 13:52:14 +0000
Subject: [Intel-gfx] [PATCH 25/26] drm/etnaviv: replace
 dma_resv_get_excl_unlocked
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

We certainly hold the reservation lock here, no need for the RCU dance.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..7e17bc2b5df1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			if (ret)
 				return ret;
 		} else {
-			bo->excl = dma_resv_get_excl_unlocked(robj);
+			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
 		}
 
 	}
-- 
2.25.1

