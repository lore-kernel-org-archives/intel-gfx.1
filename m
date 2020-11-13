Return-Path: <SRS0=JclI=ET=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4CAC55ABD
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 18:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04103208D5
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 18:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04103208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D14A6E5D3;
	Fri, 13 Nov 2020 18:04:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8C86E5D3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 18:04:26 +0000 (UTC)
IronPort-SDR: p1GwUlDySvbvQFJmo2qm6pcaMSTvkcekGqnzBkxIOY/Md6Rc4E/BPVuve0RXbhBvixHzbv72mA
 ebuk1tc4TUmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="167931874"
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="167931874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 10:04:00 -0800
IronPort-SDR: IQkJ9IsyF9tlVnBE22QGkqqOtUUGBp/x8F/nxiAASYtf+oErNGOpVn1EQ6yOgaY7iDDcpHkd0P
 lar9WO8P1a1A==
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="474752355"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 10:03:59 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2020 10:03:52 -0800
Message-Id: <20201113180359.54410-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/7] Allow privileged user to map the OA buffer
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Allow user to map the OA buffer and also trigger reports into it.

CI fixes:
v1: Fixes a memory corruption due to addition of OA whitelist on demand.
v2: Spinlock when applying whitelist
v3: Use uncore->lock. Do not check for wal->count when applying whitelist.
v4: Refresh and rerun with newly added test (forked access).
v5:
- Split patches into smaller units
- Grow the wal->list only for the engine that needs it.
- Bring back the wal->count check when applying whitelist during resume
v6: Fix checkpatch and sparse warnings
v7:
- Fix mem leak
- Grow wal->list only if wal->count is not aligned to WAL_LIST_CHUNK

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Test-with: 20201002232634.51807-1-umesh.nerlige.ramappa@intel.com

Piotr Maciejewski (1):
  drm/i915/perf: Ensure observation logic is not clock gated

Umesh Nerlige Ramappa (6):
  drm/i915/gt: Lock intel_engine_apply_whitelist with uncore->lock
  drm/i915/gt: Add a reference to the engine in i915_wa_list
  drm/i915/perf: Whitelist OA report trigger registers
  drm/i915/gt: Refactor _wa_add to reuse wa_index and wa_list_grow
  drm/i915/perf: Whitelist OA counter and buffer registers
  drm/i915/perf: Map OA buffer to user space for gen12 performance query

 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 244 ++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_workarounds.h   |   7 +
 .../gpu/drm/i915/gt/intel_workarounds_types.h |   6 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   4 +-
 drivers/gpu/drm/i915/i915_perf.c              | 228 +++++++++++++++-
 drivers/gpu/drm/i915/i915_perf_types.h        |   8 +
 drivers/gpu/drm/i915/i915_reg.h               |  10 +
 include/uapi/drm/i915_drm.h                   |  33 +++
 10 files changed, 485 insertions(+), 59 deletions(-)

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
