Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97E606A32F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpaJ5zFJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C84610EFB1;
	Mon, 16 Nov 2026 12:01:33 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85CA10EFB1
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 12:01:27 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-67db89857abso855136d50.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794830486; x=1795435286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lvSiJtoDHgutXXcSssmEpt66tUop8imWONQV44JFPrI=;
 b=fpaJ5zFJcKUOiX1EUDxumFHJHw6pFYSERIprVcMN69zyvq7fN/Yk5V/W0JVn68eIY/
 Y45gSyy8avVInW9Zlcc3Rdrk0St1HW29O67blgutahDU3bxlf6B9fgEytBxdrzT42xoC
 7LJKrltTN5YzSHzKiRhafMsUNi2sRiT2fhvB8q5TsWIpg3gdZ4tLtm2eRmUiHApDC0+S
 SkWNzLILOIVL6lRLUdZDXT0RiNcwMQnu/WprbvnMegh6OhH5ScVz3MYHs6CPaaJPYPyE
 ePiTZU1aOX5a3t9TdSTud+9T10aLH9Civyv4/TJGFZX+h8tngvLOaLmiHPQeW6RtM14Z
 Rwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794830486; x=1795435286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lvSiJtoDHgutXXcSssmEpt66tUop8imWONQV44JFPrI=;
 b=rv+1qgFIfkfsr9BhsKwLbZPBYmGkGK+BmMRtO28eYeEdQaeVNv8Sm7UVDeEC1rrN//
 6KYJg3rzCl7WGvy/yuQf0NPzx2FuCQBJRB0OKSlHUtoEDcdkYETo/S3C6yG7+bFYRKS/
 o5yKx3hinIQLTGjoTI0XTqv1uloPgGNdXo5G60/VWIDRMTZKC+wi8V+grpA7F/hyeMN/
 W/3CALVKPsMB3yNRDcY17f9liAarXHCZPrYTJUMJQMDS9aj/X9HJ5KTz0mvh9NSWhyE7
 4mM4akP5hgrL9Ci2Fuog7Bz1RalPthN/CxXJcbhjWBh/vxrIUinO6VGuLQaMesdmH0Gu
 Ui8g==
X-Gm-Message-State: APuU4Z+ZWrpfvtHEVH14gx8lPOFDzvNtTpBwU4cWZXKF5jOSAViQ37ju
 7/7JYmFMxUerrKjWeRElFg6KPE2E1yzAbtsu4pTK4N54gN159hbSUzJo7rXEX/Xr
X-Gm-Gg: AZFdTZfQPWk+68y+OmO88HArHW06bnBtTO/197HjUejGxbgwMp346Anmlm7V9QBwVDq
 QPJKjCbc5NPXC1bxlx26j0ZsZQbnwdvpAliAJRcitz+a8PNO4PABlRFyMeXNz3xecNKG1ivcK63
 Vo8SuvmhCP2j7QoSi0BaQqktNTEkHxH1PYe2ZLsFQm9GFvqZsUJFyZfhFmE3FZ4+TczByycQx9h
 k6BedK0aLRMTdVOZ743Vl8kM86PsPUyrqkKh2KbBgdCNsTcicevGkPgd1m4+0SYllqdTLCzarTX
 5R9DResMoRvzzNcLA+Dk6RZFgy82kHqQMNaXXW5ECwibPnvfaHaV/ZpbcPSWYxVUcBdDyQNEsTN
 B8HFbU6VhW9HB7RrCy7uXmNKDGVdw3pH78x98zj8qNLpYN7PWMvrkvClKVps5dYg5/SUPO0CabK
 zoo1XoWYbt3KMCjxsqnnYJCxmtkLLWJ2ogI5dI8PwzuBvO+LbttkES8bAW8XEISc6EP6oBjxwcC
 fbY3XWx1Nu4PLrCa2K8yjRNk8wnYnU34gGn/NJF/2B62ZkRJqQNn6vPdOIEZ9zr9U40mILxHLBC
 OpssxHA94w1gXWZvHAistxLRJ0oKMEf/ZakLZQvobauDL/rLv6wfwKnOJ7Dx
X-Received: by 2002:a53:e051:0:b0:67b:f57b:e85e with SMTP id
 956f58d0204a3-67d8976abb7mr3482196d50.144.1794830486482; 
 Mon, 16 Nov 2026 04:01:26 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b4aa99f7a1sm83572997b3.29.2026.11.16.04.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 04:01:24 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v3 0/2] drm/i915/guc: Fix requests of a banned context never
 completing
Date: Mon, 16 Nov 2026 11:59:46 +0000
Message-ID: <20261116115958.9499-1-javiermv@gmail.com>
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

Tested on i5-1235U (8086:46a8), GuC 70.36.0, Ubuntu 7.0.0-42 (the touched
code is identical in mainline). Without the series: 5 hangs in 17 runs, one
leaked. With v2: 30 runs, 4 hangs, all contained (VK_ERROR_DEVICE_LOST,
nothing pinned). v3 changes only text.

I can reproduce this (a hang every 10 to 30 runs) and test other approaches.
Logs and error states are in the issue.

I have an extra patch that cancels the requests when a banned context gets
another reset notification. It never ran in my tests, so I left it out.

Written with Claude Code (Opus 5.5). I ran the tests and reviewed the patches.

v3: shorter commit messages and comments (Rodrigo), rebased on v7.4-rc3.
v2: fix a use-after-free in patch 1; patch 2 also covers exiting contexts
    (Sashiko).
v2: https://lore.kernel.org/intel-gfx/20261111135753.11071-1-javiermv@gmail.com/
v1: https://lore.kernel.org/intel-gfx/20261110122534.12989-1-javiermv@gmail.com/

Patchwork CI didn't run on v1 or v2 (my address isn't on the CI allowlist). If
someone can trigger it for this version, I'd appreciate it.

Javier MV (2):
  drm/i915/guc: Complete all requests of a non-schedulable context
  drm/i915/guc: Don't unblock a non-schedulable context

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.51.1

