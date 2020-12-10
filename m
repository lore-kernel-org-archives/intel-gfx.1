Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182C6C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 03:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E2222A99
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 03:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E2222A99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AF96E3B2;
	Thu, 10 Dec 2020 03:23:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D17EA6E32F;
 Thu, 10 Dec 2020 03:23:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CEDCAAA912;
 Thu, 10 Dec 2020 03:23:48 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Thu, 10 Dec 2020 03:23:48 -0000
Message-ID: <160757062884.19120.15640362299945167484@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201210011720.26649-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201210011720.26649-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gt=3A_Split_logical_ring_contexts_from_execlist_su?=
 =?utf-8?q?bmission?=
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

Series: drm/i915/gt: Split logical ring contexts from execlist submission
URL   : https://patchwork.freedesktop.org/series/84752/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
fe020da17c4c drm/i915/gt: Split logical ring contexts from execlist submission
-:1747: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1747: 
new file mode 100644

-:1776: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'count' - possible side-effects?
#1776: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:25:
+#define LRI(count, flags) ((flags) << 6 | (count) | BUILD_BUG_ON_ZERO(count >= BIT(6)))

-:1778: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#1778: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:27:
+#define REG(x) (((x) >> 2) | BUILD_BUG_ON_ZERO(x >= 0x200))

-:1779: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1779: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:28:
+#define REG16(x) \
+	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
+	(((x) >> 2) & 0x7f)

-:1779: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#1779: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:28:
+#define REG16(x) \
+	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
+	(((x) >> 2) & 0x7f)

-:1782: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1782: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:31:
+#define END(total_state_size) 0, (total_state_size)

-:2426: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2426: FILE: drivers/gpu/drm/i915/gt/intel_lrc.c:675:
+		lrc_setup_indirect_ctx(regs, engine,
+					    i915_ggtt_offset(wa_ctx->vma) +

-:5754: WARNING:MEMORY_BARRIER: memory barrier without comment
#5754: FILE: drivers/gpu/drm/i915/gt/selftest_lrc.c:638:
+		wmb();

-:5783: WARNING:MEMORY_BARRIER: memory barrier without comment
#5783: FILE: drivers/gpu/drm/i915/gt/selftest_lrc.c:667:
+	wmb();

-:5915: WARNING:MEMORY_BARRIER: memory barrier without comment
#5915: FILE: drivers/gpu/drm/i915/gt/selftest_lrc.c:799:
+		wmb();

-:6463: WARNING:MEMORY_BARRIER: memory barrier without comment
#6463: FILE: drivers/gpu/drm/i915/gt/selftest_lrc.c:1347:
+	wmb();

-:6877: WARNING:LINE_SPACING: Missing a blank line after declarations
#6877: FILE: drivers/gpu/drm/i915/gt/selftest_lrc.c:1761:
+	struct i915_request *rq;
+	IGT_TIMEOUT(end_time);

total: 2 errors, 6 warnings, 4 checks, 5153 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
