Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C2AC43458
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Jun 2026 21:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C8D10E102;
	Mon, 29 Jun 2026 21:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Agw+RTl2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7505F10E102
 for <intel-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 21:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782768235; x=1814304235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cgwgHi3qZy4DMJFwU3G1yv6kaKfS1JK2N4fqG86QAA4=;
 b=Agw+RTl294mJeZv8ualrLwa4qE+WVcg0LhihXqTZxDH67+DENTqdxraj
 OI3SuggIl2RpqcIozzbDUuH+9UW3j+tcX+piWkhltLgQP4xDWpAwmur3B
 uqStpt/qQ/4x9xPoaqB9QkmrUgOzlIP7w7STWnnfdYLx+sxcJyo+RVSwv
 tmfk/es6bUY0HZelbKhx1naPpG6TVXJVsz9fSPPsxj4/T9Bvzk787iA5q
 tYQwdwOzzM3HDiXEf4vXij/cl5v2OvlctR5rZHf2SmiZRuwUuvlDFklcv
 xDqB5YVGA55SoMp/9xakuz/177oL27Ge3ateeQCT9nLOC0v8ZOBesKUgM g==;
X-CSE-ConnectionGUID: wDx7zuEZQBKTEAZuIXaoUg==
X-CSE-MsgGUID: lE9buiTSQw6PPYEQODEhLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83560114"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="83560114"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 14:23:55 -0700
X-CSE-ConnectionGUID: qDbcNj2bRievnJB2X1d59Q==
X-CSE-MsgGUID: XBtt05F1S+uLYcv9WM9D3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="248094990"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 14:23:53 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, jani.nikula@linux.intel.com,
 andi.shyti@intel.com
Subject: [PATCH v2] drm/i915/gt: Use poll_timeout_us in place of sliding sleep
 window
Date: Tue, 30 Jun 2026 05:23:50 +0800
Message-ID: <20260629212350.1391425-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

The functions intel_guc_send_busy_loop and ct_send can theoretically
loop forever.  In the former case, intel_guc_send_busy_loop can iterate
forever if intel_guc_send_nb repeatedly returns -EBUSY.  In the latter
case, ct_send can loop forever if the guc-to-host or host-to-guc buffers
get stuck in a full state.

Rework the functions to use the poll_timeout_us family of functions
instead of calculating sleep_period_ms repeatedly.  In both cases now,
if the loop condition is not met after 10 minutes, the function will
report it as a failure.

This also resolves a static analysis issue involving sleep_period_ms
overflowing after several shift-left-logical calls.

v2:
- Reduce default sleep/udelay duration (jcavitt)

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 32 +++++++++++------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 19 +++++---------
 2 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 053780f562c1..13be4f7e7ab7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -7,6 +7,7 @@
 #define _INTEL_GUC_H_
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/iosys-map.h>
 #include <linux/xarray.h>
 
@@ -360,8 +361,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 					   u32 g2h_len_dw,
 					   bool loop)
 {
-	int err;
-	unsigned int sleep_period_ms = 1;
+	int err, timedout;
 	bool not_atomic = !in_atomic() && !irqs_disabled();
 
 	/*
@@ -374,20 +374,20 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 	/* No sleeping with spin locks, just busy loop */
 	might_sleep_if(loop && not_atomic);
 
-retry:
-	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
-	if (unlikely(err == -EBUSY && loop)) {
-		if (likely(not_atomic)) {
-			if (msleep_interruptible(sleep_period_ms))
-				return -EINTR;
-			sleep_period_ms = sleep_period_ms << 1;
-		} else {
-			cpu_relax();
-		}
-		goto retry;
-	}
-
-	return err;
+	if (!loop)
+		return intel_guc_send_nb(guc, action, len, g2h_len_dw);
+
+	if (not_atomic)
+		timedout = poll_timeout_us(err = intel_guc_send_nb(guc, action,
+								   len, g2h_len_dw),
+					   err != -EBUSY, USEC_PER_MSEC,
+					   600 * USEC_PER_SEC, false);
+	else
+		timedout = poll_timeout_us_atomic(err = intel_guc_send_nb(guc, action,
+									  len, g2h_len_dw),
+						  err != -EBUSY, USEC_PER_MSEC,
+						  600 * USEC_PER_SEC, false);
+	return timedout ?: err;
 }
 
 /* Only call this from the interrupt handler code */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1c455d84bf9d..965239c4b3c8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -716,7 +716,6 @@ static int ct_send(struct intel_guc_ct *ct,
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct ct_request request;
 	unsigned long flags;
-	unsigned int sleep_period_ms = 1;
 	bool send_again;
 	u32 fence;
 	int err;
@@ -736,22 +735,18 @@ static int ct_send(struct intel_guc_ct *ct,
 	 * rare. Reserving the maximum size in the G2H credits as we don't know
 	 * how big the response is going to be.
 	 */
-retry:
 	spin_lock_irqsave(&ctb->lock, flags);
-	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN) ||
-		     !g2h_has_room(ct, GUC_CTB_HXG_MSG_MAX_LEN))) {
+	err = poll_timeout_us(err = 0,
+			      !h2g_has_room(ct, len + GUC_CTB_HDR_LEN) ||
+			      !g2h_has_room(ct, GUC_CTB_HXG_MSG_MAX_LEN),
+			      USEC_PER_MSEC, 600 * USEC_PER_SEC, false);
+
+	if (err) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ctb->lock, flags);
 
-		if (unlikely(ct_deadlocked(ct)))
-			return -EPIPE;
-
-		if (msleep_interruptible(sleep_period_ms))
-			return -EINTR;
-		sleep_period_ms = sleep_period_ms << 1;
-
-		goto retry;
+		return unlikely(ct_deadlocked(ct)) ? -EPIPE : err;
 	}
 
 	ct->stall_time = KTIME_MAX;
-- 
2.53.0

