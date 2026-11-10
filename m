Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF9D606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQ2NQ2Bf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DC110F64E;
	Tue, 10 Nov 2026 12:27:51 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7D710F64E
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:27:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-8b309147589so20797257b3.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 04:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794313664; x=1794918464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3ixdFvUfIg90lvMmM7M6eUC+tu9hRfgkXmJsKL6PGT8=;
 b=IQ2NQ2BfuGgqxyqVAxn0UFTnDRQOf0cjWOOariJtzv09agBHfnmAkooJnwmUUFlWNY
 y8QAZtHQ/J7y6UPJEdQB9PabZjYO2U9CBAvHLlmYLUopd5VLj2VAlboW5+m5iEcO9Not
 aSXVs79DOTsG3cVo0j+LFHr/Jt6ZnSExPNkEKT+QgJGlOsHjLr2pltYr8HOURumoPZjl
 CHsx14cCvFpwM1NgcDn4YKzEuuye7HGCZGc0ySs4xY+c2ZrwdbQkrRTv/WAWV6iLcnUO
 KRnsopC76atT63C5+pU7y1A8EbFaq+WZ4RXWNs+oxotUlgk22w801TnTQu/3yTNCzgN2
 Rs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794313664; x=1794918464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3ixdFvUfIg90lvMmM7M6eUC+tu9hRfgkXmJsKL6PGT8=;
 b=NzkBV0cK5ekiupBvxXTm2nAKwpXah3sAu+sywbAnKs+5VXCW8vFT3OnbgakKJEEDum
 HAinjpFKRiOKTKvL/A6TSmvGkwS1dLpB9WxL1gYqnLs7HM8CUnROskRXjnz9hYR8KsnR
 Rc6RAIFfwaz0/Q8v2SVvbTwP+tZorRsUm7mlLNu1w83DB6yRG4SlnsehkUbmDndQzZvQ
 Feok1ObwShHdtXY6AnT8iIDGoFRKRidrNUspnPVsbk5Kk/BmqfRZo57NYdvI0EpmWrHD
 3Udtfv9HNR5l7uQBv85ASvqZEBAwZdsPWtMpFPNYSOnlS8K+nhYO1uzLYQGRcpaGhs4S
 nNXg==
X-Gm-Message-State: APuU4Z9RdXsKcOApYDvlhGC51Z9Bp3VB230UoNL6N3LzO1UnZkQXH8he
 ccxU0kZsilLJbuFv2TBd03vLnM07UWYqGs8y7tb7CyoyH8kLvQHVwwGKWTJDI1pT
X-Gm-Gg: AYBFou1dC0/M2uqS5cP4575XLzd0lNyVHas6UP4zpdLFYIGxqdrpHD01dEkJo5MT3gi
 yobTdJylSmWhm1qk0d6HWhrP7667aIPigXo3eOoMuTLNnQ3tDUy8AaVGd8i4Rkt7dkioTZv6NEE
 9paiEIwN7rsp3V8oLZzT1TZl6Q0M/W6vjW2oQcU0ncUsbW/9H2gufW4olUNHr36CMGnuADhkhAf
 xUL7qmnQVjG1m9aZ3+XMH3QaCbgazFVmD7a5cBOpUEm5qePfdA51nkhtj+Ps9OnIFKE4/D5kAiO
 7DDdCZ0cvUzW22Z9hnQsVox525tp1PX7ke86Wz9p119teYkP9ty9XITKEgZx/Bj4eTSLrCSrQ46
 QSHFbaFP/WNHpCp6FoWalsR0yX1Rp7XRpbCvzDx5DQ/+F2YpZ/y91Jf1NfpZeR8Nc8b4JSfvJvr
 KPRZ7m+y7X6kWPecYohxvXT5o9FmkvMMvC23fnN4qwY7SFhfC23cZjdZwXl4edX7ZMtQeQ2MKJt
 SlRhTcANuPQAv2DthGkJb14FtlVbzVofVHqpxpIbhZ4mOl94+ZyUJZOsDRoWksrIYtjqOT5q9nH
 xhaJEN4IajQbkzFpCwRhCT3r7lddP0FL6B8gSIFmyf4QMTZ2mrdMLcXdzqhs
