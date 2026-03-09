Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD417FCA17E
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Mar 2026 19:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5E110E5C1;
	Mon,  9 Mar 2026 19:38:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4910E5C1;
 Mon,  9 Mar 2026 19:38:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_queued_static-key_API_red?=
 =?utf-8?q?uces_IPIs_to_134/16154_in_dyndbg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 09 Mar 2026 19:38:32 -0000
Message-ID: <177308511244.335140.5955590888016925503@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
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

Series: queued static-key API reduces IPIs to 134/16154 in dyndbg
URL   : https://patchwork.freedesktop.org/series/162898/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/162898/revisions/1/mbox/ not applied
Applying: jump_label: expose queueing API for batched static key updates
Applying: virtio: use pr_debug_ratelimited to avoid flooding
Applying: drivers/tty/serial/serial_core: ratelimit uart_wait_until_sent
Applying: dyndbg: use static-key queueing API in dynamic-debug
error: sha1 information is lacking or useless (lib/dynamic_debug.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 dyndbg: use static-key queueing API in dynamic-debug
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


