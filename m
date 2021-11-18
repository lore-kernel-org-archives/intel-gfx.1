Return-Path: <SRS0=1k+4=QF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CF2C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 17:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D75613A3
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 17:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32D75613A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ABF6E980;
	Thu, 18 Nov 2021 17:14:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72BCA6E94A;
 Thu, 18 Nov 2021 17:14:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6B8CFA47E1;
 Thu, 18 Nov 2021 17:14:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Date: Thu, 18 Nov 2021 17:14:56 -0000
Message-ID: <163725569640.10079.13418673756945438300@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211118165914.pckik75emivsilek@linutronix.de>
In-Reply-To: <20211118165914.pckik75emivsilek@linutronix.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Don=27t_disable_interrupts_and_pretend_a_lock_a?=
 =?utf-8?q?s_been_acquired_in_=5F=5Ftimeline=5Fmark=5Flock=28=29=2E?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Don't disable interrupts and pretend a lock as been acquired in __timeline_mark_lock().
URL   : https://patchwork.freedesktop.org/series/97082/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
0120a13c3885 drm/i915: Don't disable interrupts and pretend a lock as been acquired in __timeline_mark_lock().
-:8: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#8: 
   d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")

-:8: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit d67739268cf0 ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")'
#8: 
   d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")

-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 6c69a45445af ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")'
#9: 
   6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")

-:136: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#136: FILE: drivers/gpu/drm/i915/i915_request.h:650:
+					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||

total: 2 errors, 2 warnings, 0 checks, 87 lines checked


