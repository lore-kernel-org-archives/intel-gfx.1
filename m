Return-Path: <SRS0=Kzal=OO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA7AC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Sep 2021 16:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BE2610C9
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Sep 2021 16:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0BE2610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7EE6E1EE;
	Fri, 24 Sep 2021 16:38:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468FC6E1ED;
 Fri, 24 Sep 2021 16:38:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10117"; a="211354079"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="211354079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 09:38:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="516087633"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.4.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 09:38:42 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matt Roper <matthew.d.roper@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 24 Sep 2021 18:38:25 +0200
Message-Id: <20210924163825.634606-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2] drm/i915: Flush buffer pools on driver remove
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

We currently do an explicit flush of the buffer pools within the call path
of drm_driver.release(); this removes all buffers, regardless of their age,
freeing the buffers' associated resources (objects, adress space areas).
However there is other code that runs within the drm_driver.release() call
chain that expects objects and their associated address space areas have
already been flushed.

Since buffer pools auto-flush old buffers once per second in a worker
thread, there's a small window where if we remove the driver while there
are still objects in buffers with an age of less than one second, the
assumptions of the other release code may be violated.

By moving the flush to driver remove (which executes earlier via the
pci_driver.remove() flow) we're ensuring that all buffers are flushed and
their associated objects freed before some other code in
pci_driver.remove() flushes those objects so they are released before
_any_ code in drm_driver.release() that check completness of those
flushes executes.

v2: Reword commit descriptiom as suggested by Matt.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c             | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 4037c3778225..5b3acf2b064e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -741,6 +741,8 @@ void intel_gt_driver_remove(struct intel_gt *gt)
 	intel_uc_driver_remove(&gt->uc);
 
 	intel_engines_release(gt);
+
+	intel_gt_flush_buffer_pool(gt);
 }
 
 void intel_gt_driver_unregister(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index aa0a59c5b614..acc49c56a9f3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -245,8 +245,6 @@ void intel_gt_fini_buffer_pool(struct intel_gt *gt)
 	struct intel_gt_buffer_pool *pool = &gt->buffer_pool;
 	int n;
 
-	intel_gt_flush_buffer_pool(gt);
-
 	for (n = 0; n < ARRAY_SIZE(pool->cache_list); n++)
 		GEM_BUG_ON(!list_empty(&pool->cache_list[n]));
 }
-- 
2.25.1

