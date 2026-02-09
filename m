Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA0E94614
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Feb 2026 22:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC3110E48E;
	Mon,  9 Feb 2026 22:15:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04510E239;
 Mon,  9 Feb 2026 22:15:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_rust=3A_Add_CList_and_GPU?=
 =?utf-8?q?_buddy_allocator_bindings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 09 Feb 2026 22:15:15 -0000
Message-ID: <177067531594.239534.9630791030945771180@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
In-Reply-To: <20260209214246.2783990-1-joelagnelf@nvidia.com>
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

Series: rust: Add CList and GPU buddy allocator bindings (rev2)
URL   : https://patchwork.freedesktop.org/series/161236/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/161236/revisions/2/mbox/ not applied
Applying: rust: clist: Add support to interface with C linked lists
Using index info to reconstruct a base tree...
M	MAINTAINERS
M	rust/helpers/helpers.c
M	rust/kernel/lib.rs
Falling back to patching base and 3-way merge...
Auto-merging rust/kernel/lib.rs
Auto-merging rust/helpers/helpers.c
Auto-merging MAINTAINERS
CONFLICT (content): Merge conflict in MAINTAINERS
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 rust: clist: Add support to interface with C linked lists
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


