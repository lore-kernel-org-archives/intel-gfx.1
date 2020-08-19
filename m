Return-Path: <SRS0=XCjr=B5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9135DC433E1
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 20:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C97C2063A
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 20:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C97C2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934E46E81B;
	Wed, 19 Aug 2020 20:44:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C4646E81B;
 Wed, 19 Aug 2020 20:44:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 661A3A008A;
 Wed, 19 Aug 2020 20:44:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Wed, 19 Aug 2020 20:44:56 -0000
Message-ID: <159786989639.23595.6828779940447234821@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200819203302.47673-1-jose.souza@intel.com>
In-Reply-To: <20200819203302.47673-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/tgl=3A_Fix_stepping_WA_matching?=
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

Series: drm/i915/tgl: Fix stepping WA matching
URL   : https://patchwork.freedesktop.org/series/80820/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
0a625a7a4c3e drm/i915/tgl: Fix stepping WA matching
-:180: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#180: FILE: drivers/gpu/drm/i915/i915_drv.h:1595:
+#define IS_TGL_DISP_REVID(p, since, until) \
+	(IS_TIGERLAKE(p) && \
+	 tgl_revids_get(p)->disp_stepping >= (since) && \
+	 tgl_revids_get(p)->disp_stepping <= (until))

-:185: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#185: FILE: drivers/gpu/drm/i915/i915_drv.h:1600:
+#define IS_TGL_UY_GT_REVID(p, since, until) \
+	((IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_uy_revids->gt_stepping >= (since) && \
+	 tgl_uy_revids->gt_stepping <= (until))

-:190: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#190: FILE: drivers/gpu/drm/i915/i915_drv.h:1605:
+#define IS_TGL_GT_REVID(p, since, until) \
+	(IS_TIGERLAKE(p) && \
+	 !(IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_revids->gt_stepping >= (since) && \
+	 tgl_revids->gt_stepping <= (until))

total: 0 errors, 0 warnings, 3 checks, 145 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
