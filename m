Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74296C433DB
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 00:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32551207AB
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 00:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32551207AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23C389C51;
	Wed,  6 Jan 2021 00:28:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FB8389C51;
 Wed,  6 Jan 2021 00:28:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9A560A008A;
 Wed,  6 Jan 2021 00:28:01 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 06 Jan 2021 00:28:01 -0000
Message-ID: <160989288162.18711.15559231249102116788@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Split_GuC_submission_from_execlists_submission?=
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

Series: Split GuC submission from execlists submission
URL   : https://patchwork.freedesktop.org/series/85528/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b91fa7500d8f drm/i915/guc: Delete GuC code unused in future patches
45b23606fe0e drm/i915/guc: do not dump execlists state with GuC submission
19efc6761a69 drm/i915/guc: init engine directly in GuC submission mode
-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:460:
+static int guc_context_pre_pin(struct intel_context *ce,
+				     struct i915_gem_ww_ctx *ww,

-:244: WARNING:TYPO_SPELLING: 'overriden' may be misspelled - perhaps 'overridden'?
#244: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:650:
+	/* Default vfuncs which can be overriden by each engine. */
 	                               ^^^^^^^^^

total: 0 errors, 1 warnings, 1 checks, 310 lines checked
c8a929723bd2 drm/i915/guc: stop calling execlists_set_default_submission
95e1c72faff4 drm/i915/guc: enable only the user interrupt when using GuC submission


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
