Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D48AC531FC
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jul 2026 14:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0810E1D0;
	Mon, 27 Jul 2026 14:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDr8sx63";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C391310E1D0
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Jul 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785163113; x=1816699113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9A0Y3Ot7z3tka7RcOxzRe7nAFOCkXhb1A0IOCRw9vwM=;
 b=dDr8sx63oUTVjr7qySdrlzN9uzblsS60G1coqldwLRLdbcxOHkvkRI3W
 MPHmtb5fVWWGFiM9VMQx6R6RJLchBEIL0RVYS7KuCdN1x7gmKoEd4sl1i
 akLJlJOPpw3bZialHIly/ZWssdW0wjcPt2RrO2VjzS1k60m5aNMk76VXU
 w6ifUQ0qgIysvQZADFIzDbOSaJGpaLr4ycXBI9GuB6ZSlgTtrTeeMTddo
 ygDmbvyNtJ5MkuP8fpF+6wksmUZ3yUdBjOZ8mrWEoqh7AmDe8PwR/yii8
 CJv22zRtxqF7hsWZD22jkuYb3p+bhZpxFaF9GXG8Bb5yl9eGdradgHCIv A==;
X-CSE-ConnectionGUID: vRuNbLuMRxmSkTWkVhCyqg==
X-CSE-MsgGUID: Gia8qRQ9RBqXg36vh1yiyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85852526"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="85852526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:38:32 -0700
X-CSE-ConnectionGUID: XDPUnJ+OTc24DoU3qF7jTA==
X-CSE-MsgGUID: GdRk26fOR0is5FYrpvRRGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="260068706"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:38:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, andi.shyti@linux.intel.com,
 jani.nikula@linux.intel.com, krzysztof.karas@intel.com
Subject: [PATCH v5] drm/i915/gt: Use poll_timeout_us in place of sliding sleep
 window
Date: Mon, 27 Jul 2026 22:38:28 +0800
Message-ID: <20260727143828.2031386-1-jonathan.cavitt@intel.com>
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

v3:
- Use atomic in ct_send (jcavitt)

v4:
- Rework ct_send reimplementation to better preserve original logic
  (Andi)
- Define 10 minutes to remove magic numbers (Krzysztof)

v5:
- Use non-atomic poll_timeout_us in ct_send (Andi)

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 33 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 90 ++++++++++++++---------
 2 files changed, 71 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 053780f562c1..2d3adfbcd163 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -7,6 +7,7 @@
 #define _INTEL_GUC_H_
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/iosys-map.h>
 #include <linux/xarray.h>
 
@@ -354,14 +355,14 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
 				 response_buf, response_buf_size, 0);
 }
 
