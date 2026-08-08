Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE2C5B56D
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2026 13:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968E210E859;
	Mon, 10 Aug 2026 13:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QdUlo0qR";
	dkim-atps=neutral
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA9210E052
 for <intel-gfx@lists.freedesktop.org>; Sat,  8 Aug 2026 18:43:41 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-51c2a76536bso6215841cf.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 08 Aug 2026 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786214620; x=1786819420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IcA2oqrVgPRK/4M6/qUH3MmuJSmZ2LO0m1bFg3C3ijo=;
 b=QdUlo0qRRjYExcq7d3eWWXoUPeexTsY/Y91VXAIZYTB27lL7sOuRRiTY/NviUI9r0t
 Lvpz6bioWPTyIHHbQp4dRAXdKlMVnKLx+gg6xQ/Eg/a7AjB2Qb1qNHBw6yANVQNQZnmn
 jdlMzGKcDw7EWwUV6uyI6nY4OsnPb3T2WnhauZIOL/he6fkPm5t0gBBU8XYrn+EN4kvG
 NhZ1tHqC/JqeKdv6eWQYDcx11hKi8CD7COP1pmBImdvFsH4BpzNzQWTE8uGF5YfhsTYW
 mXKRCqz27ML0s1QyBNf9P6PmlivQ0p6yK4FxYnqMqQc6hl8js4J9hXmuoRDfKiYe9r2N
 vxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786214620; x=1786819420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IcA2oqrVgPRK/4M6/qUH3MmuJSmZ2LO0m1bFg3C3ijo=;
 b=QIKyKWGX5q3WFlpjTZ2Viu92tfOkX4bsOr8a/DPH6kG6BYsgNYFBef278ESc1Tcrfs
 DcRmGDmMRYAc51F7+DBvdCxI9Mzpjl7DfTXdlLMBpL69iFQcNsHNuVw7XSiRV7UNrwtn
 tFAzu53rxO38FkA3Lgr030hxIPMRsd1XUC4RQlZw1eLI9iRp16sSfu1YruLA6YsJs/jb
 TkqG3USWUAdH+0ETkvpmfiCyt34uREscPXs8gKacJYnnJEBqvZwB6/cgap5ApOwwFMHZ
 ikmNyyPJiuTBKyHON5E4W8GzcC0a66m1EM+gM4pOaw37zmFROIwJXGApsvdx+SAlzzJ0
 t1xw==
X-Gm-Message-State: AOJu0YxvB/Sffgsh3jBvN5pTWeZq6C6X5K+3ie0Q5R09bvwp8Hj4uDI2
 NJpHaEH16+/cSvJMDq6CPwjNS5ZvVG1m6/dhmuVoAkVABUCoOEr11vRGDpWiDMeQ
X-Gm-Gg: AR+sD137VJQTopsUTTDt2NWC7ByQ50+07u1ZgZ0sW0tQ+RVCXxq/McisHAkM8U1/1eF
 XIAoPRlUAzZ3kn5eW3KigJ9XOY2Nw4dxFdETA0ff4XpxHHtQ/e58dzJkEGBddDccQ9Zh3eE0/28
 SkRAq3nvMGQvwjYfdpjpmV6pqN1XJnUjDfnXBSBuutxr8kW1Bk4986kUYi9ThOzWhac669P2vJp
 C+DnOGzoMfW73NQiwQ7JfSp18bJUXb5pfUxkrDJUkAY8xkFPBGXkxuRvTIe50awCww5t38vgjEA
 feEMCNfipYUTdSqpKhBVLrAqjGGW+Rh4ScQrufwK6LdqqrcGFS7aDEPBqpBCPngsSHopzIvuL9j
 no4BRn3oGxmF/M67NoNWq8SSr8x99BRgZ4ZhwmbJXkHpdoMmAf5oDFCpoyd0it6cQ2v4OzOUvMS
 yorvnbd95YteBFFy+LP1OKJfRWhRyoeRfzFkq+JVi6QrLvrmny989iUYIkuAmCJa5oKUBLtvqLq
 wvGxv5hRtfE9Inazg==
X-Received: by 2002:ac8:5842:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-52d2095c085mr103116771cf.13.1786214620580; 
 Sat, 08 Aug 2026 11:43:40 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d1663e9e1sm38128721cf.30.2026.08.08.11.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 11:43:40 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Fix request use-after-free in heartbeat()
Date: Sat,  8 Aug 2026 14:43:02 -0400
Message-ID: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Aug 2026 13:14:57 +0000
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

heartbeat() detaches engine->heartbeat.systole with xchg() before
checking whether the request has completed. If the request is complete,
dropping the detached systole reference may free it. Concurrently,
idle_pulse() can observe the empty slot and publish a newer request.

The worker then sees a non-NULL engine->heartbeat.systole, but continues
to dereference its stale local rq. The newer request can therefore make
the shared-slot check succeed after the old request has been freed,
causing use-after-free accesses to emitted_jiffies, submit, and sched.

If the detached request is incomplete, heartbeat() can also overwrite a
newer request published by idle_pulse() when it unconditionally restores
the old pointer.

Use cmpxchg() both when idle_pulse() publishes a request and when
heartbeat() restores the detached request. Drop the detached reference
when restoration loses the race, and reload rq from the shared slot
before dereferencing it.

A KASAN-enabled i915 mock selftest reproduces the use-after-free before
this change and completes without a report after the fix.

Fixes: bf9bd6a5128a ("drm/i915/gt: Track the most recent pulse for the heartbeat")
Cc: stable@vger.kernel.org # v5.11+
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 6424ecce8bcb..fc6c53c93cf5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -81,10 +81,18 @@ heartbeat_create(struct intel_context *ce, gfp_t gfp)
 
 static void idle_pulse(struct intel_engine_cs *engine, struct i915_request *rq)
 {
+	struct i915_request *systole;
+
 	engine->wakeref_serial = READ_ONCE(engine->serial) + 1;
 	i915_request_add_active_barriers(rq);
-	if (!engine->heartbeat.systole && intel_engine_has_heartbeat(engine))
-		engine->heartbeat.systole = i915_request_get(rq);
+	if (READ_ONCE(engine->heartbeat.systole) ||
+	    !intel_engine_has_heartbeat(engine))
+		return;
+
+	systole = i915_request_get(rq);
+	/* The worker may have restored its detached systole in the meantime. */
+	if (cmpxchg(&engine->heartbeat.systole, NULL, systole))
+		i915_request_put(systole);
 }
 
 static void heartbeat_commit(struct i915_request *rq,
@@ -152,9 +160,11 @@ static void heartbeat(struct work_struct *wrk)
 	if (rq) {
 		if (i915_request_completed(rq))
 			i915_request_put(rq);
-		else
-			engine->heartbeat.systole = rq;
+		/* Keep a newer pulse that raced with the detached systole. */
+		else if (cmpxchg(&engine->heartbeat.systole, NULL, rq))
+			i915_request_put(rq);
 	}
+	rq = READ_ONCE(engine->heartbeat.systole);
 
 	if (!intel_engine_pm_get_if_awake(engine))
 		return;
@@ -163,11 +173,11 @@ static void heartbeat(struct work_struct *wrk)
 		goto out;
 
 	if (i915_sched_engine_disabled(engine->sched_engine)) {
-		reset_engine(engine, engine->heartbeat.systole);
+		reset_engine(engine, rq);
 		goto out;
 	}
 
-	if (engine->heartbeat.systole) {
+	if (rq) {
 		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
 
 		/* Safeguard against too-fast worker invocations */

base-commit: a59f57e2aa127c5354168d2ec4bac920df1be4f4
-- 
2.43.0

