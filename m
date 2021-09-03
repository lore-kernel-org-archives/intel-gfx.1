Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD18C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 23:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A1D6102A
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10A1D6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63E6E8E5;
	Fri,  3 Sep 2021 23:52:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAB76E8E5;
 Fri,  3 Sep 2021 23:52:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="280558070"
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="280558070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 16:52:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="521984363"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 16:52:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Date: Fri,  3 Sep 2021 16:49:46 -0700
Message-Id: <20210903234946.795004-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902005022.711767-8-daniele.ceraolospurio@intel.com>
References: <20210902005022.711767-8-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 07/25] Revert "drm/i915/gt: Propagate change
 in error status to children on unhold"
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Propagating errors to dependent fences is broken and can lead to errors
from one client ending up in another. In commit 3761baae908a ("Revert
"drm/i915: Propagate errors on awaiting already signaled fences""), we
attempted to get rid of fence error propagation but missed the case
added in commit 8e9f84cf5cac ("drm/i915/gt: Propagate change in error
status to children on unhold"). Revert that one too. This error was
found by an up-and-coming selftest which triggers a reset during
request cancellation and verifies that subsequent requests complete
successfully.

v2:
 (Daniel Vetter)
  - Use revert
v3:
 (Jason)
  - Update commit message

v4 (Daniele):
 - fix checkpatch error in commit message.

References: '3761baae908a ("Revert "drm/i915: Propagate errors on awaiting already signaled fences"")'
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..cafb0608ffb4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
 			if (p->flags & I915_DEPENDENCY_WEAK)
 				continue;
 
-			/* Propagate any change in error status */
-			if (rq->fence.error)
-				i915_request_set_error_once(w, rq->fence.error);
-
 			if (w->engine != rq->engine)
 				continue;
 
-- 
2.25.1