+#define POLL_TIMEOUT_DUR	(600 * USEC_PER_SEC)
 static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 					   const u32 *action,
 					   u32 len,
 					   u32 g2h_len_dw,
 					   bool loop)
 {
-	int err;
-	unsigned int sleep_period_ms = 1;
+	int err, timedout;
 	bool not_atomic = !in_atomic() && !irqs_disabled();
 
 	/*
@@ -374,20 +375,20 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
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
+					   POLL_TIMEOUT_DUR, false);
+	else
+		timedout = poll_timeout_us_atomic(err = intel_guc_send_nb(guc, action,
+									  len, g2h_len_dw),
+						  err != -EBUSY, USEC_PER_MSEC,
+						  POLL_TIMEOUT_DUR, false);
+	return timedout ?: err;
 }
 
 /* Only call this from the interrupt handler code */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1c455d84bf9d..9f13a0c225c0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -706,37 +706,19 @@ static int ct_send_nb(struct intel_guc_ct *ct,
 	return ret;
 }
 
-static int ct_send(struct intel_guc_ct *ct,
-		   const u32 *action,
-		   u32 len,
-		   u32 *response_buf,
-		   u32 response_buf_size,
-		   u32 *status)
+static int ct_lazy_spin(struct intel_guc_ct *ct,
+			struct ct_request *request,
+			const u32 *action,
+			u32 len,
+			u32 *response_buf,
+			u32 response_buf_size,
+			u32 *status)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
-	struct ct_request request;
 	unsigned long flags;
-	unsigned int sleep_period_ms = 1;
-	bool send_again;
 	u32 fence;
 	int err;
 
-	GEM_BUG_ON(!ct->enabled);
-	GEM_BUG_ON(!len);
-	GEM_BUG_ON(len > GUC_CTB_HXG_MSG_MAX_LEN - GUC_CTB_HDR_LEN);
-	GEM_BUG_ON(!response_buf && response_buf_size);
-	might_sleep();
-
-resend:
-	send_again = false;
-
-	/*
-	 * We use a lazy spin wait loop here as we believe that if the CT
-	 * buffers are sized correctly the flow control condition should be
-	 * rare. Reserving the maximum size in the G2H credits as we don't know
-	 * how big the response is going to be.
-	 */
-retry:
 	spin_lock_irqsave(&ctb->lock, flags);
 	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN) ||
 		     !g2h_has_room(ct, GUC_CTB_HXG_MSG_MAX_LEN))) {
@@ -746,31 +728,67 @@ static int ct_send(struct intel_guc_ct *ct,
 
 		if (unlikely(ct_deadlocked(ct)))
 			return -EPIPE;
-
-		if (msleep_interruptible(sleep_period_ms))
-			return -EINTR;
-		sleep_period_ms = sleep_period_ms << 1;
-
-		goto retry;
+		return -EBUSY;
 	}
 
 	ct->stall_time = KTIME_MAX;
 
 	fence = ct_get_next_fence(ct);
-	request.fence = fence;
-	request.status = 0;
-	request.response_len = response_buf_size;
-	request.response_buf = response_buf;
+	request->fence = fence;
+	request->status = 0;
+	request->response_len = response_buf_size;
+	request->response_buf = response_buf;
 
 	spin_lock(&ct->requests.lock);
-	list_add_tail(&request.link, &ct->requests.pending);
+	list_add_tail(&request->link, &ct->requests.pending);
 	spin_unlock(&ct->requests.lock);
 
 	err = ct_write(ct, action, len, fence, 0);
 	g2h_reserve_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
 	spin_unlock_irqrestore(&ctb->lock, flags);
+	return err;
+}
 
+static int ct_send(struct intel_guc_ct *ct,
+		   const u32 *action,
+		   u32 len,
+		   u32 *response_buf,
+		   u32 response_buf_size,
+		   u32 *status)
+{
+	struct ct_request request;
+	unsigned long flags;
+	bool send_again;
+	int err, timedout;
+
+	GEM_BUG_ON(!ct->enabled);
+	GEM_BUG_ON(!len);
+	GEM_BUG_ON(len > GUC_CTB_HXG_MSG_MAX_LEN - GUC_CTB_HDR_LEN);
+	GEM_BUG_ON(!response_buf && response_buf_size);
+	might_sleep();
+
+resend:
+	send_again = false;
+
+	/*
+	 * We use a lazy spin wait loop here as we believe that if the CT
+	 * buffers are sized correctly the flow control condition should be
+	 * rare. Reserving the maximum size in the G2H credits as we don't know
+	 * how big the response is going to be.
+	 */
+	timedout = poll_timeout_us(err = ct_lazy_spin(ct, &request, action,
+						      len, response_buf,
+						      response_buf_size,
+						      status),
+				   err != -EBUSY, USEC_PER_MSEC,
+				   POLL_TIMEOUT_DUR, false);
+
+	/* This is only the case if ct is deadlocked or we time out */
+	if (ct->stall_time != KTIME_MAX)
+		return timedout ?: err;
+
+	/* Otherwise, ct_write failed and we need to clean up */
 	if (unlikely(err))
 		goto unlink;
 
-- 
2.53.0

