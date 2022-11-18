Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E28C4332F
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Nov 2022 13:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAD310E72F;
	Fri, 18 Nov 2022 13:08:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E518410E742;
 Fri, 18 Nov 2022 13:08:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DE560AADE1;
 Fri, 18 Nov 2022 13:08:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 18 Nov 2022 13:08:50 -0000
Message-ID: <166877693087.25642.17090085257036860395@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221118124816.545034-1-matthew.auld@intel.com>
In-Reply-To: <20221118124816.545034-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBz?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_drm/i915/migrate=3A_Account_for_t?=
 =?utf-8?q?he_reserved=5Fspace?=
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

Series: series starting with [1/2] drm/i915/migrate: Account for the reserved_space
URL   : https://patchwork.freedesktop.org/series/111072/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  CC [M]  drivers/gpu/drm/i915/gt/intel_migrate.o
In file included from drivers/gpu/drm/i915/gt/intel_migrate.c:1137:
drivers/gpu/drm/i915/gt/selftest_migrate.c:531:5: error: no previous prototype for ‘spinner_kill’ [-Werror=missing-prototypes]
 int spinner_kill(void *arg)
     ^~~~~~~~~~~~
cc1: all warnings being treated as errors
scripts/Makefile.build:250: recipe for target 'drivers/gpu/drm/i915/gt/intel_migrate.o' failed
make[5]: *** [drivers/gpu/drm/i915/gt/intel_migrate.o] Error 1
scripts/Makefile.build:500: recipe for target 'drivers/gpu/drm/i915' failed
make[4]: *** [drivers/gpu/drm/i915] Error 2
scripts/Makefile.build:500: recipe for target 'drivers/gpu/drm' failed
make[3]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:500: recipe for target 'drivers/gpu' failed
make[2]: *** [drivers/gpu] Error 2
scripts/Makefile.build:500: recipe for target 'drivers' failed
make[1]: *** [drivers] Error 2
Makefile:1992: recipe for target '.' failed
make: *** [.] Error 2


