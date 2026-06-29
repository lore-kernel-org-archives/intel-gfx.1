Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2C3C43458
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Jun 2026 21:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6C910EA60;
	Mon, 29 Jun 2026 21:09:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BB710EA5F;
 Mon, 29 Jun 2026 21:09:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/gt=3A_Use_poll?=
 =?utf-8?q?=5Ftimeout=5Fus_in_place_of_sliding_sleep_window?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 29 Jun 2026 21:09:12 -0000
Message-ID: <178276735238.130542.5263732985641281915@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260629204437.1373799-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260629204437.1373799-1-jonathan.cavitt@intel.com>
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

Series: drm/i915/gt: Use poll_timeout_us in place of sliding sleep window
URL   : https://patchwork.freedesktop.org/series/169454/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  HDRTEST drivers/gpu/drm/xe/generated/xe_wa_oob.h
  HDRTEST drivers/gpu/drm/xe/generated/xe_device_wa_oob.h
  MODPOST Module.symvers
ERROR: modpost: "__bad_udelay" [drivers/gpu/drm/i915/i915.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/kbuild/kernel/Makefile:2134: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


