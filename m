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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D931C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2070C61178
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 17:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2070C61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810446E9F2;
	Tue, 21 Sep 2021 17:43:01 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE56F6E9C1;
 Tue, 21 Sep 2021 17:37:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d6so41374494wrc.11;
 Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwDNgKjUSiYIEL26gGmtpWr9N6eJiYIUhyirBhMCihg=;
 b=JEwHcAATh1ZpVoSYXKBWXuAXv1bDr2J7b1IMtXHoKp7ruPrV27iGamsLCvXNTFzUph
 Ax+xnc41BDjb7Wxh7GLs+N2cLpi/bwC5HRrK8ZAxLL14aBe+do6D4SaahPyqLWVpI2n4
 PS+kbBoK9o1+h7GSltEEY+XOWEmLvqZulKRSyWH59COMP8ipIE5UebYjTOs/1uvXC0tx
 K74qTo+G8Siq0Y/Q2CBa49Kt7VgUCiJ7BmnCWyIhevGvNeah8viF6gaXjiJXxLLRbPQ8
 5geDWgaBA1ccACP4EBanSi9kms7y5yHqIg15A4kfuV03bmnXfYh1gXU2ydlVWJ/RavYR
 h8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwDNgKjUSiYIEL26gGmtpWr9N6eJiYIUhyirBhMCihg=;
 b=FX/mR+VtNzgZ9530q0xxmrlkk+78JLwN8jMV5etWKHcAxZMofOsKJFoN1AURaHEAj4
 /tP3f1hGTfErOF/923/iHAOWriA9tpBYAm2fI9hQDJzW41Fp3mV8/fqGfE62EiNsqp9J
 XG4LA0PcYDzcySz8/GqXHsTczSkCIsbKDVmf5oEqaf+a/RD8BfD5mqdxRNck3lQ6HNen
 xWUzSBi2aV4vTYynrSL2pz7eoHxvrTyTAmPRNpA59+cX4ixAo4c1y4qBG78C4+ct0HYW
 APzONi+49oPsq7qu4AtvWr6W6y+eveC5cOcoEldvdnXr17LeuvYsWGRQPA8xqvOhQd45
 oy8Q==
X-Gm-Message-State: AOAM533AVcCCHrQ8LVjR1+5QUSF1p2P0zbwhGIvdlLpB+JNgltx2fX14
 7HN1YaqO9ELTqEi9Rk9Y944=
X-Google-Smtp-Source: ABdhPJyyOj/FTXHy67QtzwEuti9n5GDcIx4xSLf3NFAF5Pl2imrTWFT1+eKloNSlxJUiqK4LP4YdTA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr36619835wrw.186.1632245826275; 
 Tue, 21 Sep 2021 10:37:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Date: Tue, 21 Sep 2021 19:36:38 +0200
Message-Id: <20210921173659.246165-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Sep 2021 17:43:00 +0000
Subject: [Intel-gfx] [PATCH 05/26] dma-buf: use new iterator in
 dma_resv_wait_timeout
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
 drivers/dma-buf/dma-resv.c | 69 +++++---------------------------------
 1 file changed, 8 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 2b749cdcba02..8331e6e4f9fb 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -611,74 +611,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
-	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
-
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
-		}
-
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
 
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
+	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-			fence = lfence;
-			break;
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
+			dma_resv_iter_end(&cursor);
+			return ret;
 		}
 	}
+	dma_resv_iter_end(&cursor);
 
-	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
-
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

