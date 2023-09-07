Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C18EC8721
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Sep 2023 12:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5110E7BD;
	Thu,  7 Sep 2023 12:26:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFFFE10E7BD;
 Thu,  7 Sep 2023 12:26:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DE63FAADF1;
 Thu,  7 Sep 2023 12:26:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Date: Thu, 07 Sep 2023 12:26:37 -0000
Message-ID: <169408959790.17902.757611104977094047@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907101135.176326-1-andi.shyti@linux.intel.com>
In-Reply-To: <20230907101135.176326-1-andi.shyti@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915=3A_Run_relevant_bits_of_debugfs_drop=5Fcaches_per_GT?=
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

Series: drm/i915: Run relevant bits of debugfs drop_caches per GT
URL   : https://patchwork.freedesktop.org/series/123386/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/i915_debugfs.o
In file included from drivers/gpu/drm/i915/i915_debugfs.c:36:
drivers/gpu/drm/i915/i915_debugfs.c: In function ‘i915_drop_caches_set’:
drivers/gpu/drm/i915/gt/intel_gt.h:170:14: error: comparison between pointer and integer [-Werror]
  170 |       (id__) < I915_MAX_GT; \
      |              ^
drivers/gpu/drm/i915/i915_debugfs.c:751:2: note: in expansion of macro ‘for_each_gt’
  751 |  for_each_gt(i915, i, gt) {
      |  ^~~~~~~~~~~
In file included from ./include/drm/drm_connector.h:32,
                 from ./drivers/gpu/drm/i915/display/intel_display_core.h:16,
                 from ./drivers/gpu/drm/i915/i915_drv.h:40,
                 from ./drivers/gpu/drm/i915/gt/intel_context.h:14,
                 from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                 from drivers/gpu/drm/i915/i915_debugfs.c:35:
drivers/gpu/drm/i915/gt/intel_gt.h:172:33: error: invalid type argument of ‘->’ (have ‘unsigned int’)
  172 |   for_each_if(((gt__) = (i915__)->gt[(id__)]))
      |                                 ^~
./include/drm/drm_util.h:63:38: note: in definition of macro ‘for_each_if’
   63 | #define for_each_if(condition) if (!(condition)) {} else
      |                                      ^~~~~~~~~
drivers/gpu/drm/i915/i915_debugfs.c:751:2: note: in expansion of macro ‘for_each_gt’
  751 |  for_each_gt(i915, i, gt) {
      |  ^~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:243: drivers/gpu/drm/i915/i915_debugfs.o] Error 1
make[5]: *** [scripts/Makefile.build:480: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:480: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:480: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2032: .] Error 2
make: *** [Makefile:234: __sub-make] Error 2
Build failed, no error log produced


