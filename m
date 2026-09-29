Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796C9CA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 19:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33510F03F;
	Tue, 29 Sep 2026 19:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwB7kdAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4510F047
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 19:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790708514; x=1822244514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TZ+IbRuJBNes2lQp/jp1z7sluVd/xZBvail09qI/Nkw=;
 b=RwB7kdAKcA2d0viQIilW5V9YYV3NGREy4BNcCMxXzcNSfEDVUTe5WhFR
 BnXwGl4NiKO2kxXhwWvf7G7LSzB4chKfqfIvOSjXZ917naWS0M7UWcza3
 fTguSHU83MOlDGftc7Ibimmh+jUcGQefuKipxwgFzgUmmGkMfS8jaeoyI
 r1xqN3GHhW6PvtzFFJLa0oE851IMEn0f4TkLoGE6tkz83p2ODGHrYuFH1
 9wRzPku+Sd9ACDkVgpn52IeKJvZn/lZUECtrGe0DhJZFKNKck7V2mfvgu
 mujDa88IPTSzWD+oVYsANq3qMIqvY5Po1+VlEIewhLVwyz7BpRqBBJG+R Q==;
X-CSE-ConnectionGUID: RbBcBW7QRs2G5RJg8RYBOw==
X-CSE-MsgGUID: CaVNoz9PS1OJJ06tf0ccEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90564108"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90564108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:53 -0700
X-CSE-ConnectionGUID: LSNc+k6IR/GRnXgQLNteEw==
X-CSE-MsgGUID: HU6jW5ehR0ODT9gzcqu8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274062213"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Cc: dev@lankhorst.se
Subject: [PATCH 0/3] Fixup deadlock scenarios in the PMU path
Date: Tue, 29 Sep 2026 12:01:48 -0700
Message-ID: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Based on one user report bug regarding a deadlock in the
guc_engine_busyness path, this series fixes such scenarios.

v2:
- Disable pmu on PREEMPT_RT kernels
- Review comments from v1

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Maarten Lankhorst (1):
  drm/i915/pmu: Disable on PREEMPT_RT

Umesh Nerlige Ramappa (2):
  drm/i915/guc: Use a delayed wakeref put in guc_engine_busyness()
  drm/i915/pmu: Use a delayed wakeref put in get_rc6()

 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 24 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++-
 drivers/gpu/drm/i915/i915_pmu.c               | 21 +++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.55.0

