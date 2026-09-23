Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E8DC98309
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 11:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8520410EFCF;
	Wed, 23 Sep 2026 11:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="JgQQvbBA";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3790210E12B
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790162117;
 bh=1+VVe73chfI+tHIVw+fJUR1MPdTgwQXTsKHRN/URihc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JgQQvbBAMdmZ0ywr8y48KbhT4pF9mxbtjsOx7H0t7dTAaBSlKOsvL7hN+n3V4N02C
 PuN6dfoTa+o8bfB1tr8Odn4GA6pkwYR9Szt/oVPr92TtguaU3sy4PdQHvh+BhRiTtQ
 Qf5Yngrj8yvjLsYvbYyFr17rn+2w+HpoY38REHwpim7P1h7T/CHqcIuxCnKSVmvpKC
 G0Ym1dqrbgxBhNcqNdwpTssqyiNDXrSQB+0RvxhQq6cIUUCWC9qN4RFBx6zRsFeapw
 NJpv4tYetCqtGtjVsn2hEYGy4HUV61QXB1STZvzgURer/KWFJdVChD5nCHyIVApXiN
 LruW5fU09k7Sw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 4/6] drm/i915/gt: Fix selftests on PREEMPT_RT
Date: Wed, 23 Sep 2026 13:15:23 +0200
Message-ID: <20260923111518.310430-12-dev@lankhorst.se>
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

The engine->busyness() callbacks called from the selftests are on PREEMPT_RT
not safe with preemption disabled, because all spinlock_t locks
becomes sleeping locks on PREEMPT_RT and must not be acquired with disabled
preemption.

This is also a problem for perf events, where we disable the busyness events
on PREEMPT_RT, as they're run from hardirq context.

Previous attempts to fix this failed, so convert the selftest code to read
engine->busyness()  with migrate_disable() instead of preempt_disable() to
prevent selftest failures on PREEMPT_RT.

By disabling migration, we prevent moving the selftests between cores,
and should decrease the jitter in both the idle cases and busy cases,
compared to no prevention at all.

Since interrupts were not disabled, some jitter may still occur, but it
should hopefully be less with migration disabled.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
index 10e556a7eac45..c1eff9edd8a5e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
@@ -277,11 +277,11 @@ static int live_engine_busy_stats(void *arg)
 		st_engine_heartbeat_disable(engine);
 
 		ENGINE_TRACE(engine, "measuring idle time\n");
-		preempt_disable();
+		migrate_disable();
 		de = intel_engine_get_busy_time(engine, &t[0]);
 		udelay(100);
 		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
-		preempt_enable();
+		migrate_enable();
 		dt = ktime_sub(t[1], t[0]);
 		if (de < 0 || de > 10) {
 			pr_err("%s: reported %lldns [%d%%] busyness while sleeping [for %lldns]\n",
@@ -316,11 +316,11 @@ static int live_engine_busy_stats(void *arg)
 		}
 
 		ENGINE_TRACE(engine, "measuring busy time\n");
-		preempt_disable();
+		migrate_disable();
 		de = intel_engine_get_busy_time(engine, &t[0]);
 		mdelay(100);
 		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
-		preempt_enable();
+		migrate_enable();
 		dt = ktime_sub(t[1], t[0]);
 		if (100 * de < 95 * dt || 95 * de > 100 * dt) {
 			pr_err("%s: reported %lldns [%d%%] busyness while spinning [for %lldns]\n",
-- 
2.55.0

