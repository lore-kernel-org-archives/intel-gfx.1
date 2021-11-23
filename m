Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E08C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Nov 2021 22:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C185C88F1E;
	Tue, 23 Nov 2021 22:56:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C77E288F1E;
 Tue, 23 Nov 2021 22:56:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BE92CA00E8;
 Tue, 23 Nov 2021 22:56:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luis Chamberlain" <mcgrof@kernel.org>
Date: Tue, 23 Nov 2021 22:56:05 -0000
Message-ID: <163770816575.2114.4485007593332755706@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211123202422.819032-1-mcgrof@kernel.org>
In-Reply-To: <20211123202422.819032-1-mcgrof@kernel.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBz?=
 =?utf-8?q?ysctl=3A_second_set_of_kernel/sysctl_cleanups?=
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

Series: sysctl: second set of kernel/sysctl cleanups
URL   : https://patchwork.freedesktop.org/series/97221/
State : failure

== Summary ==

Applying: hpet: simplify subdirectory registration with register_sysctl()
Applying: i915: simplify subdirectory registration with register_sysctl()
Applying: macintosh/mac_hid.c: simplify subdirectory registration with register_sysctl()
Applying: ocfs2: simplify subdirectory registration with register_sysctl()
Applying: test_sysctl: simplify subdirectory registration with register_sysctl()
Applying: inotify: simplify subdirectory registration with register_sysctl()
error: sha1 information is lacking or useless (kernel/sysctl.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0006 inotify: simplify subdirectory registration with register_sysctl()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


