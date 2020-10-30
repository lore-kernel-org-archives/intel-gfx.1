Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA97CC388F9
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 11:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64454207DE
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 11:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64454207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6CD6EDB4;
	Fri, 30 Oct 2020 11:37:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F2966EDA2;
 Fri, 30 Oct 2020 11:37:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B2C8A8835;
 Fri, 30 Oct 2020 11:37:35 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Fri, 30 Oct 2020 11:37:35 -0000
Message-ID: <160405785510.23387.3977119399824166648@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201030111001.7685-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201030111001.7685-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/7=5D_drm/i915/gt=3A_Wrap_intel=5F?=
 =?utf-8?q?timeline=2Ehas=5Finitial=5Fbreadcrumb?=
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

Series: series starting with [1/7] drm/i915/gt: Wrap intel_timeline.has_initial_breadcrumb
URL   : https://patchwork.freedesktop.org/series/83269/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a14ed43522cc drm/i915/gt: Wrap intel_timeline.has_initial_breadcrumb
ace8d5c1c529 drm/i915/gt: Track timeline GGTT offset seperately from subpage offset
-:4: WARNING:TYPO_SPELLING: 'seperately' may be misspelled - perhaps 'separately'?
#4: 
Subject: [PATCH] drm/i915/gt: Track timeline GGTT offset seperately from

total: 0 errors, 1 warnings, 0 checks, 147 lines checked
a9096b3c91b5 drm/i915/gt: Add timeline "mode"
53ec4f9202bb drm/i915/gt: Expose more parameters for emitting writes into the ring
8345610b1f7e drm/i915/gt: Use indices for writing into relative timelines
3e10e00a5e5c drm/i915/selftests: Exercise relative timeline modes
8b8654437016 drm/i915/gt: Use ppHWSP for unshared non-semaphore related timelines


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
