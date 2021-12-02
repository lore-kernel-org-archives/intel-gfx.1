Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3060FC433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Dec 2021 18:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F26F48A;
	Thu,  2 Dec 2021 18:54:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E429C6F48A;
 Thu,  2 Dec 2021 18:54:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB398A7DFB;
 Thu,  2 Dec 2021 18:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 02 Dec 2021 18:54:43 -0000
Message-ID: <163847128386.9457.8366442470472817906@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211202181515.2794397-1-matthew.auld@intel.com>
In-Reply-To: <20211202181515.2794397-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBz?=
 =?utf-8?q?eries_starting_with_=5B1/8=5D_drm/i915/migrate=3A_don=27t_check?=
 =?utf-8?q?_the_scratch_page?=
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

Series: series starting with [1/8] drm/i915/migrate: don't check the scratch page
URL   : https://patchwork.freedesktop.org/series/97504/
State : failure

== Summary ==

Applying: drm/i915/migrate: don't check the scratch page
Applying: drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
Applying: drm/i915/gtt: add gtt mappable plumbing
Applying: drm/i915/migrate: fix offset calculation
Applying: drm/i915/migrate: fix length calculation
Applying: drm/i915/selftests: handle object rounding
Applying: drm/i915/migrate: add acceleration support for DG2
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/gt/intel_migrate.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0007 drm/i915/migrate: add acceleration support for DG2
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


