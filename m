Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2567DC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Nov 2021 11:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DF26E428;
	Tue, 30 Nov 2021 11:53:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05A046E428;
 Tue, 30 Nov 2021 11:53:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F304DA363C;
 Tue, 30 Nov 2021 11:53:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 30 Nov 2021 11:53:22 -0000
Message-ID: <163827320299.20413.15686415462583533807@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211130110607.3902085-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20211130110607.3902085-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/adl-n=3A_Enable_ADL-N_platform?=
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

Series: drm/i915/adl-n: Enable ADL-N platform
URL   : https://patchwork.freedesktop.org/series/97406/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
39db60e0b083 drm/i915/adl-n: Enable ADL-N platform
-:98: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#98: FILE: include/drm/i915_pciids.h:670:
+#define INTEL_ADLN_IDS(info) \
+	INTEL_VGA_DEVICE(0x46D0, info), \
+	INTEL_VGA_DEVICE(0x46D1, info), \
+	INTEL_VGA_DEVICE(0x46D2, info)

-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'info' - possible side-effects?
#98: FILE: include/drm/i915_pciids.h:670:
+#define INTEL_ADLN_IDS(info) \
+	INTEL_VGA_DEVICE(0x46D0, info), \
+	INTEL_VGA_DEVICE(0x46D1, info), \
+	INTEL_VGA_DEVICE(0x46D2, info)

total: 1 errors, 0 warnings, 1 checks, 59 lines checked


