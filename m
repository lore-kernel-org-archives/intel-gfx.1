Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8B5E81BD7
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Feb 2026 15:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8877710E417;
	Mon,  9 Feb 2026 15:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="m88SHKNd";
	dkim-atps=neutral
X-Greylist: delayed 933 seconds by postgrey-1.36 at gabe;
 Mon, 09 Feb 2026 11:42:48 UTC
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9410E066;
 Mon,  9 Feb 2026 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Message-ID:Date:Subject
 :From; bh=IIec2LSknqxkoPqpM3FPJF5Lz7rAFB101XiUbTj0NDI=; b=m88SHKNdjE5eDjtidGh
 Si4TM66ruxN8sBL7OGnbMvPmkxcPjD+h896ZhMd7qsndsH4ALdHDinNP24M5O3xnIEr9X0L7TFl7L
 36PiYNGjkBvByfWns00qPTnKqxmOoszkWcSyeY0IzHxMB0szbhG6UNuPB62nxyKjRWF+2eG6zObfW
 1sfNXixiSSjREb5iEN1HyEgtty3Zb34izkA0+K7ttsSN4i2QwIwSOQt4nSloxCOFtaVW+zX+sz4cf
 bm6B5CFh97UaqjvoLZOtYSIiCewScbq+FGlJ37nps/RbFRFp+ZUkg7AIR8slzz9gjvyP6KfwwoboS
 ts+kJRg4isDf9Xg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <khorenko@virtuozzo.com>) id 1vpPP9-00DGir-16;
 Mon, 09 Feb 2026 12:27:01 +0100
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH] drm/i915/guc: fix corrupted copyright symbols in selftest
 files
Date: Mon,  9 Feb 2026 12:27:09 +0100
Message-ID: <20260209112709.2551603-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 15:22:05 +0000
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

Replace broken UTF-8 sequences (Unicode replacement characters) with
proper "©" text in copyright headers.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index 68feb55654f77..0ef294bef00b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright �� 2021 Intel Corporation
+ * Copyright © 2021 Intel Corporation
  */
 
 #include "gt/intel_gt_print.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index a40e7c32e6137..28e8a092f4e7d 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright �� 2019 Intel Corporation
+ * Copyright © 2019 Intel Corporation
  */
 
 #include "gt/intel_gt_print.h"
-- 
2.43.0

