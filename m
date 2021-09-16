Return-Path: <SRS0=l9+3=OG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E8AC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 12:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771DD61263
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 12:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 771DD61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073F36ED6B;
	Thu, 16 Sep 2021 12:00:50 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B36ECE8;
 Thu, 16 Sep 2021 11:30:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso4275788wme.0; 
 Thu, 16 Sep 2021 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIxvi6EFxqBABKYJnzo5Lw9hfwCaC7HFX+lvVcywepM=;
 b=oKsgdiKsr96XgM3JmAFofC5/0vuipaAwfX9jsgxGyMZ3fTV8A9VyvR/ScjKqxr1iJt
 bducrdb5jL9zm0RZEOVKInM+FZ16fL2q9KOmuRy9n1CIFugnd0OyJ6ZCJ7ba3wVOuIJ1
 B8OWSgFXztchdu/RS5naKpaoWKrhf4BhMJFEF8A9UMwPZssg0n7ERFOnwOCNGB5rqH/k
 S9yDBL4FuIDgwIzfgi+kYaO52GxXcd/kfYvz/1DYl413ZbuqKxaKfJnwMBT2nUwrA65Q
 Rj742F0Dv0ZZw5Gv5z/DJkI1HjLlDzUB+WrprlPlzlYbeV+PJLJaINKpSPpELYuxiERy
 RkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIxvi6EFxqBABKYJnzo5Lw9hfwCaC7HFX+lvVcywepM=;
 b=8LyjGGbPxdOGBfB9u7ypQIswdlTSrKty2ykI83fdWfPsV1EG8seIeBLhooLVhFVapQ
 WbqpHElYt8EE6ZhKPTijPN14AqAJmXdzBAmhtbpZqcPwAlTk7CS5JZO+arXhRvz7VETM
 6+y9WNwFh0jeIKM1EABGtmUNUcV6vNHA+B+rGwnsZHpCiqC8/RCAg8zZlFaVDeR10XWR
 gX0Sqs3fiSEAvFlpnTgIA9KZh/R36MTK/E95JGBRzMXWiW9fwfX39t8GoTM1vM06NvDs
 7ev3XQv+69sqSODirE8nw2fQdw7uADWh/21Tgs+k37WhApmRsQyXyhcocLkWGr9/ouAc
 eQeg==
X-Gm-Message-State: AOAM5336Y16cneOy2CDmvn4inLLDfDjvpGTIif9CrQtBj24uJnwzLKks
 QhZN9xNs28by+LVrblw2W8Q=
X-Google-Smtp-Source: ABdhPJy7b3HQjHDebWAfW7eXMzch47xtmYEOMmPyzkWSnIxSlRLBJJzUeYWwqGoNs1xMajeq93ccIw==
X-Received: by 2002:a1c:3b41:: with SMTP id i62mr9483249wma.38.1631791854892; 
 Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Date: Thu, 16 Sep 2021 13:30:26 +0200
Message-Id: <20210916113042.3631-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Sep 2021 12:00:17 +0000
Subject: [Intel-gfx] [PATCH 10/26] drm/msm: use new iterator in
 msm_gem_describe
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

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 22308a1b66fc..5bece4600e41 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(robj, &cursor, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

