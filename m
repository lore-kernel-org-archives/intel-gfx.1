Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D4CDB479
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 09:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8346010EE26;
	Wed, 24 Jun 2026 09:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2E600TH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDE710EE26
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782292201; x=1813828201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2+AYVRt5sXs90dXPOyDTHlXALrZ4HOpnjfYqPyRpyZE=;
 b=k2E600THkghbwK8aVsvI9a0XizwCHNGHzfFR2QAmStg2wHWoRaq8cfFY
 fwDx5h0yiiHpGOxUa2koIRRQNVCgj0Bilpu4XGjGo5oWvXQ4d1UV16mfA
 Mqy5WkYfKRPp4JfzbfX5US0tPdJ/3oXcFneuBS4aboFFQpIXBppprk6hM
 40+kkvDTx4Cx4Z2FaDiUNNJju8n9NsDFfBitrVGZzo37qYJ4b79vDGU6Y
 BHUNqZbVOu0hbLNyeEJEK5pYQXybnFNYmm3vGUGi7EawYecf46ZaWQ3Nc
 Zk/68Q6GvJRLJtzdkRtNms2dd7YvQfywkzbgqTwmspHtO5nh+sE2XPykD g==;
X-CSE-ConnectionGUID: Z/CMENYdRAy6lhUKyVn32g==
X-CSE-MsgGUID: rHUkRzZHQFyDQRS3QW4Log==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100598680"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="100598680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:10:00 -0700
X-CSE-ConnectionGUID: KfwQPapZRiWPbZUEA0FmyA==
X-CSE-MsgGUID: +m2B6kc9RUybhaFhj3Nsrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="279938649"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.147])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 02:09:58 -0700
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: [PATCH] drm/i915: Return NULL on error in active_instance
Date: Wed, 24 Jun 2026 12:09:40 +0300
Message-ID: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Avoid returning &node->base when node is NULL due to OOM
during GFP_ATOMIC allocation.

Discovered using AI-assisted static analysis confirmed by
Intel Product Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: bfaae47db3c0 ("drm/i915: make lockdep slightly happier about execbuf.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: <stable@vger.kernel.org> # v5.13+
Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 5cb7a72774a0..aa77def0bc0d 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -318,7 +318,7 @@ active_instance(struct i915_active *ref, u64 idx)
 	 */
 	node = kmem_cache_alloc(slab_cache, GFP_ATOMIC);
 	if (!node)
-		goto out;
+		goto err;
 
 	__i915_active_fence_init(&node->base, NULL, node_retire);
 	node->ref = ref;
@@ -332,6 +332,11 @@ active_instance(struct i915_active *ref, u64 idx)
 	spin_unlock_irq(&ref->tree_lock);
 
 	return &node->base;
+
+err:
+	spin_unlock_irq(&ref->tree_lock);
+
+	return NULL;
 }
 
 void __i915_active_init(struct i915_active *ref,
-- 
2.54.0

