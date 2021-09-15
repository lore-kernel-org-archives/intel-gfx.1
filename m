Return-Path: <SRS0=Y9sQ=OF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4616C433FE
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 16:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B54861216
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 16:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B54861216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6076E97C;
	Wed, 15 Sep 2021 16:31:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BF196E97A;
 Wed, 15 Sep 2021 16:31:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 318E5A0099;
 Wed, 15 Sep 2021 16:31:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imran Khan" <imran.f.khan@oracle.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 15 Sep 2021 16:31:20 -0000
Message-ID: <163172348019.30118.3391457393898783465@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210915014806.3206938-1-imran.f.khan@oracle.com>
In-Reply-To: <20210915014806.3206938-1-imran.f.khan@oracle.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBs?=
 =?utf-8?q?ib=2C_stackdepot=3A_check_stackdepot_handle_before_accessing_sl?=
 =?utf-8?q?abs?=
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

Series: lib, stackdepot: check stackdepot handle before accessing slabs
URL   : https://patchwork.freedesktop.org/series/94696/
State : failure

== Summary ==

CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND objtool
  CHK     include/generated/compile.h
  CC [M]  drivers/gpu/drm/i915/intel_runtime_pm.o
drivers/gpu/drm/i915/intel_runtime_pm.c: In function ‘__print_intel_runtime_pm_wakeref’:
drivers/gpu/drm/i915/intel_runtime_pm.c:196:3: error: too many arguments to function ‘stack_depot_print’
   stack_depot_print(stack, buf, PAGE_SIZE, 2);
   ^~~~~~~~~~~~~~~~~
In file included from ./include/linux/page_ext.h:7,
                 from ./include/linux/mm.h:25,
                 from ./include/linux/kallsyms.h:13,
                 from ./include/linux/bpf.h:20,
                 from ./include/linux/bpf-cgroup.h:5,
                 from ./include/linux/cgroup-defs.h:22,
                 from ./include/linux/cgroup.h:28,
                 from ./include/linux/memcontrol.h:13,
                 from ./include/linux/swap.h:9,
                 from ./include/linux/suspend.h:5,
                 from ./include/linux/regulator/consumer.h:35,
                 from ./include/linux/i2c.h:18,
                 from drivers/gpu/drm/i915/i915_drv.h:39,
                 from drivers/gpu/drm/i915/intel_runtime_pm.c:33:
./include/linux/stackdepot.h:25:6: note: declared here
 void stack_depot_print(depot_stack_handle_t stack);
      ^~~~~~~~~~~~~~~~~
scripts/Makefile.build:277: recipe for target 'drivers/gpu/drm/i915/intel_runtime_pm.o' failed
make[4]: *** [drivers/gpu/drm/i915/intel_runtime_pm.o] Error 1
scripts/Makefile.build:540: recipe for target 'drivers/gpu/drm/i915' failed
make[3]: *** [drivers/gpu/drm/i915] Error 2
scripts/Makefile.build:540: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:540: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
Makefile:1874: recipe for target 'drivers' failed
make: *** [drivers] Error 2


