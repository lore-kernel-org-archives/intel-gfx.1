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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E90C433FE
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B5E361178
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B5E361178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601886E9F7;
	Tue, 21 Sep 2021 17:43:02 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7576E9C4;
 Tue, 21 Sep 2021 17:37:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so39817157wrg.5;
 Tue, 21 Sep 2021 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLSizZ4M7ck2vZK70ODv7YgGo+NNZv9b+MC6JZjgVHI=;
 b=WIeU5gPMVQAYFFZSGNknvCAMsvT8UjjP9BfyIVm63GEiswovgVy4AzVOqolBxhEWp/
 AT8fKzC7Yj38e0aOTRAgxRXU1uSCPf0/fTY7tSDEvPorkthPyosgeZQlpDgYiixh4Dde
 FS7rYYnU4Gy0WeWLsj5aydYYIRWKRWUfxnf1tLd+ni9i9TkcZ5rpQOYA8mjFEhcCavSC
 dee0c9H8Yg8nxmgD2slgXSWGPcjiIMIiN9ol5Rthc24K+Q0EIZSOnrECPByvRKPJVkIa
 dXOTWkGTLqLlMPMvyY/2jqNJM1AdaYiRTwvjRKlhdDP6Ct/xM1oQgWKCnLrAiBrSJNBy
 YC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLSizZ4M7ck2vZK70ODv7YgGo+NNZv9b+MC6JZjgVHI=;
 b=Q27cqtGFn6FNjihks3SwoktTl51bwcbUcUBPtQB1OKFmoO5C+05YH/eOF8BNU4X7KX
 WB+dqwS6LmsH0XmGVhk946WHnitXq6I6+D5aGmBwkIvCqrrEd8AVpDGpu8t5TbGa9fyf
 0jF6rbIec1eiVO1D+LhXwe6LydbVHtiHJLdeFB98jWKHg3hTss194sy143/wNggD7jDi
 bzzofcx+tLP6UOwjtIeBzB8OWDMrJY3eFuaF2h6fu3CHCHrheXSO306mWDARINtV2jzt
 wyUXqVOOhe9ODrSGKavKmPZHKcNBLQA+lRV7K8nPUkk87krN/X2BNrNhNjSCXHLmpCKn
 0ueQ==
X-Gm-Message-State: AOAM532pvvsSK8yvm4d5Vh7nHSwUmy1RGhswkxzRnEMTcwIbQzgbPrpZ
 WY3NXBtZuq/ePId8QHbqZzY=
X-Google-Smtp-Source: ABdhPJzXt6M3ehIM5bW3VMY6F1g9umw9RyMB9K/yfY7tZ5c55BsQ+KirqM0HvVLRgEuCeDgwtA+pNw==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr35646827wrn.365.1632245827210; 
 Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Date: Tue, 21 Sep 2021 19:36:39 +0200
Message-Id: <20210921173659.246165-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Sep 2021 17:43:00 +0000
Subject: [Intel-gfx] [PATCH 06/26] dma-buf: use new iterator in
 dma_resv_test_signaled
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 57 +++++---------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 8331e6e4f9fb..c1a958b92912 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -630,22 +630,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -662,43 +646,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
-
-	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
-		}
-	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
 
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_resv_iter_end(&cursor);
+		return false;
 	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
-	rcu_read_unlock();
-	return ret;
+	dma_resv_iter_end(&cursor);
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

