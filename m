Return-Path: <SRS0=BVws=LK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E17C48BE5
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 00:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA1561107
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 00:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA1561107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F14B6E44F;
	Wed, 16 Jun 2021 00:42:25 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5236E442
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Jun 2021 00:42:23 +0000 (UTC)
IronPort-SDR: FB86QtqW6ENknYGWr+hwb0I7p/U2oa2DjnrWe+tYczHMHz6yJSFBDuiH64847C6TP8X2luVtQy
 YbBIT+JOtf5A==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="186468444"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="186468444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 17:42:23 -0700
IronPort-SDR: 3RgTabRe4O0Cmgc58gVjOqeapSnW3WWwy1gEGziHzLhyfxp7QuC1ARgeCG9Vf84lFmQxMLwn8e
 /9RwELBoeSGg==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="478896380"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 17:42:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Jun 2021 17:42:10 -0700
Message-Id: <20210616004213.1705079-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2.1 0/3] Explicity steer l3bank multicast reads
 when necessary
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

We've recently learned that when steering reads of multicast registers
that use 'subslice' replication, it's not only important to steer to a
subslice that isn't fused off, but also to steer to the lowest-numbered
subslice.  This is because when Render Power Gating is enabled, grabbing
forcewake will only cause the hardware to power up a single subslice
(referred to as the "minconfig") until/unless a real workload is being
run on the EUs.  If we try to read back a value from a register instance
other than the minconfig subslice, the read operation will either return
0 or random garbage.

Unfortunately this extra requirement to steer to the minconfig means
that the steering target we use for subslice-replicated registers may
not select a valid instance for l3bank-replicated registers.  In cases
where the two types of multicast registers do not have compatible
steering targets, we'll initialize the steering control register to the
proper subslice target at driver load, and then explicitly re-steer
individual reads of l3bank registers as they occur at runtime.

This series sets up an infrastructure to handle explicit resteering of
multiple multicast register types, and then applies it to l3bank
registers.  Our next upcoming platform (which we'll probably start
upstreaming soon) will bring several more types of multicast registers,
each with their own steering criteria, so the infrastructure here is
partially in preparation for those extra multicast types that will be
arriving soon.

v2:
 - Use {} as table terminator and check for end==0 instead of 0xFFFFFF
   on loop iteration.  (Rodrigo)
 - Use gt->uncore instead of gt->i915->uncore.  (Tvrtko)
 - Now that wa_list_verify() uses _fw accessors we need to explicitly
   grab forcewake.

v2.1:
 - Rebase

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Daniele Ceraolo Spurio (1):
  drm/i915: extract steered reg access to common function

Matt Roper (2):
  drm/i915: Add GT support for multiple types of multicast steering
  drm/i915: Add support for explicit L3BANK steering

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  41 +-----
 drivers/gpu/drm/i915/gt/intel_gt.c            | 102 +++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h            |   8 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  26 ++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 123 ++++++++----------
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  55 ++++++++
 drivers/gpu/drm/i915/intel_uncore.h           |   6 +
 8 files changed, 251 insertions(+), 112 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
