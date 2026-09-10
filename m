Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB1C79FBF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574D210E2C6;
	Thu, 10 Sep 2026 18:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is1iFzd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282BF10E2A0
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789065783; x=1820601783;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W/0L530WhXWw+9Gl8IAuSQ2gu5NBAKMBoYJjWEjf8DQ=;
 b=is1iFzd1jc2cn0adIs0DHfmFPTPzjDS59uvhe0XCmbXCYVUNbLAWBSH3
 nQ3TtIHj8zsMgzbAauu3Db+tTENUTdnbQfywMM7fhiLAid5dAceCSgzDv
 hp7au8nqf5qk7OeLD4pTXVkwHBPtEE4v7ykk9IY5W3n2XJKKHR3/pzTst
 stGLV9IxwJyGRE1I8FwTCKmRNQOcKC+D9DcWBxZz5fVwpQDAmA45Z08Kk
 KIECPxZknijiL44hCxvIteR0dwUYxonHVQHoHDwJgPVDRQmLNbAhy7aH+
 XIZsObsZ/t1uT7olDZx5CvW0MdyNozMEb0NkW2FgnA54K0ORd1cjCRsI5 Q==;
X-CSE-ConnectionGUID: /y4cUEe4Tee3B3mj4p+a2g==
X-CSE-MsgGUID: aqIl2TlgQV+RM3EL7M1qwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77085242"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77085242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
X-CSE-ConnectionGUID: tzsliNiiQtGlllSD3wHLRQ==
X-CSE-MsgGUID: V2zvgMwyQRWqe3G+33rfFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268424699"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Subject: [PATCH 0/2] Fixup deadlock scenarios in the PMU path
Date: Thu, 10 Sep 2026 11:42:54 -0700
Message-ID: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/i915/guc: Use a delayed wakeref put in guc_engine_busyness()
  drm/i915/pmu: Use a delayed wakeref put in get_rc6()

 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 24 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++-
 drivers/gpu/drm/i915/i915_pmu.c               |  7 +++++-
 3 files changed, 36 insertions(+), 2 deletions(-)

-- 
2.55.0

