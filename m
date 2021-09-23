Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E627DC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 11:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C73960F56
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 11:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C73960F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336816ED15;
	Thu, 23 Sep 2021 11:57:24 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ECB6ECFA
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Sep 2021 07:56:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i23so14641055wrb.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Sep 2021 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=E01i4/VhKHLSBzmXJY2cmn2Vap1DfLwnqZXq6NzJg7a1QlmZSFLiiINNFdomdJCbpF
 LqMNq9wvbPNT7Apnyj23sFjbiV26FJXpl3wEtZkHOtaECZErgYB91YeokGP6zyfNcZGI
 eeTM1WcQqG8ikWK70aUbFIqcZxzXjWyyJiih7RCeh2/6OW5ExXAI8UsHYXCHvF0aQCim
 l9rLzEL/3A92g7BROpM7frQEFte3FBgDwyMaWLKd2khDIYTlImr6tkbLlX3aL4LKpGJK
 HEoWpIGwJ4fKMo4rymjxAodfnyMx2e09MbgGozhbuXCfvBZFQNjSYeXDkuBLloL79iPd
 tUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=16FtH6llT0MP2lZGy+lH+ytsq/jEq91SPBogLBoEq1eT/EidVdx+aXg7tmNsDcKYxq
 gqm3wlY91Qj9OK0gOF6ZYv3rUz7YupfsjfcGa6it+1xJUNg8rkbMWLIFNrX+0ZMBADUC
 4JcXjmwsUIUs8us6c4+RW7jFaimQDhd4oJLpeeuykUPXBJyaKygFHJtegy/e9fWBOCp9
 T0Uff52DPuxjLg676cwhlUGvOb0rlG3lthcXT0k0kjHbOPBxuF6sFGRfEha9hwRy+V5C
 QuGrc55EjropBJb05rMSW/HwMGCEGamNHoI8gG2Htzqfnkq9mpU/nGErUvuhDt21Vijt
 Ua7Q==
X-Gm-Message-State: AOAM5320t5zgTyvNZbzZtEbDYZbsnbZlHA+zTEslL4LGB/5p5X7h+IWF
 WunhamieiiFgu1MrsC2xyJ2OR8qZpV4=
X-Google-Smtp-Source: ABdhPJxWmqPeteffQAhVwlppNQXEQ142csPYX4dB7Y8TJZ/TougfFwfzCA1y/fzn6UcO/uAs404esQ==
X-Received: by 2002:a05:6000:1a52:: with SMTP id
 t18mr3345181wry.21.1632383780614; 
 Thu, 23 Sep 2021 00:56:20 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k19sm4280704wmr.21.2021.09.23.00.56.19
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:56:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Sep 2021 09:55:56 +0200
Message-Id: <20210923075608.2873-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923075608.2873-1-christian.koenig@amd.com>
References: <20210923075608.2873-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Sep 2021 11:57:22 +0000
Subject: [Intel-gfx] [PATCH 13/25] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
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

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 042c16b5d54a..5bc5f775abe1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
-			break;
+			return ret;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
-- 
2.25.1

