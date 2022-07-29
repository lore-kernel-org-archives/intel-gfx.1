Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E90EC00144
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jul 2022 07:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C905410E1BD;
	Fri, 29 Jul 2022 07:14:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B3B410E1BD;
 Fri, 29 Jul 2022 07:14:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 070B6AADD2;
 Fri, 29 Jul 2022 07:14:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mchehab@kernel.org>
Date: Fri, 29 Jul 2022 07:14:02 -0000
Message-ID: <165907884202.24434.8550833721800311804@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1659077372.git.mchehab@kernel.org>
In-Reply-To: <cover.1659077372.git.mchehab@kernel.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBN?=
 =?utf-8?q?ove_TLB_invalidation_code_for_its_own_file_and_document_it_=28r?=
 =?utf-8?q?ev2=29?=
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

Series: Move TLB invalidation code for its own file and document it (rev2)
URL   : https://patchwork.freedesktop.org/series/106805/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/106805/revisions/2/mbox/ not applied
Applying: drm/i915/gt: Move TLB invalidation to its own file
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gem/i915_gem_pages.c
M	drivers/gpu/drm/i915/gt/intel_gt.c
M	drivers/gpu/drm/i915/gt/intel_gt.h
M	drivers/gpu/drm/i915/i915_vma.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/i915_vma.c
Auto-merging drivers/gpu/drm/i915/gt/intel_gt.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt.h
Auto-merging drivers/gpu/drm/i915/gt/intel_gt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt.c
Auto-merging drivers/gpu/drm/i915/gem/i915_gem_pages.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pages.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/gt: Move TLB invalidation to its own file
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


