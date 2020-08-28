Return-Path: <SRS0=+bTq=CG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9830C433E6
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 00:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E8E2071B
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 00:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E8E2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D3F6E125;
	Fri, 28 Aug 2020 00:50:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3B806E11D;
 Fri, 28 Aug 2020 00:50:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C2E40A41FB;
 Fri, 28 Aug 2020 00:50:23 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Fri, 28 Aug 2020 00:50:23 -0000
Message-ID: <159857582377.4242.12954390589573574351@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200827233943.400946-1-jose.souza@intel.com>
In-Reply-To: <20200827233943.400946-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/tgl=3A_Fix_stepping_WA_matching_=28rev3=29?=
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

Series: drm/i915/tgl: Fix stepping WA matching (rev3)
URL   : https://patchwork.freedesktop.org/series/80820/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
308f1ef1a8cb drm/i915/tgl: Fix stepping WA matching
-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#185: FILE: drivers/gpu/drm/i915/i915_drv.h:1595:
+#define IS_TGL_DISP_REVID(p, since, until) \
+	(IS_TIGERLAKE(p) && \
+	 tgl_revids_get(p)->disp_stepping >= (since) && \
+	 tgl_revids_get(p)->disp_stepping <= (until))

-:190: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#190: FILE: drivers/gpu/drm/i915/i915_drv.h:1600:
+#define IS_TGL_UY_GT_REVID(p, since, until) \
+	((IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_uy_revids->gt_stepping >= (since) && \
+	 tgl_uy_revids->gt_stepping <= (until))

-:195: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#195: FILE: drivers/gpu/drm/i915/i915_drv.h:1605:
+#define IS_TGL_GT_REVID(p, since, until) \
+	(IS_TIGERLAKE(p) && \
+	 !(IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_revids->gt_stepping >= (since) && \
+	 tgl_revids->gt_stepping <= (until))

total: 0 errors, 0 warnings, 3 checks, 144 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
