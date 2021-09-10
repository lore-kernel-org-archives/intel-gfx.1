Return-Path: <SRS0=qdHQ=OA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66503C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 05:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DF86113E
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 05:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32DF86113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4FE6E96A;
	Fri, 10 Sep 2021 05:33:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1046E964;
 Fri, 10 Sep 2021 05:33:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217832057"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="217832057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480012415"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Date: Thu,  9 Sep 2021 22:33:11 -0700
Message-Id: <20210910053317.3379249-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/6] i915: Simplify mmio handling & add new DG2
 shadow table
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

Our uncore MMIO functions for reading/writing registers have become very
complicated over time.  There's significant macro magic used to generate
several nearly-identical functions that only really differ in terms of
which platform-specific shadow register table they should check on write
operations.  We can significantly simplify our MMIO handlers by storing
a reference to the current platform's shadow table within the 'struct
intel_uncore' the same way we already do for forcewake; this allows us
to consolidate the multiple variants of each 'write' function down to
just a single 'fwtable' version that gets the shadow table out of the
uncore struct rather than hardcoding the name of a specific platform's
table.  We can do similar consolidation on the MMIO read side by
creating a single-entry forcewake table to replace the open-coded range
check they had been using previously.

The final patch of the series adds a new shadow table for DG2; this
becomes quite clean and simple now, given the refactoring in the first
five patches.

Matt Roper (6):
  drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
  drm/i915/uncore: Associate shadow table with uncore
  drm/i915/uncore: Replace gen8 write functions with general fwtable
  drm/i915/uncore: Drop gen11/gen12 mmio write handlers
  drm/i915/uncore: Drop gen11 mmio read handlers
  drm/i915/dg2: Add DG2-specific shadow register table

 drivers/gpu/drm/i915/intel_uncore.c           | 190 ++++++++++--------
 drivers/gpu/drm/i915/intel_uncore.h           |   7 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   1 +
 3 files changed, 110 insertions(+), 88 deletions(-)

-- 
2.25.4

