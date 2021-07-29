Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B36C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 00:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3317760F12
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 00:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3317760F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C24F6E296;
	Thu, 29 Jul 2021 00:16:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38726E231;
 Thu, 29 Jul 2021 00:16:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212500655"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212500655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="456666795"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Wed, 28 Jul 2021 17:33:59 -0700
Message-Id: <20210729003400.151864-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/1] Fix gem_ctx_persistence failures with GuC
 submission
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Should fix below failures with GuC submission for the following tests:
gem_exec_balancer --r noheartbeat
gem_ctx_persistence --r heartbeat-close

Not going to fix:
gem_ctx_persistence --r heartbeat-many
gem_ctx_persistence --r heartbeat-stop

As the above tests change the heartbeat value to 0 (off) after the
context is closed and we have no way to detect that with GuC submission
unless we keep a list of closed but running contexts which seems like
overkill for a non-real world use case. We likely should just skip these
tests with GuC submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (1):
  drm/i915: Check if engine has heartbeat when closing a context

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
 .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
 6 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
