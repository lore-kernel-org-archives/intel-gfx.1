Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654EAC4167B
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Nov 2023 06:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E5610E6BA;
	Thu, 30 Nov 2023 06:58:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D66910E0A7;
 Thu, 30 Nov 2023 06:58:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50B29AADEB;
 Thu, 30 Nov 2023 06:58:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Date: Thu, 30 Nov 2023 06:58:37 -0000
Message-ID: <170132751730.15646.17875457815191047078@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129205122.3464299-1-matthew.s.atwood@intel.com>
In-Reply-To: <20231129205122.3464299-1-matthew.s.atwood@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv3=2C1/2=5D_drm/i915=3A_Move_reg=5F?=
 =?utf-8?q?in=5Frange=5Ftable?=
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

Series: series starting with [v3,1/2] drm/i915: Move reg_in_range_table
URL   : https://patchwork.freedesktop.org/series/127082/
State : warning

== Summary ==

Error: dim checkpatch failed
553cf478868e drm/i915: Move reg_in_range_table
349983425e84 drm/i915: Introduce Wa_1401127433
-:188: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'engine' - possible side-effects?
#188: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:3078:
+#define NEEDS_CTX_WABB(engine) ( \
+	IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 0), IP_VER(12, 55)) && \
+	engine->class == RENDER_CLASS)

-:188: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'engine' may be better as '(engine)' to avoid precedence issues
#188: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:3078:
+#define NEEDS_CTX_WABB(engine) ( \
+	IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 0), IP_VER(12, 55)) && \
+	engine->class == RENDER_CLASS)

total: 0 errors, 0 warnings, 2 checks, 170 lines checked


