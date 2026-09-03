Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C9C624DE
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 13:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B7110F5FA;
	Thu,  3 Sep 2026 13:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qDcZOqnB";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E378310F5EF
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 13:44:13 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso1528600f8f.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788443052; x=1789047852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m5nFAvnp9TbeBbFXDaBPRO3V4SNXTlxxZw2s8E+92CE=;
 b=qDcZOqnBdHoFcbhmsgqhzEDdtNwCu2bJUMbjofF6qrA0ouuylP1Y4WQ7fjQluqcPJp
 ceqAGG/L0CUZA0BGxhSaZbqzKzbY53K4u/8tZSwnjjlzxbglL9o1gxeX2tRrvbTk5cHj
 Ula1ShOFsYeZqerFDLx0Xeyz95hVeSYiWdt15WAgDsF8fqq5q6WLW+Hsf5hJKinYvlBV
 33PpDW2gzUcRf2AyJa3eKzmOCLEtRfguMstpGEECcLzfk0iZUNTdxwdZnggj22GF3Jyn
 t52uZIvY5fFd/SLaimXbdD1xlr1dIynBPCLgZ9FBpri8Ng7tLDtQeLonDFHfflHA83UQ
 yLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443052; x=1789047852;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m5nFAvnp9TbeBbFXDaBPRO3V4SNXTlxxZw2s8E+92CE=;
 b=KkmEzKpKuNB+XQD7XFdxhlb6FRIWa6JDsRh3LMQn+XaNCTib1FaFbw5nJjM1mJUseL
 9rbBvw2TAqfdlQsfagPpfXPs+MFV4NDFzEyOHv/ZyGhG8GhKI+MCiCQaH+4VhSNxyz/K
 x4bVc765Gh3kAei0Cho12lypNldneGmVPXobUtjcki77ub+UFsHHp75j/BjOt2uYBNuX
 WviytmkNHnt9DZ36w5sXi4kFyS9KJ3fUcUlCnse68NufplhnsmxTOsMA77KBIwW4Gn2e
 8ypL9GB8vzH2CIaIkkNBxN2ylxjbw7+kpzpQI5wNcUGnVrOK3K9AjC7dmEKeCNVgph8Z
 Dsmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWFWVsRqLjGLz5d7t//IxE7h0Xs+bYkoNZBw3PUGEDTZYe7r3XiVqEvs7ZYiEOgtVg/JMw/tmWR9I=@lists.freedesktop.org
X-Gm-Message-State: AFuF++n27SyNXGjQPg83BiKB9JM4tVsNCuPwnIHUgYevjIRVcM2s9+eM
 vlrsDIEI3ZhHzIB0sixu3zTH+qqvC1Yq9J7NXeDkHim99ZVXJOocRYy2
X-Gm-Gg: AYBFou1fyHqP9wLnzR9Iv4eADUmc/2UHOCgy0/LTUSNGV7+2Lmi3yyhx3I6SoMHsShd
 3GtZ5wrTREWC3A6sER+v/Svl5wgJcPAHbdash9xSMpD7BRSu7JQ1Wy98o337YMDOt0HervKxFJR
 NLA3vndf5Omdtc4TNOuh9pMHrF94XZCVFjRwwI9Po5QRObI84OUdivk09uGWRGszORgY6GWPmit
 rIWAZ6owD5X1huC/yld0DQOuSyrujyGYO1wXT/s1lzZGrzkPMGRbIbBECP6nhPjR0MYxXBV2XvK
 PIlMaTrYXIWBOO907Kc0z3AQLS08uChiPdVv2944jjWEPXfXtJTuqDd2yZ4+1FSRbdF+8X6tdOg
 JlvThXwdMQsnfJQm04lTniojMqdBnBSt09SqNjFzbVGGxf/PSGvDGyhDNWEcjNJiMkrU5uJ7ucs
 bujfJpOuCMQ9tgGHg/WXso8CU+iskbGWc7IBMCuv/m2HnG7zoKLxVE/ffY1nmJSuUZhB7mfwqGM
 g==
X-Received: by 2002:a05:6000:601:b0:484:36c8:ffb9 with SMTP id
 ffacd0b85a97d-48586022058mr934474f8f.4.1788443051985; 
 Thu, 03 Sep 2026 06:44:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d9:4700:e712:9f38:603a:54e4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm13597080f8f.5.2026.09.03.06.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:44:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/i915: fix incorrect RCU teardown order
Date: Thu,  3 Sep 2026 15:27:56 +0200
Message-ID: <20260903134408.105317-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903134408.105317-1-christian.koenig@amd.com>
References: <20260903134408.105317-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: christian.koenig@amd.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

i915_gem_busy_ioctl uses dma_resv_for_each_fence_unlocked() to iterate
over the fences in an GEM object without holding a reference but only
the RCU read side lock.

What can happen here is that the GEM object is destroyed concurrently
while i915_gem_busy_ioctl is still running. This won't free the GEM
objects memory, but still drops all the dma_fence references.

Now when dma_resv_for_each_fence_unlocked() sees a destroyed dma_fence it
assumes that a new fence list was installed and re-starts the loop.

But in the case of a destroyed GEM object a new fence list is never
installed, only the old one freed and therefore the iteration never
finishes resulting in an endless loop.

The solution is to drop the fence references only after the RCU grace
period.

The fixes tag is not necessary the patch introducing the problem, but the
one making it so worse that we need to address it.

This problem was pointed out by Sashiko-bot.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 912ff2ebd695 ("drm/i915: use the new iterator in i915_gem_busy_ioctl v2")
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 5172d3982654..9e01f8b2079a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -89,6 +89,7 @@ struct drm_i915_gem_object *i915_gem_object_alloc(void)
 
 void i915_gem_object_free(struct drm_i915_gem_object *obj)
 {
+	dma_resv_fini(&obj->base._resv);
 	return kmem_cache_free(slab_objects, obj);
 }
 
@@ -144,7 +145,6 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 {
 	mutex_destroy(&obj->mm.get_page.lock);
 	mutex_destroy(&obj->mm.get_dma_page.lock);
-	dma_resv_fini(&obj->base._resv);
 }
 
 /**
-- 
2.43.0

