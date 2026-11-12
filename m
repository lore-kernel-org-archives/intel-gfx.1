Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442FA606A330
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiebPAWE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFB910E7F7;
	Fri, 13 Nov 2026 14:28:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D921121C9
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 15:58:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2eb0f1b592bso52245ad.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794499132; x=1795103932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PBaR9YGz0f77rnkIf9yudCqFA3ukRsghy48xQHT8H54=;
 b=jiebPAWEH8GdzSRMuk7yyQEOi+Z3fZ6SbN31CVslFMfJfjHaK1bfrcTxLhq6fuwG/D
 YcUNyMxrrb250RRhl06KHF18CCgcXmfkwhJH6UVOsdw25D+CFnV4PQepNiSs3RjBZlK1
 ikPFNSYy+CGvOp98D1E7BO00nPPC/+GXLpPSQxjklzttrWHd5zJ6BnIE/pg3SvIKHmwU
 +9f5a1z7uwNwpNyXvq0PqxtwiM/ZcwosS5/WdDvg2VWY84HGuUrf2qQSfS9E6SrK/6Jx
 R2Afhn2moDuUks9JTlGvsPukbI/N/bhJCanEJLIJ83v3oM5ju7lhBIukHry2XMK7bU5k
 zQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794499132; x=1795103932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PBaR9YGz0f77rnkIf9yudCqFA3ukRsghy48xQHT8H54=;
 b=HxwSCopAEaeOSIid/U25xOTWWJMwo6wO19uzYNgg18chLU/pR9SDrQUE4IT7PCI2pz
 kqd67Tf46pKRxDLfzj2NyTKSCXZeklXmnayY//IPbxY7rRkP7UVUJN2y3SsUFazuCge3
 zobtBePG743f0v6M3wnvKMNQaC1FUuqAWyAAUT+mMl1sFzSoMF/UN0eQULLAF5N3oB6H
 1/Iwq2XBd4zbyshA1sbvG9vGaHllGAhxF2xXhCdnG27v17iR62VFrITsvSPcA84+uaqQ
 ObWfWDkznJLNOoXlszrPyXH8iGh27CcvYS6uOiF6yqjm/mJM+53LxEMNQprlc2YxF8k/
 L+bw==
X-Gm-Message-State: APuU4Z/+dIvo8QgAPEb7wDqSUpoqCvuzQfaCtRni5CsiI+b3LR1QNV78
 R5v/khB/MP4++0WHRab6FM63yoOCqzUeR+RIxAcfnsuB5ip0qPWJaYDk
X-Gm-Gg: AYBFou09hB0XFRhA3dvIBDt82l3ZVGFvDEwlYdH4mizJSdcI43ZkpDeOGlix24xYoZc
 KNZo6tYgbszfOig1Ciel38EyN6iK5MFEztUc1N/bCDXaUt0KxQELztqWJW8wStB5peWVuDYiXTx
 CQRr5hhpiBRsKoCfa1g/r1vNIZF6bg2WT8+DOG1XCHGw5M9Y5esLhUXdzA561/4TrKCi3UvLzs9
 ke/DkwQuIKH2QP5RuOx/KXW4lkm4ReSdF8lq7WaWp0Qfi0HfRoeEnf0VGpFeCwjN/xkZNlw4D+x
 blD7ApAdztAM2ZDyN/3CXNA6vzlHD2Wo8igK7rXt5WEiRN+I233Om1SDoOssFEs5MU/OSjBB8aM
 A+W4WWeSfjL+S8CjcjN5axbiRD6C4MeFkKDnd2/VIgJXnMneqJ8pBOh9G5qVKxYCMZc1g3uJm/3
 zVHaxu3xLrma6kFP5ulJONYjEqKrM0Su4obyfijbPicxBywY1NwK5ibMmNHqwWCp5q2PfOKpEhg
 F3WKRt90JGa7DPCeWLJdt7U6zqEd7BxQJnw7XFT+NMgvT2Lvpp0uoa31QkpH7VovbQ9Pr6R5n/L
 w3xpqYg3L5LXowEYqJ8=
X-Received: by 2002:a17:903:1111:b0:2e8:7686:4d46 with SMTP id
 d9443c01a7336-2edd788d0bemr62363735ad.34.1794499131728; 
 Thu, 12 Nov 2026 07:58:51 -0800 (PST)
Received: from oslab.. ([101.6.42.129]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2edb6d4b93csm35556945ad.14.2026.11.12.07.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 07:58:51 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: zhenyuw.linux@gmail.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tuo Li <islituo@gmail.com>
Subject: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
Date: Thu, 12 Nov 2026 23:58:22 +0800
Message-ID: <20261112155822.1336713-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Nov 2026 14:28:12 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The running slot is updated to the pending slot before updating the running
context. However, the condition checks the old running context instead of
the newly assigned running slot.

When no pending slot exists, running_slot becomes NULL. If the previous
running_context is non-NULL, the code attempts to access
running_slot->ctx[0], resulting in a NULL pointer dereference.

To fix this possible NULL pointer dereference, check running_slot instead
to ensure that running_context is updated only when a valid slot is
available.

Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index 29147a9f162e..763c310f2aaf 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel_vgpu_execlist *execlist)
 
 	execlist->running_slot = execlist->pending_slot;
 	execlist->pending_slot = NULL;
-	execlist->running_context = execlist->running_context ?
+	execlist->running_context = execlist->running_slot ?
 		&execlist->running_slot->ctx[0] : NULL;
 
 	gvt_dbg_el("[after] running slot %d/context %x pending slot %d\n",
-- 
2.43.0

