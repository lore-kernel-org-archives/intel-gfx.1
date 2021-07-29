Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65156C4320E
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361DF60462
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 361DF60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4258C6EC77;
	Thu, 29 Jul 2021 05:41:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F676E159
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 05:41:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199987830"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="199987830"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="567114062"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 22:41:12 -0700
Message-Id: <20210729054118.2458523-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/6] Forcewake and shadowed register updates
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

Update the way we handle shadowed registers (i.e., registers that we can
write to without grabbing forcewake first) to support register ranges
rather than just single registers, and add some missing registers for
gen11, gen12, and Xe_HP.

While we're working in this area of the code, let's also adjust the
description of the GT domain in error messages (referring to it as
'blitter' just confuses people) and eliminate some unnecessary
duplication of forcewake read functions.


Matt Roper (6):
  drm/i915: correct name of GT forcewake domain in error messages
  drm/i915: Re-use gen11 forcewake read functions on gen12
  drm/i915: Make shadow tables range-based
  drm/i915/gen11: Update shadowed register table
  drm/i915/gen12: Update shadowed register table
  drm/i915/xehp: Xe_HP shadowed registers are a strict superset of gen12

 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  13 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 185 ++++++++----------
 drivers/gpu/drm/i915/intel_uncore.h           |   6 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  33 ++--
 4 files changed, 111 insertions(+), 126 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