X-Received: by 2002:a05:690c:e153:b0:8b0:e55b:9b71 with SMTP id
 00721157ae682-8b392893b75mr12193607b3.8.1794313663572; 
 Tue, 10 Nov 2026 04:27:43 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b393421a3esm17859727b3.32.2026.11.10.04.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:27:42 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH 0/2] drm/i915/guc: Fix requests of a banned context never
 completing
Date: Tue, 10 Nov 2026 12:24:46 +0000
Message-ID: <20261110122534.12989-1-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Javier MV <javiermv@duck.com>

On ADL-P with GuC submission, a GuC context reset of a context whose requests
are being cancelled by the request watchdog can leave that context's requests
incomplete forever. The client waits on their fences forever, and if it is
killed its buffers stay pinned until reboot (here 7.5 GB of Shmem/Unevictable,
with the process gone from DRM clients).
Reported in https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301.

The sequence, from instrumented runs (a llama.cpp Vulkan compute job,
request_timeout_ms=2000 via debugfs, preempt_timeout_ms=7500):

 1. The watchdog cancels a request: guc_context_cancel_request() blocks the
    context (schedule disable) to skip it.
 2. GuC can't preempt the compute work (no mid-thread preemption on Gen12) and
    resets the context instead. The reset handler captures, bans (revoke finds
    the disable pending, so it only sets a 1 ms preemption timeout) and replays,
    which unwinds the incomplete requests back to the scheduler queue.
 3. The late schedule disable done G2H clears SCHED_STATE_BANNED and cancels
    nothing (the list is already empty), then guc_context_unblock() enables
    scheduling of the banned context.
 4. Either the resubmitted requests run as NOPs and everything retires
    (harmless), or GuC resets the context again at the first preemption (1 ms
    timeout). That second notification is ignored for a banned context, so its
    submitted requests never complete. In one run this was followed by G2H
    action 0x6000 rejected with -EOPNOTSUPP, a stopped rcs0 heartbeat and a
    full GT reset; after it the context was no longer registered, and the
    dequeue only marks the last of a banned context's merged requests
    complete, so the other 9 never completed.

Patch 1 completes all requests of a non-schedulable context on resubmission
(once it is off the HW), and patch 2 stops unblock from re-enabling a banned
context.

A reset notification for an already banned context is still ignored. I didn't
see one with this series, so it doesn't change that, but if one can still
happen some other way, that context's requests could stay incomplete. I have
an additional patch for that case, which cancels the requests on such a
notification. It has never run in my tests because I couldn't reach that path
with these patches applied, so I left it out, but I can send it if you want it.

Tested on i5-1235U (ADL-P GT2, 8086:46a8), GuC 70.36.0, on top of Ubuntu's
7.0.0-42 (mainline 7.0.14; the touched code is identical in mainline as of
2026-10-29). Without the series: 5 hangs in 17 runs with the setup above
(some with other GPU or CPU load), one of them leaked as described (as did
an earlier run on the stock module). With this series: 30 runs, 1 hang (the
ecode of the run that leaked): no full GT reset, the client got
VK_ERROR_DEVICE_LOST instead of waiting forever, nothing stayed pinned.
Instrumented builds that also carried the additional patch above, which never
fired: 20 runs with both patches, 2 hangs of the leaking kind (same ecodes as
before), handled the same way, and the logs show no second reset; 20 runs with
patch 1 alone, 1 hang, also contained.

I can reproduce this here, though a hang takes 10 to 30 runs. If it helps, I
can send the full log of a hang from the instrumented build, attach error
states, or test a different approach if you'd rather fix it another way.

Tool disclosure: I did this work with Claude Code (Opus 5.5), over several
sessions. I reported the symptoms, ran it on my machine and decided what to
pursue. The assistant read the i915 sources and the logs, wrote the debug
instrumentation and test scripts, worked out the sequence above, and wrote both
patches, their changelogs and most of this letter. The logs and results quoted
here come from runs on my machine. I have checked the sequence and the patches
against the code and can answer for them.

Javier MV (2):
  drm/i915/guc: Complete all requests of a non-schedulable context
  drm/i915/guc: Don't unblock a banned context

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.51.1

