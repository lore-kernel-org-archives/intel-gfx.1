Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF00C07E95
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 22:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 925246108B
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 22:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 925246108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E16E174;
	Mon, 19 Jul 2021 22:32:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B95546E069;
 Mon, 19 Jul 2021 22:32:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AB6D3A47E2;
 Mon, 19 Jul 2021 22:32:25 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Mon, 19 Jul 2021 22:32:25 -0000
Message-ID: <162673394568.8481.16917519480517140435@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210719221352.3498-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210719221352.3498-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/2=5D_drm/i915/step=3A_Add_ma?=
 =?utf-8?q?cro_magic_for_handling_steps?=
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

Series: series starting with [CI,1/2] drm/i915/step: Add macro magic for handling steps
URL   : https://patchwork.freedesktop.org/series/92735/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
29663fa4daa2 drm/i915/step: Add macro magic for handling steps
-:24: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#24: FILE: drivers/gpu/drm/i915/intel_step.c:186:
+#define STEP_NAME_CASE(name)	\
+	case STEP_##name:	\
+		return #name;

-:24: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#24: FILE: drivers/gpu/drm/i915/intel_step.c:186:
+#define STEP_NAME_CASE(name)	\
+	case STEP_##name:	\
+		return #name;

-:47: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#47: FILE: drivers/gpu/drm/i915/intel_step.h:20:
+#define STEP_NAME_LIST(func)		\
+	func(A0)			\
+	func(A1)			\
+	func(A2)			\
+	func(B0)			\
+	func(B1)			\
+	func(B2)			\
+	func(C0)			\
+	func(C1)			\
+	func(D0)			\
+	func(D1)			\
+	func(E0)			\
+	func(F0)			\
+	func(G0)			\
+	func(H0)			\
+	func(I0)			\
+	func(I1)			\
+	func(J0)

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#47: FILE: drivers/gpu/drm/i915/intel_step.h:20:
+#define STEP_NAME_LIST(func)		\
+	func(A0)			\
+	func(A1)			\
+	func(A2)			\
+	func(B0)			\
+	func(B1)			\
+	func(B2)			\
+	func(C0)			\
+	func(C1)			\
+	func(D0)			\
+	func(D1)			\
+	func(E0)			\
+	func(F0)			\
+	func(G0)			\
+	func(H0)			\
+	func(I0)			\
+	func(I1)			\
+	func(J0)

total: 2 errors, 1 warnings, 1 checks, 70 lines checked
e9092fbd9b75 drm/i915/dmc: Change intel_get_stepping_info()


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
