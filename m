Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D846C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD66B61178
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD66B61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B76E9FD;
	Tue, 21 Sep 2021 17:43:02 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB536E9CC;
 Tue, 21 Sep 2021 17:37:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u15so41554142wru.6;
 Tue, 21 Sep 2021 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=AjeurPfq1kDkLVDNKEyzA3ic/0uRfkVU3vaodCkkrhN9y5sx05fMEcuv0WmWPJC0mD
 2o1dniadW8xHw4DAigWerfaPMteZ3aVI7pFvc8SgWLloolksf6oKP8gELsmoXjFRRWlD
 W+xhfE+G92fi3bgSnxt+zlairoiVxKhFUnk2ekt14KIyV3mUrnY4qWKEn+01u1/+a2BR
 ZY3hzs0yuCBkDBOQ0iTAjFy6LEK4e/WQz5a3pIpQv2fox4plAzgkCVWmBfGa0o0lbZQp
 HsghcopUUGW91yRDrDATfKzkdwpyNBv3xiTtpWqSOo34jQI8RX+Aw+pgUsrjKxMmGtl4
 0hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=JZXxAJq+cKdovyswS2qOiTF8NefOHJiS2bVlkMQaFES5BQ3Mpgp/decLV/jdcQQCS3
 UY1mq0eg1fo1IiYLzzMTGACos1Gjrq7x2Pucv5Jl6NLvz4kBdOoZAIbig9tsBuI3b06q
 gxVm+QFyb6vOP72jh/fSzydFWDfE8DB4ULuRxfVHqrMTSP/M9cR27NxB21SsEhYcDEwP
 T+IEvnF8rZosFeenbBqi5fgV3a90dxMHIxLixtoF1JDBMMHUX5uDjbvlYfHWZV/hT8pS
 Cl7a0ITPbkWkU2W8gRRjkMbbidowb/h9oPgOiwi2Ux+fKIHdEkmJ9/mJzpxQShMRfgJk
 ewag==
X-Gm-Message-State: AOAM533IgzVdv6wDHpSDgmPYJqYgyRsyngVMehMy/3up5USIT2k7bTrD
 Ip7+zFkd9YmGgFN209/pVybtoCU9gCY=
X-Google-Smtp-Source: ABdhPJz/cKujCdBuVcET0U2UeOJWQuLnRk9AfHRKg6pCYMW7TFRNoUoGHUOJg/PJazf5hBSLJ8Eikg==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr36810602wru.110.1632245836491; 
 Tue, 21 Sep 2021 10:37:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Date: Tue, 21 Sep 2021 19:36:48 +0200
Message-Id: <20210921173659.246165-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Sep 2021 17:43:01 +0000
Subject: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object v2
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

