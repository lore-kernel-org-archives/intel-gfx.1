Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03CCCD6E7B
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Jun 2026 21:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F857112C14;
	Fri,  5 Jun 2026 21:01:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A34112C12;
 Fri,  5 Jun 2026 21:01:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/=7Bi915=2C_xe=7D=3A_R?=
 =?utf-8?q?efactor_generic=5Fhandle=5Firq=5Fsafe=28=29_error_messages_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 05 Jun 2026 21:01:53 -0000
Message-ID: <178069331381.49962.2293384365464426465@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
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

Series: drm/{i915, xe}: Refactor generic_handle_irq_safe() error messages (rev3)
URL   : https://patchwork.freedesktop.org/series/167911/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
In file included from ./include/linux/device.h:15,
                 from ./include/linux/auxiliary_bus.h:11,
                 from ./include/linux/mei_aux.h:8,
                 from drivers/gpu/drm/i915/gt/intel_gsc.c:7:
drivers/gpu/drm/i915/gt/intel_gsc.c: In function ‘gsc_irq_handler’:
drivers/gpu/drm/i915/gt/intel_gsc.c:289:84: error: passing argument 1 of ‘PTR_ERR’ makes pointer from integer without a cast [-Werror=int-conversion]
  289 |                 gt_err_ratelimited(gt, "GSC: irq handling failed (%pe)\n", PTR_ERR(ret));
      |                                                                                    ^~~
      |                                                                                    |
      |                                                                                    int
./include/linux/dev_printk.h:110:37: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
./include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_err’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
./include/linux/dev_printk.h:225:9: note: in expansion of macro ‘dev_level_ratelimited’
  225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/drm/drm_print.h:615:9: note: in expansion of macro ‘dev_err_ratelimited’
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
./include/drm/drm_print.h:645:9: note: in expansion of macro ‘__drm_printk’
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
./drivers/gpu/drm/i915/gt/intel_gt_print.h:32:9: note: in expansion of macro ‘drm_err_ratelimited’
   32 |         drm_err_ratelimited(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/intel_gsc.c:289:17: note: in expansion of macro ‘gt_err_ratelimited’
  289 |                 gt_err_ratelimited(gt, "GSC: irq handling failed (%pe)\n", PTR_ERR(ret));
      |                 ^~~~~~~~~~~~~~~~~~
In file included from ./include/linux/cleanup.h:6,
                 from ./include/linux/preempt.h:11,
                 from ./include/linux/spinlock.h:56,
                 from ./include/linux/irq.h:14,
                 from drivers/gpu/drm/i915/gt/intel_gsc.c:6:
./include/linux/err.h:63:61: note: expected ‘const void *’ but argument is of type ‘int’
   63 | static inline long __must_check PTR_ERR(__force const void *ptr)
      |                                                 ~~~~~~~~~~~~^~~
./include/drm/drm_print.h:615:46: error: format ‘%p’ expects argument of type ‘void *’, but argument 4 has type ‘long int’ [-Werror=format=]
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |                                              ^~~~~~~~
./include/linux/dev_printk.h:110:30: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
./include/linux/dev_printk.h:154:56: note: in expansion of macro ‘dev_fmt’
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                        ^~~~~~~
./include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_err’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
./include/linux/dev_printk.h:225:9: note: in expansion of macro ‘dev_level_ratelimited’
  225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/drm/drm_print.h:615:9: note: in expansion of macro ‘dev_err_ratelimited’
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
./include/drm/drm_print.h:645:9: note: in expansion of macro ‘__drm_printk’
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
./drivers/gpu/drm/i915/gt/intel_gt_print.h:32:9: note: in expansion of macro ‘drm_err_ratelimited’
   32 |         drm_err_ratelimited(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/intel_gsc.c:289:17: note: in expansion of macro ‘gt_err_ratelimited’
  289 |                 gt_err_ratelimited(gt, "GSC: irq handling failed (%pe)\n", PTR_ERR(ret));
      |                 ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/gt/intel_gsc.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


