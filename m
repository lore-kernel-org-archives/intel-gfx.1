Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E7ECA6002
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9574C10EEDC;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+ctMgOT";
	dkim-atps=neutral
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103F110E4EF
 for <intel-gfx@lists.freedesktop.org>; Sun,  4 Oct 2026 21:24:09 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-53519e20d7bso10044491cf.0
 for <intel-gfx@lists.freedesktop.org>; Sun, 04 Oct 2026 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791149048; x=1791753848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4FDDBOjHId45sAPhEMEOKQ193Q3Lv9uy6bGqIfQK4UI=;
 b=e+ctMgOTymF+Tscj1W1FIFRqI4Dwy+XM8Pk6k79X7E8/VxJvQOHYK1uR/bktDOSGwb
 njE1y5c9Q/iv5GUGKQkTPB7hhccDliwgVaiZLJkNxQ/EYqWa9Pg6DlV8qfCj8BvPkUfk
 KSqdy6kZ5uXdfedyqKLIE/hIFckfgS0L2UXTzf44/CsLe3nWMrVkCzWk9+8I4Sw3L153
 9JmaMMNyXEk1nzC206aO7ISquC4l1m+wV0KswhYJyFPKqMK+v+fFaVC8sWEuu58WkzDz
 Md7N2CU+Q1lR2MeTBPbciEEzG9MpVYAktZTf+2zXfPFnSpAIjf9SdeqYfr+LftWIrkQi
 ud7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791149048; x=1791753848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4FDDBOjHId45sAPhEMEOKQ193Q3Lv9uy6bGqIfQK4UI=;
 b=t+E9/1uVMVDZ3yGcIOXzQT+E8blQkRczaMYhOthL4GfeVqWI71hT14mIVTTChbnXk2
 OVDFzd4oD6s6JgBGlwTNayakugKYgTd3Aa5Z1lv+JaHwpYOwpx1mYQzPYTMLCK0pGjCZ
 QfZ1xFadcersuYDmaGFAMOrW3cvUUDRQo3uv+Hyf7ElJFZDyoqYnkwJ6/ns0QDHQ59tT
 p+bZO/j4D8R/HrhI6pbGYWT5/M1sx6SHZxFK39mE3pIejj4tnvaFN1/AMNJd3909LDHu
 Aw5/n8APVTUnNiLyTNiAftMPLE0T7sOmslf7GEf8dVedNYnxLg9FRS6CbV3dBq7wi53f
 FMEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2U562RknmtNFTpGcWI5ewgHF5oiHy4h9AwjZRlYobYR/VK1wd+cLMn5hklBA9pwOqvdpwBXehAGI=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nkYg4AYUoUCSDgURFX3JJaA57y0mm2YFQHebPAxa4RJUCFQusj
 rEUm5K5zFgN3r62u/lwvwRpYIy3XIomCerD/6RV4MiRvqnuXCurf/Ta5
X-Gm-Gg: AYBFou2AT+YmmreYYIkjBJmHewtQpyR6i3PQ3rmLkLImPuZbA3HG39JB5m1GhoIp1A9
 G+OmKvPMAtKyGQKYFZM3pffQ0StBBuiqH681IOcbZcCkF6ydAWCJSIjyqxrqqG+6pO0dDcvhP8R
 ZKJIqxf+kJAbbLS5q03MDBw0AHiR9fcKFPZS+f1YcA6RGzc0oqJYeC+YuEIfyb8jfgJPY1q3GxX
 4HwAmM1Za48AHMEJofv2x2XWJq6tpLVei8dnp4b1V5TeLysgI/e4ZJjv6nGk4Obzir6VNXjTr0Y
 ioiMbjt6ufVQWTkvKPyiQVKw67oUt0alx93wqZPh8yaFIMV7W5iOso74DYndIoGaGfa3TdVzTol
 fPJIzLElc03UbYq6KFULk7ypoDb1JSAbFEsYxMUp23Yqpuk0ktA9NXAumFiH0E5YmZwKIiXGq/p
 hdcc33j3sUCUCpnlpD/A3m28htk8tdoKZ8E0yDTLCh7fkBMXb0Hhdp1jYIf+CPdVtYXeVHvVEpP
 1N5Z5vQZHDq6rgdyQQGAA==
X-Received: by 2002:a05:622a:653:b0:535:1924:d211 with SMTP id
 d75a77b69052e-5351924d301mr81314081cf.1.1791149047944; 
 Sun, 04 Oct 2026 14:24:07 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5339883034csm81689241cf.3.2026.10.04.14.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 14:24:07 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yuho Choi <oss.patchbox@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is still in
 use
Date: Sun,  4 Oct 2026 17:22:39 -0400
Message-ID: <20261004212403.208681-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
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

intel_gvt_dma_map_guest_page() unmaps and frees the cache entry of a
gfn when it is requested with a different size, and maps the page again.
The entry is still referenced: shadow GTT entries and dma-bufs keep
using its DMA address after the page is unpinned and the DMA mapping is
torn down. When the new mapping gets the same DMA address, their later
intel_gvt_dma_unmap_guest_page() calls also drop the references of the
new entry.

Keep the existing entry instead. A 2M mapping covers a 4K request for
its first page, so take a reference on it. If the entry is smaller than
the request, fail and let the caller split the 2M entry into 4K pages,
as it already does when a 2M mapping cannot be set up.

Fixes: 7366aeb77cd8 ("drm/i915/gvt: fix incorrect cache entry for guest page mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 defconfig + DRM_I915_GVT_KVMGT, W=1, sparse).

 drivers/gpu/drm/i915/gvt/kvmgt.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ec62db5cc3675..9a3e305253469 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1626,19 +1626,15 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
 		if (ret)
 			goto err_unmap;
-	} else if (entry->size != size) {
-		/* the same gfn with different size: unmap and re-map */
-		gvt_dma_unmap_page(vgpu, gfn, entry->dma_addr, entry->size);
-		__gvt_cache_remove_entry(vgpu, entry);
-
-		ret = gvt_dma_map_page(vgpu, gfn, dma_addr, size);
-		if (ret)
-			goto err_unlock;
-
-		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
-		if (ret)
-			goto err_unmap;
+	} else if (entry->size < size) {
+		/*
+		 * The smaller mapping may still be in use, so don't replace
+		 * it. Fail and let the caller map the range in smaller pages.
+		 */
+		ret = -EBUSY;
+		goto err_unlock;
 	} else {
+		/* A mapping of the same or a larger size covers the request */
 		kref_get(&entry->ref);
 		*dma_addr = entry->dma_addr;
 	}

base-commit: 7704c4c5bb127673b4f0ead839919db573559e38
-- 
2.43.0

