Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B573606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyfic43/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E89010E0CF;
	Thu, 19 Nov 2026 14:57:55 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDD010E0CF
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:57:49 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-7cc1cf48a39so811782137.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795100268; x=1795705068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Iov938nTP52Y2R2A8lEMd4UE5Smc17qRHKZhD6YECW8=;
 b=uyfic43/XDT8+sGjOPoVK5l0uqWXFwOgND/pArW8HIdU0y1iA08q+wXeZEIQtmChaC
 yIL8UM7/XO7wB8GP0FkUz6kYPmFd82TxyF5914siesKxF8YKpprPJngmMpo8mqdAN2O1
 uhGMrWy72q2kZ0HmfuNA1X5BOv9N8+A6k5LpkFjQNZeT3MeiortYY8m4iQngWmoE84GH
 HFLCIICKshPC97MosimDYhUtGCGoxXhYSJVOquvVcgbTMk/aUg5Zgob6uTAqLcvTrYRx
 Rr3UfLlwHrwed0iVF28u1IjA+XrNZCNGa43/w1UpjeBHxtMtTW2cc9ZAVX7mABjUBXzd
 YXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795100268; x=1795705068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Iov938nTP52Y2R2A8lEMd4UE5Smc17qRHKZhD6YECW8=;
 b=IBEyJ3b2ffdivJ6gZX4ld7VG9/yg0iNQ6AHAujmd5FvGCnozwAQ2y0w7Vco6WYeeiv
 hAi1ZXNVw2NR8WzKuigza1P40WKHyLe833U1BTPe42Te1NFo6JQES8sokX4nF5yTHhOu
 AeJc7ivO7tjnYwdC6g5uY4ffBg1Jh3xHAkDB4Pd0SdDMMStzDQ+t188D7UrJY2lXZnOB
 20p95R1gDJJKdrnYYT6bYjqt4QdjTwvbOJA7KFQVrnLOoxJ+Sv6/TmaPHl8UBV27auXY
 Kw93hBDKvMite1SyZcVyCOxQLvaajJFUTxkW7x2AyfukcqRpIdjGgZwXI8Zn+c7/24y7
 zMDg==
X-Gm-Message-State: APuU4Z+XvggqIPHHO99+wcpdfryVgvAf1j6VeXel9ZdAuba/xxGipRSK
 4Teijxh+ZfZxbyDsniDRTakddcaMk/AkbeGwOne9Y/RlueSkGIrLwl1LJEnwgcI9
X-Gm-Gg: AYBFou2FrM/k8xS+BTyVEcy+wlNpyp60Tsw8Pdo0CoF/mzcPzeAWtej+bYLPg40AkQD
 NV/RUieQkMJJRweCmAs+xPVSK716h7fSdn5DrWkfZt6kYMHu2Ed4CgdaFzETKOEEpKFDDYtYzdi
 Q85PLbLoVQUAtWKgXO1O08A7E+hLsBQJt1I3MIdFRQ4qWsZEmHeteAJSsq0sRoUX+262WQOQW/4
 1lgWwp6RPs7NEoyS+OWmyW2tIQG5NzZLwGrYscVJ3mqQvKLzQIQZCkY8jc6GxL8QtDaSQIsHlm7
 ed3Ht3xaSvZ3ZhqnIVvM0jW3UhB1rk1ZM1VLnHcPdUruJvAenBaINDKLDJ9cI0yHkW6NIUh6+Op
 7TRhDteU2SmeoQa7Mvhpet6UCeEXzPqpSmROahqOUtEseB2sTlXURIEcPTOI1PEB3KSsRxFgvQx
 YOcvDoXUbqwggFtqxO1MA119vwvOz/ATthyN2HGrn2y0cRp/EJ1aIk602HhODwcHdcDwU2Nu/+R
 rj3SUE4bUjwCI8hmVcSVdCDxXmWVbApuYg85KtwLqIPOWgU+oGfaInzOeFxY6U69bi+cDvF99TO
 0zVMunm1Xyk/GegUJuEx8jKACWgZ8pzUaNqAGAUlEWcXbqePPHanLlXbUda0
X-Received: by 2002:a05:6102:508a:b0:7d6:5e38:342b with SMTP id
 ada2fe7eead31-7d6ba42f4d5mr2214189137.27.1795100268043; 
 Thu, 19 Nov 2026 06:57:48 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d6e7f3d7bcsm6083137.4.2026.11.19.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:57:47 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v4 0/2] drm/i915/guc: Fix requests of a banned context never
 completing
Date: Thu, 19 Nov 2026 14:56:53 +0000
Message-ID: <20261119145709.6735-1-javiermv@gmail.com>
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

On ADL-P with GuC submission, a GuC context reset during a request watchdog
cancellation can leave the context's requests incomplete forever: the client
hangs on its fences and, once killed, its buffers stay pinned until reboot
(7.5 GB here). Reported in
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301.

Sequence (llama.cpp Vulkan compute, request_timeout_ms=2000,
preempt_timeout_ms=7500):
 1. The watchdog blocks the context to cancel a request.
 2. GuC can't preempt the compute work and resets the context. i915 bans it
    and unwinds its requests.
 3. The late schedule disable done clears SCHED_STATE_BANNED, and unblock
    re-enables the banned context.
 4. GuC resets it again at the first preemption. That reset is ignored, and
    after a full GT reset the dequeue completes only the last of its merged
    requests.

Patch 1 completes all of them once the context is off the HW. Patch 2 stops
unblock from re-enabling a non-schedulable context.

Tested on i5-1235U (8086:46a8), GuC 70.36.0, Ubuntu 7.0.0-42 and -43 (the
touched code is identical in mainline). Without the series: 5 hangs in 17
runs, one leaked. With v2: 30 runs, 4 hangs, all contained
(VK_ERROR_DEVICE_LOST, nothing pinned). With v4: 30 runs, no regressions,
but no hang reproduced.

I can reproduce this (a hang every 10 to 30 runs) and test other approaches.
Logs and error states are in the issue.

I have an extra patch that cancels the requests when a banned context gets
another reset notification. It never ran in my tests, so I left it out.

Written with Claude Code (Opus 5.5). I ran the tests and reviewed the patches.

v4: patch 1 uses the off-HW test of guc_context_revoke() and leaves the
    other cases to the schedule disable done handler (Sashiko).
v3: shorter commit messages and comments (Rodrigo), rebased on v7.4-rc3.
v2: fix a use-after-free in patch 1; patch 2 also covers exiting contexts
    (Sashiko).
v3: https://lore.kernel.org/intel-gfx/20261116115958.9499-1-javiermv@gmail.com/
v2: https://lore.kernel.org/intel-gfx/20261111135753.11071-1-javiermv@gmail.com/
v1: https://lore.kernel.org/intel-gfx/20261110122534.12989-1-javiermv@gmail.com/

Patchwork CI didn't run on v1 to v3 (my address isn't on the CI allowlist). If
someone can trigger it for this version, I'd appreciate it.

Javier MV (2):
  drm/i915/guc: Complete all requests of a non-schedulable context
  drm/i915/guc: Don't unblock a non-schedulable context

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.51.1

