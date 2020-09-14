Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187A7C433E2
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 22:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E04206F4
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 22:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E04206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2451C6E7D0;
	Mon, 14 Sep 2020 22:01:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DAA26E5D5;
 Mon, 14 Sep 2020 22:01:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 864E8A66C9;
 Mon, 14 Sep 2020 22:01:19 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Gleixner" <tglx@linutronix.de>
Date: Mon, 14 Sep 2020 22:01:19 -0000
Message-ID: <160012087951.5912.8419266271155927746@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200914204209.256266093@linutronix.de>
In-Reply-To: <20200914204209.256266093@linutronix.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBw?=
 =?utf-8?q?reempt=3A_Make_preempt_count_unconditional?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: preempt: Make preempt count unconditional
URL   : https://patchwork.freedesktop.org/series/81661/
State : failure

== Summary ==

Applying: lib/debug: Remove pointless ARCH_NO_PREEMPT dependencies
Applying: preempt: Make preempt count unconditional
Applying: preempt: Clenaup PREEMPT_COUNT leftovers
Applying: lockdep: Clenaup PREEMPT_COUNT leftovers
Applying: mm/pagemap: Clenaup PREEMPT_COUNT leftovers
Applying: locking/bitspinlock: Clenaup PREEMPT_COUNT leftovers
Applying: uaccess: Clenaup PREEMPT_COUNT leftovers
Applying: sched: Clenaup PREEMPT_COUNT leftovers
Applying: ARM: Clenaup PREEMPT_COUNT leftovers
Applying: xtensa: Clenaup PREEMPT_COUNT leftovers
Applying: drm/i915: Clenaup PREEMPT_COUNT leftovers
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/Kconfig.debug).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0011 drm/i915: Clenaup PREEMPT_COUNT leftovers
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
