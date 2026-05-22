Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD85CD5BB3
	for <intel-gfx@archiver.kernel.org>; Fri, 22 May 2026 16:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BDE10E28E;
	Fri, 22 May 2026 16:33:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0010E28E;
 Fri, 22 May 2026 16:33:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Convert_moduleparams_to_s?=
 =?utf-8?q?eq=5Fbuf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kees Cook" <kees@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 22 May 2026 16:33:33 -0000
Message-ID: <177946761355.308.6910575802613578588@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260521133315.work.845-kees@kernel.org>
In-Reply-To: <20260521133315.work.845-kees@kernel.org>
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

Series: Convert moduleparams to seq_buf
URL   : https://patchwork.freedesktop.org/series/167021/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/167021/revisions/1/mbox/ not applied
Applying: params: bound array element output to the caller's page buffer
Applying: panic: Replace panic_print_get() with generic helper
Applying: moduleparam: Add DEFINE_KERNEL_PARAM_OPS macro family
Applying: treewide: Convert struct kernel_param_ops initializers to DEFINE_KERNEL_PARAM_OPS
error: sha1 information is lacking or useless (kernel/panic.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 treewide: Convert struct kernel_param_ops initializers to DEFINE_KERNEL_PARAM_OPS
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


