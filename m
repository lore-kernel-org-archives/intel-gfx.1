Return-Path: <SRS0=Zu3g=BS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632B2C433E0
	for <intel-gfx@archiver.kernel.org>; Sat,  8 Aug 2020 19:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39ADD2067D
	for <intel-gfx@archiver.kernel.org>; Sat,  8 Aug 2020 19:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39ADD2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08A06E231;
	Sat,  8 Aug 2020 19:16:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EDFE6E22F;
 Sat,  8 Aug 2020 19:16:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 69035A882E;
 Sat,  8 Aug 2020 19:16:08 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Sat, 08 Aug 2020 19:16:08 -0000
Message-ID: <159691416840.14937.16932016926854886840@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200808184511.2594286-1-matthew.d.roper@intel.com>
In-Reply-To: <20200808184511.2594286-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/kbl=3A_Fix_revision_ID_checks?=
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

Series: drm/i915/kbl: Fix revision ID checks
URL   : https://patchwork.freedesktop.org/series/80419/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d391445dba5b drm/i915/kbl: Fix revision ID checks
-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#126: FILE: drivers/gpu/drm/i915/i915_drv.h:1543:
+#define IS_KBL_GT_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping <= until)

-:126: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'since' may be better as '(since)' to avoid precedence issues
#126: FILE: drivers/gpu/drm/i915/i915_drv.h:1543:
+#define IS_KBL_GT_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping <= until)

-:126: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'until' may be better as '(until)' to avoid precedence issues
#126: FILE: drivers/gpu/drm/i915/i915_drv.h:1543:
+#define IS_KBL_GT_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].gt_stepping <= until)

-:130: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#130: FILE: drivers/gpu/drm/i915/i915_drv.h:1547:
+#define IS_KBL_DISP_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping <= until)

-:130: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'since' may be better as '(since)' to avoid precedence issues
#130: FILE: drivers/gpu/drm/i915/i915_drv.h:1547:
+#define IS_KBL_DISP_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping <= until)

-:130: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'until' may be better as '(until)' to avoid precedence issues
#130: FILE: drivers/gpu/drm/i915/i915_drv.h:1547:
+#define IS_KBL_DISP_REVID(dev_priv, since, until) \
+	(IS_KABYLAKE(dev_priv) && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping >= since && \
+	 kbl_revids[INTEL_REVID(dev_priv)].disp_stepping <= until)

total: 0 errors, 0 warnings, 6 checks, 109 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
