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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F11C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 13:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6889613A2
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 13:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6889613A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7090A6E1B6;
	Mon, 13 Sep 2021 13:52:17 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D27B6E1A2;
 Mon, 13 Sep 2021 13:17:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b6so14629010wrh.10;
 Mon, 13 Sep 2021 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKcmOjs+nnoTfTMzj1B5wwjzz9EHhzICWjOSUDa4Z8U=;
 b=nBPqCuTA/TC2qVnaVxCbTiYSf/S2Zb+rPI3NMesDDCkuCLK6GhnykrXk2iMYKdSdT1
 jvPsOLCrv2QnGCs4MxccvHdcgMir8VwtF8aB35eDL1jKIc2IhHVRj6bnTtWyN7WQV28X
 EXCaP1pbmof5OEUYC6IXxSI5P9/RjqqhzG0gvV09dp/aonbhLWGKRjt40FZ10nAA9aN0
 xEOyQS0g4JwN98ffF/JVBgZs6jXfF0J4uPfsjmHBggroCU5cHYtt1pPnadRl4cMs+W04
 Hg9Pfu7wtmSxrbMAlBBbwP74P3dl+SpST7alSOENKz66OCpJJQA8a5J5aELwnIkgm1h0
 vqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKcmOjs+nnoTfTMzj1B5wwjzz9EHhzICWjOSUDa4Z8U=;
 b=QGz55NjpXpCwuBkzyUzbFhTD1E9AeH6afuh6hu5t1GxHcpd3d9ngzDsW4TDduCGRsK
 fzGMnIgEA54T3UkS1KGTGoZtjvx/67hyL/6p6Coap9Bs370aiYw5HrKdFCzthxldkmK6
 rbtcKeAoWZqFHfmiHkunZ+mk/ma0eCTouE9piEmRRTUWHBspibh/dPgY6tII3uJcmebN
 Amk82qbsPaYEaZ+9jd10fM+9iN6HvUBKtbfkbkb0yYSuDbXIa0XVTaVkONYjnkHORW+D
 yX7lQQQH04XCS+I/RXq6g6IJsjvJVVqfyXkse46F2376UGY//y5VygE2nuw6nFvIhwzZ
 pHcQ==
X-Gm-Message-State: AOAM530wl/7t1DHQBRvKeqi8enbrTUzPp1TSwvnvPTh3m6qkbCW5gSSZ
 ULKcjv5jDtXYX/oxIj8Tg0s=
X-Google-Smtp-Source: ABdhPJxsd5NTCKCjaeMUfEJLxSPuesNlwu+JoEsLMfvIj+y4YAP3U29/E88Z+2CBo6RfJbhW863CUw==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr9242218wrn.238.1631539052126; 
 Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Date: Mon, 13 Sep 2021 15:16:56 +0200
Message-Id: <20210913131707.45639-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Sep 2021 13:52:14 +0000
Subject: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 37aef1308573..b81045ceb619 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			break;
 		}
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
 	}
 
 	return ret;
-- 
2.25.1

