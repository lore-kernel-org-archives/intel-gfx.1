Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD9AC6377B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F216023D
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F216023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B936E8FD;
	Wed, 21 Jul 2021 22:28:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEB216E8FD;
 Wed, 21 Jul 2021 22:28:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E747EA77A5;
 Wed, 21 Jul 2021 22:28:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Wed, 21 Jul 2021 22:28:56 -0000
Message-ID: <162690653691.768.17943926306453912309@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210721215238.24980-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210721215238.24980-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/4=5D_drm/i915/step=3A_Add_ma?=
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

Series: series starting with [CI,1/4] drm/i915/step: Add macro magic for handling steps
URL   : https://patchwork.freedesktop.org/series/92849/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
c0b839cec037 drm/i915/step: Add macro magic for handling steps
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

total: 2 errors, 1 warnings, 1 checks, 71 lines checked
ef7c2d172b12 drm/i915/dmc: Change intel_get_stepping_info()
4a8d375d3242 drm/i915/firmware: Update to DMC v2.12 on TGL
-:10: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Madhumitha Pradeep <'
#10: 
Reviewed-by: Madhumitha Pradeep <

total: 1 errors, 0 warnings, 0 checks, 10 lines checked
55698bd418a0 drm/i915/firmware: Update to DMC v2.03 on RKL
-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Madhumitha Pradeep <'
#12: 
Reviewed-by: Madhumitha Pradeep <

total: 1 errors, 0 warnings, 0 checks, 10 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
