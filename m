Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6FFC00140
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Aug 2022 18:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA34BFDD3;
	Wed, 24 Aug 2022 18:14:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AA16B8BB6;
 Wed, 24 Aug 2022 18:14:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2FFCBA77A5;
 Wed, 24 Aug 2022 18:14:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Date: Wed, 24 Aug 2022 18:14:37 -0000
Message-ID: <166136487717.9870.10279054805529954022@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915/guc/slpc=3A_Allow_SLPC_to_use_efficient_frequency_=28re?=
 =?utf-8?b?djYp?=
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

Series: drm/i915/guc/slpc: Allow SLPC to use efficient frequency (rev6)
URL   : https://patchwork.freedesktop.org/series/107101/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/107101/revisions/6/mbox/ not applied
Applying: drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_rps.c
M	drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
M	drivers/gpu/drm/i915/intel_mchbar_regs.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
Auto-merging drivers/gpu/drm/i915/gt/intel_rps.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_rps.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/guc/slpc: Allow SLPC to use efficient frequency
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


