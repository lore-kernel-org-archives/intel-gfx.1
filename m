Return-Path: <SRS0=hFQw=IK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C5AC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 16:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086F564F80
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 16:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086F564F80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920BD6E3E5;
	Fri, 12 Mar 2021 16:22:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3E286E3E5;
 Fri, 12 Mar 2021 16:22:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BC2C5A0091;
 Fri, 12 Mar 2021 16:22:11 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 12 Mar 2021 16:22:11 -0000
Message-ID: <161556613174.8355.6299030111253031306@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Default_request/fence_expiry_+_watchdog?=
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

Series: Default request/fence expiry + watchdog
URL   : https://patchwork.freedesktop.org/series/87930/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
865f5ed6eec8 drm/i915: Individual request cancellation
-:256: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using '__cancel_inactive', this function's name, in a string
#256: FILE: drivers/gpu/drm/i915/selftests/i915_request.c:660:
+		pr_err("%s: __cancel_inactive error %d\n", engine->name, err);

-:317: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using '__cancel_active', this function's name, in a string
#317: FILE: drivers/gpu/drm/i915/selftests/i915_request.c:721:
+		pr_err("%s: __cancel_active error %d\n", engine->name, err);

-:388: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using '__cancel_active_chain', this function's name, in a string
#388: FILE: drivers/gpu/drm/i915/selftests/i915_request.c:792:
+		pr_err("%s: __cancel_active_chain error %d\n",

-:438: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using '__cancel_completed', this function's name, in a string
#438: FILE: drivers/gpu/drm/i915/selftests/i915_request.c:842:
+		pr_err("%s: __cancel_completed error %d\n", engine->name, err);

total: 0 errors, 4 warnings, 0 checks, 444 lines checked
5b101fa80277 drm/i915: Restrict sentinel requests further
c4f617682a6d drm/i915: Request watchdog infrastructure
-:197: WARNING:LONG_LINE_COMMENT: line length of 124 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/i915_request.c:314:
+			       NSEC_PER_MSEC, /* FIXME check if it gives the "not sooner" guarantee or slack is both ways */

total: 0 errors, 1 warnings, 0 checks, 190 lines checked
9e458012bb44 drm/i915: Allow userspace to configure the watchdog
5d0b88dfca39 drm/i915: Fail too long user submissions by default
7f4fb6d644b5 drm/i915: Allow configuring default request expiry via modparam


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
