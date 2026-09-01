Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDC4C61DD3
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B41710ECF4;
	Tue,  1 Sep 2026 13:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qnlJIsdp";
	dkim-atps=neutral
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF4110E16C
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 05:02:49 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-39682983a0fso5467665a91.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 22:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788238969; x=1788843769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9yUuR/WSkjmDZYldjCLyDwNxnmnt2IjU3AxaHKK9h1A=;
 b=qnlJIsdpEVmJhI+OmNasyOxhH/JSsHxvclJbqdMc7e8iJ4d6iNhXZ+dIcYJtn0XZew
 ye+0pjLpXzOVsg9DJ2gDOoupfXzV1xnODVi64Xq5Z4Cr/+7jQjeVXoI2W0uX1GvQcJjq
 vV6h1c0lpwAdLXDtRxlz308Ff34CIqTwNzkrnRwoxPiESarECC8yY9HPXLZVcHgtrN7x
 dEHNbGzCQfypcozx4XvfMVL4Q7wEOpCPGd6NbLcOs1CYdDtqH91SSuOKu6mKa7D18edz
 Rms3OEDT7Tzp4i8cI1KmmJYmJGBBxtHfCVqA1SqQqTz8cNEMfeUk+onSyzIQQJliUL3m
 hliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788238969; x=1788843769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9yUuR/WSkjmDZYldjCLyDwNxnmnt2IjU3AxaHKK9h1A=;
 b=kUmFPY6yYDgdf0F6Snxq/HpTFC+VDqbPDqqMurCYx9id573JceHwaTcYkaJmZ/khrK
 CUh8HrVi3LV0XLzb/NA3nP6y/LC1TyootGgim79CYx2t6ELGgwRu2r9ZqJAPbe0sO9bO
 KXlG5t5sAtZ8q7MNeQEaLrNDepTjK1t4376m9y7WRCX4ufgI5guX5bX8LItR9V7oVJI2
 zhDenAo0rm0g+Pk0nzKhEICVseqzr/bDlEdXkyRGkC8kLiBO1WWyKZ2hv/Bq4SmfqfXD
 5qqqTFbo60je8ZBAHCaxUqFwpalZ5Zje3mImIm4CaNxCEHAtqD5Lva/Hb9myYxajkveG
 Ismw==
X-Gm-Message-State: AFuF++l+JHSPy8qhQnGyAwcBKQ276FqF4gZZhhwUiuLZr3YJCwu4dTrs
 Wg9hRio5UajATJAopni3O7u/dBc5mjw4IFacEVEAdtRUnTg8LbD0FTzy
X-Gm-Gg: AYBFou2Aso8f4Z6oEjiAC1aBXD+h04Br4PFg6eBqfnXstxP2iYGplABpAcb57Y5Jhar
 LHPbV4HqXykAmPTyuEYTe63bLIHxPiYwgUu1A0YXCUx12gdyYBp18bzs1iwNqJ96JrDpL6TsLP5
 e2894sMsnkoxFj9zrp8B9FdmiK/oeoAXzCJLxjYwGmBfbRGIhmpurwSAcRxvVF4c4T3IfnYWERf
 LAgCLTnTIoT4H+bYifFdeaUX0E4AdLw9ngnNUpSlg4vMXQnZ62RWEExfiqs3KL5JsmMzyh3tJou
 5sP10oDclMB+xzg4onnBgSHV7VPx3EfHRo6FOh8b4Mz079ha18fd4VXPkptaoNvoAXXi96gNzqB
 rPxQ4YBgUefoDSv21PnZbwV2h0lLBIayjlILScc/rcOkLgtjew3CiggYW78pvQE/P0PnLvx3hjL
 Zr+XN/K6Wslm1u7FrjQQDiSx7jYwZHoZnFYi38yQhqeejVxuyeD8MZG6jUEoXTnZKZc0k2
X-Received: by 2002:a17:90b:3c83:b0:398:9bd5:490b with SMTP id
 98e67ed59e1d1-3989bd54c84mr34387219a91.18.1788238969089; 
 Mon, 31 Aug 2026 22:02:49 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0bf8a13sm49404128c88.0.2026.08.31.22.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 22:02:48 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] drm/i915/gvt: use strscpy() instead of strcpy() in
 virt_vbt_generation()
Date: Tue,  1 Sep 2026 10:32:41 +0530
Message-ID: <20260901050241.359490-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Sep 2026 13:43:42 +0000
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

strcpy() has no bound on the destination buffer, so convert this to
the bounded, always-NUL-terminating strscpy() instead. The literal
"BIOS_DATA_BLOCK" (15 chars + NUL) fits the 16-byte signature field
exactly, so this is a no-op change in behaviour.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index d6e76ba31d60..f2527e26cd1e 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -151,7 +151,8 @@ static void virt_vbt_generation(struct vbt *v)
 	v->header.vbt_size = sizeof(struct vbt);
 	v->header.bdb_offset = offsetof(struct vbt, bdb_header);
 
-	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
+	strscpy(v->bdb_header.signature, "BIOS_DATA_BLOCK",
+		sizeof(v->bdb_header.signature));
 	v->bdb_header.version = 186; /* child_dev_size = 33 */
 	v->bdb_header.header_size = sizeof(v->bdb_header);
 
