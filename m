Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531CC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Jan 2022 23:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED36210E138;
	Tue, 11 Jan 2022 23:37:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E410E1D2;
 Tue, 11 Jan 2022 23:37:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 17F28AADD2;
 Tue, 11 Jan 2022 23:37:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Robert Beckett" <bob.beckett@collabora.com>
Date: Tue, 11 Jan 2022 23:37:49 -0000
Message-ID: <164194426906.24979.2734208826297825349@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220111180238.1370631-1-bob.beckett@collabora.com>
In-Reply-To: <20220111180238.1370631-1-bob.beckett@collabora.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?icsrete_card_64K_page_support?=
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

Series: dicsrete card 64K page support
URL   : https://patchwork.freedesktop.org/series/98758/
State : failure

== Summary ==

Applying: drm/i915: enforce min GTT alignment for discrete cards
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_gtt.c
M	drivers/gpu/drm/i915/gt/intel_gtt.h
M	drivers/gpu/drm/i915/i915_vma.c
M	drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
Auto-merging drivers/gpu/drm/i915/i915_vma.c
Auto-merging drivers/gpu/drm/i915/gt/intel_gtt.h
Auto-merging drivers/gpu/drm/i915/gt/intel_gtt.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915: enforce min GTT alignment for discrete cards
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


