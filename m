Return-Path: <SRS0=NK3F=OH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5F7C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 13:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E714611C3
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 13:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E714611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2826ED15;
	Fri, 17 Sep 2021 13:02:52 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68FD6EC4F;
 Fri, 17 Sep 2021 12:35:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i23so14967796wrb.2;
 Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=ClzefoT8ZJqdUhLiTrPyn/tYDsZAUMp22rU6KvROHSGBst/72K19MsNlgZgPwNO7TW
 AzzYRDpFMvki1AWIpcB3SZIsVtHNlefi2C0rzgvLNY2ea7LGm7pyCHeorIzpd6z/PhVs
 Yg3bacdCLixtAitXPrJanpP7YNVwgDDRW+BjgRpPr2dluoppn1Anx7C2CpiYPQdRWBOx
 YhpsSFuvu0fHEtr9Io9x3aaRelwNL0ds1HpVg6Jwo/i2bglZSrqyknWPgpVo+NJ8siwr
 IheZXKe8bubdnLwaZiIbyC9G055EWnN2K3oamY6NP8jStkHOeNyf+cBn8KYiJgOBvGV6
 OAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=lrNGmPbDVt4GrTWKVI9qTcePGhZiCOE7srH028MQs5RRJ3Lfr4JQZfd32UDBzI0ME+
 xPZEqQp8J8nqtmguArctk9Q1Qox+pvfrzbyowp5gWR25HUS37BJ7Ds9MFLlzv9Muiupt
 de8N3HCPmo9+Oz0BIP1+tOOP8LRWKNzZvz7qnK36Oa4YEcN5Az89BuxwObbONuD0d22/
 wz4YbjqsLB/hEDEl96M5wkW+RMh5yCJYeCDivxAG6hEWIHuiZom6dGPAPKwdVf88DHGu
 vTsHEkpZsPiwkjMgNcd4+s2z8JkFAXzCnsVJaglJPhS+ADc7aZ15kDhFZDU+Dc19n7Tc
 zqcg==
X-Gm-Message-State: AOAM530xWSpQLmywWZX3108BRBZfk5qavUmvOqqkX/iDQN+EENZsiduv
 4oZ/s1ROJ48jpJC5NoSObXg=
X-Google-Smtp-Source: ABdhPJzNtLWcjUTMHGl/9GN0PRbPfq18kIpBmMBWkzWXF+U+Lc7iVK6lvLbnj7xd/dMsUoLsX6t9Qg==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr11976979wri.82.1631882137364; 
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Date: Fri, 17 Sep 2021 14:35:12 +0200
Message-Id: <20210917123513.1106-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Sep 2021 13:02:50 +0000
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

