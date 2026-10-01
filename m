Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95C0CA5FCB
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F54710E05D;
	Thu,  1 Oct 2026 11:44:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554810E05D;
 Thu,  1 Oct 2026 11:44:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/selftests=3A_Mod?=
 =?utf-8?q?ernize_printing_in_i915_selftests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 01 Oct 2026 11:44:01 -0000
Message-ID: <179085504114.228359.15935590332195390156@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001074100.2694888-1-krzysztof.karas@intel.com>
In-Reply-To: <20261001074100.2694888-1-krzysztof.karas@intel.com>
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

Series: drm/i915/selftests: Modernize printing in i915 selftests (rev6)
URL   : https://patchwork.freedesktop.org/series/171991/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/171991/revisions/6/mbox/ not applied
Applying: drm/i915/selftests: Use gt_*/drm_* prints in core selftests
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/selftests/i915_vma.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/selftests/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_vma.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/selftests: Use gt_*/drm_* prints in core selftests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


