Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A6606A321
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlHa9Jrx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5710FBDA;
	Wed, 11 Nov 2026 13:58:39 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE8210FB59
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 13:58:32 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b335ef6441so28382827b3.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 05:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794405511; x=1795010311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jNxsiagog5cgueeDEdYr2nc2EsT8gS2dnYJ8lXM3VhQ=;
 b=NlHa9JrxiZm92gesvFAgQPCXvOBVFvo7p3fKmzdLAzAtXI7/gyrQPZYM0wpNIjIxZR
 A5nWNz6zy2e/nHgz16pH2n6Iy6FCn364c17DI2h8kVCzr8DjzRt+6xVhcdHA2ynNBQoS
 Z1Q5V3MODFT4eDS1o93bS+gomPVdaU6w57vAliRH2KXvHwBds7hU9NkNv2HoRSh5qZc+
 hPap1jSstSwL22h9mrJbfzN5Fk2hn6vSk5g8h40C2VBGXCfHsrrdEc/3+XHUxWceCzkf
 WIBH07Y8hH8pnOpHbkvRh1afQ7HMCS6uFLSTfBVuMYenvl4KQ8JdikOc9o5hjR7Uqved
 x1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794405511; x=1795010311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jNxsiagog5cgueeDEdYr2nc2EsT8gS2dnYJ8lXM3VhQ=;
 b=2rAYXsg0PShEgR6sd8x2uKKOLFSLfiE7d2YiD96i2207cw8xboInce9WcvokybhKBM
 jcVo1spFERDi+isYg3BKnA9puiXx7o0ZOwEd4XbvGxwErnAo2ij96AD0aNMHCWO+8a8y
 IbjjZ4WqSO69DLWrEZHhzrHdOEz7OBOIcY5JsYfHJ/mjmZW3Vzy3fz/r3rzKShfqqdF5
 4BGG3wNMLO/JVcpK8P4EQE7dneRHGG1U/bo0NtIU9oaNzkxM0wmIUTvE+KAK77avOpL8
 zTXJrrF8JLBuakraMJJYnomM4X/eSMNywXW3u+0x11gB1OnbWRoqbMl0HKKJcXuue89O
 qkDw==
X-Gm-Message-State: APuU4Z8NEYBjrKrDWINbSIy9Eg/72cL06/8qscFNYkxiytJn7l6WWDtP
 XcbHrCOj9yxNQiHcpzHhUSGI/v6rqLJpKyW/YHQujCAk+nO0ksbJvK3kckHxC6LX
X-Gm-Gg: AYBFou0eKBMJZDZcU0ZR4av4pDX4FpyugABmHKernfxE3KBTd6cwHOjBVbuPhnpy9zH
 3SMcCBuQFmIHvj7oCrc94kdU3qJ9GjzvxoprYUi9AzCsirY20FTfEve54kxSzVw1SE+yoh637nz
 GfbsDrdwSOVK9czIbh+GFCwo4M+XlNKw9il7fSLFqmD/xwox4B1HpaGkvQmgQXW+kIptaypjAq3
 zQFqm6a4p0Fs4xbvMTOHaxJ6ml4FTxtS9TRPwXb9H0y1eEedhFRW4oHQBYo0KcocyX6BmA4c2pw
 9ilfRoV++OQL6DZTCMpR3jCt6DBHLxouFLQ/WlYEWcrLEJoXo5ivVchMuXG5G6kdW35f5PKIkHO
 nlqmGr3cheIFFpjuIZE1G5tBzzM+gWaM+HJ6Bm/dIko/ALbgO5++zekcyrX3gYsODQuxJrhCKXU
 W37cpuLxT5rsNrQcJDsQtRfvEEQbvkvl0WKK+2HMo3cYaZV59vgs+6bkSK03gH8HE0fp7BpEySg
 Rk4NlHr0FpUUzovZphEfn/INFa7CCpCkfqMKwCfdCKRCa1KSr9MfrsLJ7EY4a0znPtbQksIR0Gn
 Ql056ZHj5wCExMBsWmgeBwUJkxWQxFIN+S61HyMsAcH4FTZW3D4AZjCPPh5T
X-Received: by 2002:a05:690c:6989:b0:8b3:3854:c29f with SMTP id
 00721157ae682-8b3a783f507mr16696867b3.0.1794405511550; 
 Wed, 11 Nov 2026 05:58:31 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39339efd0sm44619547b3.10.2026.11.11.05.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:58:30 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v2 0/2] drm/i915/guc: Fix requests of a banned context never
 completing
Date: Wed, 11 Nov 2026 13:57:24 +0000
Message-ID: <20261111135753.11071-1-javiermv@gmail.com>
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
(or exiting) context.

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
an earlier run on the stock module). With v1 of this series: 30 runs, 1
hang (the ecode of the run that leaked): no full GT reset, the client got
VK_ERROR_DEVICE_LOST instead of waiting forever, nothing stayed pinned.
Instrumented builds that also carried the additional patch above, which never
fired: 20 runs with both patches, 2 hangs of the leaking kind (same ecodes as
before), handled the same way, and the logs show no second reset; 20 runs with
patch 1 alone, 1 hang, also contained.

With v2 (same setup): 30 runs, 4 hangs, all contained the same way
(VK_ERROR_DEVICE_LOST, nothing stayed pinned). In one of them GuC failed
the engine reset and i915 reset the whole GT, which I had also seen
without the series; it ended the same way.

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

Changes in v2 (both from the Sashiko review of v1):
- Patch 1: v1 completed the submitted request again after dropping the
  lock, although the loop had already completed it, so it could have
  been retired and freed in between. v2 completes it either in the loop
  (context off the HW) or on its own (context still on the HW), both
  under the lock, and doesn't touch it after the unlock.
- Patch 2: check !intel_context_is_schedulable() instead of
  intel_context_is_banned(), since revoke takes the same path for exiting
  contexts.
- Not changed: the other two findings on patch 1 (only the last request
  completed while the context is still on the HW, and requests left with
  an enable pending) are about the on-HW path, which still completes only
  the submitted request, as it did before this series (now under the
  lock).

v1: https://lore.kernel.org/intel-gfx/20261110122534.12989-1-javiermv@gmail.com/

Patchwork CI didn't run on v1 (my address isn't on the CI allowlist). If
someone can trigger it for this version, I'd appreciate it.

Javier MV (2):
  drm/i915/guc: Complete all requests of a non-schedulable context
  drm/i915/guc: Don't unblock a non-schedulable context

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.51.1

