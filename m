Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BAEC0218F
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jan 2025 08:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85B10E4C3;
	Mon, 27 Jan 2025 08:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ma2C8Rtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FCE10E4C3;
 Mon, 27 Jan 2025 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737965853; x=1769501853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LzCMHO043hAnaSRu+5NO6sCBK5XnyNgnbyQMT2/fz44=;
 b=Ma2C8RtlqZR4+RMkmL7IJc/pnzouIbJbRPiuPNcwfx/R8fo8+j7ZPuQx
 v0sNNWVapLu9H85Sw2xmAzNNAc9vEtVdyqBLvnv09e7wd7Ug2BrIq/rKT
 O2gv1M0IS9CN2pxnnwNXZ+3lb82OikSKvvDYPVMmOoNG6+ANiea5TIB/6
 KBtWQX0QtkQPO2tdPmsJPcUuRnXs7L+R2gE3nmvVnnKhOYavi9znsTStM
 ykKeWWKUlJShlVQO7RTHtFpBRxJgJ/f2OqRM09VrRT9l9LNh+ePCWTgxE
 UgUPlUNtbyHcVqJ0R9M8nCTPvTkdSWvMZ7bOZgKLtUqkdTFxp1oND5n/j g==;
X-CSE-ConnectionGUID: xsfMJj6STwmvtZrfR+gMdA==
X-CSE-MsgGUID: FcZaTzyNSdCuyr8BSPMm0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60883636"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="60883636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 00:17:32 -0800
X-CSE-ConnectionGUID: HWy6+NcRQUiulFQ9XCtoMQ==
X-CSE-MsgGUID: 94kYUN2PRQ6ex6jnrS6LAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108342402"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 27 Jan 2025 00:17:32 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/intel/xe_pmu: Add PMU tests
Date: Mon, 27 Jan 2025 00:14:00 -0800
Message-Id: <20250127081402.2587605-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Add utils and gt-c6 tests that utilize PMU counters.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  lib/igt_perf: Add utils to extract PMU event info
  tests/xe/pmu: Add pmu tests

 lib/igt_perf.c       |  74 +++++++++++++++++
 lib/igt_perf.h       |   4 +
 tests/intel/xe_pmu.c | 191 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 270 insertions(+)
 create mode 100644 tests/intel/xe_pmu.c

-- 
2.38.1

