Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AA9C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5890160C51
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5890160C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD296E39B;
	Wed, 20 Oct 2021 19:52:38 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B1F89FF9;
 Wed, 20 Oct 2021 19:52:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289715854"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="289715854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="445056174"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 20 Oct 2021 12:52:36 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 20 Oct 2021 12:52:13 -0700
Message-Id: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/3] drm/i915/guc/slpc: Implement waitboost for
 SLPC
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
patch set implements it for the SLPC path. A "boost" happens when user
calls gem_wait ioctl on a submission that has not landed on HW yet. GT
frequency gets temporarily bumped to RP0 to allow the previous request
to finish quickly. We achieve this on SLPC by setting the min frequency,
SLPC will set that as the requested frequency.

Like before, boost frequency is configurable through sysfs, so we can
adjust it to any specific value as long as it is between [min, RP0].

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/i915/guc/slpc: Define and initialize boost frequency
  drm/i915/guc/slpc: Add waitboost functionality for SLPC
  drm/i915/guc/slpc: Update boost sysfs hooks for SLPC

 drivers/gpu/drm/i915/gt/intel_rps.c           | 57 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h           |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 56 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  3 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c             | 21 ++-----
 7 files changed, 127 insertions(+), 18 deletions(-)

-- 
2.25.0

