Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7574C433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 11:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CCAE61130
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 11:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CCAE61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12E6F417;
	Thu,  7 Oct 2021 11:35:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43AAA6E847;
 Thu,  7 Oct 2021 11:35:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38992AA914;
 Thu,  7 Oct 2021 11:35:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vlastimil Babka" <vbabka@suse.cz>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 07 Oct 2021 11:35:42 -0000
Message-ID: <163360654219.5187.218705694682855786@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211007095815.3563-1-vbabka@suse.cz>
In-Reply-To: <20211007095815.3563-1-vbabka@suse.cz>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBs?=
 =?utf-8?q?ib/stackdepot=3A_allow_optional_init_and_stack=5Ftable_allocati?=
 =?utf-8?q?on_by_kvmalloc=28=29?=
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

Series: lib/stackdepot: allow optional init and stack_table allocation by kvmalloc()
URL   : https://patchwork.freedesktop.org/series/95549/
State : failure

== Summary ==

Applying: lib/stackdepot: allow optional init and stack_table allocation by kvmalloc()
error: sha1 information is lacking or useless (include/linux/stackdepot.h).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 lib/stackdepot: allow optional init and stack_table allocation by kvmalloc()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


