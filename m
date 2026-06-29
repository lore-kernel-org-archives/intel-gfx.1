Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2FC43327
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Jun 2026 13:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924710E656;
	Mon, 29 Jun 2026 13:10:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E9510E4EF;
 Mon, 29 Jun 2026 13:10:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/display=3A_All_p?=
 =?utf-8?q?atches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 29 Jun 2026 13:10:01 -0000
Message-ID: <178273860161.128396.17791788169119740111@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626134222.1198252-1-dev@lankhorst.se>
In-Reply-To: <20260626134222.1198252-1-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev20)
URL   : https://patchwork.freedesktop.org/series/159035/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/i915_pmu.o
drivers/gpu/drm/i915/i915_pmu.c: In function ‘i915_pmu_register’:
drivers/gpu/drm/i915/i915_pmu.c:1167:17: error: ‘reeturn’ undeclared (first use in this function); did you mean ‘irqreturn’?
 1167 |                 reeturn;
      |                 ^~~~~~~
      |                 irqreturn
drivers/gpu/drm/i915/i915_pmu.c:1167:17: note: each undeclared identifier is reported only once for each function it appears in
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/i915_pmu.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2144: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


