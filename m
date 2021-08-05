Return-Path: <SRS0=p3Ij=M4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F6C432BE
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 10:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F2261078
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62F2261078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF966E9D4;
	Thu,  5 Aug 2021 10:47:31 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBF76E93A
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d6so7683998edt.7
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AK+c0pgue1U/7WLRgeX/+Ci0DZnUS//VOEaHWRKAX5U=;
 b=SRV5IhN5DMDyWV09eeN3EjfR17ReBj5n9Lq1qSv/r9V6+eQfDRr6fZdauf0iIDq3CO
 o/UNpku9ih2UaUPZI3EXN1ZjVDTZ8Fz1uML0N6lbl7CLwHx+5OgSqMWP8wt11FpXoxm4
 8zLiMn4IuSFdLoDzyQey39Z5B/GSS49sZK9/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AK+c0pgue1U/7WLRgeX/+Ci0DZnUS//VOEaHWRKAX5U=;
 b=fn0vZ3VScTkXDxYV5b5TMIsEGOvpbGewJcA1XBPXbHQwCy8mSgHtCGa6KCCCLbW7cs
 3zmB2xt/zWxF/UPoJUi4uQihTPUyKT5YN25ukrkHvxUH8DRhEx8SSF91ytbrIoFppO6t
 JZxIKKmk7FprJGKluMhHLRRzIBZUTnCoEl/zttr3uEZWpFZnzyMMWce6Oh80KF+9ulTo
 J2G+AsqFXKQ4E78qyVs5XgqhbGb/lkd0EIQ7g7o9+prMvyu4OiUZkzh4/Vx1bYlONmoJ
 3Hs5Qi6o+9SP76vmDyEijBWKZfJFk+/frzkSGd9rTmLFZwdbYNyn/pTR2de6P/yyQw+Z
 8N5w==
X-Gm-Message-State: AOAM530UxlSgvYbqwTGoQvh3Wa0/NkBlsH0VQFDjbYTuJBYKg8R0GAMj
 ic4vGWi3Ai/s+IA6mBFopqMM9Q==
X-Google-Smtp-Source: ABdhPJy6FedSEkt/0tNGpACXa9HfTFyknfD9vV0DxBgpb799mTTOLf1VMsdfuF+iWMF0Jbda3JPupw==
X-Received: by 2002:a05:6402:5145:: with SMTP id
 n5mr5647616edd.178.1628160442399; 
 Thu, 05 Aug 2021 03:47:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu,  5 Aug 2021 12:46:57 +0200
Message-Id: <20210805104705.862416-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 12/20] drm/msm: Use scheduler dependency
 handling
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

drm_sched_job_init is already at the right place, so this boils down
to deleting code.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/msm/msm_gem.h        |  5 -----
 drivers/gpu/drm/msm/msm_gem_submit.c | 19 +++++--------------
 drivers/gpu/drm/msm/msm_ringbuffer.c | 12 ------------
 3 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f9e3ffb2309a..8bf0ac707fd7 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -312,11 +312,6 @@ struct msm_gem_submit {
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 
-	/* Array of struct dma_fence * to block on before submitting this job.
-	 */
-	struct xarray deps;
-	unsigned long last_dep;
-
 	/* Hw fence, which is created when the scheduler executes the job, and
 	 * is signaled when the hw finishes (via seqno write from cmdstream)
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 96cea0ba4cfd..fb5a2eab27a2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
-
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
@@ -72,8 +70,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
 {
 	struct msm_gem_submit *submit =
 			container_of(kref, struct msm_gem_submit, ref);
-	unsigned long index;
-	struct dma_fence *fence;
 	unsigned i;
 
 	if (submit->fence_id) {
@@ -82,12 +78,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
 		mutex_unlock(&submit->queue->lock);
 	}
 
-	xa_for_each (&submit->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-
-	xa_destroy(&submit->deps);
-
 	dma_fence_put(submit->user_fence);
 	dma_fence_put(submit->hw_fence);
 
@@ -343,8 +333,9 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		if (no_implicit)
 			continue;
 
-		ret = drm_gem_fence_array_add_implicit(&submit->deps, obj,
-			write);
+		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
+							      obj,
+							      write);
 		if (ret)
 			break;
 	}
@@ -588,7 +579,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 		if (ret)
 			break;
 
-		ret = drm_gem_fence_array_add(&submit->deps, fence);
+		ret = drm_sched_job_add_dependency(&submit->base, fence);
 		if (ret)
 			break;
 
@@ -798,7 +789,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out_unlock;
 		}
 
-		ret = drm_gem_fence_array_add(&submit->deps, in_fence);
+		ret = drm_sched_job_add_dependency(&submit->base, in_fence);
 		if (ret)
 			goto out_unlock;
 	}
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bd54c1412649..652b1dedd7c1 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -11,17 +11,6 @@ static uint num_hw_submissions = 8;
 MODULE_PARM_DESC(num_hw_submissions, "The max # of jobs to write into ringbuffer (default 8)");
 module_param(num_hw_submissions, uint, 0600);
 
-static struct dma_fence *msm_job_dependency(struct drm_sched_job *job,
-		struct drm_sched_entity *s_entity)
-{
-	struct msm_gem_submit *submit = to_msm_submit(job);
-
-	if (!xa_empty(&submit->deps))
-		return xa_erase(&submit->deps, submit->last_dep++);
-
-	return NULL;
-}
-
 static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 {
 	struct msm_gem_submit *submit = to_msm_submit(job);
@@ -52,7 +41,6 @@ static void msm_job_free(struct drm_sched_job *job)
 }
 
 const struct drm_sched_backend_ops msm_sched_ops = {
-	.dependency = msm_job_dependency,
 	.run_job = msm_job_run,
 	.free_job = msm_job_free
 };
-- 
2.32.0

