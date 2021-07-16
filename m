Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBC1C12002
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 22:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEB8613DF
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 22:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEB8613DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89896E8C8;
	Fri, 16 Jul 2021 22:21:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCB256E8C8;
 Fri, 16 Jul 2021 22:21:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B5258A0169;
 Fri, 16 Jul 2021 22:21:48 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Fri, 16 Jul 2021 22:21:48 -0000
Message-ID: <162647410871.12776.9449702972939938711@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm=3A_Make_modeset_locking_easier?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: Make modeset locking easier
URL   : https://patchwork.freedesktop.org/series/92606/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b1e190e95142 drm: Introduce drm_modeset_lock_ctx_retry()
-:104: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ctx' - possible side-effects?
#104: FILE: include/drm/drm_modeset_lock.h:221:
+#define drm_modeset_lock_ctx_retry(ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret)))

-:104: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#104: FILE: include/drm/drm_modeset_lock.h:221:
+#define drm_modeset_lock_ctx_retry(ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret)))

-:104: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ret' - possible side-effects?
#104: FILE: include/drm/drm_modeset_lock.h:221:
+#define drm_modeset_lock_ctx_retry(ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret)))

total: 0 errors, 0 warnings, 3 checks, 77 lines checked
03c1e97e22ca drm: Introduce drm_modeset_lock_all_ctx_retry()
-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ctx' - possible side-effects?
#32: FILE: include/drm/drm_modeset_lock.h:226:
+#define drm_modeset_lock_all_ctx_retry(dev, ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret))) \
+		for_each_if(((ret) = drm_modeset_lock_all_ctx((dev), (ctx))) == 0)

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#32: FILE: include/drm/drm_modeset_lock.h:226:
+#define drm_modeset_lock_all_ctx_retry(dev, ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret))) \
+		for_each_if(((ret) = drm_modeset_lock_all_ctx((dev), (ctx))) == 0)

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ret' - possible side-effects?
#32: FILE: include/drm/drm_modeset_lock.h:226:
+#define drm_modeset_lock_all_ctx_retry(dev, ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret))) \
+		for_each_if(((ret) = drm_modeset_lock_all_ctx((dev), (ctx))) == 0)

total: 0 errors, 0 warnings, 3 checks, 10 lines checked
0ddd911343c8 drm/i915: Extract intel_crtc_initial_commit()
a7ff291d8e28 drm/i915: Use drm_modeset_lock_ctx_retry() & co.


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
