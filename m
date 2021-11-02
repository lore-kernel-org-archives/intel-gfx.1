Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D35C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 01:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D9A610E5
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 01:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0D9A610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16C36F55C;
	Tue,  2 Nov 2021 01:26:40 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6A6F55B;
 Tue,  2 Nov 2021 01:26:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="231117032"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="231117032"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 18:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="531385645"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 01 Nov 2021 18:26:37 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon,  1 Nov 2021 18:26:05 -0700
Message-Id: <20211102012608.8609-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/3] drm/i915/guc/slpc: Implement waitboost
 for SLPC
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

Waitboost is a legacy feature implemented in the Host Turbo algorithm. This
patch set implements it for the SLPC path. A boost can happen when a request
is waiting for an unmet dependency. GT frequency gets temporarily bumped to
boost freq to allow the previous request to finish quickly. We achieve this
on SLPC by setting the min frequency, SLPC will set that as the requested
frequency.

The boost will occur through a worker thread that will be scheduled
when the required conditions are met.

Like before, boost frequency is configurable through sysfs, so we can
adjust it to any specific value as long as it is between [min, RP0].

v2: Add a worker thread to perform freq boost.
v3: Address comments (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/i915/guc/slpc: Define and initialize boost frequency
  drm/i915/guc/slpc: Add waitboost functionality for SLPC
  drm/i915/guc/slpc: Update boost sysfs hooks for SLPC

 drivers/gpu/drm/i915/gt/intel_rps.c           |  72 +++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h           |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 151 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |   3 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  13 ++
 drivers/gpu/drm/i915/i915_request.c           |   2 +-
 drivers/gpu/drm/i915/i915_sysfs.c             |  19 +--
 7 files changed, 223 insertions(+), 40 deletions(-)

-- 
2.25.0

