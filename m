Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B0C79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279F110ED1F;
	Tue,  8 Sep 2026 18:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FDRlW/+u";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DACC10E0CD
 for <intel-gfx@lists.freedesktop.org>; Sat,  5 Sep 2026 14:25:41 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-38dfe7eb825so1624141a91.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 05 Sep 2026 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788618341; x=1789223141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=irtRdSHYVWU6V1hRtF1N7wOshHHRxGrEgOQHGUw+S0o=;
 b=FDRlW/+u8lA29qN+drgG/atl6HWHIti7aQ2oJyBe+njHdxFkAYNPh5RNFgJpJz4+Z9
 NNJmS3P+L968NrvMmZAJul2fGt4BSBMe7yUYTOSKEwkB7qiBQHO4QW2GsnP0jizogf5c
 cWKZFAngbX9qi7LHog3hOJj5AOm3WuPUCPAN6ZV41RZkf07Mg/cYbqR1tUNZln7CF3MB
 mWDqFRIE6W1SpXotPHSNVUGXJ7Yn2Nokl0RgBu2/mYA/MTmCMG1oHZlYHHMkIcs20Jxx
 vJr236vG76Cr2JeO3WnSR4aifyOMLudWYgrGjTRAgUEP4qtoBjnKf70Y8woEk7kbaXct
 Z5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788618341; x=1789223141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=irtRdSHYVWU6V1hRtF1N7wOshHHRxGrEgOQHGUw+S0o=;
 b=VEJPL4gkmH/GHck3nxAFrWUDX3bag+Kmo7hre5DjY3HD3J/WfdTd22vFzrJiUzPjXe
 odZhczH/HHRsIAP+OzyoJ3cHUGGO7ZNwhthUdvuMOMylUfGz6j41n9cmjyI6AZ2zbjVD
 yL/u3FWY/82LBBB0XV/KrUukqDwLnEJpfHYkEift0u40gK423p9Fu3oVTWNauH0oMlaq
 705GIFtOd0Rwy14jbgz2hLxsjtQCIbcQcAtetJYMH+ijE3Z2CB5aC68rNilSfgkXU1LO
 05OcqZWMbbs5j31FD/R0Z9Y2LnAcZvPX+lybdkFNsPTH1ekeh+rGqWGMThLfjm8+sED4
 +b6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhnXohI2ykoJH8rd2yYnGFRLvoprlWrfN82CO2yinoKh0hOC9WtGQA2BTJyEI0fY5mvO8tQF/7HRg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nAosjByfUQ5fiegqY3WryKTULR7J4n5Bsp0TYH/8a93alABHu+
 MYy0iZ4g5kK9HTiCJgLaPsx6td8/IkVUD6BpFZMtnRNrhAeK+j4ozYFd
X-Gm-Gg: AYBFou1ciCTv3U+7JRTuCClN+zcAquNJVM/TZ+jxXe0e9+8hq6rvdDDlQdmDYNAkagW
 43pPWZ4BsoGWFYacLJQSjf9xk7Bfz9xS3re9iXWpySy4gAdGVClNpvdWodlcZm7SOTaKFK+uo+L
 YQjMVrms7y+U3teAY0AMsnuzqmtB2wGhRjZRgx0zte9kCqJTJoTSxHp+fdcWjU05Ac57FiTr/f7
 6fitR0JqF4xRnl5VMgRaqfo1/Zv3AdOtcwtw3Ai1TLGj99jqsRF727/tYKmEz7UnvNRAHW4leU0
 k9mkMAo16Iln3LxC3E4bl4yocNHYHGOemu3C4RUa92dDEwz9O7t7aL9IMA/HnFVAwkZn5ihbUn8
 mFaiEj06Yw+IhbMIrRzZc9yBK2InZvrL8oaTO1zajstPpiJdgXB6AojbNRFPDqTC/8Ny1NdfR6E
 /yBkITNe3vUzhVaR4tbfRaTgxv+f6750TGP5M0YqtsbY7ZtRXrENxUv2loxddaWTZUI8uPJc5TT
 oqUqUZrcTbGYm20sjlen1vqWkVAN2Hdp7prU5kAYVBJwwNP4fKx
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id
 98e67ed59e1d1-39b2612eaa4mr17477270a91.10.1788618340676; 
 Sat, 05 Sep 2026 07:25:40 -0700 (PDT)
Received: from XiaomiLaptop (n112119120034.netvigator.com. [112.119.120.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b260fdf9asm10501790a91.9.2026.09.05.07.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 07:25:40 -0700 (PDT)
From: Andrew Zhou <zhoulol888@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrew Zhou <zhoulol888@gmail.com>
Subject: [PATCH] drm/xe/display: Remove invalid initial plane PTE check for
 iGPU
Date: Sat,  5 Sep 2026 22:25:00 +0800
Message-ID: <20260905142500.17666-1-zhoulol888@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:36 +0000
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

Pantherlake intergrated graphics can have the XE_GGTT_PTEDM bit set
in the BIOS-initialised framebuffer PTE. The new validation rejects
this and fails to create the initial frambuffer, resulting in static.

Remove the too-strict validation.

Signed-off-by: Andrew Zhou <zhoulol888@gmail.com>
Tested-by: Andrew Zhou <zhoulol888@gmail.com>
Tested-on: Intel Core Ultra X7 358H, integrated graphics, B0 stepping
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b7303..8c95dc4e6 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -85,7 +85,6 @@ initial_plane_bo(struct xe_device *xe,
 			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen;
-		u64 pte;
 
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
@@ -93,13 +92,6 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
-		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
-
-		if (is_pte_local(pte) != need_pte_local(xe)) {
-			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
-			return NULL;
-		}
-
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 
-- 
2.55.0

