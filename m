Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E089C98309
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 11:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15210EFD1;
	Wed, 23 Sep 2026 11:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Z7V+3Kei";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4D910EFC4
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790162117;
 bh=8QMvzx+zt2ycBjp3o3xV8VyWJ3IFBwSXu+RAT1NSrOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z7V+3Keink2n/uSjq5s75FyR5qhxyqBOSOQcMNP/hdhb9sYKgokFlQNCcuB91I9XS
 SCWNYoSoULHrkU4EMUW/FyekZazTrVT3oe1aSbwCgG2WnrMdH6qttL6EUettqcYdzX
 /fta71H+s8oNhTmWhzJd/6ivTUuqN1nOJiZ6/EJwb7hzbaqTNuf67oRVv+gSv1pQ9l
 TLTubg8Tl6Nfb5JcWoFd2HlvtZrGUY3vxPKuqLfAnuwQvTFfJ0Qs29cD3KPIDPLPLj
 StKAI34cP4ZOWFX5MCfTthxvPgtizwFa2DfXHlKUYs7vMHz+8Ua4xPQZn60lE3rDCr
 8g4cyM75sUs6A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 5/6] drm/i915/gt: Set stop_timeout() correctly on PREEMPT-RT
Date: Wed, 23 Sep 2026 13:15:24 +0200
Message-ID: <20260923111518.310430-13-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923111518.310430-8-dev@lankhorst.se>
References: <20260923111518.310430-8-dev@lankhorst.se>
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

Also check if RCU is disabled for PREEMPT-RT, which is the case when
local_bh_disable() is called.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c0fd349a4600c..9dd9665128caa 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1607,7 +1607,7 @@ u64 intel_engine_get_last_batch_head(const struct intel_engine_cs *engine)
 
 static unsigned long stop_timeout(const struct intel_engine_cs *engine)
 {
-	if (in_atomic() || irqs_disabled()) /* inside atomic preempt-reset? */
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */
 		return 0;
 
 	/*
-- 
2.55.0

