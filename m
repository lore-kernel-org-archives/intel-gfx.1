Return-Path: <SRS0=p3Ij=M4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A2DC4320A
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 10:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFA661078
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Aug 2021 10:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBFA661078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471006E859;
	Thu,  5 Aug 2021 10:47:19 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401B6E7DD
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id zb12so4006013ejb.5
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vk90JgGb8fo71IctIWrWmaKFEp9mmVzEBcxFqwXTPis=;
 b=R8ENjC6zpXH4/pdpJHVYfz/G4epLWVKHywZeba8tr+KA25Zq7uDTHviqCX3yC2uxf/
 cN0pAm7nPlidmEull30353JwccsQjPYtuSsJikQuCGgJERCbH1BB9ovQDtQoeaX6KN5r
 mQB2uaDm4VWEz2Pfpk63aVeH+VX4MCpGS8sDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vk90JgGb8fo71IctIWrWmaKFEp9mmVzEBcxFqwXTPis=;
 b=T04kmPUlVWjCqRP6nSY6Xi4oxFVsSAf6GG4um508HGDiRpyPp0ByI4OTLLltO+lJFf
 TzaDhHuF4ca00btpSlneMcAEfbHiBzWDWYHZ6B/jQxPzbUT+nXCwGyCVmfjZFu0sPTDe
 +hhbP6kj1wB7jbx2HE6I4Vz5XCu+LD/iSO+nKP7nHTIrUyLa3Pr2U3svsQHPViNg9z/W
 3FWFDvbY4FpXPAUnjF0TdNn92MtTr4SYFUp90TNMfexsL9XZxwlKaZMrwSni+G4ahUY+
 mAciRQTW/xKafmDSdUc+uoGVCasHtWkz+99AjbI3SKEqDduYVaLMAmCqURngoATQy7MJ
 0FvQ==
X-Gm-Message-State: AOAM531BciWo0kW0JsyEwEApQy9+VlE0//d9ZbP97ogZCjPvOgv745wr
 vdInTVCZ3A0qgge3bxlf3oQkMw==
X-Google-Smtp-Source: ABdhPJzQWlIJuekxnGW62C6E14BFG9DW8nzQUwW80y3fLAi9LCxvroE4ZSxyI8gjBo6fkzqzjpAegg==
X-Received: by 2002:a17:906:b794:: with SMTP id
 dt20mr4027358ejb.363.1628160433446; 
 Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu,  5 Aug 2021 12:46:48 +0200
Message-Id: <20210805104705.862416-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 03/20] drm/sched: Barriers are needed for
 entity->last_scheduled
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

It might be good enough on x86 with just READ_ONCE, but the write side
should then at least be WRITE_ONCE because x86 has total store order.

It's definitely not enough on arm.

Fix this proplery, which means
- explain the need for the barrier in both places
- point at the other side in each comment

Also pull out the !sched_list case as the first check, so that the
code flow is clearer.

While at it sprinkle some comments around because it was very
non-obvious to me what's actually going on here and why.

Note that we really need full barriers here, at first I thought
store-release and load-acquire on ->last_scheduled would be enough,
but we actually requiring ordering between that and the queue state.

v2: Put smp_rmp() in the right place and fix up comment (Andrey)

Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f7347c284886..89e3f6eaf519 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
 	dma_fence_put(entity->last_scheduled);
+
 	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
 
+	/*
+	 * If the queue is empty we allow drm_sched_entity_select_rq() to
+	 * locklessly access ->last_scheduled. This only works if we set the
+	 * pointer before we dequeue and if we a write barrier here.
+	 */
+	smp_wmb();
+
 	spsc_queue_pop(&entity->job_queue);
 	return sched_job;
 }
@@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
-	if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
+	/* single possible engine and already selected */
+	if (!entity->sched_list)
+		return;
+
+	/* queue non-empty, stay on the same engine */
+	if (spsc_queue_count(&entity->job_queue))
 		return;
 
-	fence = READ_ONCE(entity->last_scheduled);
+	/*
+	 * Only when the queue is empty are we guaranteed that the scheduler
+	 * thread cannot change ->last_scheduled. To enforce ordering we need
+	 * a read barrier here. See drm_sched_entity_pop_job() for the other
+	 * side.
+	 */
+	smp_rmb();
+
+	fence = entity->last_scheduled;
+
+	/* stay on the same engine if the previous job hasn't finished */
 	if (fence && !dma_fence_is_signaled(fence))
 		return;
 
-- 
2.32.0

