Return-Path: <SRS0=4n+h=QE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF7AC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 01:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CD061ABD
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 01:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45CD061ABD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765E6E0EF;
	Wed, 17 Nov 2021 01:17:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06A436E0EF;
 Wed, 17 Nov 2021 01:17:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F2957A01BB;
 Wed, 17 Nov 2021 01:17:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 17 Nov 2021 01:17:16 -0000
Message-ID: <163711183696.18222.2038418939999954162@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
In-Reply-To: <20211116174818.2128062-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_i915=3A_Additional_DG2_workarounds_=28rev3=29?=
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

Series: i915: Additional DG2 workarounds (rev3)
URL   : https://patchwork.freedesktop.org/series/96824/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
fd4f6e70e662 drm/i915/dg2: s/DISP_STEPPING/DISPLAY_STEPPING/
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/i915_drv.h:1601:
+#define IS_DG2_DISPLAY_STEP(__i915, since, until) \
 	(IS_DG2(__i915) && \
 	 IS_DISPLAY_STEP(__i915, since, until))

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
15769730ad42 drm/i915/dg2: Add Wa_14010547955
32b2e3ffceee drm/i915/dg2: Add Wa_16011777198
555621fdb28e drm/i915/dg2: Add Wa_16013000631
c4408b6b6a16 drm/i915/dg2: extend Wa_1409120013 to DG2


