Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B169C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 12:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5961361179
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 12:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5961361179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96096E429;
	Tue, 26 Oct 2021 12:10:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4E6E442;
 Tue, 26 Oct 2021 08:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C8B360FE8;
 Tue, 26 Oct 2021 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635237268;
 bh=aqX/BUKmfRta3pa2yzNOCRTmiB629p+qvxg28trH85k=;
 h=From:To:Cc:Subject:Date:From;
 b=iNJHjft9O86KkRz1OcOu6OlAUgJTcpntFvQIEV3zRcSmiDlHR9wHIh2oKUmeftdmZ
 fDZvWx4W/ZgFPMiM0fLzo+s8oD4uw6V2/VxrhDCicRY1czWpHU6VtwVcOL4uZ+L952
 Y3PJcyLBWwrxQP+MbLX3jnNmjqCn8eksHoYTKgW6JBbh9X84YW5nJYIgX+4xcEKy3X
 T3XpgTNXz9Tr1GMgom3opfnJ9F/WTpluH0aTyEq4Yd+DBbujOsqhIJKfob2LLB6q6d
 JyrFWvbQmabjCL5a+M1rcn++qxb8dwe9k3cYNyaZQ+LT+iDcx7/boLm52YFmb1Hd+D
 8r32CVf7MC1KQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 26 Oct 2021 10:34:16 +0200
Message-Id: <20211026083423.3461555-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Oct 2021 12:10:09 +0000
Subject: [Intel-gfx] [PATCH] drm/i915/dmabuf: include asm/smp.h for cache
 operations
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

From: Arnd Bergmann <arnd@arndb.de>

The x86 low-level cache management operations are declared in
asm/smp.h, so drivers that call into this code need to include
the header:

drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:248:3: error: implicit declaration of function 'wbinvd_on_all_cpus' [-Werror,-Wimplicit-function-declaration]
                wbinvd_on_all_cpus();
                ^

Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1adcd8e02d29..853a989fcb9b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -7,6 +7,7 @@
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
+#include <asm/smp.h>
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
-- 
2.29.2

