Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0D01061B0F
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Mar 2026 15:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59310E25A;
	Mon, 30 Mar 2026 15:51:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293BB10E25A;
 Mon, 30 Mar 2026 15:51:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_fix_CONFIG=5FDRM=5FUSE=5F?=
 =?utf-8?q?DYNAMIC=5FDEBUG=3Dy_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Mar 2026 15:51:34 -0000
Message-ID: <177488589414.413457.10398149831631201213@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
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

Series: fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y (rev6)
URL   : https://patchwork.freedesktop.org/series/135705/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/135705/revisions/6/mbox/ not applied
Applying: dyndbg: fix NULL ptr on i386 due to section mis-alignment
Applying: vmlinux.lds.h: move BOUNDED_SECTION_* macros to reuse later
Applying: dyndbg.lds.S: fix lost dyndbg sections in modules
Applying: vmlinux.lds.h: drop unused HEADERED_SECTION* macros
Applying: dyndbg: factor ddebug_match_desc out from ddebug_change
Applying: dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Applying: docs/dyndbg: update examples \012 to \n
Applying: docs/dyndbg: explain flags parse 1st
Applying: test-dyndbg: fixup CLASSMAP usage error
Applying: dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Applying: dyndbg: make ddebug_class_param union members same size
Applying: dyndbg: drop NUM_TYPE_ARRAY
Applying: dyndbg: tweak pr_fmt to avoid expansion conflicts
Applying: dyndbg: reduce verbose/debug clutter
Applying: dyndbg: refactor param_set_dyndbg_classes and below
Applying: dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Applying: dyndbg: replace classmap list with a vector
Applying: dyndbg: macrofy a 2-index for-loop pattern
Applying: dyndbg, module: make proper substructs in _ddebug_info
Applying: dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
Applying: dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Applying: dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
Applying: selftests-dyndbg: add a dynamic_debug run_tests target
Applying: dyndbg: change __dynamic_func_call_cls* macros into expressions
Applying: dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
Applying: dyndbg: detect class_id reservation conflicts
Applying: dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Applying: dyndbg-test: change do_prints testpoint to accept a loopct
Applying: dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
Applying: dyndbg: treat comma as a token separator
Applying: dyndbg: split multi-query strings with %
Applying: selftests-dyndbg: add test_mod_submod
Applying: dyndbg: resolve "protection" of class'd pr_debug
Applying: dyndbg: harden classmap and descriptor validation
Applying: docs/dyndbg: add classmap info to howto
Applying: dyndbg: Ignore additional arguments from pr_fmt
Applying: dyndbg-test: verify DYNAMIC_DEBUG_CLASSMAP_USE_() compile-time CHECK
Applying: drm: use correct ccflags-y spelling
Applying: drm_buddy: fix power-of-2 rounding errs
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/drm_buddy.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/drm_buddy.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_buddy.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0039 drm_buddy: fix power-of-2 rounding errs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


