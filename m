Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FCBC433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 17:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C5464E22
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 17:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43C5464E22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49E96EB70;
	Wed,  3 Feb 2021 17:59:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21DEF6E170;
 Wed,  3 Feb 2021 17:59:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1C8B0A00E6;
 Wed,  3 Feb 2021 17:59:04 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Wed, 03 Feb 2021 17:59:04 -0000
Message-ID: <161237514411.944.1110251569603964625@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210203165259.13087-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210203165259.13087-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/9=5D_drm/i915=3A_Replace_eng?=
 =?utf-8?q?ine-=3Eschedule=28=29_with_a_known_request_operation?=
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

Series: series starting with [CI,1/9] drm/i915: Replace engine->schedule() with a known request operation
URL   : https://patchwork.freedesktop.org/series/86656/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
836be19c8de4 drm/i915: Replace engine->schedule() with a known request operation
824205f4b7aa drm/i915: Restructure priority inheritance
2bbb0cc1ed69 drm/i915/selftests: Measure set-priority duration
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

-:429: WARNING:LINE_SPACING: Missing a blank line after declarations
#429: FILE: drivers/gpu/drm/i915/selftests/i915_scheduler.c:372:
+	struct igt_spinner spin;
+	I915_RND_STATE(prng);

total: 0 errors, 2 warnings, 0 checks, 696 lines checked
1bd66264e7da drm/i915/selftests: Exercise priority inheritance around an engine loop
c331ce2d4c12 drm/i915: Improve DFS for priority inheritance
dead54ac8a5b drm/i915: Extract request submission from execlists
25304ee6db0c drm/i915: Extract request rewinding from execlists
4eb8f45a1e09 drm/i915: Extract request suspension from the execlists
11ba2d6eeb89 drm/i915: Extract the ability to defer and rerun a request later


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
