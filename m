Return-Path: <SRS0=bF38=HJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CF4C433DB
	for <intel-gfx@archiver.kernel.org>; Sun,  7 Feb 2021 15:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303A864E16
	for <intel-gfx@archiver.kernel.org>; Sun,  7 Feb 2021 15:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303A864E16
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72F06E1CD;
	Sun,  7 Feb 2021 15:16:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F19FF6E183;
 Sun,  7 Feb 2021 15:16:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E9A2AA9932;
 Sun,  7 Feb 2021 15:16:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Sun, 07 Feb 2021 15:16:40 -0000
Message-ID: <161271100092.30292.14982913728263187667@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210207150351.19482-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210207150351.19482-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/4=5D_drm/i915=3A_Move_submit?=
 =?utf-8?q?=5Frequest_to_i915=5Fsched=5Fengine?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,1/4] drm/i915: Move submit_request to i915_sched_engine
URL   : https://patchwork.freedesktop.org/series/86822/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
40ff776943d9 drm/i915: Move submit_request to i915_sched_engine
90cb79f67175 drm/i915: Move finding the current active request to the scheduler
-:246: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'heartbeat', this function's name, in a string
#246: FILE: drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:111:
+			     "heartbeat " RQ_FMT "completed\n",

-:265: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'heartbeat', this function's name, in a string
#265: FILE: drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:143:
+				     "heartbeat " RQ_FMT " pending\n",

-:275: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'heartbeat', this function's name, in a string
#275: FILE: drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:159:
+				     "bumping heartbeat " RQ_FMT " prio:%d\n",

-:283: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'heartbeat', this function's name, in a string
#283: FILE: drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:167:
+				     "heartbeat " RQ_FMT " stuck\n",

-:293: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'heartbeat', this function's name, in a string
#293: FILE: drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:201:
+	ENGINE_TRACE(engine, "heartbeat " RQ_FMT "started\n", RQ_ARG(rq));

total: 0 errors, 5 warnings, 0 checks, 579 lines checked
f89a52a6bf2f drm/i915: Show execlists queues when dumping state
-:498: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#498: FILE: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3555:
+				DIV_ROUND_CLOSEST_ULL(intel_context_get_total_runtime_ns(rq->context),

total: 0 errors, 1 warnings, 0 checks, 839 lines checked
9da368f0928b drm/i915: Wrap i915_request_use_semaphores()


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
