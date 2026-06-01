Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD2CD5BD1
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 14:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE70F113458;
	Mon,  1 Jun 2026 14:57:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BABB113462;
 Mon,  1 Jun 2026 14:57:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/display=3A_Refco?=
 =?utf-8?q?unt_for_fec_enable/disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 01 Jun 2026 14:57:06 -0000
Message-ID: <178032582610.32237.3085349701192578594@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601142943.1481728-1-arun.r.murthy@intel.com>
In-Reply-To: <20260601142943.1481728-1-arun.r.murthy@intel.com>
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

Series: drm/i915/display: Refcount for fec enable/disable
URL   : https://patchwork.freedesktop.org/series/167664/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi.o
In file included from ./include/linux/kernel.h:22,
                 from ./include/linux/iopoll.h:9,
                 from drivers/gpu/drm/i915/display/intel_ddi.c:28:
drivers/gpu/drm/i915/display/intel_ddi.c: In function ‘intel_ddi_seed_fec_refcounts’:
drivers/gpu/drm/i915/display/intel_display.h:217:41: error: ‘struct drm_device’ has no member named ‘pipe_list’; did you mean ‘filelist’?
  217 |                             &(display)->pipe_list, \
      |                                         ^~~~~~~~~
./include/linux/container_of.h:20:33: note: in definition of macro ‘container_of’
   20 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./include/linux/list.h:643:9: note: in expansion of macro ‘list_entry’
  643 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:819:20: note: in expansion of macro ‘list_first_entry’
  819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_display.h:216:9: note: in expansion of macro ‘list_for_each_entry’
  216 |         list_for_each_entry((crtc), \
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_ddi.c:2117:9: note: in expansion of macro ‘for_each_intel_crtc’
 2117 |         for_each_intel_crtc(display->drm, crtc) {
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/container_of.h:5:
drivers/gpu/drm/i915/display/intel_display.h:217:41: error: ‘struct drm_device’ has no member named ‘pipe_list’; did you mean ‘filelist’?
  217 |                             &(display)->pipe_list, \
      |                                         ^~~~~~~~~
./include/linux/build_bug.h:80:56: note: in definition of macro ‘__static_assert’
   80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:21:9: note: in expansion of macro ‘static_assert’
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:21:23: note: in expansion of macro ‘__same_type’
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/list.h:632:9: note: in expansion of macro ‘container_of’
  632 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:643:9: note: in expansion of macro ‘list_entry’
  643 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:819:20: note: in expansion of macro ‘list_first_entry’
  819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_display.h:216:9: note: in expansion of macro ‘list_for_each_entry’
  216 |         list_for_each_entry((crtc), \
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_ddi.c:2117:9: note: in expansion of macro ‘for_each_intel_crtc’
 2117 |         for_each_intel_crtc(display->drm, crtc) {
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_display.h:217:41: error: ‘struct drm_device’ has no member named ‘pipe_list’; did you mean ‘filelist’?
  217 |                             &(display)->pipe_list, \
      |                                         ^~~~~~~~~
./include/linux/build_bug.h:80:56: note: in definition of macro ‘__static_assert’
   80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:21:9: note: in expansion of macro ‘static_assert’
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:22:23: note: in expansion of macro ‘__same_type’
   22 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
./include/linux/list.h:632:9: note: in expansion of macro ‘container_of’
  632 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:643:9: note: in expansion of macro ‘list_entry’
  643 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:819:20: note: in expansion of macro ‘list_first_entry’
  819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_display.h:216:9: note: in expansion of macro ‘list_for_each_entry’
  216 |         list_for_each_entry((crtc), \
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_ddi.c:2117:9: note: in expansion of macro ‘for_each_intel_crtc’
 2117 |         for_each_intel_crtc(display->drm, crtc) {
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
  610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:80:56: note: in definition of macro ‘__static_assert’
   80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:21:9: note: in expansion of macro ‘static_assert’
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:21:23: note: in expansion of macro ‘__same_type’
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/list.h:632:9: note: in expansion of macro ‘container_of’
  632 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:643:9: note: in expansion of macro ‘list_entry’
  643 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:819:20: note: in expansion of macro ‘list_first_entry’
  819 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_display.h:216:9: note: in expansion of macro ‘list_for_each_entry’
  216 |         list_for_each_entry((crtc), \
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_ddi.c:2117:9: note: in expansion of macro ‘for_each_intel_crtc’
 2117 |         for_each_intel_crtc(display->drm, crtc) {
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/random.h:8,
                 from ./include/linux/nodemask.h:94,
                 from ./include/linux/numa.h:6,
                 from ./include/linux/cpumask.h:15,
                 from ./arch/x86/include/asm/paravirt.h:19,
                 from ./arch/x86/include/asm/cpuid/api.h:57,
                 from ./arch/x86/include/asm/processor.h:19,
                 from ./arch/x86/include/asm/timex.h:5,
                 from ./include/linux/timex.h:67,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/jiffies.h:10,
                 from ./include/linux/ktime.h:25,
                 from ./include/linux/iopoll.h:11:
drivers/gpu/drm/i915/display/intel_display.h:217:41: error: ‘struct drm_device’ has no member named ‘pipe_list’; did you mean ‘filelist’?
  217 |                             &(display)->pipe_list, \
      |                                         ^~~~~~~~~
./include/linux/list.h:810:37: note: in definition of macro ‘list_entry_is_head’
  810 |         list_is_head(&pos->member, (head))
      |                                     ^~~~
drivers/gpu/drm/i915/display/intel_display.h:216:9: note: in expansion of macro ‘list_for_each_entry’
  216 |         list_for_each_entry((crtc), \
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_ddi.c:2117:9: note: in expansion of macro ‘for_each_intel_crtc’
 2117 |         for_each_intel_crtc(display->drm, crtc) {
      |         ^~~~~~~~~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/display/intel_ddi.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


