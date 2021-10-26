Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D22CC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 11:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA50060C4B
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 11:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA50060C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2F86E591;
	Tue, 26 Oct 2021 11:41:10 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE366E51C;
 Tue, 26 Oct 2021 11:41:08 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZdup3Ji8kBPGkW4RTEx9y7VueR9SxIvsPT7p9xwNuY=;
 b=kWXJEEABd63YMQRTEdZn9rxlDREQnomUdn75nKlOluEGF3QoMs9lKTc7/96i7wTj/2QA5Q
 KA0FjN+g+eESfK0G4+dWSw8GK94uICZGjvYSGMXOgyMjubIY3pSPMVHTEuUW5j0gesnxOU
 LFqvISgc6E9o+Yp6L1sZeO2wj3IRuavnwGOYdM8kb1kxaklrbFkYIJtJq2Kh/FPH245rTy
 ldQT3CEoOuCL8/+1s4fU4mCMI72CTK9UY1gFUvbjzimYaOn+iiGhwbQ3OLYA8HfIeFCYq9
 VAsbiwVTQYFFgpgO6IfGoaE71/kUIGGFFx2U6IyyORaYwuctbys8T6vfnlBjLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZdup3Ji8kBPGkW4RTEx9y7VueR9SxIvsPT7p9xwNuY=;
 b=CceJB0gqJM1PtHm1ogbWxKBoFyCM5MZaIwHglwwQ6FiFn+mXb06wWONzGqCi3dAjgDlTlA
 POdcBrwwB0XwDzBQ==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Tue, 26 Oct 2021 13:40:56 +0200
Message-Id: <20211026114100.2593433-6-bigeasy@linutronix.de>
In-Reply-To: <20211026114100.2593433-1-bigeasy@linutronix.de>
References: <20211026114100.2593433-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [Intel-gfx] [PATCH 5/9] drm/i915: Use preempt_disable/enable_rt()
 where recommended
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

From: Mike Galbraith <umgwanakikbuti@gmail.com>

Mario Kleiner suggest in commit
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into =
kms driver.")

a spots where preemption should be disabled on PREEMPT_RT. The
difference is that on PREEMPT_RT the intel_uncore::lock disables neither
preemption nor interrupts and so region remains preemptible.

The area covers only register reads and writes. The part that worries me
is:
- __intel_get_crtc_scanline() the worst case is 100us if no match is
  found.

- intel_crtc_scanlines_since_frame_timestamp() not sure how long this
  may take in the worst case.

It was in the RT queue for a while and nobody complained.
Disable preemption on PREEPMPT_RT during timestamping.

[bigeasy: patch description.]

Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_irq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_ir=
q.c
index 77680bca46eec..be8faaaa60226 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -916,7 +916,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,
 	 */
 	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
-	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_disable();
=20
 	/* Get optional system timestamp before query. */
 	if (stime)
@@ -980,7 +981,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,
 	if (etime)
 		*etime =3D ktime_get();
=20
-	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_enable();
=20
 	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
=20
--=20
2.33.1

