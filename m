Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E68CC98307
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 11:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A545210EFD4;
	Wed, 23 Sep 2026 11:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="dcE9O69A";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED410EFC4
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790162118;
 bh=iPnhUUQMC5RfkTRkfwXH/eSqdKK9YR3Hd0apy63Sk34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dcE9O69ALkR+NE8Nrp7u4QPwt0SmEqw0ooyXQRJ/WHl8vI85JOedgFWZLzcoeu9vv
 yHh9TxPxzpXpCu8X0fcDkUYLMa2gEt9QpyQXArcv9M7GVEi+2r34FYJwcMaHYCZ8E8
 TlhRP+Ea7jNtdrsaw4sVVhftj3BkHw1/pquI5NcuAIwHbvB5WcsVZESCBS6DfFUkQ2
 1dcb/O0CmIsda6WzfpKSOHdiuRuloAbN18fGH5ksMQbZvN2UahFdmhU7hf2TpX3XB/
 sSkpirf2D5JbIWEUzc36VVdpsKKWLlUJsE5wpFEg5iSrqdEBceVrtczrckjrqAhQqn
 XtLyxZyzyTSUg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 6/6] drm/i915: Use sleeping selftests for igt_atomic on
 PREEMPT_RT
Date: Wed, 23 Sep 2026 13:15:25 +0200
Message-ID: <20260923111518.310430-14-dev@lankhorst.se>
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

This makes the i915 selftests slightly happier, especially
related to GPU reset.

All of the i915 code that used to run in BH's, IRQ's, etc is
converted to preemptible code when compiled with PREEMPT_RT,
so adding coverage for those situations would require

This is a better approach than trying to convert all locks
in i915 from spinlock_t to to raw_spinlock_t just to increase
test coverage for situations that no longer happen.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/selftests/igt_atomic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/igt_atomic.c b/drivers/gpu/drm/i915/selftests/igt_atomic.c
index fb506b6990956..8ae39cf570b76 100644
--- a/drivers/gpu/drm/i915/selftests/igt_atomic.c
+++ b/drivers/gpu/drm/i915/selftests/igt_atomic.c
@@ -39,7 +39,14 @@ static void __hardirq_end(void)
 	local_irq_enable();
 }
 
+static void __maybe_unused __nop(void)
+{}
+
 const struct igt_atomic_section igt_atomic_phases[] = {
+#if IS_ENABLED(CONFIG_PREEMPT_RT)
+	{ "sleeping", __nop, __nop },
+	{ },
+#endif
 	{ "preempt", __preempt_begin, __preempt_end },
 	{ "softirq", __softirq_begin, __softirq_end },
 	{ "hardirq", __hardirq_begin, __hardirq_end },
-- 
2.55.0

