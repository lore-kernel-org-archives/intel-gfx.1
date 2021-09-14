Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B118C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 05:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4361160F21
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 05:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4361160F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F296E3F9;
	Tue, 14 Sep 2021 05:15:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5158B6E3F0;
 Tue, 14 Sep 2021 05:15:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="208976886"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="208976886"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:14:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="697404476"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:14:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>,
	<john.c.harrison@intel.com>
Date: Mon, 13 Sep 2021 22:09:52 -0700
Message-Id: <20210914050956.30685-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/4] Do error capture async,
 flush G2H processing on reset
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

Rather allocating an error capture in nowait context to break a lockdep
splat [1], do the error capture async compared to the G2H processing.

v2: Fix Docs warning

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/451415/?series=93704&rev=5

John Harrison (1):
  drm/i915/guc: Refcount context during error capture

Matthew Brost (3):
  drm/i915/guc: Move guc_ids under submission_state sub-structure
  drm/i915/guc: Do error capture asynchronously
  drm/i915/guc: Flush G2H work queue during reset

 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  16 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  36 +++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 133 ++++++++++++------
 4 files changed, 130 insertions(+), 57 deletions(-)

-- 
2.32.0

