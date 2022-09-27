Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D2BC07E9D
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Sep 2022 00:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C782610E85F;
	Tue, 27 Sep 2022 00:27:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B73D610E85F;
 Tue, 27 Sep 2022 00:27:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AF68DAADD5;
 Tue, 27 Sep 2022 00:27:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kees Cook" <keescook@chromium.org>
Date: Tue, 27 Sep 2022 00:27:16 -0000
Message-ID: <166423843668.24581.11132704676594211164@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220926191109.1803094-1-keescook@chromium.org>
In-Reply-To: <20220926191109.1803094-1-keescook@chromium.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBv?=
 =?utf-8?q?verflow=3A_Introduce_overflows=5Ftype=28=29_and_castable=5Fto?=
 =?utf-8?b?X3R5cGUoKQ==?=
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

Series: overflow: Introduce overflows_type() and castable_to_type()
URL   : https://patchwork.freedesktop.org/series/109076/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/109076/revisions/1/mbox/ not applied
Applying: overflow: Introduce overflows_type() and castable_to_type()
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/i915_utils.h
M	include/linux/overflow.h
M	lib/overflow_kunit.c
Falling back to patching base and 3-way merge...
Auto-merging lib/overflow_kunit.c
CONFLICT (content): Merge conflict in lib/overflow_kunit.c
Auto-merging include/linux/overflow.h
Auto-merging drivers/gpu/drm/i915/i915_utils.h
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 overflow: Introduce overflows_type() and castable_to_type()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


