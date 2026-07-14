Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB6C43458
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Jul 2026 22:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94510E03E;
	Tue, 14 Jul 2026 22:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkJNXDMT";
	dkim-atps=neutral
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427010E03E
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 22:04:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-470f53bdc70so298392f8f.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784066675; x=1784671475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZXMzCwzfRrZxDnE5OxiC4Hos5YaK0wzG9Gg6Qao8IS0=;
 b=SkJNXDMTc+s9RxsH2OowkiUlh7IgI1mF2cT9TJKqj3UaGOvGHl+wzvKWkQg4gFgVhe
 YkNB7YbbgvDJAjRWjaUIqb5xyPn7F02lEekgrkYAiMC6xeAi/aH9pYqsePOkvAIwPGPh
 Ub9hX/a4W45k6lYEkIoCPPXOpImKsBM3MUiW6pXswIOi1tWMFH8iq52gU9g65FOJRJun
 TR4POM/rTUWFrwl8OKzJSZm3xin7KjS907sYFBzJ0PZ9vHi0fuOhNTgY/zhGgk1HS26X
 6ySdR48zoILFaXhhmwKajF885gzIpe4N823naXe9U5xyFP5W3WtB4Qa+MCHudUTnQ/3R
 fOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784066675; x=1784671475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZXMzCwzfRrZxDnE5OxiC4Hos5YaK0wzG9Gg6Qao8IS0=;
 b=P8JsOfsVRrX8e/VztB2TIhlMFcvmd5FTJp3kjmMwTjzzpDcwj3wYdOWSBST2uOAiH/
 NmunKeOzxLsepJRpBfNY6ebrM2m0cN5uYc0FD5cQDFAj2pAK6GpzRvPJG2O5ey78OYey
 rZmAs9orPrC6b03fKl6opfXQqr0/LOJhPiB5AQWgz+opuiJ1lvmljvzzCU84ta25lIvb
 g/1qi9ldB8/OnUZHpkGw5izYAau8ll7mqK57g3ZRdi6JBGNcNBN5t1570341813Mr4B4
 TLfPShbMRb56uQMll4f6wmY8Hjf6+WziZfkgGAAvWgs0PlgrxNxFNRYg9mONIbCgyeDA
 /3yw==
X-Gm-Message-State: AOJu0Yxm5XgeY3bfokFHTB9Z9EKmrbv9+xda/FOdWZBTf8eaKimQLeHj
 A6Z25dOyaC8PcDCdUvIWSiu8hogOMr3AOe2uAZb3jiVs8oHQoRnQATINslFuNVtB/1h24g==
X-Gm-Gg: AfdE7cnVVJtZ9gc8pAInaA+y446MV/mppr0iwHjMXanoEba21ypVl5cq9DMghd3U8ie
 wDyKIaqL7Z80MRddBhzvEMi2YJOJ9JF9V5c7WunhiaoEwFtAnSGEIuDAgk1jgnXkUrV6Q1NNb6u
 BdJvCHwV8T4xHtuoUubo/ADKLKSBrVx40c68PpAGWimN02H4LHgOaO6Qm+aXHixSwaFOZmK+Ag6
 U0poxdXIU9R5k7gxVk1BkWCgfTLw/EHIPLOzkMC5hV2uqREi1vZvwJSuLLMGY/rrmpaXbk60/ZD
 ZbgJr2AJ0g/2jbMBhsZxQ1R9mlgu+yQm2VTgVYd6vWkrxNp5BbjfkAW0jHQYedYtTr5GEbpeH24
 dyDDR90JwRkLLtgTeH70UlK0aJPaK9N2rAILT8CwgvTddwP7zuw8obvRAG+t2eUkWSW4IKkrMfV
 Qf5Lx+NvMYNxnWvZ3Lg7637c4ZRbXZGuGJdGfcsFYzAA==
X-Received: by 2002:a05:6000:1843:b0:47d:ed40:a913 with SMTP id
 ffacd0b85a97d-47f2dd21ae8mr10379556f8f.7.1784066675060; 
 Tue, 14 Jul 2026 15:04:35 -0700 (PDT)
Received: from localhost.localdomain ([46.106.118.255])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464bbb0esm11595377f8f.28.2026.07.14.15.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 15:04:34 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] drm/i915/selftests: Fix GT PM sort comparators
Date: Wed, 15 Jul 2026 01:04:30 +0300
Message-ID: <20260714220430.238433-1-emreleno@gmail.com>
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

Compare the sampled clock values instead of their addresses. Comparing
addresses leaves the samples unsorted, preventing the code from discarding
the minimum and maximum samples.

Fixes: 1a5392479207 ("drm/i915/selftests: Measure CS_TIMESTAMP")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
index 33351deeea4f..07eaf71955c4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
@@ -16,9 +16,9 @@ static int cmp_u64(const void *A, const void *B)
 {
 	const u64 *a = A, *b = B;
 
-	if (a < b)
+	if (*a < *b)
 		return -1;
-	else if (a > b)
+	else if (*a > *b)
 		return 1;
 	else
 		return 0;
@@ -28,9 +28,9 @@ static int cmp_u32(const void *A, const void *B)
 {
 	const u32 *a = A, *b = B;
 
-	if (a < b)
+	if (*a < *b)
 		return -1;
-	else if (a > b)
+	else if (*a > *b)
 		return 1;
 	else
 		return 0;
-- 
2.55.0

