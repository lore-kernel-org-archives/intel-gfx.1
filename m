Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72437C982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 10:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107E010E044;
	Fri, 18 Sep 2026 10:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="wXC4nmRb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EWkgOhil";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2710E044
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 10:37:28 +0000 (UTC)
Date: Fri, 18 Sep 2026 12:37:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1789727847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wMnvo0TmAaP5x+2p+/Wxuc4oHhTSZfFWX74rdMQKQLg=;
 b=wXC4nmRbmP8N1H0sVcwkYaN7CLo1pDXTSwSLe7fWy31sQWUFyhuq9UFj8Br8KGx9fDfUeL
 3CpMF3uej/l6NZXTLHVPznDVTieZ7PtAoK20a1/OYsrlcKnHVvBSv/wgmvn8XFrWWE2ER6
 8jjDV2YQO+S7nPQkNNCKtI2kqI6ImrTfFfQCz0jukUsHKEmIhzNdqBT3YtCMMS9CadXDmI
 8Ix26Pj/wlSG+6s2UDwsDuEqIcwyTieB/v1VmIQOmKXkYO41nizVDKNtEzin8QbQwtN4G6
 od0c/SmsHZm9Ezbka3mBdDsCgSZQnwnN2Rqn0kzYgnkgPzr0pHVdPvvN89jgsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1789727847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wMnvo0TmAaP5x+2p+/Wxuc4oHhTSZfFWX74rdMQKQLg=;
 b=EWkgOhilDWGz2TQMZXAyQ8tt90LyA5uj9SlgM+vTyr7XUY4HPhScrnVDytoRtRNa4FKvtz
 7WDi06xZgAoTq5Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH] drm/i915: Use %p for pointer formatting
Message-ID: <20260918103725.cfYzL1Wt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Commit 2563a4524febe ("drm/i915: restrict kernel address leak in
debugfs") introduced the %pK modifier in order not to leak kernel
pointer.
Since commit ad67b74d2469d ("printk: hash addresses printed with
%p") pointers are hashed by default and the behaviour can be controller
by `hash_pointers' boot argument.
The policy on %p is to not introduce new ones. Keeping the %p allows
to assign an id to the object.
Removing %pK makes it possible to remove its handling from the library.

Use %p instead %pK to allow debugging if needed.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index a3e27f9e4f476..93ba7369ba6e2 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -179,7 +179,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 	struct i915_vma *vma;
 	int pin_count = 0;
 
-	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
+	seq_printf(m, "%p: %c%c%c %8zdKiB %02x %02x %s%s%s",
 		   &obj->base,
 		   get_tiling_flag(obj),
 		   get_global_flag(obj),
-- 
2.55.0

