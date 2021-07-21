Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A12C6377A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 21:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB2561208
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 21:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB2561208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06616E840;
	Wed, 21 Jul 2021 21:54:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75DA26E4DE;
 Wed, 21 Jul 2021 21:54:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6DA33A0118;
 Wed, 21 Jul 2021 21:54:59 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 21 Jul 2021 21:54:59 -0000
Message-ID: <162690449942.769.11333915374184001604@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210721215101.139794-1-matthew.brost@intel.com>
In-Reply-To: <20210721215101.139794-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Series_to_merge_a_subset_of_GuC_submission_=28rev2=29?=
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

Series: Series to merge a subset of GuC submission (rev2)
URL   : https://patchwork.freedesktop.org/series/92791/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
081c22c811d7 drm/i915/guc: Add new GuC interface defines and structures
87421139cc96 drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
7b76cda1c85a drm/i915/guc: Add LRC descriptor context lookup array
c9e9768ec25b drm/i915/guc: Implement GuC submission tasklet
0d92798721fc drm/i915/guc: Add bypass tasklet submission path to GuC
ba27aaa2fae5 drm/i915/guc: Implement GuC context operations for new inteface
-:150: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#150: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:120:
+	bool not_atomic = !in_atomic() && !irqs_disabled();

total: 1 errors, 0 warnings, 0 checks, 912 lines checked
ac2069bdddf5 drm/i915/guc: Insert fence on context when deregistering
2a7cea557692 drm/i915/guc: Defer context unpin until scheduling is disabled
68b4749ad89a drm/i915/guc: Disable engine barriers with GuC during unpin
9786ce9beec1 drm/i915/guc: Extend deregistration fence to schedule disable
b7c5a26b4acb drm/i915: Disable preempt busywait when using GuC scheduling
a2e1e262476d drm/i915/guc: Ensure request ordering via completion fences
48900c02cbf4 drm/i915/guc: Disable semaphores when using GuC scheduling
0c70454fb944 drm/i915/guc: Ensure G2H response has space in buffer
af704c4a01b5 drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
752e0551e1d6 drm/i915/guc: Update GuC debugfs to support new GuC
37a4e4eb390b drm/i915/guc: Add trace point for GuC submit
61b81bfe2dde drm/i915: Add intel_context tracing
-:145: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#145: FILE: drivers/gpu/drm/i915/i915_trace.h:902:
+		    TP_STRUCT__entry(

-:152: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#152: FILE: drivers/gpu/drm/i915/i915_trace.h:909:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 255 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
