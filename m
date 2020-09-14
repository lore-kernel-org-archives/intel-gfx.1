Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F431C2BBD1
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BE3217BA
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FKqpL270";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3ZJjdClz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47BE3217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E8A6E5BB;
	Mon, 14 Sep 2020 20:54:59 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7426E5A9
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 20:54:57 +0000 (UTC)
Message-Id: <20200914204441.115488215@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+wlx0B5bXFGE1ZqmF2GOQz7Vu5f4dOGKH6MLdtZ/des=;
 b=FKqpL2700K2KI8YRyNg486WotbPXB8OPjTNR7CD6hpf4WOsECuFHsf9Fl7xQ/njOCC4us1
 V7/8dgt2Y8Q5bsUgPdX3cx6XhZz7xzGxkW9H08+RkTCs1S3zZRCuJ6BO6NdCa1sGP2ZZpX
 3bB1p3j0W8RPnI56xz7EqLgYOttnzUhttUOz6CqCP4LTLNoe43UQ+fBcsmVdaPtzMUWgf2
 T1f1tMxghsrPiIICkGbkbj/aNUjRjRxUCjZE6DU4Hd0Nghaw+wzNONpacrfVovmhca4M2C
 rQnc8p8FaD3ZJfM8rRAgyRFUboeWQsqzuPbUDTsqtxOETbLcX/pUl6ZnCc32nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+wlx0B5bXFGE1ZqmF2GOQz7Vu5f4dOGKH6MLdtZ/des=;
 b=3ZJjdClz5oMHjfFfg9NKeHYyaj0Ejpc30NZ9Tracs4udi2vCXYHDiLEh6EZOsJaUpk6Jwn
 e+AMA/J0ha4T1+Bg==
Date: Mon, 14 Sep 2020 22:42:11 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
References: <20200914204209.256266093@linutronix.de>
MIME-Version: 1.0
Subject: [Intel-gfx] [patch 02/13] preempt: Make preempt count unconditional
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>, dri-devel@lists.freedesktop.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx@lists.freedesktop.org,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, linux-alpha@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The handling of preempt_count() is inconsistent accross kernel
configurations. On kernels which have PREEMPT_COUNT=n
preempt_disable/enable() and the lock/unlock functions are not affecting
the preempt count, only local_bh_disable/enable() and _bh variants of
locking, soft interrupt delivery, hard interrupt and NMI context affect it.

It's therefore impossible to have a consistent set of checks which provide
information about the context in which a function is called. In many cases
it makes sense to have seperate functions for seperate contexts, but there
are valid reasons to avoid that and handle different calling contexts
conditionally.

The lack of such indicators which work on all kernel configuratios is a
constant source of trouble because developers either do not understand the
implications or try to work around this inconsistency in weird
ways. Neither seem these issues be catched by reviewers and testing.

Recently merged code does:

	 gfp = preemptible() ? GFP_KERNEL : GFP_ATOMIC;

Looks obviously correct, except for the fact that preemptible() is
unconditionally false for CONFIF_PREEMPT_COUNT=n, i.e. all allocations in
that code use GFP_ATOMIC on such kernels.

Attempts to make preempt count unconditional and consistent have been
rejected in the past with handwaving performance arguments.

Freshly conducted benchmarks did not reveal any measurable impact from
enabling preempt count unconditionally. On kernels with CONFIG_PREEMPT_NONE
or CONFIG_PREEMPT_VOLUNTARY the preempt count is only incremented and
decremented but the result of the decrement is not tested. Contrary to that
enabling CONFIG_PREEMPT which tests the result has a small but measurable
impact due to the conditional branch/call.

It's about time to make essential functionality of the kernel consistent
accross the various preemption models.

Enable CONFIG_PREEMPT_COUNT unconditionally. Follow up changes will remove
the #ifdeffery and remove the config option at the end.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/Kconfig.preempt |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -75,8 +75,7 @@ config PREEMPT_RT
 endchoice
 
 config PREEMPT_COUNT
-       bool
+       def_bool y
 
 config PREEMPTION
        bool
-       select PREEMPT_COUNT

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
