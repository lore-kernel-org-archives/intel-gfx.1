Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976ACC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 21:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6787E60E73
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 21:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6787E60E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185196E91D;
	Wed, 27 Oct 2021 21:28:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A3A26E917;
 Wed, 27 Oct 2021 21:27:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41C95AA01E;
 Wed, 27 Oct 2021 21:27:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 27 Oct 2021 21:27:59 -0000
Message-ID: <163537007922.4635.1940416126881565312@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211027205302.19222-1-rdunlap@infradead.org>
In-Reply-To: <20211027205302.19222-1-rdunlap@infradead.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBp?=
 =?utf-8?q?915/gem/dmabuf=3A_add_=3Casm/smp=2Eh=3E_to_fix_build_error?=
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

Series: i915/gem/dmabuf: add <asm/smp.h> to fix build error
URL   : https://patchwork.freedesktop.org/series/96360/
State : failure

== Summary ==

Applying: i915/gem/dmabuf: add <asm/smp.h> to fix build error
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 i915/gem/dmabuf: add <asm/smp.h> to fix build error
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


