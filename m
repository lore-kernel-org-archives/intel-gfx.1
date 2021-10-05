Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E52C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 23:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D740760EE4
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 23:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D740760EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8176E486;
	Tue,  5 Oct 2021 23:48:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DE486E486;
 Tue,  5 Oct 2021 23:48:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 75D4FA47EB;
 Tue,  5 Oct 2021 23:48:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 05 Oct 2021 23:48:23 -0000
Message-ID: <163347770345.19281.6545698716785962332@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBD?=
 =?utf-8?q?PU_+_GPU_synchronised_priority_scheduling_=28rev4=29?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: CPU + GPU synchronised priority scheduling (rev4)
URL   : https://patchwork.freedesktop.org/series/95294/
State : failure

== Summary ==

Applying: effective and consolidated user experience. In other words why user would not be
error: drivers/gpu/drm/i915/i915_drm_client.c: already exists in index
error: drivers/gpu/drm/i915/i915_drm_client.h: already exists in index
error: patch failed: drivers/gpu/drm/i915/gem/i915_gem_context.c:956
error: drivers/gpu/drm/i915/gem/i915_gem_context.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gem/i915_gem_context_types.h:277
error: drivers/gpu/drm/i915/gem/i915_gem_context_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gem/i915_gem_context.c:1169
error: drivers/gpu/drm/i915/gem/i915_gem_context.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_drm_client.c:38
error: drivers/gpu/drm/i915/i915_drm_client.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_drm_client.h:7
error: drivers/gpu/drm/i915/i915_drm_client.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gem/i915_gem_context.c:1932
error: drivers/gpu/drm/i915/gem/i915_gem_context.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_drm_client.c:18
error: drivers/gpu/drm/i915/i915_drm_client.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_drm_client.h:6
error: drivers/gpu/drm/i915/i915_drm_client.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3216
error: drivers/gpu/drm/i915/gt/intel_execlists_submission.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2414
error: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_scheduler.c:255
error: drivers/gpu/drm/i915/i915_scheduler.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_scheduler_types.h:177
error: drivers/gpu/drm/i915/i915_scheduler_types.h: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/Makefile
M	drivers/gpu/drm/i915/gem/i915_gem_context.c
M	drivers/gpu/drm/i915/gem/i915_gem_context_types.h
M	drivers/gpu/drm/i915/gt/intel_execlists_submission.c
M	drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
A	drivers/gpu/drm/i915/i915_drm_client.c
A	drivers/gpu/drm/i915/i915_drm_client.h
M	drivers/gpu/drm/i915/i915_drv.c
M	drivers/gpu/drm/i915/i915_drv.h
M	drivers/gpu/drm/i915/i915_scheduler.c
M	drivers/gpu/drm/i915/i915_scheduler_types.h
Patch failed at 0001 effective and consolidated user experience. In other words why user would not be
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


