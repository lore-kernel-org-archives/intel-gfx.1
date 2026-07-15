Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07376C44507
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Jul 2026 22:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2210E1BD;
	Wed, 15 Jul 2026 22:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IVHz1/Oc";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7A10E1BD
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 22:26:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-46cea75d96cso617582f8f.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784154377; x=1784759177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HznNu2oP3vdo009kQzzHBrfsGvXYlXjkFudERsRqoXE=;
 b=IVHz1/OcDrjbp7EfXpbPzr3CJO5N0wYpbbrzabixzzbSKVbs0x3KkWLKFGMMQQEFN0
 xOsrzr2ZKAdlDzfCeockExWRql79BE9t6i6c4VzDAeYXzJ0ftbSkyZ4361v2IeCuqzEn
 uCzDYLutxe/b+2Sv7uHG9b5Ab22XonBq8qWNnPlH3MI7axdCMwL7teC/BEB7HLIZ/doU
 vRayIKLvVh4lPlcLBSnUMqOFPgpf0kexPnTgdWnv1TkrCliYFrkarsb/8rt/4M993Ddn
 vu89pVcYPo2YpdnbItJ8Opxj/+CQZuNOLFRbC9w3KExDGgk0CReg5sOWbWJRdt4ZN2md
 jTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784154377; x=1784759177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HznNu2oP3vdo009kQzzHBrfsGvXYlXjkFudERsRqoXE=;
 b=EVa7D/VFr2sw7PanbW+epm9i8Gkqe+dJuPKZ02lngvvaw42wEqdkOKjg7KOObF5Vyy
 bxi6OljCKUR0eTbylsbOW3/HvpW12SszDy2Ee3qF6VLLUgPR6EwBEE3GmpEqk8sUhpTV
 uqs9T7X9CJBZ173azkaboIy+9cepDBl1HA4W7py4pG6txKBc0k2JFX1zm0hZPiPh/+bZ
 KFbkIZ65HcgXq2vzfV4G2t/rdzuhVK0U+/vRQI3TI6kDx70SdQ1Sof4YtPRGAYRnCyXQ
 30ecv9n1Hl29x4CuIUGuUq4FNW8TSckPzc4rv4R5xkuBtOFTvrKJIyeH42D3g5GVN4Sg
 MnIg==
X-Gm-Message-State: AOJu0YwS9SAHbrNaZLamOeFviBDDtQoDFSzCT+7xEIdrqllRhs7rWc2e
 zGBHkwQqWizAcTt4Q/zdKzyiZX5sXoUXLyesmeIOjUWk5G/ZyPiFqysTXnohptp0+sMl7A==
X-Gm-Gg: AfdE7cnJwZQKcDH3SMz2CVRBr7CLWi8lw37sj6fJiTSIjaBmT/9T1wq6FsimuP9ivqh
 Bi+GsYCVbdX3lvqv79lPJCcsx+9q6B9hVRzEx8+XI+m0znBrTp5RP9ihoaHaVcEOnnQxugUr5zn
 TTp8TzL4PLD8hVjY1MpPcTro/Br+HzOfiCJWtvoIsiHQYDS4jjB7IbhlvMm6+KxWJibFFHy+0rD
 b6hBxIW3kXSNKU/RgSTOoeYtWyx1s2hi/A4GQDa94mdjvpBmPmK3bqh7uyAlc9C/QiPiLVGAjWS
 /mxgzpiKAITQajztu2T6vnBhDtUc1MPKBTCMge4gxqKkZjjlxdY6Z3Dm81Medzxn/3HV2vboMbe
 6u3HR/APlgbgs4QSuV0x+Vl4B+J+J1ia4mlZql5wwIYhE87ve9wF3ObS+g0ffR7Cb9g==
X-Received: by 2002:a05:600c:4f94:b0:492:1e4d:d44b with SMTP id
 5b1f17b1804b1-493f8835228mr114092515e9.8.1784154376697; 
 Wed, 15 Jul 2026 15:26:16 -0700 (PDT)
Received: from fridge ([188.3.249.68]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541e93295sm12046815e9.10.2026.07.15.15.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 15:26:16 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, chris@chris-wilson.co.uk, lionel.g.landwerlin@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] drm/i915: Free OA config IDs on reallocation failure
Date: Thu, 16 Jul 2026 01:26:13 +0300
Message-ID: <20260715222613.399409-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

When the OA configuration list grows while it is being collected, the
array is resized and the query is retried. krealloc() leaves the original
allocation untouched on failure, so returning directly leaks the array.

Free the original allocation before returning the error.

Fixes: 4f6ccc74a85c ("drm/i915: add support for perf configuration queries")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/gpu/drm/i915/i915_query.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 0c55fb6e9727..11157fb14db3 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -403,8 +403,10 @@ static int query_perf_config_list(struct drm_i915_private *i915,
 		ids = krealloc(oa_config_ids,
 			       n_configs * sizeof(*oa_config_ids),
 			       GFP_KERNEL);
-		if (!ids)
+		if (!ids) {
+			kfree(oa_config_ids);
 			return -ENOMEM;
+		}
 
 		alloc = fetch_and_zero(&n_configs);
 
-- 
2.55.0

