Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C4C43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 19:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639DD10E23D;
	Wed,  1 Jul 2026 19:52:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486610E20F;
 Wed,  1 Jul 2026 19:52:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tracing=3A_Move_trace=5Fp?=
 =?utf-8?q?rintk=2Eh_out_of_kernel=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 19:52:44 -0000
Message-ID: <178293556473.139541.3524224686218654676@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260621093430.264983361@kernel.org>
In-Reply-To: <20260621093430.264983361@kernel.org>
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

Series: tracing: Move trace_printk.h out of kernel.h
URL   : https://patchwork.freedesktop.org/series/169614/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  CC      kernel/rcu/tree.o
In file included from kernel/rcu/tree.c:70:
kernel/rcu/tree_stall.h: In function ‘rcu_stall_kick_kthreads’:
kernel/rcu/rcu.h:337:17: error: implicit declaration of function ‘ftrace_dump’; did you mean ‘ftrace_bug’? [-Werror=implicit-function-declaration]
  337 |                 ftrace_dump(oops_dump_mode); \
      |                 ^~~~~~~~~~~
kernel/rcu/tree_stall.h:238:17: note: in expansion of macro ‘rcu_ftrace_dump’
  238 |                 rcu_ftrace_dump(DUMP_ALL);
      |                 ^~~~~~~~~~~~~~~
kernel/rcu/tree_stall.h:238:33: error: ‘DUMP_ALL’ undeclared (first use in this function)
  238 |                 rcu_ftrace_dump(DUMP_ALL);
      |                                 ^~~~~~~~
kernel/rcu/rcu.h:337:29: note: in definition of macro ‘rcu_ftrace_dump’
  337 |                 ftrace_dump(oops_dump_mode); \
      |                             ^~~~~~~~~~~~~~
kernel/rcu/tree_stall.h:238:33: note: each undeclared identifier is reported only once for each function it appears in
  238 |                 rcu_ftrace_dump(DUMP_ALL);
      |                                 ^~~~~~~~
kernel/rcu/rcu.h:337:29: note: in definition of macro ‘rcu_ftrace_dump’
  337 |                 ftrace_dump(oops_dump_mode); \
      |                             ^~~~~~~~~~~~~~
kernel/rcu/tree_stall.h: In function ‘check_cpu_stall’:
kernel/rcu/tree_stall.h:859:41: error: ‘DUMP_ALL’ undeclared (first use in this function)
  859 |                         rcu_ftrace_dump(DUMP_ALL);
      |                                         ^~~~~~~~
kernel/rcu/rcu.h:337:29: note: in definition of macro ‘rcu_ftrace_dump’
  337 |                 ftrace_dump(oops_dump_mode); \
      |                             ^~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:289: kernel/rcu/tree.o] Error 1
make[3]: *** [scripts/Makefile.build:549: kernel/rcu] Error 2
make[2]: *** [scripts/Makefile.build:549: kernel] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2189: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


