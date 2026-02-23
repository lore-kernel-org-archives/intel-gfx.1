Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2838EC111B
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Feb 2026 18:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBA210E02B;
	Mon, 23 Feb 2026 18:06:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA810E02B;
 Mon, 23 Feb 2026 18:06:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/selftests=3A_Fix?=
 =?utf-8?q?_build_after_dma-fence_locking_rework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Feb 2026 18:06:14 -0000
Message-ID: <177186997431.277322.9648806167626304001@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223172553.1663749-1-matthew.brost@intel.com>
In-Reply-To: <20260223172553.1663749-1-matthew.brost@intel.com>
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

Series: drm/i915/selftests: Fix build after dma-fence locking rework
URL   : https://patchwork.freedesktop.org/series/161998/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/i915_active.o
In file included from drivers/gpu/drm/i915/i915_active.c:1174:
drivers/gpu/drm/i915/selftests/i915_active.c: In function ‘active_flush’:
drivers/gpu/drm/i915/selftests/i915_active.c:326:23: error: implicit declaration of function ‘dma_fence_spinlock’; did you mean ‘dma_fence_signal’? [-Werror=implicit-function-declaration]
  326 |         spin_lock_irq(dma_fence_spinlock(fence));
      |                       ^~~~~~~~~~~~~~~~~~
      |                       dma_fence_signal
drivers/gpu/drm/i915/selftests/i915_active.c:326:23: error: passing argument 1 of ‘spin_lock_irq’ makes pointer from integer without a cast [-Werror=int-conversion]
  326 |         spin_lock_irq(dma_fence_spinlock(fence));
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                       |
      |                       int
In file included from ./include/linux/debugobjects.h:6,
                 from drivers/gpu/drm/i915/i915_active.c:7:
./include/linux/spinlock.h:368:55: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘int’
  368 | static __always_inline void spin_lock_irq(spinlock_t *lock)
      |                                           ~~~~~~~~~~~~^~~~
drivers/gpu/drm/i915/selftests/i915_active.c:328:25: error: passing argument 1 of ‘spin_unlock_irq’ makes pointer from integer without a cast [-Werror=int-conversion]
  328 |         spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                         |
      |                         int
./include/linux/spinlock.h:398:57: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘int’
  398 | static __always_inline void spin_unlock_irq(spinlock_t *lock)
      |                                             ~~~~~~~~~~~~^~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/i915_active.o] Error 1
make[5]: *** [scripts/Makefile.build:546: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:546: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:546: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:546: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2101: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


